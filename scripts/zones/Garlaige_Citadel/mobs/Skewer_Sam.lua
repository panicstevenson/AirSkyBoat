-----------------------------------
-- Area: Garlaige Citadel (200)
--   NM: Skewer Sam
-----------------------------------
require("scripts/globals/titles")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    player:addTitle(xi.title.BEAKBENDER)
end

entity.onMobDespawn = function(mob)
    xi.mob.nmTODPersist(mob, math.random(132, 138) * 600) -- 22 to 23 hours in 10 minute windows
end

return entity
