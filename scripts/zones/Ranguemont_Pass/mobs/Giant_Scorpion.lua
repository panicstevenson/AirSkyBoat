-----------------------------------
-- Area: Ranguemont Pass
--  Mob: Giant Scorpion
-- Note: Place holder Bat Eye
-----------------------------------
local ID = require("scripts/zones/Ranguemont_Pass/IDs")
require("scripts/globals/mobs")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob)
end

entity.onMobDespawn = function(mob)
    if mob:getID() == ID.mob.BAT_EYE_PH then
        mob:setRespawnTime(xi.mob.respawnTimer.DUNGEON)
    end
    xi.mob.phOnDespawn(mob, ID.mob.BAT_EYE_PH, 10, 300) -- Considered a true lottery set to 5 minutes
end

return entity
