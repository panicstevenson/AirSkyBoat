-----------------------------------
-- Zone: Promyvion-Vahzl (22)
-----------------------------------
local ID = require('scripts/zones/Promyvion-Vahzl/IDs')
require('scripts/globals/promyvion')
require('scripts/globals/settings')
require('scripts/globals/status')
-----------------------------------
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    xi.promyvion.initZone(zone)
    xi.horizon.spawnInitialMobs(zone)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(-14.744, 0.036, -119.736, 1) -- To Floor 1 (R)
    end

    return cs
end

zoneObject.afterZoneIn = function(player)
    if xi.settings.main.ENABLE_COP_ZONE_CAP == 1 then
        player:addStatusEffect(xi.effect.LEVEL_RESTRICTION, 50, 0, 0)
    end
end

zoneObject.onRegionEnter = function(player, region)
    xi.promyvion.onRegionEnter(player, region)
end

zoneObject.onRegionLeave = function(player, region)
end

zoneObject.onEventUpdate = function(player, csid, option)
    if csid >= 30 and csid <= 44 then
        for _, entry in pairs(player:getNotorietyList()) do
            entry:clearEnmity(player) -- reset hate on player after teleporting
        end
    end
end

zoneObject.onEventFinish = function(player, csid, option)
    if csid == 45 and option == 1 then
        player:setPos(-379.947, 48.045, 334.059, 192, 9) -- To Pso'Xja (R)
    end
end

zoneObject.onGameDay = function(zone)
    xi.promyvion.zoneGameDay(zone)
end

return zoneObject
