-----------------------------------
-- Area: North Gustaberg
--  Mob: Maneating Hornet
-- Note: Place Holder For Stinging Sophie
-----------------------------------
local ID = require("scripts/zones/North_Gustaberg/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    local bees =
    {
        17211532,
        17211534,
        17211535,
        17211533,
        17211536,
        17211531,
        17211556,
        17211557,
        17211558,
        17211560,
        17211559,
        17211581,
        17211582,
        17211580,
        17211583,
        17211579
    }

    for i in pairs(bees) do
        if mob:getID() == bees[i] then
            mob:setRespawnTime(300)
        end
    end
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 17, 1, xi.regime.type.FIELDS)
end

entity.onMobDespawn = function(mob)
    xi.mob.phOnDespawn(mob, ID.mob.STINGING_SOPHIE_PH, 5, 1) -- Pure Lottery
end

return entity
