-----------------------------------
-- Area: Ordelles Caves (193)
--   NM: Morbolger
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.ALWAYS_AGGRO, 1) -- "Aggros regardless of level"
    mob:setMod(xi.mod.CLAIMSHIELD, 4000)
end

entity.onMobDeath = function(mob, player, optParams)
    player:addTitle(xi.title.MORBOLBANE)
end

entity.onMobDespawn = function(mob)
    xi.mob.nmTODPersist(mob, math.random(132, 138) * 600) -- 22 to 23 hours in 10 minute windows
end

return entity
