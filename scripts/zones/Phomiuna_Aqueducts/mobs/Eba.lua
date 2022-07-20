-----------------------------------
-- Area: Phomiuna_Aqueducts
--   NM: Eba
-----------------------------------
mixins = {require("scripts/mixins/fomor_hate")}
local ID = require("scripts/zones/Phomiuna_Aqueducts/IDs")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setLocalVar("fomorHateAdj", 4)
end

entity.onMobDeath = function(mob, player, isKiller)
end

entity.onMobDespawn = function(mob)
    -- Respawn is shared with Mahisha, random to see which spawns
    if math.random(1,2) == 1 then
        DisallowRespawn(mob:getID(), true)
        DisallowRespawn(ID.mob.MAHISHA, false)
        GetMobByID(ID.mob.MAHISHA):setRespawnTime(math.random(28800, 43200)) -- 8 to 12 hours
    else
        mob:setRespawnTime(math.random(28800, 43200)) -- 8 to 12 hours
    end
end

return entity
