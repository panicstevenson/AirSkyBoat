-----------------------------------
-- Zone: Attohwa_Chasm (7)
-----------------------------------
local ID = require('scripts/zones/Attohwa_Chasm/IDs')
require('scripts/globals/helm')
require('scripts/globals/zone')
-----------------------------------
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    -- Poison Flowers!
    zone:registerRegion(1, -475.809, 5, 316.499, 0, 0, 0)
    zone:registerRegion(2, -440.938, 7, 281.749, 0, 0, 0)
    zone:registerRegion(3, -388.027, 5, 264.831, 0, 0, 0)
    zone:registerRegion(4, -534.104, 5, 217.833, 0, 0, 0)
    zone:registerRegion(5, -530.000, 5, 210.000, 0, 0, 0)
    zone:registerRegion(6, -482.192, 5, 198.647, 0, 0, 0)
    zone:registerRegion(7, -595.756, 7, 157.532, 0, 0, 0)
    zone:registerRegion(8, -514.000, 5, 166.000, 0, 0, 0)
    zone:registerRegion(9, -396.844, 5, 164.790, 0, 0, 0)
    zone:registerRegion(10, -382.919, 5, 143.572, 0, 0, 0)
    zone:registerRegion(11, -537.558, 5, 102.683, 0, 0, 0)
    zone:registerRegion(12, -393.979, 5, 101.877, 0, 0, 0)
    zone:registerRegion(13, -367.892, 5, 75.774, 0, 0, 0)
    zone:registerRegion(14, -369.333, 5, 69.333, 0, 0, 0)
    zone:registerRegion(15, -351.717, 5, 64.773, 0, 0, 0)
    zone:registerRegion(16, -386.000, 5, 50.000, 0, 0, 0)
    zone:registerRegion(17, -360.705, 5, 51.505, 0, 0, 0)
    zone:registerRegion(18, -475.667, 5, 37.081, 0, 0, 0)
    zone:registerRegion(19, -321.902, 5, 36.697, 0, 0, 0)
    zone:registerRegion(20, -351.916, 5, 10.501, 0, 0, 0)
    zone:registerRegion(21, -554.739, 5, -3.057, 0, 0, 0)
    zone:registerRegion(22, -397.667, 5, -5.563, 0, 0, 0)
    zone:registerRegion(23, -330.062, 5, -18.832, 0, 0, 0)
    zone:registerRegion(24, -233.015, 5, -19.049, 0, 0, 0)
    zone:registerRegion(25, -553.523, 5, -72.071, 0, 0, 0)
    zone:registerRegion(26, -535.904, 7, -67.914, 0, 0, 0)
    zone:registerRegion(27, -435.438, 5, -74.171, 0, 0, 0)
    zone:registerRegion(28, -369.343, 5, -73.449, 0, 0, 0)
    zone:registerRegion(29, -238, 5, -118, 0, 0, 0)
    zone:registerRegion(30, -385.349, 5, -173.973, 0, 0, 0)

    -- Parradamo Tor miasma walls
    GetNPCByID(ID.npc.PARRA_MIASMA[1]):addPeriodicTrigger(0, 3, 0)
    GetNPCByID(ID.npc.PARRA_MIASMA[2]):addPeriodicTrigger(0, 3, 0)
    GetNPCByID(ID.npc.PARRA_MIASMA[3]):addPeriodicTrigger(0, 3, 0)
    GetNPCByID(ID.npc.PARRA_MIASMA[4]):addPeriodicTrigger(0, 3, 0)

    UpdateNMSpawnPoint(ID.mob.TIAMAT)
    GetMobByID(ID.mob.TIAMAT):setRespawnTime(math.random(86400, 259200))

    xi.helm.initZone(zone, xi.helm.type.EXCAVATION)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(-194.487, -13.766, 338.704, 141)
    end

    return cs
end

zoneObject.onConquestUpdate = function(zone, updatetype)
    xi.conq.onConquestUpdate(zone, updatetype)
end

zoneObject.onRegionEnter = function(player, region)
    -- TODO: Gasponia's shouldn't "always" poison you. However, in retail regions constantly reapply themselves without having to re-enter the region. That doesn't happen currently so I'm leaving it as-is for now.
    local regionId = region:GetRegionID()

    if regionId <= 30 then
        local gasponia = GetNPCByID(ID.npc.GASPONIA_OFFSET + regionId - 1)
        if gasponia ~= nil then
            gasponia:openDoor(3)

            if not player:hasStatusEffect(xi.effect.POISON) then
                player:addStatusEffect(xi.effect.POISON, 15, 0, math.random(30, 60))
                player:messageSpecial(ID.text.GASPONIA_POISON)
            end
        end
    end
end

zoneObject.onRegionLeave = function(player, region)
end

zoneObject.onGameHour = function(zone)
    --[[
        the hard-coded id that was here was wrong. there are 22 miasmas in attohwa chasm
        starting at ID.npc.MIASMA_OFFSET. some are supposed to toggle open, but need retail test
        to determine which.  for now, they're just statically set per npc_list.animation
    --]]

    -- Don't allow Citipati or Xolotl to spawn outside of night
    local xolre = GetMobByID(ID.mob.XOLOTL):getLocalVar("xolotlRespawn")

    if VanadielHour() >= 4 and VanadielHour() < 20 then
        DisallowRespawn(ID.mob.CITIPATI, true)
        DisallowRespawn(ID.mob.XOLOTL, true)
    else
        DisallowRespawn(ID.mob.CITIPATI, false)
        DisallowRespawn(ID.mob.XOLOTL, false)
        if os.time() > xolre and VanadielHour() == 20 then
            SpawnMob(ID.mob.XOLOTL)
            GetMobByID(ID.mob.XOLOTL):setLocalVar("xolotlDead", 0)
        end
    end
end

zoneObject.onEventUpdate = function(player, csid, option)
end

zoneObject.onEventFinish = function(player, csid, option)
end

return zoneObject
