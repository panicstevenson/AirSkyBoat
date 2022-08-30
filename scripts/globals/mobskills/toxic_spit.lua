-----------------------------------
--  Toxic Spit
--
--  Description: Spews a toxic glob at a single target. Effect: Poison
--  Type: Magical Water
--  Utsusemi/Blink absorb: Ignores shadows
--  Notes: Additional effect can be removed with Poisona.
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
    local typeEffect = xi.effect.POISON
    local power = mob:getMainLvl()/5 + 3
    xi.mobskills.mobStatusEffectMove(mob, target, typeEffect, power, 3, 180)
end

return mobskill_object
