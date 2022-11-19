-----------------------------------
-- An Invitation West
-- Promathia 2-1
-----------------------------------
-- !addmission 6 138
-----------------------------------
require('scripts/globals/interaction/mission')
require('scripts/globals/keyitems')
require('scripts/globals/missions')
require('scripts/globals/titles')
require('scripts/globals/zone')
-----------------------------------
local lufaiseID = require('scripts/zones/Lufaise_Meadows/IDs')
-----------------------------------

local mission = Mission:new(xi.mission.log_id.COP, xi.mission.id.cop.AN_INVITATION_WEST)

mission.reward =
{
    title       = xi.title.DEAD_BODY,
    nextMission = { xi.mission.log_id.COP, xi.mission.id.cop.THE_LOST_CITY },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [xi.zone.LUFAISE_MEADOWS] =
        {
            onZoneIn =
            {
                function(player, prevZone)
                    if mission:getVar(player, 'Status') == 0 then
                        return 110
                    end
                end,
            },

            onEventFinish =
            {
                [110] = function(player, csid, option, npc)
                    player:messageSpecial(lufaiseID.text.KI_STOLEN, 0, xi.ki.MYSTERIOUS_AMULET)
                    player:delKeyItem(xi.ki.MYSTERIOUS_AMULET)
                    mission:setVar(player, 'Status', 1)
                    player:changeContainerSize(xi.inv.WARDROBE2, 5)

                    return player:PrintToPlayer("Your Mog Wardrobe 2 capacity has been increased by 5!", xi.msg.channel.SYSTEM_3, "")
                end,
            },
        },

        [xi.zone.TAVNAZIAN_SAFEHOLD] =
        {
            onZoneIn =
            {
                function(player, prevZone)
                    if mission:getVar(player, 'Status') == 1 then
                        return 101
                    end
                end,
            },

            onEventFinish =
            {
                [101] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
