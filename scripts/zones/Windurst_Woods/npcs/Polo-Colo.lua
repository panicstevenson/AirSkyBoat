-----------------------------------
-- Area: Windurst Woods
-- Polo-Colo
-- Warps players to Port Windurst
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
