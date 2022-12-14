-----------------------------------
-- Area: Konschtat Highlands
--   NM: Stray Mary
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/titles")
require("scripts/quests/tutorial")
-----------------------------------

local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMod(xi.mod.CLAIMSHIELD, 4000)
end

entity.onMobSpawn = function(mob)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 203)
    player:addTitle(xi.title.MARYS_GUIDE)
    xi.tutorial.onMobDeath(player)
end

return entity
