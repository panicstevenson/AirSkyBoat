-----------------------------------
-- Area: Palborough Mines
--  Mob: Old Quadav
-- Note: PH for Be'Hya Hundredwall
-----------------------------------
local ID = require("scripts/zones/Palborough_Mines/IDs")
require("scripts/globals/mobs")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    if mob:getID() == ID.mob.BEHYA_HUNDREDWALL_PH then
        mob:setRespawnTime(xi.mob.respawnTimer.DUNGEON)
    end
    xi.mob.phOnDespawn(mob, ID.mob.BEHYA_HUNDREDWALL_PH, 10, 3600) -- 1 hour
end

return entity
