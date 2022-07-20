-----------------------------------
-- Area: Eastern Altepa Desert
--  Mob: Giant Spider
-- Note: PH for Dune Widow
-----------------------------------
local ID = require("scripts/zones/Eastern_Altepa_Desert/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.regime.checkRegime(player, mob, 109, 1, xi.regime.type.FIELDS)
end

entity.onMobDespawn = function(mob)
    xi.mob.phOnDespawn(mob, ID.mob.DUNE_WIDOW_PH, 10, 3600) -- 1 hour minimum
end

return entity
