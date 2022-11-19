-----------------------------------
-- Zone: Al_Zahbi (48)
-----------------------------------
local ID = require('scripts/zones/Al_Zahbi/IDs')
require('scripts/globals/chocobo')
-----------------------------------
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    xi.chocobo.initZone(zone)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        local position = math.random(1, 5) + 37
        player:setPos(position, 0, -62, 192)
    end

    if prevZone == player:getZoneID() then
        xi.moghouse.exitJobChange(player, prevZone)
    else
        player:setVolatileCharVar('[MOGHOUSE]Exit_Pending', 0)
        player:setVolatileCharVar('[MOGHOUSE]Exit_Job_Change', 0)
    end

    return cs
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
end

zoneObject.onEventUpdate = function(player, csid, option)
end

zoneObject.onEventFinish = function(player, csid, option)
    xi.moghouse.exitJobChangeFinish(player, csid, option)
end

return zoneObject
