-----------------------------------
-- Zone: Southern_San_dOria (230)
-----------------------------------
local ID = require('scripts/zones/Southern_San_dOria/IDs')
require('scripts/globals/events/harvest_festivals')
require('scripts/quests/flyers_for_regine')
require('scripts/globals/conquest')
require('scripts/globals/settings')
require('scripts/globals/chocobo')
require('scripts/globals/zone')
-----------------------------------
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    zone:registerTriggerArea(1, -292, -10, 90 , -258, 10, 105)
    quests.ffr.initZone(zone) -- register trigger areas 2 through 6
    applyHalloweenNpcCostumes(zone:getID())
    xi.chocobo.initZone(zone)
    xi.conquest.toggleRegionalNPCs(zone)
    xi.hardcore.setupNPC(zone)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    -- FIRST LOGIN (START CS)
    if player:getPlaytime(false) == 0 then
        if xi.settings.main.NEW_CHARACTER_CUTSCENE == 1 then
            cs = 503
        end

        player:setPos(-96, 1, -40, 224)
        player:setHomePoint()
    end

    -- MOG HOUSE EXIT
    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(161, -2, 161, 94)
    end

    if prevZone == player:getZoneID() then
        xi.moghouse.exitJobChange(player, prevZone)
    else
        player:setVolatileCharVar('[MOGHOUSE]Exit_Pending', 0)
        player:setVolatileCharVar('[MOGHOUSE]Exit_Job_Change', 0)
    end

    return cs
end

zoneObject.onConquestUpdate = function(zone, updatetype)
    xi.conq.onConquestUpdate(zone, updatetype)
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
    quests.ffr.onTriggerAreaEnter(player, triggerArea) -- player approaching Flyers for Regine NPCs
end

zoneObject.onTriggerAreaLeave = function(player, triggerArea)
end

zoneObject.onEventUpdate = function(player, csid, option)
end

zoneObject.onEventFinish = function(player, csid, option)
    if csid == 503 then
        player:messageSpecial(ID.text.ITEM_OBTAINED, 536)
    end

    xi.moghouse.exitJobChangeFinish(player, csid, option)
end

return zoneObject
