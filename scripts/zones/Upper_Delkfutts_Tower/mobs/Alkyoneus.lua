-----------------------------------
-- Area: Upper Delkfutt's Tower
--   NM: Alkyoneus
-----------------------------------
mixins = { require("scripts/mixins/job_special") }
-----------------------------------
local entity = {}

entity.onMobDespawn = function(mob)
    xi.mob.nmTODPersist(mob, math.random(132, 138) * 600) -- 22 to 23 hours in 10 minute windows
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
