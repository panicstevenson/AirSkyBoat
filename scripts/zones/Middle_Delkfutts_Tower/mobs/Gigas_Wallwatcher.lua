-----------------------------------
-- Area: Middle Delkfutt's Tower
--  Mob: Gigas Wallwatcher
-- Note: PH for Ogygos
-----------------------------------
local ID = require("scripts/zones/Middle_Delkfutts_Tower/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.regime.checkRegime(player, mob, 783, 1, xi.regime.type.GROUNDS)
    xi.regime.checkRegime(player, mob, 784, 2, xi.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    xi.mob.phOnDespawn(mob, ID.mob.OGYGOS_PH, 5, 7200) -- 2 hour minimum
end

return entity
