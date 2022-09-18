-----------------------------------
-- Area: Rabao
--  NPC: Eflatun
-- Standard Info NPC
-----------------------------------
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}

local path =
{
    {x = -27.722, y = 2.087, z = -40.146, wait = 5000},
    {x = -31.931, y = 0.772, z = -40.160, wait = 5000},
    {x = -32.677, y = 0.623, z = -43.978, wait = 5000},
    {x = -36.593, y = 0.000, z = -46.357, wait = 5000},
    {x = -30.784, y = 0.714, z = -50.402, wait = 5000},
    {x = -24.458, y = 3.035, z = -45.556, wait = 5000},
}

entity.onSpawn = function(npc)
    npc:initNpcAi()
    npc:setPos(xi.path.first(path))
    npc:pathThrough(path, xi.path.flag.PATROL)
end

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(55)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
