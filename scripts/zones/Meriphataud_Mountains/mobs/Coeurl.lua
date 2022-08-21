-----------------------------------
-- Area: Meriphataud Mountains
--  Mob: Coeurl
-- Note: PH for Patripatan
-----------------------------------
local ID = require("scripts/zones/Meriphataud_Mountains/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.regime.checkRegime(player, mob, 63, 1, xi.regime.type.FIELDS)
end

entity.onMobDespawn = function(mob)
    xi.mob.phOnDespawn(mob, ID.mob.PATRIPATAN_PH, 10, 3600) -- 1 to 3 hours
end

return entity
