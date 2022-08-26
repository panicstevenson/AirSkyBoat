-----------------------------------
-- Area: Garlaige Citadel
--  Mob: Fallen Mage
-- Note: Place holder Hovering Hotpot
-----------------------------------
local ID = require("scripts/zones/Garlaige_Citadel/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.regime.checkRegime(player, mob, 703, 2, xi.regime.type.FIELDS)
end

entity.onMobDespawn = function(mob)
    xi.mob.phOnDespawn(mob, ID.mob.HOVERING_HOTPOT_PH, 20, 1800) -- 30 minute minimum
end

return entity
