-----------------------------------
-- Zone: Sacrarium (28)
-----------------------------------
local ID = require('scripts/zones/Sacrarium/IDs')
require('scripts/globals/conquest')
require('scripts/globals/settings')
require('scripts/globals/treasure')
require('scripts/globals/status')
-----------------------------------
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    -- randomize Old Prof. Mariselle's spawn location
    GetNPCByID(ID.npc.QM_MARISELLE_OFFSET + math.random(0, 5)):setLocalVar("hasProfessorMariselle", 1)

    xi.treasure.initZone(zone)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(-219.996, -18.587, 82.795, 64)
    end

    return cs
end

zoneObject.afterZoneIn = function(player)
end

zoneObject.onConquestUpdate = function(zone, updatetype)
    xi.conq.onConquestUpdate(zone, updatetype)
end

zoneObject.onRegionEnter = function(player, region)
end

zoneObject.onGameDay = function()
    -- change 18 labyrinth doors depending on in-game day (0 = open, 1 = closed)
    local labyrinthDoorsByDay =
    {
        [xi.day.FIRESDAY]     = { 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0 },
        [xi.day.EARTHSDAY]    = { 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0 },
        [xi.day.WATERSDAY]    = { 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1 },
        [xi.day.WINDSDAY]     = { 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0 },
        [xi.day.ICEDAY]       = { 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0 },
        [xi.day.LIGHTNINGDAY] = { 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0 },
        [xi.day.LIGHTSDAY]    = { 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1 },
        [xi.day.DARKSDAY]     = { 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0 },
    }

    local doors = labyrinthDoorsByDay[VanadielDayOfTheWeek()]
    for i = 0, 17 do
        GetNPCByID(ID.npc.LABYRINTH_OFFSET + i):setAnimation(xi.anim.OPEN_DOOR + doors[i + 1])
    end
end

zoneObject.onEventUpdate = function(player, csid, option)
end

zoneObject.onEventFinish = function(player, csid, option)
end

zoneObject.onZoneWeatherChange = function(weather)
    local elel = GetMobByID(ID.mob.ELEL)
    if
        not elel:isSpawned() and os.time() > elel:getLocalVar("cooldown") and
        (weather == xi.weather.GLOOM or weather == xi.weather.DARKNESS) and
        (VanadielHour() < 4 or VanadielHour() >= 20)
    then
        DisallowRespawn(elel:getID(), false)
        elel:setRespawnTime(math.random(30, 150)) -- pop 30-150 sec after wind weather starts
    end
end

return zoneObject
