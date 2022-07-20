-----------------------------------
-- Area: Riverne Site #B01
--  NPC: qm_unstable_cluster (???)
-- Note: Spawns Unstable Cluster
-----------------------------------
local ID = require("scripts/zones/Riverne-Site_B01/IDs")
require("scripts/globals/npc_util")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if npcUtil.tradeHas(trade, xi.items.CLUSTERED_TAR) and npcUtil.popFromQM(player, npc, ID.mob.UNSTABLE_CLUSTER) then
        player:confirmTrade()
    end
end

entity.onTrigger = function(player, npc)
    player:messageSpecial(ID.text.GROUND_GIVING_HEAT)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
