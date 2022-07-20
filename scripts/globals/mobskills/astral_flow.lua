-----------------------------------
-- Astral Flow
-----------------------------------
require("scripts/globals/mobskills")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local mobskill_object = {}

xi = xi or {}
xi.astralflow = xi.astralflow or {}
xi.astralflow.avatarOffsets =
{
    [17444883] = 3, -- Vermilion-eared Noberry
    [17453078] = 3, -- Duke Dantalian
    [17453085] = 3, -- Duke Dantalian
    [17453092] = 3, -- Duke Dantalian
    [17506670] = 5, -- Kirin
}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(xi.msg.basic.USES)
    local mobID = mob:getID()
    local avatar = 0

    if xi.astralflow.avatarOffsets[mobID] then
        avatar = mobID + xi.astralflow.avatarOffsets[mobID]
    else
        avatar = mobID + 2 -- default offset
    end

    if not GetMobByID(avatar):isSpawned() then
        GetMobByID(avatar):setSpawn(mob:getXPos() + 1, mob:getYPos(), mob:getZPos() + 1, mob:getRotPos())
        SpawnMob(avatar):updateEnmity(mob:getTarget())
    end

    return xi.effect.ASTRAL_FLOW
end

return mobskill_object
