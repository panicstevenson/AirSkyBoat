-----------------------------------
-- Area: Balga's Dais
--  Mob: Nenaunir's Wife
-- BCNM: Harem Scarem
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMod(xi.mod.LULLABYRES, 100)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
