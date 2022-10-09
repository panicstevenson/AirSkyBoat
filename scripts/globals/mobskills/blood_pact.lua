-----------------------------------
-- Blood Pact
-- Commands pet to use one of their abilities.
-----------------------------------
require("scripts/globals/mobskills")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local ID = require("scripts/zones/Mine_Shaft_2716/IDs")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    if not mob:getPet():isAlive() then
        return 0
    elseif GetMobByID(mob:getID()+2):isAlive() and mob:getPool() == 1296 then
        return 0
    else
        return 1
    end
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    -- Fantoccini (ENM: Pulling the Strings)
    if mob:getPool() == 1296 then
        local pet = GetMobByID(mob:getID()+3)
        pet:setTP(3000)
        pet:setMobMod(xi.mobMod.SKILL_LIST, ID.jobTable[mob:getMainJob()].petSkillList[mob:getLocalVar("petModel")])
        mob:timer(1, function(mobArg)
            pet:setMobMod(xi.mobMod.SKILL_LIST, 0)
        end)
    else
        mob:getPet():setTP(3000)
    end
    skill:setMsg(xi.msg.basic.NONE)
    return 0
end

return mobskill_object
