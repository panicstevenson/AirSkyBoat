-----------------------------------
-- HorizonXI Lua Module
-- Used to change ability luas.
-----------------------------------
require("modules/module_utils")
require("scripts/globals/ability")
require("scripts/globals/status")
require("scripts/globals/jobpoints")
-----------------------------------

local m = Module:new("horizon_abilities")

local chakraStatusEffects =
{
    POISON       = 0, -- Removed by default
    BLINDNESS    = 0, -- Removed by default
    PARALYSIS    = 0, -- Removed by default
    DISEASE      = 2,
    PLAGUE       = 4,
}

m:addOverride("xi.globals.abilities.boost.onUseAbility", function(player, target, ability)
    local power = 25 + (0.10 * player:getMod(xi.mod.BOOST_EFFECT))

    if player:hasStatusEffect(xi.effect.BOOST) then
        local effect = player:getStatusEffect(xi.effect.BOOST)
        effect:setPower(effect:getPower() + power)
        player:addMod(xi.mod.ATTP, power)
    else
        player:addStatusEffect(xi.effect.BOOST, power, 0, 180)
    end
end)

m:addOverride("xi.globals.abilities.chakra.onUseAbility", function(player, target, ability)
    local chakraRemoval = player:getMod(xi.mod.CHAKRA_REMOVAL)
    for k, v in pairs(chakraStatusEffects) do
        if bit.band(chakraRemoval, v) == v then
            player:delStatusEffect(xi.effect[k])
        end
    end

    player:delStatusEffectsByFlag(xi.effectFlag.ERASABLE, true)

    local jpLevel = target:getJobPointLevel(xi.jp.CHAKRA_EFFECT) * 10
    local recover = player:getStat(xi.mod.VIT) * (1 + player:getMod(xi.mod.CHAKRA_MULT) / 10) -- TODO: Figure out "function of level" addition (August 2017 update)
    player:setHP(player:getHP() + recover + jpLevel)

    local merits = player:getMerit(xi.merit.INVIGORATE)
    if merits > 0 then
        if player:hasStatusEffect(xi.effect.REGEN) then
            player:delStatusEffect(xi.effect.REGEN)
        end
        player:addStatusEffect(xi.effect.REGEN, 10, 0, merits, 0, 0, 1)
    end

    return recover
end)

m:addOverride("xi.globals.abilities.focus.onUseAbility", function(player, target, ability)
    local power = 20 + player:getMod(xi.mod.FOCUS_EFFECT)
    player:addStatusEffect(xi.effect.FOCUS, power, 0, 180)
end)

m:addOverride("xi.globals.abilities.chi_blast.onUseAbility", function(player, target, ability)
    local boost = player:getStatusEffect(xi.effect.BOOST)
    local multiplier = 1.0

    if boost ~= nil then
        multiplier = (boost:getPower()/100) * 4 -- power is the raw % atk boost
    end

    local dmg = math.floor(player:getStat(xi.mod.MND) * (0.5 + (math.random() / 2))) * multiplier
    dmg = utils.stoneskin(target, dmg)
    target:takeDamage(dmg, player, xi.attackType.SPECIAL, xi.damageType.ELEMENTAL)
    target:updateEnmityFromDamage(player, dmg)
    target:updateClaim(player)
    player:delStatusEffect(xi.effect.BOOST)
    target:dispelStatusEffect()

    return dmg
end)

m:addOverride("xi.globals.abilities.divine_seal.onAbilityCheck", function(player, target, ability)
    if player:getMainJob() == xi.job.WHM then
        ability:setRecast(600)
    end

    return 0, 0
end)

m:addOverride("xi.globals.abilities.ancient_circle.onUseAbility", function(player, target, ability)
    local duration = 180 + player:getMod(xi.mod.ANCIENT_CIRCLE_DURATION)
    local jpValue = player:getJobPointLevel(xi.jp.ANCIENT_CIRCLE_EFFECT)
    local power = 5

    if player:getMainJob() == xi.job.DRG then
        power = 15 + jpValue
        target:addStatusEffect(xi.effect.ANCIENT_CIRCLE, power, 0, duration)
    else
        target:addStatusEffect(xi.effect.ANCIENT_CIRCLE, power, 0, duration)
    end
end)

m:addOverride("xi.globals.abilities.arcane_circle.onUseAbility", function(player, target, ability)
    local duration = 180 + player:getMod(xi.mod.ARCANE_CIRCLE_DURATION)
    local power = 15

    if player:getMainJob() == xi.job.DRK then
        target:addStatusEffect(xi.effect.ARCANE_CIRCLE, power, 0, duration)
    else
        target:addStatusEffect(xi.effect.ARCANE_CIRCLE, power, 0, duration)
    end
end)

m:addOverride("xi.globals.abilities.warding_circle.onUseAbility", function(player, target, ability)
    local duration = 180 + player:getMod(xi.mod.WARDING_CIRCLE_DURATION)
    local power = 5

    if player:getMainJob() == xi.job.SAM then
        power = 15
        target:addStatusEffect(xi.effect.WARDING_CIRCLE, power, 0, duration)
    else
        target:addStatusEffect(xi.effect.WARDING_CIRCLE, power, 0, duration)
    end
end)

m:addOverride("xi.globals.abilities.holy_circle.onUseAbility", function(player, target, ability)
    local duration = 180 + player:getMod(xi.mod.HOLY_CIRCLE_DURATION)
    local power = 14

    if player:getMainJob() == xi.job.PLD then
        power = 15
        target:addStatusEffect(xi.effect.HOLY_CIRCLE, power, 0, duration)
    else
        target:addStatusEffect(xi.effect.HOLY_CIRCLE, power, 0, duration)
    end
end)

return m
