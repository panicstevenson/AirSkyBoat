-----------------------------------
-- Area: Giddeus (145)
--  Mob: Yagudo Piper
-- Note: PH for Vuu Puqu the Beguiler
-----------------------------------
local ID = require("scripts/zones/Giddeus/IDs")
require("scripts/globals/mobs")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    if mob:getID() == ID.mob.VUU_PUQU_THE_BEGUILER_PH then
        mob:setRespawnTime(xi.mob.respawnTimer.DUNGEON)
    end
    xi.mob.phOnDespawn(mob, ID.mob.VUU_PUQU_THE_BEGUILER_PH, 15, 900) -- 15 minutes
end

return entity
