-----------------------------------
-- Zone: Ship bound for Selbina Pirates (227)
-----------------------------------
local ID = require('scripts/zones/Ship_bound_for_Selbina_Pirates/IDs')
require('scripts/globals/zone')
require('scripts/globals/pirates')
require('scripts/globals/sea_creatures')
-----------------------------------
local zone_object = {}

zone_object.onInitialize = function(zone)
    xi.pirates.init(ID)
end

zone_object.onZoneIn = function(player, prevZone)
    local cs = -1
    local zoneID = 227

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        local position = math.random(-2, 2) + 0.150
        player:setPos(position, -2.100, 3.250, 64)
        if
            player:getGMLevel() == 0 and
            GetZone(zoneID):getLocalVar('stateSet') == 0
        then
            GetZone(zoneID):setLocalVar('stateSet', 1)
            GetZone(zoneID):setLocalVar('state', 2)
            GetZone(zoneID):setLocalVar('transportTime', os.time())
        end
    end

    return cs
end

zone_object.onGameHour = function(zone)
    local hour = VanadielHour()
    if
        hour >= 20 or
        hour < 4
    then
        -- Check for Enagakure
        local players = zone:getPlayers()
        for _, player in pairs(players) do
            if player:hasKeyItem(xi.ki.SEANCE_STAFF)
                and player:getVar("Enagakure_Killed") == 0
                and not GetMobByID(ID.mob.ENAGAKURE):isSpawned()
            then
                GetMobByID(ID.mob.ENAGAKURE):spawn()
            end
        end
        if
            math.random() < 0.20 and
            not GetMobByID(ID.mob.PHANTOM):isSpawned()
        then
            GetMobByID(ID.mob.PHANTOM):spawn()
        end
    else
        if GetMobByID(ID.mob.PHANTOM):isSpawned() then
            DespawnMob(ID.mob.PHANTOM)
        end
        if GetMobByID(ID.mob.ENAGAKURE):isSpawned() then
            DespawnMob(ID.mob.ENAGAKURE)
        end
    end
end

zone_object.onZoneTick = function(zone)
    if zone:getLocalVar('state') == 1 then
        if GetMobByID(ID.mob.PHANTOM):isSpawned() then
            DespawnMob(ID.mob.PHANTOM)
        end
        xi.sea_creatures.despawn(ID)
        zone:setLocalVar('state', 0)
    elseif zone:getLocalVar('state') == 2 then
        xi.pirates.start(ID)
        xi.sea_creatures.checkSpawns(ID, 5, 1) -- 5 percent on init
        zone:setLocalVar('state', 0)
    end

    if os.time() - zone:getLocalVar('transportTime') % 60 then
        xi.sea_creatures.checkSpawns(ID, 1, 2) -- 1 percent per vana minute, 2 total mobs
    end

    xi.pirates.update(ID, zone, os.time()-zone:getLocalVar('transportTime'))
end

zone_object.onTransportEvent = function(player, transport)
    player:getZone():setLocalVar('stateSet', 0)
    player:getZone():setLocalVar('state', 1)
    player:startEvent(255)
end

zone_object.onEventUpdate = function(player, csid, option)
end

zone_object.onEventFinish = function(player, csid, option)
    if csid == 255 then
        player:setPos(0, 0, 0, 0, xi.zone.SELBINA)
    end
end

return zone_object
