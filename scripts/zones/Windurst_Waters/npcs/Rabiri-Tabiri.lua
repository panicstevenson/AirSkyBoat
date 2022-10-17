-----------------------------------
-- Area: Windurst Waters
--  NPC: Rabiri-Tabiri
-- Working 100%
-----------------------------------
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}

local path =
{
    { x = -109.833, y = -2.000, z = 49.970, rotation = 32, wait = 6000 },
    { x = -97.530, z = 50.283, rotation = 118, wait = 6000 },
    { x = -104.014, z = 42.639, rotation = 214, wait = 6000 },
}

entity.onSpawn = function(npc)
    npc:initNpcAi()
    npc:setPos(xi.path.first(path))
    npc:pathThrough(path, bit.bor(xi.path.flag.PATROL, xi.path.flag.RUN))
end

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(568)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
