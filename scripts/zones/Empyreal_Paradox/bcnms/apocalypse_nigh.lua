-----------------------------------
-- Area: Empyreal_Paradox
-- Name: Apocalypse Nigh
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/quests")
-----------------------------------
local battlefieldObject = {}

battlefieldObject.onBattlefieldTick = function(battlefield, tick)
    xi.battlefield.onBattlefieldTick(battlefield, tick)
end

battlefieldObject.onBattlefieldRegister = function(player, battlefield)
end

battlefieldObject.onBattlefieldEnter = function(player, battlefield)
end

battlefieldObject.onBattlefieldLeave = function(player, battlefield, leavecode)
    if leavecode == xi.battlefield.leaveCode.WON then
        local _, clearTime, partySize = battlefield:getRecord()
        local arg8 = (player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.APOCALYPSE_NIGH) == QUEST_COMPLETED) and 1 or 0

        local worldFirst = string.format("WF_%s", "APOC_NIGH")
        if GetServerVariable(worldFirst) == 0 then
            hxi.worldFirst.checkWorldFirstServerVar(player,
                "APOC_NIGH",
                string.format("%s's group has been the first to defeat Kamlaunaut and Eald'narche, completing Apocalypse Nigh!", player:getName()))
        end

        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), arg8)
    elseif leavecode == xi.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end

battlefieldObject.onEventUpdate = function(player, csid, option)
end

battlefieldObject.onEventFinish = function(player, csid, option)
    if csid == 7 then
        player:setPos(-0.004, -10, -465.053, 64, 33)
    end
end

return battlefieldObject
