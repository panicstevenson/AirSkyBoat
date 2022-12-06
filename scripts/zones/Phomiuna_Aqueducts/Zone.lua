-----------------------------------
-- Zone: Phomiuna_Aqueducts (27)
-----------------------------------
local ID = require('scripts/zones/Phomiuna_Aqueducts/IDs')
require('scripts/globals/settings')
require('scripts/globals/status')
-----------------------------------
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    -- NM Persistence
    xi.mob.nmTODPersistCache(zone, ID.mob.TRES_DUENDES)
    -- Mahisha and Eba share a respawn, random to see who spawns
    if GetServerVariable("EBA_MAHISHA") == 1 then
        xi.mob.nmTODPersistCache(zone, ID.mob.MAHISHA)
    else
        xi.mob.nmTODPersistCache(zone, ID.mob.EBA)
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
        player:setPos(260.02, -2.12, -290.461, 192)
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
end

return zoneObject
