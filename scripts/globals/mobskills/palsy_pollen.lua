-----------------------------------
-- Palsy Pollen
-- Conal paralyze
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Melee?
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
    skill:setMsg(xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.PARALYSIS, 30, 0, 180))

    return xi.effect.PARALYSIS
end

return mobskillObject
