-----------------------------------
-- Zone: Riverne-Site_A01
-----------------------------------
local ID = require('scripts/zones/Riverne-Site_A01/IDs')
require('scripts/globals/conquest')
require('scripts/globals/settings')
require('scripts/globals/status')
-----------------------------------
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    -- NM Persistence
    for i = ID.mob.CARMINE_DOBSONFLY_OFFSET, ID.mob.CARMINE_DOBSONFLY_OFFSET + 9 do
        xi.mob.nmTODPersistCache(zone, i)
    end
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
        player:setPos(732.55, -32.5, -506.544, 90)
    end

    return cs
end

zoneObject.afterZoneIn = function(player)
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
end

zoneObject.onEventUpdate = function(player, csid, option)
end

zoneObject.onEventFinish = function(player, csid, option)
    if csid >= 2 and csid <= 39 then
        for _, entry in pairs(player:getNotorietyList()) do
            entry:clearEnmity(player) -- reset hate on player after teleporting
        end
    end
end

return zoneObject
