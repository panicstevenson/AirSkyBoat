-----------------------------------
-- Screwdriver
-- Deals critical damage. Chance of critical hit varies with TP.
-- 100% TP: ??? / 200% TP: ??? / 300% TP: ???
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/mobskills")
-----------------------------------
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local crit = 0.33
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, 1, xi.mobskills.physicalTpBonus.CRIT_VARIES, 2, 2.5, 3, crit)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, info.hitslanded)
    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)
    return dmg
end

return mobskillObject
