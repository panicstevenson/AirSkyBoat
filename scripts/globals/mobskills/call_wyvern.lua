-----------------------------------
-- Call Wyvern
-- Call my pet.
-----------------------------------
require("scripts/globals/msg")
require("scripts/globals/mobskills")
require("modules/era/lua_dynamis/globals/era_dynamis_spawning")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    if mob:hasPet() or mob:getPet() == nil then
        return 1
    end

    return 0
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    if mob:isInDynamis() then
        local mobInfo = xi.dynamis.mobList[mob:getZoneID()][mob:getZone():getLocalVar((string.format("MobIndex_%s", mob:getID())))]

        if mobInfo ~= nil and mobInfo.info[2] == "Apocalyptic Beast" then
            if mob:getLocalVar("CALL_WYVERN") == 1 then
                skill:setMsg(xi.msg.basic.NONE)
                return 0
            end

            for i = 5, 1, -1 do
                xi.dynamis.spawnDynamicPet(target, mob, xi.job.DRG)
            end
        else
            xi.dynamis.spawnDynamicPet(target, mob, xi.job.DRG)
        end
    else
        mob:spawnPet()
    end

    skill:setMsg(xi.msg.basic.NONE)

    return 0
end

return mobskill_object
