-----------------------------------
-- Zone: Yuhtunga_Jungle (123)
-----------------------------------
local ID = require('scripts/zones/Yuhtunga_Jungle/IDs')
require('scripts/quests/i_can_hear_a_rainbow')
require('scripts/globals/chocobo_digging')
require('scripts/globals/conquest')
require('scripts/globals/helm')
require('scripts/globals/zone')
require('scripts/globals/beastmentreasure')
require('scripts/missions/amk/helpers')
-----------------------------------
local zone_object = {}

zone_object.onChocoboDig = function(player, precheck)
    return xi.chocoboDig.start(player, precheck)
end

zone_object.onInitialize = function(zone)
    UpdateNMSpawnPoint(ID.mob.MEWW_THE_TURTLERIDER)
    GetMobByID(ID.mob.MEWW_THE_TURTLERIDER):setRespawnTime(math.random(900, 10800))

    xi.conq.setRegionalConquestOverseers(zone:getRegionID())

    xi.helm.initZone(zone, xi.helm.type.HARVESTING)
    xi.helm.initZone(zone, xi.helm.type.LOGGING)

    xi.bmt.updatePeddlestox(xi.zone.YUHTUNGA_JUNGLE, ID.npc.PEDDLESTOX)
end

zone_object.onGameDay = function()
    xi.bmt.updatePeddlestox(xi.zone.YUHTUNGA_JUNGLE, ID.npc.PEDDLESTOX)

    -- Chocobo Digging.
    SetServerVariable("[DIG]ZONE105_ITEMS", 0)
end

zone_object.onConquestUpdate = function(zone, updatetype)
    xi.conq.onConquestUpdate(zone, updatetype)
end

zone_object.onZoneIn = function( player, prevZone)
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(116.825, 6.613, 100, 140)
    end

    if quests.rainbow.onZoneIn(player) then
        cs = 11
    end

    -- AMK06/AMK07
    if xi.settings.main.ENABLE_AMK == 1 then
        xi.amk.helpers.tryRandomlyPlaceDiggingLocation(player)
    end

    return cs
end

zone_object.onZoneOut = function(player)
    if player:hasStatusEffect(xi.effect.BATTLEFIELD) then
        player:delStatusEffect(xi.effect.BATTLEFIELD)
    end
end

zone_object.onRegionEnter = function( player, region)
end

zone_object.onEventUpdate = function( player, csid, option)
    if csid == 11 then
        quests.rainbow.onEventUpdate(player)
    end
end

zone_object.onEventFinish = function( player, csid, option)
end

zone_object.onZoneWeatherChange = function(weather)
    if xi.settings.main.ENABLE_WOTG == 1 then
        local bayawak = GetMobByID(ID.mob.BAYAWAK)
        if
            not bayawak:isSpawned() and os.time() > bayawak:getLocalVar("cooldown") and
            xi.settings.main.ENABLE_WOTG == 1 and
            (weather == xi.weather.HOT_SPELL or weather == xi.weather.HEAT_WAVE)
        then
            DisallowRespawn(bayawak:getID(), false)
            bayawak:setRespawnTime(math.random(30, 150)) -- pop 30-150 sec after fire weather starts
        end
    end
end

return zone_object
