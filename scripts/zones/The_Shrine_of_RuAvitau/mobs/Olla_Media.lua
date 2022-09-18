-----------------------------------
-- Area: The Shrine of Ru'Avitau
--  Mob: Olla Media
-----------------------------------
local ID = require("scripts/zones/The_Shrine_of_RuAvitau/IDs")
require("scripts/globals/settings")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.DISPEL)
end

entity.onMobDeath = function(mob, player, isKiller)
    if isKiller then
        local pos = mob:getPos()
        GetMobByID(mob:getID() + 1):setSpawn(pos.x, pos.y, pos.z)
        SpawnMob(mob:getID() + 1):updateEnmity(player)
    end
end

entity.onMobDespawn = function(mob)
    if (not GetMobByID(mob:getID() + 1):isSpawned()) then -- if this Media despawns and Grande is not alive, it would be because it despawned outside of being killed.
        GetNPCByID(ID.npc.OLLAS_QM):updateNPCHideTime(xi.settings.main.FORCE_SPAWN_QM_RESET_TIME)
    end
end

return entity
