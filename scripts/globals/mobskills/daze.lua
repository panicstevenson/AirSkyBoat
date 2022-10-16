-----------------------------------
-- Daze
-- Description: Stuns target.
-- Type: Physical
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/mobskills")
-----------------------------------
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target,mob,skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 1.8
    local info = xi.mobskills.mobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,xi.mobskills.physicalTpBonus.DMG_VARIES,2.5,2.75,3)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg,mob,skill,target, xi.attackType.RANGED, xi.damageType.PIERCING,info.hitslanded)

    target:addStatusEffect(xi.effect.STUN, 1, 0, 3)
    target:takeDamage(dmg, mob, xi.attackType.RANGED, xi.damageType.PIERCING)
    return dmg
end

return mobskillObject
