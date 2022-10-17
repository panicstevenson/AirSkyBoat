-----------------------------------
--  1000 Needles
--
--  Description: Shoots multiple needles at enemies within range.
--  Type: Physical (Piercing)
--
--
-----------------------------------
require("scripts/globals/mobskills")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local needles = 1000 / skill:getTotalTargets()

    local dmg = xi.mobskills.mobFinalAdjustments(needles, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.PIERCING, xi.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.PIERCING)

    return dmg
end

return mobskillObject
