-----------------------------------
-- Self-Destruct
-- Bomb Cluster Self Destruct - 3 Bombs up
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/mobskills")
-----------------------------------
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if (mob:getHPP() > 66 or mob:getAnimationSub() ~= 4) and math.random() < .2 then -- 20% chance for all bombs to explode
        return 1
    end

    mob:setLocalVar("HPSelfDestruct", mob:getHP())
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local selfDestHPP = mob:getLocalVar("HPSelfDestruct")

    local info = xi.mobskills.mobMagicalMove(mob, target, skill, selfDestHPP, xi.magic.ele.FIRE, 1, xi.mobskills.magicalTpBonus.NO_EFFECT, 0, 0, 1, 1.1, 1.2)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.FIRE, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)
    mob:setHP(0)
    target:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.FIRE)
    return dmg
end

return mobskillObject
