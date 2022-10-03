-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Jeanvirgaud
-- Outpost Teleporter NPC
-- !pos -239.9489 8.0000 17.4968 231
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
