-----------------------------------
-- Area: Ghelsba Outpost (140)
--  Mob: Orcish Grunt
-- Note: PH for Thousandarm Deshglesh
-----------------------------------
local ID = require("scripts/zones/Ghelsba_Outpost/IDs")
require("scripts/globals/mobs")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    if mob:getID() == ID.mob.THOUSANDARM_DESHGLESH_PH then
        mob:setRespawnTime(ID.mob.respawnTime.DUNGEON)
    end
    xi.mob.phOnDespawn(mob, ID.mob.THOUSANDARM_DESHGLESH_PH, 5, 3600) -- 1 hour minimum
end

return entity
