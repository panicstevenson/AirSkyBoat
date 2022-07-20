-----------------------------------
-- Area: Pso'xja
--  NPC: ???
-- Notes: Used to spawn Golden-Tongued Culberry
-- !pos -270.063 31.395 256.812 9
-----------------------------------
local ID = require("scripts/zones/PsoXja/IDs")
require("scripts/globals/npc_util")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    local pendantChance = 0
    if npcUtil.tradeHasExactly(trade, xi.items.ODOROUS_KNIFE) then
        pendantChance = 500
    elseif npcUtil.tradeHasExactly(trade, xi.items.ODOROUS_KNIFE_P1) then
        pendantChance = 1000
    end

    if pendantChance > 0 and npcUtil.popFromQM(player, npc, ID.mob.GOLDEN_TONGUED_CULBERRY) then
        player:confirmTrade()
        SetDropRate(1190, 13145, pendantChance)
    end
end

entity.onTrigger = function(player, npc)
    player:messageSpecial(ID.text.BROKEN_KNIFE)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
