-----------------------------------
-- Area: Upper Delkfutt's Tower
--   NM: Pallas
-----------------------------------
mixins = { require("scripts/mixins/job_special") }
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMod(xi.mod.CLAIMSHIELD, 4000)
end

entity.onMobDespawn = function(mob)
    xi.mob.nmTODPersist(mob, math.random(132, 138) * 600) -- 22 to 23 hours in 10 minute windows
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
