-----------------------------------
-- Zone: Ranguemont Pass (166)
-----------------------------------
local ID = require('scripts/zones/Ranguemont_Pass/IDs')
require('scripts/globals/conquest')
-----------------------------------
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    -- pick a random Taisaijin PH and set its do not disturb time
    local phIndex = math.random(1, 3)
    local ph = GetMobByID(ID.mob.TAISAIJIN_PH[phIndex])

    ph:setLocalVar("timeToGrow", os.time() + math.random(86400, 259200)) -- 1 to 3 days
    ph:setLocalVar("phIndex", phIndex)
end

zoneObject.onConquestUpdate = function(zone, updatetype)
    xi.conq.onConquestUpdate(zone, updatetype)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(302.778, -68.131, 257.759, 137)
    end

    return cs
end

zoneObject.onRegionEnter = function(player, region)
end

zoneObject.onEventUpdate = function(player, csid, option)
end

zoneObject.onEventFinish = function(player, csid, option)
end

return zoneObject
