-----------------------------------
-- Area: Western Altepa Desert
--  Mob: Cactuar
-- Note: Place holder for Cactuar_Cantautor
-----------------------------------
local ID = require("scripts/zones/Western_Altepa_Desert/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.regime.checkRegime(player, mob, 136, 2, xi.regime.type.FIELDS)
end

entity.onMobDespawn = function(mob)
    xi.mob.phOnDespawn(mob, ID.mob.CACTUAR_CANTAUTOR_PH, 5, 3600) -- 1 hour minimum
end

return entity
