-----------------------------------
-- Area: Windurst Walls
--  NPC: Nanaa Mihgo
-- Starts and Finishes Quest: Mihgo's Amigo (R), The Tenshodo Showdown (start), Rock Racketeer (start)
-- Involved In Quest: Crying Over Onions
-- Involved in Mission 2-1
-- !pos 62 -4 240 241
-----------------------------------
local ID = require("scripts/zones/Windurst_Woods/IDs")
require("scripts/globals/items")
require("scripts/globals/keyitems")
require("scripts/globals/magic")
require("scripts/globals/missions")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/status")
require("scripts/globals/titles")
require("scripts/globals/utils")
-----------------------------------
local entity = {}

local trustMemory = function(player)
    local memories = 0
    -- 2 - Saw her at the start of the game
    if player:getNation() == xi.nation.WINDURST then
        memories = memories + 2
    end

    -- 4 - ROCK_RACKETEER
    if player:hasCompletedQuest(xi.quest.log_id.WINDURST, xi.quest.id.windurst.ROCK_RACKETEER) then
        memories = memories + 4
    end

    -- 8 - HITTING_THE_MARQUISATE
    if player:hasCompletedQuest(xi.quest.log_id.WINDURST, xi.quest.id.windurst.HITTING_THE_MARQUISATE) then
        memories = memories + 8
    end

    -- 16 - CRYING_OVER_ONIONS
    if player:hasCompletedQuest(xi.quest.log_id.WINDURST, xi.quest.id.windurst.CRYING_OVER_ONIONS) then
        memories = memories + 16
    end

    -- 32 - hasItem(286) Nanaa Mihgo statue
    if player:hasItem(xi.items.NANAA_MIHGO_STATUE) then
        memories = memories + 32
    end

    -- 64 - ROAR_A_CAT_BURGLAR_BARES_HER_FANGS
    if player:hasCompletedMission(xi.mission.log_id.AMK, xi.mission.id.amk.ROAR_A_CAT_BURGLAR_BARES_HER_FANGS) then
        memories = memories + 64
    end

    return memories
end

entity.onTrade = function(player, npc, trade)
    local rot = npc:getRotPos()

    if
        npcUtil.tradeHas(trade, { { 8889, 1 } }, true) and
        player:getCharVar("thfsNeck") == 0
    then
        player:faceTarget(npc)

        npc:timer(250, function(npcArg)
            player:PrintToPlayer("This reminds me of a lucky necklace I once crrrafted for myself...", xi.msg.channel.SAY , "Nanaa Mihgo")
        end)

        npc:timer(750, function(npcArg)
            player:PrintToPlayer("I could fashion one for you as well if you brrring me the proper materials.", xi.msg.channel.SAY , "Nanaa Mihgo")
        end)

        npc:timer(1250, function(npcArg)
            player:PrintToPlayer("Brrring me a set of things to bring you luck. A rrrare bud perhaps...?", xi.msg.channel.SAY , "Nanaa Mihgo")
        end)

        npc:timer(1750, function(npcArg)
            player:PrintToPlayer("Also, a special egg, and don't forget the tail of a lucky vermin.", xi.msg.channel.SAY , "Nanaa Mihgo")
        end)

        npc:timer(2250, function(npcArg)
            player:PrintToPlayer("Finally a pendant of deep blue color...", xi.msg.channel.SAY , "Nanaa Mihgo")
        end)

        npc:timer(2750, function(npcArg)
            npcArg:setRotation(rot)
            player:setCharVar("thfsNeck", 1)
            player:confirmTrade()
        end)
    elseif
        npcUtil.tradeHas(trade, { 4600, 4369, 4444, 13086 }, true) and
        player:getCharVar("thfsNeck") == 1
    then
        player:faceTarget(npc)

        npc:timer(250, function(npcArg)
            player:PrintToPlayer("Ah so it seems you have brrrought me everything.", xi.msg.channel.SAY , "Nanaa Mihgo")
        end)

        npc:timer(750, function(npcArg)
            player:PrintToPlayer("This next part is going to take a bit though...", xi.msg.channel.SAY , "Nanaa Mihgo")
        end)

        npc:timer(1250, function(npcArg)
            player:PrintToPlayer("I'll leave the necklace for you at my hideout deep in the Horutoto Rrruins.", xi.msg.channel.SAY , "Nanaa Mihgo")
            player:setCharVar("thfsNeck", 2)
            player:confirmTrade()
        end)

        npc:timer(1750, function(npcArg)
            npcArg:setRotation(rot)
        end)
    end
end

--npcUtil.tradeHas(trade, { xi.items.MYTHRIL_PICK, xi.items.MYTHRIL_PICK_HQ }, true, true)

entity.onTrigger = function(player, npc)
    local wildcatWindurst = player:getCharVar("WildcatWindurst")
    local mihgosAmigo = player:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.MIHGO_S_AMIGO)

    -- LURE OF THE WILDCAT (WINDURST 2-1)
    -- Simply checks this NPC as talked to for the PC, should be highest priority
    if
        player:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.LURE_OF_THE_WILDCAT) == QUEST_ACCEPTED and
        not utils.mask.getBit(wildcatWindurst, 4)
    then
        player:startEvent(732)

    -- TRUST
    elseif
        player:hasKeyItem(xi.ki.WINDURST_TRUST_PERMIT) and
        not player:hasSpell(xi.magic.spell.NANAA_MIHGO) and
        player:getLocalVar("TrustDialogue") == 0
    then
        local trustFlag = (player:getRank(player:getNation()) >= 3 and 1 or 0) + (mihgosAmigo == QUEST_COMPLETED and 2 or 0)

        player:setLocalVar("TrustDialogue", 1)

        player:startEvent(865, 0, 0, 0, trustMemory(player), 0, 0, 0, trustFlag)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    -- LURE OF THE WILDCAT (WINDURST)
    if csid == 732 then
        player:setCharVar("WildcatWindurst", utils.mask.setBit(player:getCharVar("WildcatWindurst"), 4, true))
    end
end

return entity
