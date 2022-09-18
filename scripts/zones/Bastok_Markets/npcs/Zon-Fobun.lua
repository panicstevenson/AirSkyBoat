-----------------------------------
-- Area: Bastok Markets
--  NPC: Zon-Fobun
-- !pos -241.293 -3 63.406 235
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}

local path =
{
    {x = -242.254, y = -2.000, z = 61.679, wait = 4000},
    {x = -240.300, y = -2.000, z = 65.194, wait = 4000},
}

entity.onSpawn = function(npc)
    npc:initNpcAi()
    npc:setPos(xi.path.first(path))
    npc:pathThrough(path, xi.path.flag.PATROL)
end

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
