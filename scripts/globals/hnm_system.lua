xi = xi or {}
xi.hnm_system = xi.hnm_system or {}

xi.hnm_system.startup = function(zone)
    local fafnogg = GetServerVariable("[HNM]Fafnir") -- Get Pop Time
    local adamantoise = GetServerVariable("[HNM]Adamantoise") -- Get Pop Time
    local behemoth = GetServerVariable("[HNM]Behemoth") -- Get Pop Time
    local fDay = GetServerVariable("FafnirDay") -- Get Day
    local aDay = GetServerVariable("AdamantoiseDay")
    local bDay = GetServerVariable("BehemothZone")
    local fZone = GetServerVariable("FafnirZone") -- Get Next Zone to Pop in
    local aZone = GetServerVariable("AdamantoiseZone")
    local bZone = GetServerVariable("BehemothZone")

    local zones =
    {
        xi.zone.THE_SANCTUARY_OF_ZITAH,
        xi.zone.THE_BOYAHDA_TREE,
        xi.zone.ROMAEVE,
        xi.zone.DRAGONS_AERY,
        xi.zone.CAPE_TERIGGAN,
        xi.zone.GUSTAV_TUNNEL,
        xi.zone.KUFTAL_TUNNEL,
        xi.zone.VALLEY_OF_SORROWS,
        xi.zone.ROLANBERRY_FIELDS,
        xi.zone.QUFIM_ISLAND,
        xi.zone.SAUROMUGUE_CHAMPAIGN,
        xi.zone.BATALLIA_DOWNS,
        xi.zone.BEHEMOTHS_DOMINION
    }

    -- add 5 minutes if the mob is supposed to spawn isntantly on server startup (Adds crash buffer)
    if os.time > fafnogg then
        fafnogg = os.time() + 300
    end

    if os.time > adamantoise then
        adamantoise = os.time() + 300
    end

    if os.time > behemoth then
        behemoth = os.time() + 300
    end

    if fZone == 0 then
        fZone = zones[4] -- Very First spawn in Dragons Aery
    end

    if aZone == 0 then
        aZone = zones[8] -- Very First spawn in Valley
    end

    if bZone == 0 then
        bZone = zones[13] -- Very First spawn in Dominion
    end

    for i in pairs(zones) do
        if i <=  4 then
            zone:setLocalVar("[HNM]Fafnir", fafnogg)
            zone:setLocalVar("FafnirDay", fDay)
            zone:setLocalVar("FafnirZone", fZone)
        elseif i <= 8 then
            zone:setLocalVar("[HNM]Adamantoise", adamantoise)
            zone:setLocalVar("AdamantoiseDay", aDay)
            zone:setLocalVar("AdamantoiseZone", aZone)
        else
            zone:setLocalVar("[HNM]Behemoth", behemoth)
            zone:setLocalVar("BehemothDay", bDay)
            zone:setLocalVar("BehemothZone", bZone)
        end
    end
end

xi.hnm_system.onDeath = function(mob)
    local type = mob:getLocalVar("HNMType")
    local hQ = mob:getLocalVar("HQ")
    local fDay = GetServerVariable("FafnirDay")
    local aDay = GetServerVariable("AdamantoiseDay")
    local bDay = GetServerVariable("BehemothDay")
    local respawn = os.time() + 79200 + (math.random(0, 6) * 600) -- 22 hour min 23 hour max with 6 windows at 10  mins

    local zones =
    {
        xi.zone.THE_SANCTUARY_OF_ZITAH,
        xi.zone.THE_BOYAHDA_TREE,
        xi.zone.ROMAEVE,
        xi.zone.DRAGONS_AERY,
        xi.zone.CAPE_TERIGGAN,
        xi.zone.GUSTAV_TUNNEL,
        xi.zone.KUFTAL_TUNNEL,
        xi.zone.VALLEY_OF_SORROWS,
        xi.zone.ROLANBERRY_FIELDS,
        xi.zone.QUFIM_ISLAND,
        xi.zone.SAUROMUGUE_CHAMPAIGN,
        xi.zone.BATALLIA_DOWNS,
        xi.zone.BEHEMOTHS_DOMINION
    }

    if type == 1 then
        local fzone = zones[math.random(1, 4)]
        for i = 1, 4 do
            GetZone(zones[i]):setLocalVar("[HNM]Fafnir", respawn)
            GetZone(zones[i]):setLocalVar("FafID", 0)
            if hQ == 1 then
                GetZone(zones[i]):setLocalVar("FafnirDay", 1)
            else
                GetZone(zones[i]):setLocalVar("FafnirDay", fDay + 1)
            end
            GetZone(zones[i]):setLocalVar("FafnirZone", fzone)
        end

        SetServerVariable("[HNM]Fafnir", respawn)
        SetServerVariable("FafnirZone", fzone)

        if hQ == 1 then
            SetServerVariable("FafnirDay", 1)
        else
            SetServerVariable("FafnirDay", fDay + 1)
        end
    elseif type == 2 then
        local azone = zones[math.random(5, 8)]
        for i = 5, 8 do
            GetZone(zones[i]):setLocalVar("[HNM]Adamantoise", respawn)
            GetZone(zones[i]):setLocalVar("AddyID", 0)
            if hQ == 1 then
                GetZone(zones[i]):setLocalVar("AdamantoiseDay", 1)
            else
                GetZone(zones[i]):setLocalVar("AdamantoiseDay", aDay + 1)
            end
            GetZone(zones[i]):setLocalVar("AdamantoiseZone", azone)
        end

        SetServerVariable("[HNM]Adamantoise", respawn)
        SetServerVariable("AdamantoiseZone", azone)

        if hQ == 1 then
            SetServerVariable("AdamantoiseDay", 0)
        else
            SetServerVariable("AdamantoiseDay", aDay + 1)
        end
    else
        local bzone = zones[math.random(9, 13)]
        for i = 9, 13 do
            GetZone(zones[i]):setLocalVar("[HNM]Behemoth", respawn)
            GetZone(zones[i]):setLocalVar("BeheID", 0)
            if hQ == 1 then
                GetZone(zones[i]):setLocalVar("BehemothDay", 1)
            else
                GetZone(zones[i]):setLocalVar("BehemothDay", bDay + 1)
            end
            GetZone(zones[i]):setLocalVar("BehemothZone", bzone)
        end

        SetServerVariable("[HNM]Behemoth", respawn)
        SetServerVariable("BehemothZone", bzone)

        if hQ == 1 then
            SetServerVariable("BehemothDay", 1)
        else
            SetServerVariable("BehemothDay", aDay + 1)
        end
    end
end

xi.hnm_system.checkSpawn = function(zone)
    local fafnogg = zone:getLocalVar("[HNM]Fafnir")
    local fDay  = zone:getLocalVar("FafnirDay")
    local fZone = zone:getLocalVar("FafnirZone")
    local fID = zone:getLocalVar("FafID")
    local adamantoise = zone:getLocalVar("[HNM]Adamantoise")
    local aDay = zone:getLocalVar("AdamantoiseDay")
    local aZone = zone:getLocalVar("AdamantoiseZone")
    local aID = zone:getLocalVar("AddyID")
    local behemoth = zone:getLocalVar("[HNM]Behemoth")
    local bDay = zone:getLocalVar("BehemothDay")
    local bZone = zone:getLocalVar("BehemothZone")
    local bID = zone:getLocalVar("BeheID")
    local hQChange = math.random(1, 100)

    if zone:getID() == fZone and os.time() > fafnogg and fID ~= 0 then
        if fDay > 3 and hQChange < ((fDay - 2) * 12) then -- Day # * 12 chance to spawn HQ
            zone:setLocalVar("FafID", 1)
            xi.hnm_system.spawnNidhogg()
        else
            zone:setLocalVar("FafID", 1)
            xi.hnm_system.spawnFafnir()
        end
    elseif zone:getID() == aZone and os.time() > adamantoise and aID ~= 0 then
        if aDay > 3 and hQChange < ((aDay - 2) * 12) then -- Day # * 12 chance to spawn HQ
            zone:setLocalVar("AddyID", 1)
            xi.hnm_system.spawnAspid()
        else
            zone:setLocalVar("AddyID", 1)
            xi.hnm_system.spawnAddy()
        end
    elseif zone:getID() == bZone and os.time() > behemoth and bID ~= 0 then
        if bDay > 3 and hQChange < ((bDay - 2) * 12) then -- Day # * 12 chance to spawn HQ
            zone:setLocalVar("BeheID", 1)
            xi.hnm_system.spawnKingBehe()
        else
            xi.hnm_system.spawnBehemoth()
        end
    end
end

xi.hnm_system.spawnFafnir = function(zone)
    local spawnPoints =
    {
        [xi.zones.THE_SANCTUARY_OF_ZITAH] =
        {
            607.58, -0.12, -167.62, 20.19, 0.231, 97.6, -484, 0, 236.55, -289.96, 0, 210.84
        },
        [xi.zone.ROMAEVE] =
        {
            0.14, -28, 97.8, 114, -8, 46, -116, -8, 42.28, -48.23, -2, -93.6
        },
        [xi.zone.THE_BOYAHDA_TREE] =
        {
            -255.88, 9.8, -271.1, -227.57, 9.92, -292.97, -256.54, 9.69, -290.59, -253.46, 9.77, -266.3
        },
        [xi.zone.DRAGONS_AERY] =
        {
            78.000, 6.000, 39.000, 80.965, 6.868, 42.384, 75.645, 6.749, 35.790, 89.395, 6.805, 39.952
        }
    }

    local point = math.random(1, 4)

    if point ~= 1 then
        for i = 0, 2 do
            point = point + (i * 3)
        end
    end

    local fafnir = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = 'Fafnir',
        x = spawnPoints[zone:getID()][point],
        y = spawnPoints[zone:getID()][point] + 1,
        z = spawnPoints[zone:getID()][point] + 2,
        rotation = math.random(1, 360),
        groupId = 5,
        groupZoneId = 154,
        releaseIdOnDeath = true,
        widescan = 0,
        onMobDeath = function(fafnirArg, playerArg, isKiller)
            xi.hnm_system.onDeath(fafnirArg:getZone())
        end,
        onMobSpawn = function(fafnirArg)
            fafnirArg:setLocalVar("HNMType", 1)
        end,
    })

    fafnir:setSpawn(spawnPoints[zone:getID()][point], spawnPoints[zone:getID()][point] + 1, spawnPoints[zone:getID()][point] + 2, math.random(1, 360))

    fafnir:spawn()

    for _, player in pairs(zone:getPlayers()) do
        player:PrintToPlayer("You hear an ominous roar off in the distance..", xi.msg.channel.NS_SAY)
    end
end

xi.hnm_system.spawnNidhogg = function(zone)
    local spawnPoints =
    {
        [xi.zones.THE_SANCTUARY_OF_ZITAH] =
        {
            607.58, -0.12, -167.62, 20.19, 0.231, 97.6, -484, 0, 236.55, -289.96, 0, 210.84
        },
        [xi.zone.ROMAEVE] =
        {
            0.14, -28, 97.8, 114, -8, 46, -116, -8, 42.28, -48.23, -2, -93.6
        },
        [xi.zone.THE_BOYAHDA_TREE] =
        {
            -255.88, 9.8, -271.1, -227.57, 9.92, -292.97, -256.54, 9.69, -290.59, -253.46, 9.77, -266.3
        },
        [xi.zone.DRAGONS_AERY] =
        {
            78.000, 6.000, 39.000, 80.965, 6.868, 42.384, 75.645, 6.749, 35.790, 89.395, 6.805, 39.952
        }
    }

    local point = math.random(1, 4)

    if point ~= 1 then
        for i = 0, 2 do
            point = point + (i * 3)
        end
    end

    local fafnir = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = 'Nidhogg',
        x = spawnPoints[zone:getID()][point],
        y = spawnPoints[zone:getID()][point] + 1,
        z = spawnPoints[zone:getID()][point] + 2,
        rotation = math.random(1, 360),
        groupId = 6,
        groupZoneId = 154,
        releaseIdOnDeath = true,
        widescan = 0,
        onMobDeath = function(fafnirArg, playerArg, isKiller)
            xi.hnm_system.onDeath(fafnirArg:getZone())
        end,
        onMobSpawn = function(fafnirArg)
            fafnirArg:setLocalVar("HNMType", 1)
        end,
    })

    fafnir:spawn()

    for _, player in pairs(zone:getPlayers()) do
        player:PrintToPlayer("You hear the roar of a great wyrm off in the distance..", xi.msg.channel.NS_SAY)
    end
end

xi.hnm_system.spawnAddy = function(zone)
    local spawnPoints =
    {
        [xi.zones.VALLEY_OF_SORROWS] =
        {
            -26.068, -0.038, 23.504, -47.618, 0.018, -29.171, -1.446, 0.543, 13.472, -5.911, 0.282, 9.178
        },
        [xi.zone.GUSTAV_TUNNEL] =
        {
            -272.3, -9.6, -1.2, -294, -10.33, -23.04, -331.21, -9.83, -0.092, -311.31, -9.53, 8.47
        },
        [xi.zone.CAPE_TERIGGAN] =
        {
            94.3998, 0.39, 165.7, -211.01, -2.31, 489.83, -33.17, -1.19, 67.82, 167.48, 6.87, 206.52
        },
        [xi.zone.KUFTAL_TUNNEL] =
        {
            94.49, 29.3, 107.56, 69.69, 29.48, 107.3, 66.7, 29.48, 130.2, 90.85, 31.2, 131.49
        }
    }

    local point = math.random(1, 4)

    if point ~= 1 then
        for i = 0, 2 do
            point = point + (i * 3)
        end
    end

    local fafnir = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = 'Adamantoise',
        x = spawnPoints[zone:getID()][point],
        y = spawnPoints[zone:getID()][point] + 1,
        z = spawnPoints[zone:getID()][point] + 2,
        rotation = math.random(1, 360),
        groupId = 6,
        groupZoneId = 128,
        releaseIdOnDeath = true,
        widescan = 0,
        onMobDeath = function(fafnirArg, playerArg, isKiller)
            xi.hnm_system.onDeath(fafnirArg:getZone())
        end,
        onMobSpawn = function(fafnirArg)
            fafnirArg:setLocalVar("HNMType", 2)
        end,
    })

    fafnir:spawn()

    for _, player in pairs(zone:getPlayers()) do
        player:PrintToPlayer("You feel the ground shake as a large monster stomps in the distance..", xi.msg.channel.NS_SAY)
    end
end

xi.hnm_system.spawnAspid = function(zone)
    local spawnPoints =
    {
        [xi.zones.VALLEY_OF_SORROWS] =
        {
            -26.068, -0.038, 23.504, -47.618, 0.018, -29.171, -1.446, 0.543, 13.472, -5.911, 0.282, 9.178
        },
        [xi.zone.GUSTAV_TUNNEL] =
        {
            -272.3, -9.6, -1.2, -294, -10.33, -23.04, -331.21, -9.83, -0.092, -311.31, -9.53, 8.47
        },
        [xi.zone.CAPE_TERIGGAN] =
        {
            94.3998, 0.39, 165.7, -211.01, -2.31, 489.83, -33.17, -1.19, 67.82, 167.48, 6.87, 206.52
        },
        [xi.zone.KUFTAL_TUNNEL] =
        {
            94.49, 29.3, 107.56, 69.69, 29.48, 107.3, 66.7, 29.48, 130.2, 90.85, 31.2, 131.49
        }
    }

    local point = math.random(1, 4)

    if point ~= 1 then
        for i = 0, 2 do
            point = point + (i * 3)
        end
    end

    local fafnir = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = 'Aspidochelone',
        x = spawnPoints[zone:getID()][point],
        y = spawnPoints[zone:getID()][point] + 1,
        z = spawnPoints[zone:getID()][point] + 2,
        rotation = math.random(1, 360),
        groupId = 7,
        groupZoneId = 128,
        releaseIdOnDeath = true,
        widescan = 0,
        onMobDeath = function(fafnirArg, playerArg, isKiller)
            xi.hnm_system.onDeath(fafnirArg:getZone())
        end,
        onMobSpawn = function(fafnirArg)
            fafnirArg:setLocalVar("HNMType", 2)
        end,
    })

    fafnir:spawn()

    for _, player in pairs(zone:getPlayers()) do
        player:PrintToPlayer("You feel the ground split as an enourmous monster stomps in the distance..", xi.msg.channel.NS_SAY)
    end
end

xi.hnm_system.spawnBehemoth = function(zone)
    local spawnPoints =
    {
        [xi.zones.BEHEMOTHS_DOMINION] =
        {
            -277.763, -20.309, 72.189, -255.954, -19.209, 39.293, -209.320, -20.016, 48.118, -271.910, -19.543, 63.326
        },
        [xi.zone.QUFIM_ISLAND] =
        {
            103.47, -20.97, 136.66, 163.16, -20, 161.87, 180.18, -19, 115.97, 109.82, -19.69, 80.94
        },
        [xi.zone.ROLANBERRY_FIELDS] =
        {
            191.83, 14.27, 114.65, 304.16, 0.21, 141.77, 284.2, 10.75, 257.18, 160.4, 16.39, 187.8
        },
        [xi.zone.SAUROMUGUE_CHAMPAIGN] =
        {
            466.02, 17.3, 14.02, 502.72, 16.8, -3.64, 488.57, 15.67, -75.64, 467.18, 16.76, -72.36
        },
        [xi.zone.BATALLIA_DOWNS] =
        {
            184.8, 8.1, -483.7, 283.18, 8.35, 28.84, -556.05, -16, 80.79, 68.19, 6.22, -441.31
        }
    }

    local point = math.random(1, 4)

    if point ~= 1 then
        for i = 0, 2 do
            point = point + (i * 3)
        end
    end

    local fafnir = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = 'Behemoth',
        x = spawnPoints[zone:getID()][point],
        y = spawnPoints[zone:getID()][point] + 1,
        z = spawnPoints[zone:getID()][point] + 2,
        rotation = math.random(1, 360),
        groupId = 9,
        groupZoneId = 127,
        releaseIdOnDeath = true,
        widescan = 0,
        onMobDeath = function(fafnirArg, playerArg, isKiller)
            xi.hnm_system.onDeath(fafnirArg:getZone())
        end,
        onMobSpawn = function(fafnirArg)
            fafnirArg:setLocalVar("HNMType", 3)
        end,
    })

    fafnir:spawn()

    for _, player in pairs(zone:getPlayers()) do
        player:PrintToPlayer("You hear the thundering roar of a monster in the distance..", xi.msg.channel.NS_SAY)
    end
end

xi.hnm_system.spawnKingBehe = function(zone)
    local spawnPoints =
    {
        [xi.zones.BEHEMOTHS_DOMINION] =
        {
            -277.763, -20.309, 72.189, -255.954, -19.209, 39.293, -209.320, -20.016, 48.118, -271.910, -19.543, 63.326
        },
        [xi.zone.QUFIM_ISLAND] =
        {
            103.47, -20.97, 136.66, 163.16, -20, 161.87, 180.18, -19, 115.97, 109.82, -19.69, 80.94
        },
        [xi.zone.ROLANBERRY_FIELDS] =
        {
            191.83, 14.27, 114.65, 304.16, 0.21, 141.77, 284.2, 10.75, 257.18, 160.4, 16.39, 187.8
        },
        [xi.zone.SAUROMUGUE_CHAMPAIGN] =
        {
            466.02, 17.3, 14.02, 502.72, 16.8, -3.64, 488.57, 15.67, -75.64, 467.18, 16.76, -72.36
        },
        [xi.zone.BATALLIA_DOWNS] =
        {
            184.8, 8.1, -483.7, 283.18, 8.35, 28.84, -556.05, -16, 80.79, 68.19, 6.22, -441.31
        }
    }

    local point = math.random(1, 4)

    if point ~= 1 then
        for i = 0, 2 do
            point = point + (i * 3)
        end
    end

    local fafnir = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = 'King Behemoth',
        x = spawnPoints[zone:getID()][point],
        y = spawnPoints[zone:getID()][point] + 1,
        z = spawnPoints[zone:getID()][point] + 2,
        rotation = math.random(1, 360),
        groupId = 9,
        groupZoneId = 127,
        releaseIdOnDeath = true,
        widescan = 0,
        onMobDeath = function(fafnirArg, playerArg, isKiller)
            xi.hnm_system.onDeath(fafnirArg:getZone())
        end,
        onMobSpawn = function(fafnirArg)
            fafnirArg:setLocalVar("HNMType", 3)
        end,
    })

    fafnir:spawn()

    for _, player in pairs(zone:getPlayers()) do
        player:PrintToPlayer("You hear the thundering roar of a great Behemoth in the distance..", xi.msg.channel.NS_SAY)
    end
end
