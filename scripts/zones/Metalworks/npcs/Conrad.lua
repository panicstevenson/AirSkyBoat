-----------------------------------
-- Area: Metalworks
--  NPC: Conrad
-- Outpost Teleporter NPC
-- !pos 130.6146 -16.9836 25.4512 237
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
