-----------------------------------
-- Area: Ordelle's Caves
--  Mob: Stroper Chyme
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMod(xi.mod.CLAIMSHIELD, 1000)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
