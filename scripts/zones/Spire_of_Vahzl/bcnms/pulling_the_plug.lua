-----------------------------------
-- Pulling the Plug
-- Spire of Vahzl ENM
-----------------------------------
local ID = require("scripts/zones/Spire_of_Vahzl/IDs")
require("scripts/globals/battlefield")
require("scripts/globals/missions")
require("scripts/globals/titles")
-----------------------------------
local battlefield_object = {}

battlefield_object.onBattlefieldInitialise = function(battlefield)
    battlefield:setLocalVar("loot", 1)
    battlefield:setLocalVar("GreenDead", 0)
    battlefield:setLocalVar("BlueDead", 0)
    battlefield:setLocalVar("TealDead", 0)
end

battlefield_object.onBattlefieldTick = function(battlefield, tick)
    xi.battlefield.onBattlefieldTick(battlefield, tick)
end

battlefield_object.onBattlefieldRegister = function(player, battlefield)
end

battlefield_object.onBattlefieldEnter = function(player, battlefield)
    if player:hasKeyItem(xi.ki.CENSER_OF_ACRIMONY) then
        player:delKeyItem(xi.ki.CENSER_OF_ACRIMONY)
        player:messageSpecial(ID.text.CENSER_FADES, xi.ki.CENSER_OF_ACRIMONY)
        player:setCharVar("[ENM]VenessaComplete", 1)
    end
end

battlefield_object.onBattlefieldLeave = function(player, battlefield, leavecode)
    if leavecode == xi.battlefield.leaveCode.WON then
        local _, clearTime, partySize = battlefield:getRecord()
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 0)
    elseif leavecode == xi.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end

battlefield_object.onEventUpdate = function(player, csid, option)
end

battlefield_object.onEventFinish = function(player, csid, option)
    if csid == 32001 then
        player:addExp(3000)
    end
end

return battlefield_object
