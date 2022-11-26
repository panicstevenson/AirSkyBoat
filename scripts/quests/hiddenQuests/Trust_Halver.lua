-----------------------------------
-- Trust: Halver
-----------------------------------
require('scripts/globals/items')
require('scripts/globals/quests')
require('scripts/globals/npc_util')
require('scripts/globals/interaction/hidden_quest')
-----------------------------------

local quest = HiddenQuest:new("TrustHalver")

quest.sections =
{
    {
        check = function(player, questVars, vars)
            return not player:hasSpell(972) and
                not player:findItem(xi.items.CIPHER_OF_HALVERS_ALTER_EGO) and
                player:hasCompletedMission(xi.mission.log_id.ROV, xi.mission.id.rov.THE_PATH_UNTRAVELED) and
                xi.settings.main.ENABLE_ROV == 1
        end,

        [xi.zone.CHATEAU_DORAGUILLE] =
        {
            ['Halver'] =
            {
                onTrigger = function(player, npc)
                    -- NOTE: No cap has been provided to determine if there is separate dialogue.  This
                    -- exists as a stopgap to ensure that the player can receive the item in case of full
                    -- inventory, or having already progressed.

                    npcUtil.giveItem(player, xi.items.CIPHER_OF_HALVERS_ALTER_EGO)
                    return quest:noAction()
                end,
            },
        },
    },
}

return quest
