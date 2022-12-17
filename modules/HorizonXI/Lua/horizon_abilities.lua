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
    local power = 20 + (0.10 * player:getMod(xi.mod.BOOST_EFFECT))

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

m:addOverride("xi.globals.abilities.call_beast.onUseAbility", function(player, target, ability)
    xi.pet.spawnPet(player, player:getWeaponSubSkillType(xi.slot.AMMO))
    player:removeAmmo()
    -- Briefly put the recastId for READY/SIC (102) into a recast state to
    -- toggle charges accumulating. 102 is the shared recast id for all jug
    -- pet abilities and for SIC when using a charmed mob.
    -- see sql/abilities_charges and sql_abilities
    player:addRecast(xi.recast.ABILITY, 102, 1)

    -- Horizon Era+ Augments Call Beast Monster Gloves
    if
        player:getEquipID(xi.slot.HANDS) == xi.items.MONSTER_GLOVES or
        player:getEquipID(xi.slot.HANDS) == xi.items.MONSTER_GLOVES_P1
    then
        player:getPet():setMod(xi.mod.HASTE_GEAR, 300)
    end
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

m:addOverride("xi.job_utils.monk.useDodge", function(player, target, ability)
    local power = 20 + player:getMod(xi.mod.DODGE_EFFECT)

    player:addStatusEffect(xi.effect.DODGE, power, 0, 180)
end)

m:addOverride("xi.globals.abilities.pets.crimson_howl.onPetAbility", function(target, pet, skill, summoner)
    local bonusTime = utils.clamp(summoner:getSkillLevel(xi.skill.SUMMONING_MAGIC) - 300, 0, 200)
    local duration = 180 + bonusTime

    target:addStatusEffect(xi.effect.WARCRY, 12, 0, duration)
    skill:setMsg(xi.msg.basic.SKILL_GAIN_EFFECT)

    return xi.effect.WARCRY
end)

m:addOverride("xi.globals.abilities.pets.whispering_wind.onPetAbility", function(target, pet, skill, summoner)
    local base = 47 + pet:getMainLvl() * 3
    local tp   = pet:getTP()

    if tp < 1000 then
        tp = 1000
    end

    base = base * tp / 1000

    if target:getHP() + base > target:getMaxHP() then
        base = target:getMaxHP() - target:getHP() --cap it
    end

    target:delStatusEffect(xi.effect.BLINDNESS)
    target:delStatusEffect(xi.effect.POISON)
    target:delStatusEffect(xi.effect.PARALYSIS)
    target:delStatusEffect(xi.effect.DISEASE)
    target:delStatusEffect(xi.effect.PETRIFICATION)
    target:delStatusEffect(xi.effect.SILENCE)

    if math.random() > 0.5 then
        target:delStatusEffect(xi.effect.SLOW)
    end

    target:wakeUp()
    skill:setMsg(xi.msg.basic.SELF_HEAL)
    target:addHP(base)
    return base
end)

m:addOverride("xi.globals.abilities.pets.ecliptic_howl.onPetAbility", function(target, pet, skill, summoner)
    local duration = 180
    local moon = VanadielMoonLatentPhase()
    local accuracy = 0
    local evasion = 0
    local moonTable =
    {
        { acc = 15, eva = 15 }, -- New Moon
        { acc = 16, eva = 11 }, -- Waxing Crescent
        { acc = 18, eva = 8  }, -- First Quarter
        { acc = 21, eva = 6  }, -- Waxing Gibbous
        { acc = 21, eva = 6  }, -- Full Moon
        { acc = 25, eva = 5  }, -- Waning Gibbous
        { acc = 18, eva = 8  }, -- Last Gibbous
        { acc = 16, eva = 11 }, -- Waning Crescent
    }

    accuracy = moonTable[moon].acc
    evasion = moonTable[moon].eva

    target:delStatusEffect(xi.effect.ACCURACY_BOOST)
    target:delStatusEffect(xi.effect.EVASION_BOOST)
    target:addStatusEffect(xi.effect.ACCURACY_BOOST, accuracy, 0, duration)
    target:addStatusEffect(xi.effect.EVASION_BOOST, evasion, 0, duration)
    skill:setMsg(xi.msg.basic.NONE)
    return 0
end)

m:addOverride("xi.globals.abilities.pets.spring_water.onPetAbility", function(target, pet, skill, summoner)
    local bonusTime = utils.clamp(summoner:getSkillLevel(xi.skill.SUMMONING_MAGIC) - 300, 0, 200)
    local duration = 180 + bonusTime

    target:addStatusEffect(xi.effect.REFRESH, 2, 0, duration)
    skill:setMsg(xi.msg.basic.SKILL_GAIN_EFFECT)
    return xi.effect.REFRESH
end)

return m
