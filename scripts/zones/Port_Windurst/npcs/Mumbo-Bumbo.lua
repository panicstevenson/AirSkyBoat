-----------------------------------
-- Area: Port Windurst
-- Mumbo-Bumbo
-- Warps players to Windurst Woods
-----------------------------------
require("scripts/globals/horizon_teleports")

local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    hxi.teleport.triggerTaruWarp(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
