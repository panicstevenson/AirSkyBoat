-----------------------------------
--  Ore Toss
--
--  Description: Deals high damage in a ranged attack.
--  Type: Ranged
--  Utsusemi/Blink absorb: Yes
--  Range: Unknown range
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
    local numhits = 1
    local accmod = 1
    local dmgmod = math.random(3, 6)

    if (skill:getID()==1123) then
        -- Skill ID is Ore Toss used by Dynamis Quadavs as a ranged attack.
        -- against a 298 defense character - dmgmod of 1 produces hits of low 100s to high 100s by Masons in Bastok.
        dmgmod = 1
    end

    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.physicalTpBonus.DMG_VARIES, 1, 2, 3)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.RANGED, xi.damageType.BLUNT, xi.mobskills.shadowBehavior.NUMSHADOWS_1)
    target:takeDamage(dmg, mob, xi.attackType.RANGED, xi.damageType.BLUNT)
    return dmg
end

return mobskill_object
