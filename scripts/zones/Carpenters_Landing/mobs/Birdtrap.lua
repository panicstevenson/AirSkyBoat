-----------------------------------
-- Area: Carpenters' Landing
--  Mob: Birdtrap
-- Note: Placeholder Orctrap
-----------------------------------
local ID = require("scripts/zones/Carpenters_Landing/IDs")
require("scripts/globals/mobs")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    if mob:getID() == ID.mob.ORCTRAP_PH then
        mob:setRespawnTime(xi.mob.respawnTimer.DUNGEON)
    end
    xi.mob.phOnDespawn(mob, ID.mob.ORCTRAP_PH, 10, 3600) -- 1 hour minimum
end

return entity
