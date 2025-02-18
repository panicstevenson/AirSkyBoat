-----------------------------------
-- Zone: Temenos (37)
-----------------------------------
local ID = require('scripts/zones/Temenos/IDs')
require('scripts/globals/conquest')
require('scripts/globals/settings')
require('scripts/globals/status')
-----------------------------------
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    SetServerVariable("[TEMENOS_NORTHERN_TOWER]Time", 0)
    SetServerVariable("[TEMENOS_EASTERN_TOWER]Time", 0)
    SetServerVariable("[TEMENOS_WESTERN_TOWER]Time", 0)
    SetServerVariable("[CENTRAL_TEMENOS_4TH_FLOOR]Time", 0)
    SetServerVariable("[CENTRAL_TEMENOS_3RD_FLOOR]Time", 0)
    SetServerVariable("[CENTRAL_TEMENOS_2ND_FLOOR]Time", 0)
    SetServerVariable("[CENTRAL_TEMENOS_1ST_FLOOR]Time", 0)
    SetServerVariable("[CENTRAL_TEMENOS_BASEMENT]Time", 0)

    -- Temenos North Elevators
    zone:registerRegion(1,   340.000, 5,  376.000, 0, 0, 0) -- F1 -> F2
    zone:registerRegion(2,   220.000, 5,  376.000, 0, 0, 0) -- F2 -> F3
    zone:registerRegion(3,    20.000, 5,  376.000, 0, 0, 0) -- F3 -> F4
    zone:registerRegion(4,  -100.000, 5,  376.000, 0, 0, 0) -- F4 -> F5
    zone:registerRegion(5,  -300.000, 5,  376.000, 0, 0, 0) -- F5 -> F6
    zone:registerRegion(6,  -420.000, 5,  376.000, 0, 0, 0) -- F6 -> F7
    zone:registerRegion(7,  -620.000, 5,  376.000, 0, 0, 0) -- F7 -> Entrance

    -- Temenos East Elevators
    zone:registerRegion(8,   340.000, 5,   96.000, 0, 0, 0) -- F1 -> F2
    zone:registerRegion(9,   220.000, 5,   96.000, 0, 0, 0) -- F2 -> F3
    zone:registerRegion(10,   20.000, 5,   96.000, 0, 0, 0) -- F3 -> F4
    zone:registerRegion(11, -100.000, 5,   96.000, 0, 0, 0) -- F4 -> F5
    zone:registerRegion(12, -300.000, 5,   96.000, 0, 0, 0) -- F5 -> F6
    zone:registerRegion(13, -420.000, 5,   96.000, 0, 0, 0) -- F6 -> F7
    zone:registerRegion(14, -620.000, 5,   96.000, 0, 0, 0) -- F7 -> Entrance

    -- Temenos West Elevators
    zone:registerRegion(15,  340.000, 5, -184.000, 0, 0, 0) -- F1 -> F2
    zone:registerRegion(16,  220.000, 5, -184.000, 0, 0, 0) -- F2 -> F3
    zone:registerRegion(17,   20.000, 5, -184.000, 0, 0, 0) -- F3 -> F4
    zone:registerRegion(18, -100.000, 5, -184.000, 0, 0, 0) -- F4 -> F5
    zone:registerRegion(19, -300.000, 5, -184.000, 0, 0, 0) -- F5 -> F6
    zone:registerRegion(20, -420.000, 5, -184.000, 0, 0, 0) -- F6 -> F7
    zone:registerRegion(21, -620.000, 5, -184.000, 0, 0, 0) -- F7 -> Entrance

    -- Temenos Central Elevators
    zone:registerRegion(22,  540.000, 5, -544.000, 0, 0, 0) -- Basement -> Entrance
    zone:registerRegion(23,  300.000, 5, -504.000, 0, 0, 0) -- F1 -> Entrance
    zone:registerRegion(24,  -20.000, 5, -544.000, 0, 0, 0) -- F2 -> Entrance
    zone:registerRegion(25, -264.000, 5, -500.000, 0, 0, 0) -- F3 -> Entrance
    zone:registerRegion(26, -580.000, 5, -584.000, 0, 0, 0) -- F4 -> Entrance

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
        player:setPos(580, -1.5, 4.452, 192)
    end

    return cs
end

zoneObject.onRegionEnter = function(player, region)
    local regionID = region:GetRegionID()
    local cs

    if GetNPCByID(ID.npc.TEMENOS_N_GATE[1] + (regionID - 1)):getAnimation() == xi.animation.OPEN_DOOR then
        if regionID > 20 then
            cs = 120
        else
            cs = regionID + 99
        end

        player:startOptionalCutscene(cs)
    end
end

zoneObject.onRegionLeave = function(player, region)
end

zoneObject.onEventUpdate = function(player, csid, option)
    if csid == 32001 or csid == 32002 then
        player:messageSpecial(ID.text.HUM + 1)
    end
end

zoneObject.onEventFinish = function(player, csid, option)
    if csid >= 100 and csid <= 120 then
        for _, entry in pairs(player:getNotorietyList()) do
            entry:clearEnmity(player) -- reset hate on player after teleporting
        end
    end
end

return zoneObject
