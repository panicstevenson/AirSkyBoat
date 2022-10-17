-----------------------------------
-- Area: Sacrificial Chamber
--  Mob: Vermilion-eared Noberry
-- BCNM: Jungle Boogymen
-----------------------------------
mixins =
{
    require("scripts/mixins/families/tonberry"),
    require("scripts/mixins/job_special")
}
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller then
        local elementalId = mob:getID() + 2
        if GetMobByID(elementalId):isSpawned() then
            DespawnMob(elementalId)
        end
    end
end

return entity
