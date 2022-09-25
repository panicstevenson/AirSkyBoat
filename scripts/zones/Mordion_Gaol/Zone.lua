-----------------------------------
-- Zone: Mordion_Gaol
-----------------------------------
local ID = require('scripts/zones/Mordion_Gaol/IDs')
require('scripts/globals/conquest')
-----------------------------------
local zone_object = {}

zone_object.onInitialize = function(zone)
    xi.jail.registerRegions(zone)
end

zone_object.onConquestUpdate = function(zone, updatetype)
    xi.conq.onConquestUpdate(zone, updatetype)
end

zone_object.onZoneIn = function(player, prevZone)
    local cs = -1
    if player:getCharVar('[JAIL]inJail') > 0 then
        player:jail()
        if player:getCharVar('[JAIL]cellSet') == 0 then
            player:setJailCell()
        end
    end

    return cs
end

zone_object.onRegionEnter = function(player, region)
    if player:getCharVar('[JAIL]inJail') > 0 and player:getCharVar('punishment') > 3 then
        xi.jail.punish(player)
    end
end

zone_object.onRegionLeave = function(player, region)
    if player:getCharVar('[JAIL]inJail') > 0 then
        xi.jail.restrainCell(player, region:getRegionID())
    end
end

zone_object.onZoneOut = function(player)
    if player:getCharVar('[JAIL]inJail') > 0 then
        xi.jail.restrainCell(player)
    end
end

zone_object.onEventUpdate = function(player, csid, option)
end

zone_object.onEventFinish = function(player, csid, option)
end

return zone_object
