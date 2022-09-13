-----------------------------------
-- Area: Bastok Markets
--  NPC: Michea
-- Starts: Father Figure (100%) | The Elvaan Goldsmith (100%)
-- Involed in: Distant Loyalties
-- !pos -298 -16 -157 235
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    local distantLoyalties = player:getQuestStatus(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.DISTANT_LOYALTIES)
    local fatherFigure = player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.FATHER_FIGURE)

    -- DISTANT LOYALTIES
    if (distantLoyalties == QUEST_ACCEPTED and player:getCharVar("DistantLoyaltiesProgress") == 2 and npcUtil.tradeHas(trade, 653)) then
        player:startEvent(317)

    -- FATHER FIGURE
    elseif (fatherFigure == QUEST_ACCEPTED and npcUtil.tradeHas(trade, 744)) then
        player:startEvent(241)
    end
end

entity.onTrigger = function(player, npc)
    local theElvaanGoldsmith = player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.THE_ELVAAN_GOLDSMITH)
    local distantLoyalties = player:getQuestStatus(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.DISTANT_LOYALTIES)
    local distantLoyaltiesProgress = player:getCharVar("DistantLoyaltiesProgress")
    local fatherFigure = player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.FATHER_FIGURE)

    -- DISTANT LOYALTIES
    if distantLoyalties == QUEST_ACCEPTED and distantLoyaltiesProgress >= 1 and distantLoyaltiesProgress <= 3 then
        if distantLoyaltiesProgress == 1 and player:hasKeyItem(xi.ki.GOLDSMITHING_ORDER) then
            player:startEvent(315)
        elseif distantLoyaltiesProgress == 2 then
            player:startEvent(316)
        elseif distantLoyaltiesProgress == 3 and player:needToZone() then
            player:startEvent(317)
        elseif distantLoyaltiesProgress == 3 and not player:needToZone() then
            player:startEvent(318)
        end

    -- FATHER FIGURE
    elseif theElvaanGoldsmith == QUEST_COMPLETED and fatherFigure == QUEST_AVAILABLE and player:getFameLevel(xi.quest.fame_area.BASTOK) >= 2 then
        player:startEvent(240)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    -- DISTANT LOYALTIES
    if csid == 315 then
        player:delKeyItem(xi.ki.GOLDSMITHING_ORDER)
        player:setCharVar("DistantLoyaltiesProgress", 2)
    elseif csid == 317 then
        player:confirmTrade()
        player:setCharVar("DistantLoyaltiesProgress", 3)
        player:needToZone(true)
    elseif csid == 318 then
        player:setCharVar("DistantLoyaltiesProgress", 4)
        npcUtil.giveKeyItem(player, xi.ki.MYTHRIL_HEARTS)

    -- FATHER FIGURE
    elseif csid == 240 then
        player:addQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.FATHER_FIGURE)
    elseif csid == 241 then
        if npcUtil.completeQuest(player, xi.quest.log_id.BASTOK, xi.quest.id.bastok.FATHER_FIGURE, {gil=2200, fame=120}) then
            player:confirmTrade()
        end
    end
end

return entity
