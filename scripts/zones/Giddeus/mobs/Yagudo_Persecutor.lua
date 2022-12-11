-----------------------------------
-- Area: Giddeus (145)
--  Mob: Yagudo Persecutor
-----------------------------------
local ID = require("scripts/zones/Giddeus/IDs")
require("scripts/globals/mobs")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    if mob:getID() == ID.mob.JUU_DUZU_THE_WHIRLWIND_PH then
        mob:setRespawnTime(xi.mob.respawnTimer.DUNGEON)
    end
    xi.mob.phOnDespawn(mob, ID.mob.JUU_DUZU_THE_WHIRLWIND_PH, 5, 3600) -- 1 to 2 hours
end

return entity
