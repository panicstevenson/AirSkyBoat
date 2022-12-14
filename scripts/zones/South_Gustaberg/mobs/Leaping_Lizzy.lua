-----------------------------------
-- Area: South Gustaberg
--   NM: Leaping Lizzy
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMod(xi.mod.CLAIMSHIELD, 4000)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 200)
end

return entity
