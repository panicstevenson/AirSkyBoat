-----------------------------------
-- Area: The Shrine of Ru'Avitau
--  Mob: Aura Statue
-----------------------------------
local ID = require("scripts/zones/The_Shrine_of_RuAvitau/IDs")
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDespawn = function(mob)
    xi.mob.phOnDespawn(mob, ID.mob.ULLIKUMMI_PH, 5, 10800) -- 3 hours
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 749, 1, xi.regime.type.GROUNDS)
    xi.regime.checkRegime(player, mob, 754, 1, xi.regime.type.GROUNDS)
end

return entity
