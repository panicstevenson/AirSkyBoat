-----------------------------------
-- Area: Port Windurst
--  NPC: Rottata
-- Outpost Teleporter NPC
-- !pos -137.7822 -5.5000 157.7986 240
-----------------------------------
require("scripts/globals/conquest")
require("scripts/globals/horizon_teleports")
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    xi.horizon.teleport.triggerOPWarp(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
