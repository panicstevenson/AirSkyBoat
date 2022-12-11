-----------------------------------
-- Area: Ranguemont Pass
--  Mob: Hecteyes
-----------------------------------
require("scripts/globals/regimes")
local ID = require("scripts/zones/Ranguemont_Pass/IDs")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 606, 2, xi.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    if mob:getID() == ID.mob.HYAKUME_PH then
        mob:setRespawnTime(xi.mob.respawnTimer.DUNGEON)
    end
    xi.mob.phOnDespawn(mob, ID.mob.HYAKUME_PH, 15, 3600) -- 1 hour
end

return entity
