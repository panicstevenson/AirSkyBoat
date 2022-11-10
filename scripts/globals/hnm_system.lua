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
        fafnogg = fafnogg + 300
    end

    if os.time > adamantoise then
        adamantoise = adamantoise + 300
    end

    if os.time > behemoth then
        behemoth = behemoth + 300
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
    local HQ = mob:getLocalVar("HQ")
    local fDay = GetServerVariable("FafnirDay")
    local aDay = GetServerVariable("AdamantoiseDay")
    local bDay = GetServerVariable("BehemothDay")
    local respawn = os.time() + 79200 + (math.random(0,6) * 600) -- 22 hour min 23 hour max with 6 windows at 10  mins

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
        local fzone = zones[math.random(1,4)]
        for i = 1,4 do
            GetZone(zones[i]):setLocalVar("[HNM]Fafnir", respawn)
            GetZone(zones[i]):setLocalVar("FafID", 0)
            if HQ == 1 then
                GetZone(zones[i]):setLocalVar("FafnirDay", 1)
            else
                GetZone(zones[i]):setLocalVar("FafnirDay", fDay + 1)
            end
            GetZone(zones[i]):setLocalVar("FafnirZone", fzone)
        end

        SetServerVariable("[HNM]Fafnir", respawn)
        SetServerVariable("FafnirZone", fzone)

        if HQ == 1 then
            SetServerVariable("FafnirDay", 1)
        else
            SetServerVariable("FafnirDay", fDay + 1)
        end
    elseif type == 2 then
        local azone = zones[math.random(5,8)]
        for i = 5,8 do
            GetZone(zones[i]):setLocalVar("[HNM]Adamantoise", respawn)
            GetZone(zones[i]):setLocalVar("AddyID", 0)
            if HQ == 1 then
                GetZone(zones[i]):setLocalVar("AdamantoiseDay", 1)
            else
                GetZone(zones[i]):setLocalVar("AdamantoiseDay", aDay + 1)
            end
            GetZone(zones[i]):setLocalVar("AdamantoiseZone", azone)
        end

        SetServerVariable("[HNM]Adamantoise", respawn)
        SetServerVariable("AdamantoiseZone", azone)

        if HQ == 1 then
            SetServerVariable("AdamantoiseDay", 0)
        else
            SetServerVariable("AdamantoiseDay", aDay + 1)
        end
    else
        local bzone = zones[math.random(9,13)]
        for i = 5,8 do
            GetZone(zones[i]):setLocalVar("[HNM]Behemoth", respawn)
            GetZone(zones[i]):setLocalVar("BeheID", 0)
            if HQ == 1 then
                GetZone(zones[i]):setLocalVar("BehemothDay", 1)
            else
                GetZone(zones[i]):setLocalVar("BehemothDay", bDay + 1)
            end
            GetZone(zones[i]):setLocalVar("BehemothZone", bzone)
        end

        SetServerVariable("[HNM]Behemoth", respawn)
        SetServerVariable("BehemothZone", bzone)

        if HQ == 1 then
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
        [xi.zones.THE_SANCTUARY_OF_ZITAH] = {1,2,3,4,5,6,7,8,9,10,11,12},
        [xi.zone.ROMAEVE] = {1,2,3,4,5,6,7,8,9,10,11,12},
        [xi.zone.THE_BOYAHDA_TREE] = {1,2,3,4,5,6,7,8,9,10,11,12},
        [xi.zone.DRAGONS_AERY] = {1,2,3,4,5,6,7,8,9,10,11,12}
    }

    local point = math.random(1,4)

    if point ~= 1 then
        for i = 0,2 do
            point = point + (i * 3)
        end
    end

    local fafnir = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = 'Fafnir',
        x = spawnPoints[zone:getID()][point],
        y = spawnPoints[zone:getID()][point] + 1,
        z = spawnPoints[zone:getID()][point] + 2,
        rotation = math.random(1,360),
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
        [xi.zones.THE_SANCTUARY_OF_ZITAH] = {1,2,3,4,5,6,7,8,9,10,11,12},
        [xi.zone.ROMAEVE] = {1,2,3,4,5,6,7,8,9,10,11,12},
        [xi.zone.THE_BOYAHDA_TREE] = {1,2,3,4,5,6,7,8,9,10,11,12},
        [xi.zone.DRAGONS_AERY] = {1,2,3,4,5,6,7,8,9,10,11,12}
    }

    local point = math.random(1,4)

    if point ~= 1 then
        for i = 0,2 do
            point = point + (i * 3)
        end
    end

    local fafnir = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = 'Nidhogg',
        x = spawnPoints[zone:getID()][point],
        y = spawnPoints[zone:getID()][point] + 1,
        z = spawnPoints[zone:getID()][point] + 2,
        rotation = math.random(1,360),
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
        [xi.zones.VALLEY_OF_SORROWS] = {1,2,3,4,5,6,7,8,9,10,11,12},
        [xi.zone.GUSTAV_TUNNEL] = {1,2,3,4,5,6,7,8,9,10,11,12},
        [xi.zone.CAPE_TERIGGAN] = {1,2,3,4,5,6,7,8,9,10,11,12},
        [xi.zone.KUFTAL_TUNNEL] = {1,2,3,4,5,6,7,8,9,10,11,12}
    }

    local point = math.random(1,4)

    if point ~= 1 then
        for i = 0,2 do
            point = point + (i * 3)
        end
    end

    local fafnir = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = 'Adamantoise',
        x = spawnPoints[zone:getID()][point],
        y = spawnPoints[zone:getID()][point] + 1,
        z = spawnPoints[zone:getID()][point] + 2,
        rotation = math.random(1,360),
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
        [xi.zones.VALLEY_OF_SORROWS] = {1,2,3,4,5,6,7,8,9,10,11,12},
        [xi.zone.GUSTAV_TUNNEL] = {1,2,3,4,5,6,7,8,9,10,11,12},
        [xi.zone.CAPE_TERIGGAN] = {1,2,3,4,5,6,7,8,9,10,11,12},
        [xi.zone.KUFTAL_TUNNEL] = {1,2,3,4,5,6,7,8,9,10,11,12}
    }

    local point = math.random(1,4)

    if point ~= 1 then
        for i = 0,2 do
            point = point + (i * 3)
        end
    end

    local fafnir = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = 'Aspidochelone',
        x = spawnPoints[zone:getID()][point],
        y = spawnPoints[zone:getID()][point] + 1,
        z = spawnPoints[zone:getID()][point] + 2,
        rotation = math.random(1,360),
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
        [xi.zones.BEHEMOTHS_DOMINION] = {1,2,3,4,5,6,7,8,9,10,11,12},
        [xi.zone.QUFIM_ISLAND] = {1,2,3,4,5,6,7,8,9,10,11,12},
        [xi.zone.ROLANBERRY_FIELDS] = {1,2,3,4,5,6,7,8,9,10,11,12},
        [xi.zone.SAUROMUGUE_CHAMPAIGN] = {1,2,3,4,5,6,7,8,9,10,11,12},
        [xi.zone.BATALLIA_DOWNS] = {1,2,3,4,5,6,7,8,9,10,11,12}
    }

    local point = math.random(1,4)

    if point ~= 1 then
        for i = 0,2 do
            point = point + (i * 3)
        end
    end

    local fafnir = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = 'Behemoth',
        x = spawnPoints[zone:getID()][point],
        y = spawnPoints[zone:getID()][point] + 1,
        z = spawnPoints[zone:getID()][point] + 2,
        rotation = math.random(1,360),
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
        [xi.zones.BEHEMOTHS_DOMINION] = {1,2,3,4,5,6,7,8,9,10,11,12},
        [xi.zone.QUFIM_ISLAND] = {1,2,3,4,5,6,7,8,9,10,11,12},
        [xi.zone.ROLANBERRY_FIELDS] = {1,2,3,4,5,6,7,8,9,10,11,12},
        [xi.zone.SAUROMUGUE_CHAMPAIGN] = {1,2,3,4,5,6,7,8,9,10,11,12},
        [xi.zone.BATALLIA_DOWNS] = {1,2,3,4,5,6,7,8,9,10,11,12}
    }

    local point = math.random(1,4)

    if point ~= 1 then
        for i = 0,2 do
            point = point + (i * 3)
        end
    end

    local fafnir = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = 'King Behemoth',
        x = spawnPoints[zone:getID()][point],
        y = spawnPoints[zone:getID()][point] + 1,
        z = spawnPoints[zone:getID()][point] + 2,
        rotation = math.random(1,360),
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