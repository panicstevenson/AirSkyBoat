-----------------------------------
-- Area: Oldton Movalpolos
--  NPC: Tarnotik
-- Type: Standard NPC
-- !pos 160.896 10.999 -55.659 11
-----------------------------------
require("scripts/globals/missions")
require("scripts/globals/npc_util")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if player:getCurrentMission(xi.mission.log_id.COP) >= xi.mission.id.cop.THREE_PATHS and npcUtil.tradeHas(trade, 1725) then
        if player:hasKeyItem(xi.ki.SHAFT_2716_OPERATING_LEVER) then
            player:startEvent(54)
        else
            player:startEvent(32)
        end
    end
end

entity.onTrigger = function(player, npc)
    if math.random() < 0.5 then -- this isn't retail at all.
        player:startEvent(30)
    else
        player:startEvent(31)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 32 then
        player:confirmTrade()
        xi.teleport.to(player, xi.teleport.id.MINESHAFT)
    elseif csid == 54 and option == 1 then
        player:delKeyItem(xi.item.SHAFT_2716_OPERATING_LEVER)
    end
end

return entity
