-----------------------------------
-- Area: Horlais Peak
--  Mob: Gerjis
-- BCNM: Eye of the Tiger
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMod(xi.mod.EVA, 50)
end

entity.onMobDeath = function(mob, player, isKiller)
end

return entity
