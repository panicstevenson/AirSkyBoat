-----------------------------------
-- Area: The Boyahda Tree
--  Mob: Death Cap
-- Note: PH for Ellyllon
-----------------------------------
local ID = require("scripts/zones/The_Boyahda_Tree/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.regime.checkRegime(player, mob, 719, 1, xi.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    xi.mob.phOnDespawn(mob, ID.mob.ELLYLLON_PH, 10, 7200) -- 2 hour minimum
end

return entity
