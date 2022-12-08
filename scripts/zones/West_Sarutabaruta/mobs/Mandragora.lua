-----------------------------------
-- Area: West Sarutabaruta
--  Mob: Mandragora
-- Note: PH for Tom Tit Tat
-----------------------------------
local ID = require("scripts/zones/West_Sarutabaruta/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    local liz =
    {
        17248467,
        17248466,
        17248507,
        17248506,
        17248543,
        17248546,
        17248544,
        17248545
    }

    for i in pairs(liz) do
        if mob:getID() == liz[i] then
            mob:setRespawnTime(300)
        end
    end
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 26, 1, xi.regime.type.FIELDS)
end

entity.onMobDespawn = function(mob)
    xi.mob.phOnDespawn(mob, ID.mob.TOM_TIT_TAT_PH, 7, math.random(3600, 7200)) -- 1 to 2 hours
end

return entity
