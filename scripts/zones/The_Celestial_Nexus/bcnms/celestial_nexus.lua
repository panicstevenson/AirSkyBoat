-----------------------------------
-- Area: The Celestial Nexus
-- Name: The Celestial Nexus (ZM16)
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/missions")
require("scripts/globals/titles")
-----------------------------------
local battlefieldObject = {}

battlefieldObject.onBattlefieldTick = function(battlefield, tick)
    xi.battlefield.onBattlefieldTick(battlefield, tick)
end

battlefieldObject.onBattlefieldInitialise = function(battlefield)
    battlefield:setLocalVar("phaseChange", 1)
end

battlefieldObject.onBattlefieldRegister = function(player, battlefield)
end

battlefieldObject.onBattlefieldEnter = function(player, battlefield)
end

battlefieldObject.onBattlefieldLeave = function(player, battlefield, leavecode)
    if leavecode == xi.battlefield.leaveCode.WON then
        local _, clearTime, partySize = battlefield:getRecord()

        if player:getCurrentMission(xi.mission.log_id.ZILART) == xi.mission.id.zilart.THE_CELESTIAL_NEXUS then
            player:setLocalVar("battlefieldWin", battlefield:getID())
        end

        local arg8 = (player:hasCompletedMission(xi.mission.log_id.ZILART, xi.mission.id.zilart.THE_CELESTIAL_NEXUS)) and 1 or 0

        if player:getCharVar("celestialWin") == 0 then
            player:setCharVar("celestialWin", 1)

            local str = string.format(
            "Your %s capacity has been increased by %i!",
            "Mog Wardrobe 2", 5)

            player:PrintToPlayer(str, xi.msg.channel.SYSTEM_3, "")
        end

        local worldFirst = string.format("WF_%s", "ZILART_MISSION")
        if GetServerVariable(worldFirst) == 0 then
            hxi.worldFirst.checkWorldFirstServerVar(player,
                "ZILART_MISSION",
                string.format("%s's group has been the first to defeat Eald'narche and complete the Rise of the Zilart mission line!", player:getName()))
        end

        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), arg8)
    elseif leavecode == xi.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end

battlefieldObject.onEventUpdate = function(player, csid, option)
end

battlefieldObject.onEventFinish = function(player, csid, option)
end

return battlefieldObject
