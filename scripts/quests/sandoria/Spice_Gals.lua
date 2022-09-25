-----------------------------------
-- Souls in Shadow
-- Novalmauge !pos 70 -24 21 167
-- qm2 !pos 118 36 -281 160
-----------------------------------
require('scripts/globals/interaction/quest')
require('scripts/globals/weaponskillids')
require('scripts/globals/keyitems')
require('scripts/globals/npc_util')
require('scripts/globals/quests')
require('scripts/globals/status')
require('scripts/globals/items')
-----------------------------------
local ID = require('scripts/zones/Riverne-Site_A01/IDs')
-----------------------------------

local quest = Quest:new(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.SOULS_IN_SHADOW)

quest.reward =
{
    item = xi.items.MIRATETES_MEMOIRS,
    fame = 40,
    fameArea = xi.quest.fame_area.SANDORIA,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == QUEST_AVAILABLE and
            player:getCurrentMission(xi.mission.log_id.COP) >= xi.mission.id.cop.ANCIENT_VOWS
        end,

        [xi.zone.SOUTHERN_SAN_DORIA] =
        {
            ['Rouva'] = quest:progressEvent(724),

            onEventFinish =
            {
                [724] = function(player, csid, option, npc)
                    if option == 1 then
                        quest:begin(player)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == QUEST_ACCEPTED
        end,

        [xi.zone.SOUTHERN_SAN_DORIA] =
        {
            ['Rouva'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(xi.ki.RIVERNEWORT) then
                        return quest:progressEvent(725)
                    else
                        return quest:event(728) -- Additional Dialogue
                    end
                end,
            },

            onEventFinish =
            {
                [725] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:delKeyItem(xi.ki.RIVERNEWORT)
                        quest:setVar(player, 'Option', getConquestTally())
                    end
                end,
            },
        },

        [xi.zone.RIVERNE_SITE_A01] =
        {
            ['qm_rivernewort'] =
            {
                onTrigger = function(player, npc)
                    if not player:hasKeyItem(xi.ki.RIVERNEWORT) then
                        player:addKeyItem(xi.ki.RIVERNEWORT)
                        return quest:message(ID.text.KEYITEM_OBTAINED)
                    end
                end,
            },
        },

        [xi.zone.RIVERNE_SITE_B01] =
        {
            ['qm_rivernewort'] =
            {
                onTrigger = function(player, npc)
                    if not player:hasKeyItem(xi.ki.RIVERNEWORT) then
                        player:addKeyItem(xi.ki.RIVERNEWORT)
                        return quest:message(ID.text.KEYITEM_OBTAINED)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == QUEST_COMPLETED and
                quest:getVar(player, 'Option') < getConquestTally()
        end,

        [xi.zone.SOUTHERN_SAN_DORIA] =
        {
            ['Rouva'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(xi.ki.RIVERNEWORT) then
                        return quest:progressEvent(725)
                    else
                        return quest:event(724)
                    end
                end,
            },

            onEventFinish =
            {
                [725] = function(player, csid, option, npc)
                    player:delKeyItem(xi.ki.RIVERNEWORT)
                    npcUtil.giveItem(player, xi.items.MIRATETES_MEMOIRS)
                    quest:setVar(player, 'Option', getConquestTally())
                end,
            },
        },

        [xi.zone.RIVERNE_SITE_A01] =
        {
            ['qm_rivernewort'] =
            {
                onTrigger = function(player, npc)
                    if not player:hasKeyItem(xi.ki.RIVERNEWORT) then
                        player:addKeyItem(xi.ki.RIVERNEWORT)
                        return quest:message(ID.text.KEYITEM_OBTAINED)
                    end
                end,
            },
        },

        [xi.zone.RIVERNE_SITE_B01] =
        {
            ['qm_rivernewort'] =
            {
                onTrigger = function(player, npc)
                    if not player:hasKeyItem(xi.ki.RIVERNEWORT) then
                        player:addKeyItem(xi.ki.RIVERNEWORT)
                        return quest:message(ID.text.KEYITEM_OBTAINED)
                    end
                end,
            },
        },
    },
}

return quest
