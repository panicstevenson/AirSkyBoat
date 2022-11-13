-----------------------------------
-- Zone: Port_San_dOria (232)
-----------------------------------
local ID = require('scripts/zones/Port_San_dOria/IDs')
require('scripts/quests/flyers_for_regine')
require('scripts/globals/conquest')
require('scripts/globals/missions')
require('scripts/globals/settings')
require('scripts/globals/zone')
-----------------------------------
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    quests.ffr.initZone(zone) -- register regions 1 through 5
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    -- FIRST LOGIN (START CS)
    if player:getPlaytime(false) == 0 then
        if xi.settings.main.NEW_CHARACTER_CUTSCENE == 1 then
            cs = 500
        end

        player:setPos(-104, -8, -128, 227)
        player:setHomePoint()
    end

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        if prevZone == xi.zone.SAN_DORIA_JEUNO_AIRSHIP then
            cs = 702
            player:setPos(-1.000, 0.000, 44.000, 0)
        else
            player:setPos(80, -16, -135, 165)
        end
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

zoneObject.onRegionEnter = function(player, region)
    quests.ffr.onRegionEnter(player, region) -- player approaching Flyers for Regine NPCs
end

zoneObject.onRegionLeave = function(player, region)
end

zoneObject.onTransportEvent = function(player, transport)
    if player:getLocalVar('[AIRSHIP]Paid') == 1 then
        player:startEvent(700)
    else
        player:setPos(-33.5104, -8.1500, 27.7711, 0)
        player:setLocalVar('[AIRSHIP]Paid', 0)
    end
end

zoneObject.onEventUpdate = function(player, csid, option)
end

zoneObject.onEventFinish = function(player, csid, option)
    if csid == 500 then
        player:messageSpecial(ID.text.ITEM_OBTAINED, 536)
    elseif csid == 700 then
        player:setVolatileCharVar('[MOGHOUSE]Exit_Job_Change', 0)
        player:setPos(0, 0, 0, 0, 223)
    elseif csid == 518 and option == 0 then
        player:setLocalVar('[AIRSHIP]Paid', 0)
    end

    xi.moghouse.exitJobChangeFinish(player, csid, option)
end

return zoneObject
