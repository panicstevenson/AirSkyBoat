-----------------------------------
--  Frost Breath
--
--  Description: Deals Ice breath damage to enemies within a fan-shaped area originating from the caster.
--  Type: Magical (Ice)
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/mobskills")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)

    local dmgmod = xi.mobskills.mobBreathMove(mob, target, 0.15, 0.25, xi.magic.ele.ICE, 125)

    local dmg = xi.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, xi.attackType.BREATH, xi.damageType.ICE, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, xi.attackType.BREATH, xi.damageType.ICE)
    return dmg
end

return mobskill_object
