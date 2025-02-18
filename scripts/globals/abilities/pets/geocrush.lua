-----------------------------------
-- Geocrush
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/mobskills")
require("scripts/globals/magic")
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onPetAbility = function(target, pet, skill)
    local dINT   = math.floor(pet:getStat(xi.mod.INT) - target:getStat(xi.mod.INT))
    local tp     = pet:getTP() / 10
    local master = pet:getMaster()
    local merits = 0
    local dmgmod = (((45/256) * tp) + (1370/256))
    if master ~= nil and master:isPC() then
        merits = master:getMerit(xi.merit.GEOCRUSH)
    end

    tp = tp + (merits - 40)
    if tp > 300 then
        tp = 300
    end

    local damage = pet:getMainLvl() + 2 + (0.30 * pet:getStat(xi.mod.INT)) + (dINT * 1.5)
    damage = xi.mobskills.mobMagicalMove(pet, target, skill, damage, xi.magic.ele.EARTH, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT, 0)
    damage = xi.mobskills.mobAddBonuses(pet, target, damage.dmg, xi.magic.ele.EARTH)
    damage = xi.summon.avatarFinalAdjustments(damage, pet, skill, target, xi.attackType.MAGICAL, xi.damageType.EARTH, 1)

    target:takeDamage(damage, pet, xi.attackType.MAGICAL, xi.damageType.EARTH)
    target:updateEnmityFromDamage(pet, damage)

    if not target:hasStatusEffect(xi.effect.STUN) then
        target:addStatusEffect(xi.effect.STUN, 3, 3, 3)
    end

    return damage
end

return abilityObject
