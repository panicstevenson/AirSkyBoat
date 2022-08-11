-----------------------------------
-- Area: Waughroon Shrine
--  Mob: Flayer Franz
-- BCNM: The Worm's Turn
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
    target:setPos(mob:getXPos() + 0.3, mob:getYPos(), mob:getZPos() + 0.3, mob:getRotPos())
end

entity.onMobDeath = function(mob, player, isKiller)
end

return entity
