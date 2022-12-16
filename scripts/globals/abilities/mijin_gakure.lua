-----------------------------------
-- Ability: Mijin Gakure
-- Sacrifices user's life to deal damage to an enemy.
-- Obtained: Ninja Level 1
-- Recast Time: 1:00:00
-- Duration: Instant
-----------------------------------
require("scripts/globals/jobpoints")
require("scripts/globals/mobskills")
require("scripts/globals/status")
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    ability:setRecast(ability:getRecast() - player:getMod(xi.mod.ONE_HOUR_RECAST))
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    -- Era Plus:
    -- Max of: floor(3.5 * lvl) + 50 or Ninjutsu skill * 4
    local dmg    = math.max(math.floor(3.5 * player:getMainLvl()) + 50, player:getSkillLevel(xi.skill.NINJUTSU) * 4)
    local resist = xi.mobskills.applyPlayerResistance(player, nil, target, player:getStat(xi.mod.INT) - target:getStat(xi.mod.INT), 0, xi.magic.ele.NONE)

    dmg = dmg * resist

    dmg = utils.rampart(target, dmg)
    dmg = utils.stoneskin(target, dmg)

    target:takeDamage(dmg, player, xi.attackType.SPECIAL, xi.damageType.ELEMENTAL)
    target:updateEnmityFromDamage(player, dmg)

    -- HP to 5% maxHP instead of 0
    player:setHP(math.min(player:getHP(), math.floor(player:getMaxHP() * 0.05)))

    -- Flash target
    local params = {}
    params.element = xi.magic.ele.NONE
    params.attribute = xi.mod.MND
    params.maccBonus = 200

    local flashResist = xi.magic.applyAbilityResistance(player, target, params)
    local duration = 12 * flashResist
    if resist > 0.0625 then
        target:addStatusEffectEx(xi.effect.FLASH, 0, 300, 4, duration)
    end

    return dmg
end

return abilityObject
