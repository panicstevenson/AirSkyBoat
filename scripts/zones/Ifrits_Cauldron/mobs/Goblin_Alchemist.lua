-----------------------------------
-- Area: Ifrit's Cauldron
--  Mob: Goblin Alchemist
-----------------------------------
require("scripts/globals/regimes")
local ID = require("scripts/zones/Ifrits_Cauldron/IDs")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.regime.checkRegime(player, mob, 757, 1, xi.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    xi.mob.phOnDespawn(mob, ID.mob.FORESEER_ORAMIX_PH, 5, 3600) -- 1 hour
end

return entity
