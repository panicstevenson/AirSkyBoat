-----------------------------------
--  Words of Bane
--
--  Description: Curses a single target.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Single Target
--  Notes:
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
    skill:setMsg(xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.CURSE_I, 25, 0, 45))

    return xi.effect.CURSE_I
end

return mobskillObject
