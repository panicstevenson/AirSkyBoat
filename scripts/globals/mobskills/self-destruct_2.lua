-----------------------------------
-- Self-Destruct
-- Bomb Cluster Self Destruct - 2 Bombs up
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/mobskills")
-----------------------------------
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:getHPP() > 32 or mob:getAnimationSub() ~= 5 then
        return 1
    end

    mob:setLocalVar("HPSelfDestruct", mob:getHP())
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local selfDestHPP = mob:getLocalVar("HPSelfDestruct") / 3

    -- Razon - ENM: Fire in the Sky
    if mob:getHPP() <= 33 and mob:getPool() == 3333 then
        selfDestHPP = 0
    end

    local info = xi.mobskills.mobMagicalMove(mob, target, skill, selfDestHPP, xi.magic.ele.FIRE, 1, xi.mobskills.magicalTpBonus.MAB_BONUS, 1, 0, 1, 1.1, 1.2)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.FIRE, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)

    mob:setAnimationSub(6)

    target:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.FIRE)
    return dmg
end

return mobskillObject
