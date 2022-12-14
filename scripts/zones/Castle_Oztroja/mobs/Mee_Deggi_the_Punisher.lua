-----------------------------------
-- Area: Castle Oztroja (151)
--   NM: Mee Deggi the Punisher
-----------------------------------
mixins = { require("scripts/mixins/job_special") }
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMod(xi.mod.CLAIMSHIELD, 4000)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
