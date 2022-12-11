-----------------------------------
-- Area: Labyrinth of Onzozo
--  Mob: Labyrinth Manticore
-----------------------------------
local ID = require("scripts/zones/Labyrinth_of_Onzozo/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 775, 2, xi.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    local id = mob:getID()

    if
        id == ID.mob.WYVERN_PH or
        id == ID.mob.NARASIMHA_PH
    then
        mob:setRespawnTimer(xi.mob.respawnTimer.DUNGEON)
    end
    xi.mob.phOnDespawn(mob, ID.mob.WYVERN_PH, 20,1) -- Wyvern shared spawn
    xi.mob.phOnDespawn(mob, ID.mob.NARASIMHA_PH, 10, 21600) -- 6 hour minimum
end

return entity
