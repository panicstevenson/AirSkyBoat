-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Goblin Reaper
-- Note: Place holder Goblinsavior Heronox
-----------------------------------
local ID = require("scripts/zones/Gustav_Tunnel/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.regime.checkRegime(player, mob, 764, 3, xi.regime.type.GROUNDS)
    xi.regime.checkRegime(player, mob, 765, 3, xi.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    xi.mob.phOnDespawn(mob, ID.mob.GOBLINSAVIOR_HERONOX_PH, 5, 10800) -- 3 hour minimum
end

return entity
