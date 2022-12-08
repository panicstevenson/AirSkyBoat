-----------------------------------
-- Area: East Sarutabaruta
--  Mob: Savanna Rarab
-- Note: PH for Sharp Eared Ropipi
-----------------------------------
local ID = require("scripts/zones/East_Sarutabaruta/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    local liz =
    {
        17252507,
        17252506,
        17252487,
        17252488,
    }

    for i in pairs(liz) do
        if mob:getID() == liz[i] then
            mob:setRespawnTime(300)
        end
    end
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 91, 1, xi.regime.type.FIELDS)
end

entity.onMobDespawn = function(mob)
    xi.mob.phOnDespawn(mob, ID.mob.SHARP_EARED_ROPIPI_PH, 20, 300) -- 5 minutes
end

return entity
