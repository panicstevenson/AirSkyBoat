-----------------------------------
-- Zone: Garlaige_Citadel (200)
-----------------------------------
local ID = require('scripts/zones/Garlaige_Citadel/IDs')
require('scripts/globals/conquest')
require('scripts/globals/treasure')
require('scripts/globals/status')
-----------------------------------
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    -- Banishing Gate #1
    zone:registerRegion(1, -208, -1, 224, -206, 1, 227)
    zone:registerRegion(2, -208, -1, 212, -206, 1, 215)
    zone:registerRegion(3, -213, -1, 224, -211, 1, 227)
    zone:registerRegion(4, -213, -1, 212, -211, 1, 215)

    -- Banishing Gate #2
    zone:registerRegion(10,  -51, -1,  82,  -49, 1,  84)
    zone:registerRegion(11, -151, -1,  82, -149, 1,  84)
    zone:registerRegion(12,  -51, -1, 115,  -49, 1, 117)
    zone:registerRegion(13, -151, -1, 115, -149, 1, 117)

    -- Banishing Gate #3
    zone:registerRegion(19, -190, -1, 355, -188, 1, 357)
    zone:registerRegion(20, -130, -1, 355, -128, 1, 357)
    zone:registerRegion(21, -190, -1, 322, -188, 1, 324)
    zone:registerRegion(22, -130, -1, 322, -128, 1, 324)

    UpdateNMSpawnPoint(ID.mob.OLD_TWO_WINGS)
    GetMobByID(ID.mob.OLD_TWO_WINGS):setRespawnTime(math.random(900, 10800))

    UpdateNMSpawnPoint(ID.mob.SKEWER_SAM)
    GetMobByID(ID.mob.SKEWER_SAM):setRespawnTime(math.random(900, 10800))

    UpdateNMSpawnPoint(ID.mob.SERKET)
    GetMobByID(ID.mob.SERKET):setRespawnTime(math.random(900, 10800))

    xi.treasure.initZone(zone)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(-380.035, -13.548, 398.032, 64)
    end

    return cs
end

zoneObject.onConquestUpdate = function(zone, updatetype)
    xi.conq.onConquestUpdate(zone, updatetype)
end

zoneObject.onRegionEnter = function(player, region)
    local regionId = region:GetRegionID()
    local leverSet = math.floor(regionId / 9)                      -- The set of levers player is standing on (0, 1, 2)
    local gateId   = ID.npc.BANISHING_GATE_OFFSET + (9 * leverSet) -- The ID of the related gate
    local gate = GetNPCByID(gateId)

    -- Logic when standing on the lever.
    GetNPCByID(ID.npc.BANISHING_GATE_OFFSET + regionId):setAnimation(xi.anim.OPEN_DOOR)

    -- If all 4 levers of a set are down, open related gate for 30 seconds.
    if
        GetNPCByID(gateId):getAnimation() == xi.anim.CLOSE_DOOR and -- Avoid spamming.

        GetNPCByID(gateId + 1):getAnimation() == xi.anim.OPEN_DOOR and
        GetNPCByID(gateId + 2):getAnimation() == xi.anim.OPEN_DOOR and
        GetNPCByID(gateId + 3):getAnimation() == xi.anim.OPEN_DOOR and
        GetNPCByID(gateId + 4):getAnimation() == xi.anim.OPEN_DOOR
    then
        if gate:getLocalVar("isOpen") == 0 then

            -- set gate opened var to prevent 'opening' an already open gate.
            gate:setLocalVar("isOpen", 1)

            -- I think different gates might have different durations.
            local time = 60
            local zonePlayers = player:getZone():getPlayers()
            gate:openDoor(time)
            for _, zonePlayer in pairs(zonePlayers) do
                -- send gate opening text to each player in zone
                zonePlayer:messageSpecial(ID.text.BANISHING_GATES + leverSet)

                gate:timer(1000 * time, function(gateArg)
                    -- send gate closing text to each player in zone
                    zonePlayer:messageSpecial(ID.text.BANISHING_GATES_CLOSING + leverSet)
                end)
            end

            gate:timer(1000 * time, function(gateArg)
                -- set gate closed var to allow this gate to be opened again.
                gateArg:setLocalVar("isOpen", 0)
            end)
        end
    end
end

-- TODO: For onRegionEnter and onRegionLeave
-- Regularly, the levers will deactivate the moment you step down, so long as the related door is closed.
-- However, if a lever is activated while it's related door is open, the lever will remain activated until the door closes.

zoneObject.onRegionLeave = function(player, region)
    GetNPCByID(ID.npc.BANISHING_GATE_OFFSET + region:GetRegionID()):setAnimation(xi.anim.CLOSE_DOOR)
end

zoneObject.onEventUpdate = function(player, csid, option)
end

zoneObject.onEventFinish = function(player, csid, option)
end

return zoneObject
