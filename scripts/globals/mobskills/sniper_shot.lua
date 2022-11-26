-----------------------------------
-- Sniper Shot
-- Description: Lowers enemy's INT. Chance of lowering INT varies with TP.
-- Type: Ranged
-----------------------------------
require("scripts/globals/mobskills")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 1
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT, 1.1, 1.2, 1.3)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.RANGED, xi.damageType.PIERCING, info.hitslanded)

    if (math.random(1, 100) < skill:getTP()/3) then
        target:addStatusEffect(xi.effect.INT_DOWN, 10, 0, 120)
    end

    target:takeDamage(dmg, mob, xi.attackType.RANGED, xi.damageType.PIERCING)
    return dmg
end

return mobskillObject
