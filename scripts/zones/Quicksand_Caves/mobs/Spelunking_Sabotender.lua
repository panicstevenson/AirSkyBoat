-----------------------------------
-- Area: Quicksand Caves
--  Mob: Spelunking Sabotender
-----------------------------------
local ID = require("scripts/zones/Quicksand_Caves/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 816, 1, xi.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    if mob:getID() == ID.mob.SABOTENDER_BAILARINA_PH then
        mob:setRespawnTimer(xi.mob.respawnTimer.DUNGEON)
    end
    xi.mob.phOnDespawn(mob, ID.mob.SABOTENDER_BAILARINA_PH, 10, 9000) -- 2.5 hours
end

return entity
