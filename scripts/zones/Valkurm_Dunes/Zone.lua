-----------------------------------
-- Zone: Valkurm_Dunes (103)
-----------------------------------
local ID = require('scripts/zones/Valkurm_Dunes/IDs')
require('scripts/quests/i_can_hear_a_rainbow')
require('scripts/globals/chocobo_digging')
require('scripts/globals/conquest')
require('scripts/globals/missions')
require('scripts/globals/mog_tablets')
require('scripts/globals/status')
require('scripts/missions/amk/helpers')
-----------------------------------
local zoneObject = {}

zoneObject.onChocoboDig = function(player, precheck)
    return xi.chocoboDig.start(player, precheck)
end

zoneObject.onInitialize = function(zone)
    xi.conq.setRegionalConquestOverseers(zone:getRegionID())
    xi.mogTablet.onZoneInitialize(zone)

    local results = zone:queryEntitiesByName("qm2")
    if results ~= nil and results[1] ~= nil then
        local qm2 = results[1]

        if VanadielHour() < 5 or VanadielHour() >= 18 then
            qm2:setStatus(xi.status.NORMAL)
        else
            qm2:setStatus(xi.status.DISAPPEAR)
        end
    end
end

zoneObject.onZoneTick = function(zone)
    xi.mogTablet.onZoneTick(zone)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(60.989, -4.898, -151.001, 198)
    end

    if quests.rainbow.onZoneIn(player) then
        cs = 3
    end

    -- AMK06/AMK07
    if xi.settings.main.ENABLE_AMK == 1 then
        xi.amk.helpers.tryRandomlyPlaceDiggingLocation(player)
    end

    return cs
end

zoneObject.onZoneOut = function(player)
    if player:hasStatusEffect(xi.effect.BATTLEFIELD) then
        player:delStatusEffect(xi.effect.BATTLEFIELD)
    end
end

zoneObject.onConquestUpdate = function(zone, updatetype)
    xi.conq.onConquestUpdate(zone, updatetype)
end

zoneObject.onGameDay = function()
    SetServerVariable("[DIG]ZONE103_ITEMS", 0)
end

zoneObject.onRegionEnter = function(player, region)
end

zoneObject.onEventUpdate = function(player, csid, option)
    if csid == 3 then
        quests.rainbow.onEventUpdate(player)
    end
end

zoneObject.onEventFinish = function(player, csid, option)
end

zoneObject.onGameHour = function(zone)
    local results = zone:queryEntitiesByName("qm2")
    if results ~= nil and results[1] ~= nil then
        local qm2 = results[1]
        if VanadielHour() == 5 then
            qm2:setStatus(xi.status.DISAPPEAR)
        end
        if VanadielHour() == 18 then
            qm2:setStatus(xi.status.NORMAL)
        end
    end
end

zoneObject.onZoneWeatherChange = function(weather)
    local qm1 = GetNPCByID(ID.npc.SUNSAND_QM) -- Quest: An Empty Vessel
    if weather == xi.weather.DUST_STORM or weather == xi.weather.SAND_STORM then
        qm1:setStatus(xi.status.NORMAL)
    else
        qm1:setStatus(xi.status.DISAPPEAR)
    end
end

return zoneObject
