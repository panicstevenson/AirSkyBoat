-----------------------------------
-- Zone: Mordion_Gaol
-----------------------------------
local ID = require('scripts/zones/Mordion_Gaol/IDs')
require('scripts/globals/conquest')
-----------------------------------
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    xi.jail.registerRegions(zone)
end

zoneObject.onConquestUpdate = function(zone, updatetype)
    xi.conq.onConquestUpdate(zone, updatetype)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1
    if player:getCharVar('[JAIL]inJail') > 0 then
        player:jail()
        if player:getCharVar('[JAIL]cellSet') == 0 then
            player:setJailCell()
        end
    end

    return cs
end

zoneObject.onRegionEnter = function(player, region)
    if player:getCharVar('[JAIL]inJail') > 0 and player:getCharVar('punishment') > 3 then
        xi.jail.punish(player)
    end
end

zoneObject.onRegionLeave = function(player, region)
    if player:getCharVar('[JAIL]inJail') > 0 then
        xi.jail.restrainCell(player, region:getRegionID())
    end
end

zoneObject.onZoneOut = function(player)
    if player:getCharVar('[JAIL]inJail') > 0 then
        xi.jail.restrainCell(player)
    end
end

zoneObject.onEventUpdate = function(player, csid, option)
end

zoneObject.onEventFinish = function(player, csid, option)
end

return zoneObject
