-----------------------------------
-- Area: South Gustaberg
--  Mob: Ornery Sheep
-- Note: PH for Carnero
-----------------------------------
local ID = require("scripts/zones/South_Gustaberg/IDs")
require("scripts/globals/mobs")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    local sheep =
    {
        17215638,
        17215611,
        17215612,
        17215624,
        17215625,
        17215646,
        17215645,
        17215648,
        17215649,
    }

    for i in pairs(sheep) do
        if mob:getID() == sheep[i] then
            mob:setRespawnTime(300)
        end
    end
end

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    xi.mob.phOnDespawn(mob, ID.mob.CARNERO_PH, 5, 1) -- Pure lottery
end

return entity
