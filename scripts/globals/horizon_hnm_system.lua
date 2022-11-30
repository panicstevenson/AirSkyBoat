hxi = hxi or { }
hxi.hnm = hxi.hnm or { }

hxi.hnm.startup = function(zone)
    local fafnogg = GetServerVariable("[HNM]Fafnir") -- Get Pop Time
    local adamantoise = GetServerVariable("[HNM]Adamantoise") -- Get Pop Time
    local behemoth = GetServerVariable("[HNM]Behemoth") -- Get Pop Time
    local fDay = GetServerVariable("FafnirDay") -- Get Day
    local aDay = GetServerVariable("AdamantoiseDay")
    local bDay = GetServerVariable("BehemothZone")
    local fZone = GetServerVariable("FafnirZone") -- Get Next Zone to Pop in
    local aZone = GetServerVariable("AdamantoiseZone")
    local bZone = GetServerVariable("BehemothZone")
    local timer = os.time()

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
    if timer > fafnogg then
        fafnogg = timer + 300
    end

    if timer > adamantoise then
        adamantoise = timer + 300
    end

    if timer > behemoth then
        behemoth = timer + 300
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

    if fDay == 0 then
        fDay = 1
        SetServerVariable("FafnirDay", 1)
    end

    if bDay == 0 then
        bDay = 1
        SetServerVariable("BehemothDay", 1)
    end

    if aDay == 0 then
        aDay = 1
        SetServerVariable("AdamantoiseDay", 1)
    end

    zone:setLocalVar("[HNM]Fafnir", fafnogg)
    zone:setLocalVar("FafnirDay", fDay)
    zone:setLocalVar("FafnirZone", fZone)
    zone:setLocalVar("[HNM]Adamantoise", adamantoise)
    zone:setLocalVar("AdamantoiseDay", aDay)
    zone:setLocalVar("AdamantoiseZone", aZone)
    zone:setLocalVar("[HNM]Behemoth", behemoth)
    zone:setLocalVar("BehemothDay", bDay)
    zone:setLocalVar("BehemothZone", bZone)
end

hxi.hnm.onDeath = function(mob)
    local mobType = mob:getLocalVar("HNMType")
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

    if mobType == 1 then
        local fzone = zones[math.random(1, 4)]
        SetServerVariable("[HNM]Fafnir", respawn)
        SetServerVariable("FafnirZone", fzone)
        for i = 1, 4 do

            if hQ == 1 then
                SendLuaFuncStringToZone(zones[i], string.format([[
                    local zoneId = %i
                    local zone = GetZone(zoneId)
                    local fDay = GetServerVariable("FafnirDay")
                    local fafnogg = GetServerVariable("[HNM]Fafnir")
                    local fZone = GetServerVariable("FafnirZone")

                    zone:setLocalVar("[HNM]Fafnir", fafnogg)
                    zone:setLocalVar("FafID", 0)

                    zone:setLocalVar("FafnirDay", 1)
                    zone:setLocalVar("FafnirZone", fZone)

                ]], zones[i]))
            else
                SendLuaFuncStringToZone(zones[i], string.format([[
                    local zoneId = %i
                    local zone = GetZone(zoneId)
                    local fDay = GetServerVariable("FafnirDay")
                    local fafnogg = GetServerVariable("[HNM]Fafnir")
                    local fZone = GetServerVariable("FafnirZone")

                    zone:setLocalVar("[HNM]Fafnir", fafnogg)
                    zone:setLocalVar("FafID", 0)

                    zone:setLocalVar("FafnirDay", fDay + 1)
                    zone:setLocalVar("FafnirZone", fZone)

                ]], zones[i]))
            end
        end

        if hQ == 1 then
            SetServerVariable("FafnirDay", 1)
        else
            SetServerVariable("FafnirDay", fDay + 1)
        end
    elseif mobType == 2 then
        local azone = zones[math.random(5, 8)]
        SetServerVariable("[HNM]Adamantoise", respawn)
        SetServerVariable("AdamantoiseZone", azone)
        for i = 5, 8 do
            if hQ == 1 then
                SendLuaFuncStringToZone(zones[i], string.format([[
                    local zoneId = %i
                    local zone = GetZone(zoneId)
                    local aDay = GetServerVariable("AdamantoiseDay")
                    local adamantoise = GetServerVariable("[HNM]Adamantoise")
                    local aZone = GetServerVariable("AdamantoiseZone")

                    zone:setLocalVar("[HNM]Adamantoise", adamantoise)
                    zone:setLocalVar("AddyID", 0)

                    zone:setLocalVar("AdamantoiseDay", 1)
                    zone:setLocalVar("AdamantoiseZone", aZone)
                ]], zones[i]))
            else
                SendLuaFuncStringToZone(zones[i], string.format([[
                    local zoneId = %i
                    local zone = GetZone(zoneId)
                    local aDay = GetServerVariable("AdamantoiseDay")
                    local adamantoise = GetServerVariable("[HNM]Adamantoise")
                    local aZone = GetServerVariable("AdamantoiseZone")

                    zone:setLocalVar("[HNM]Adamantoise", adamantoise)
                    zone:setLocalVar("AddyID", 0)

                    zone:setLocalVar("AdamantoiseDay", aDay + 1)
                    zone:setLocalVar("AdamantoiseZone", aZone)
                ]], zones[i]))
            end
        end

        if hQ == 1 then
            SetServerVariable("AdamantoiseDay", 1)
        else
            SetServerVariable("AdamantoiseDay", aDay + 1)
        end
    else
        local bzone = zones[math.random(9, 13)]
        SetServerVariable("[HNM]Behemoth", respawn)
        SetServerVariable("BehemothZone", bzone)
        for i = 9, 13 do

            if hQ == 1 then
                SendLuaFuncStringToZone(zones[i], string.format([[
                    local zoneId = %i
                    local zone = GetZone(zoneId)
                    local bDay = GetServerVariable("BehemothDay")
                    local behemoth = GetServerVariable("[HNM]Behemoth")
                    local bZone = GetServerVariable("BehemothZone")

                    zone:setLocalVar("[HNM]Behemoth", behemoth)
                    zone:setLocalVar("BeheID", 0)

                    zone:setLocalVar("BehemothDay", 1)
                    zone:setLocalVar("BehemothZone", bZone)
                ]], zones[i]))
            else
                SendLuaFuncStringToZone(zones[i], string.format([[
                    local zoneId = %i
                    local zone = GetZone(zoneId)
                    local bDay = GetServerVariable("BehemothDay")
                    local behemoth = GetServerVariable("[HNM]Behemoth")
                    local bZone = GetServerVariable("BehemothZone")

                    zone:setLocalVar("[HNM]Behemoth", behemoth)
                    zone:setLocalVar("BeheID", 0)

                    zone:setLocalVar("BehemothDay", bDay + 1)
                    zone:setLocalVar("BehemothZone", bZone)
                ]], zones[i]))
            end
        end

        if hQ == 1 then
            SetServerVariable("BehemothDay", 1)
        else
            SetServerVariable("BehemothDay", bDay + 1)
        end
    end
end

hxi.hnm.checkSpawn = function(zone)
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
    local zoneID = zone:getID()
    local timer = os.time()

    if zoneID == fZone and timer > fafnogg and fID == 0 then
        if fDay > 3 and hQChange < ((fDay - 2) * 12) then -- Day # * 12 chance to spawn HQ
            hxi.hnm.spawnNidhogg(zone)
            zone:setLocalVar("FafID", 1)
        else
            hxi.hnm.spawnFafnir(zone)
            zone:setLocalVar("FafID", 1)
        end
    elseif zoneID == aZone and timer > adamantoise and aID == 0 then
        if aDay > 3 and hQChange < ((aDay - 2) * 12) then -- Day # * 12 chance to spawn HQ
            hxi.hnm.spawnAspid(zone)
            zone:setLocalVar("AddyID", 1)
        else
            hxi.hnm.spawnAddy(zone)
            zone:setLocalVar("AddyID", 1)
        end
    elseif zoneID == bZone and timer > behemoth and bID == 0 then
        if bDay > 3 and hQChange < ((bDay - 2) * 12) then -- Day # * 12 chance to spawn HQ
            hxi.hnm.spawnKingBehe(zone)
            zone:setLocalVar("BeheID", 1)
        else
            hxi.hnm.spawnBehemoth(zone)
            zone:setLocalVar("BeheID", 1)
        end
    end
end

hxi.hnm.spawnFafnir = function(zone)
    local spawnPoints =
    {
        [xi.zone.THE_SANCTUARY_OF_ZITAH] =
        {
            { x = 607.58, y = -0.12, z = -167.62 },
            { x = 20.19, y = 0.231, z = 97.6 },
            { x = -484, y = 0, z = 236.55 },
            { x = -289.96, y = 0, z = 210.84 },
        },
        [xi.zone.ROMAEVE] =
        {
            { x = 0.14, y = -28, z = 97.8 },
            { x = 114,  y = -8, z = 46 },
            { x = -116, y = -8, z = 42.28 },
            { x = -48.23, y = -2, z = -93.6 },
        },
        [xi.zone.THE_BOYAHDA_TREE] =
        {
            { x = -255.88, y = 9.8, z = -271.1 },
            { x = -227.57, y = 9.92, z = -292.97 },
            { x = -256.54, y = 9.69, z = -290.59 },
            { x = -253.46, y = 9.77, z = -266.3 },
        },
        [xi.zone.DRAGONS_AERY] =
        {
            { x = 78.000, y = 6.000, z = 39.000 },
            { x = 80.965, y = 6.868, z = 42.384 },
            { x = 75.645, y = 6.749, z = 35.790 },
            { x = 89.395, y = 6.805, z = 39.952 },
        }
    }

    local point = math.random(1, 4)

    local fafnir = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = 'Fafnir',
        x = spawnPoints[zone:getID()][point].x,
        y = spawnPoints[zone:getID()][point].y,
        z = spawnPoints[zone:getID()][point].z,
        rotation = math.random(1, 255),
        groupId = 5,
        groupZoneId = 154,
        releaseIdOnDeath = true,
        widescan = 0,
        onMobDeath = function(fafnirArg, playerArg, isKiller)
            hxi.hnm.onDeath(fafnirArg)
            playerArg:addTitle(xi.title.FAFNIR_SLAYER)
        end,
        onMobSpawn = function(fafnirArg)
            fafnirArg:setLocalVar("HNMType", 1)
            fafnirArg:setMobMod(xi.mobMod.DRAW_IN, 1)
            fafnirArg:setMobMod(xi.mobMod.DRAW_IN_CUSTOM_RANGE, 20)
            fafnirArg:setMobMod(xi.mobMod.DRAW_IN_FRONT, 1)
            fafnirArg:setLocalVar("[rage]timer", 3600) -- 60 minutes
        end,
        mixins =
        {
            require("scripts/mixins/rage"),
        },
    })

    fafnir:setDropID(805)
    fafnir:setSpawn(spawnPoints[zone:getID()][point].x, spawnPoints[zone:getID()][point].y, spawnPoints[zone:getID()][point].z, math.random(1, 255))
    fafnir:spawn()

    for _, player in pairs(zone:getPlayers()) do
        player:PrintToPlayer("You hear an ominous roar off in the distance...", xi.msg.channel.NS_SAY)
    end
end

hxi.hnm.spawnNidhogg = function(zone)
    local spawnPoints =
    {
        [xi.zone.THE_SANCTUARY_OF_ZITAH] =
        {
            { x = 607.58, y = -0.12, z = -167.62 },
            { x = 20.19, y = 0.231, z = 97.6 },
            { x = -484, y = 0, z = 236.55 },
            { x = -289.96, y = 0, z = 210.84 },
        },
        [xi.zone.ROMAEVE] =
        {
            { x = 0.14, y = -28, z = 97.8 },
            { x = 114,  y = -8, z = 46 },
            { x = -116, y = -8, z = 42.28 },
            { x = -48.23, y = -2, z = -93.6 },
        },
        [xi.zone.THE_BOYAHDA_TREE] =
        {
            { x = -255.88, y = 9.8, z = -271.1 },
            { x = -227.57, y = 9.92, z = -292.97 },
            { x = -256.54, y = 9.69, z = -290.59 },
            { x = -253.46, y = 9.77, z = -266.3 },
        },
        [xi.zone.DRAGONS_AERY] =
        {
            { x = 78.000, y = 6.000, z = 39.000 },
            { x = 80.965, y = 6.868, z = 42.384 },
            { x = 75.645, y = 6.749, z = 35.790 },
            { x = 89.395, y = 6.805, z = 39.952 },
        }
    }

    local point = math.random(1, 4)

    local fafnir = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = 'Nidhogg',
        x = spawnPoints[zone:getID()][point].x,
        y = spawnPoints[zone:getID()][point].y,
        z = spawnPoints[zone:getID()][point].z,
        rotation = math.random(1, 255),
        groupId = 6,
        groupZoneId = 154,
        releaseIdOnDeath = true,
        widescan = 0,
        onMobDeath = function(fafnirArg, playerArg, isKiller)
            hxi.hnm.onDeath(fafnirArg)
        end,
        onMobSpawn = function(fafnirArg)
            fafnirArg:setLocalVar("HNMType", 1)
            fafnirArg:setLocalVar("HQ", 1)
            fafnirArg:setLocalVar("[rage]timer", 3600) -- 60 minutes
            fafnirArg:setMobMod(xi.mobMod.DRAW_IN, 1)
            fafnirArg:setMobMod(xi.mobMod.DRAW_IN_CUSTOM_RANGE, 20)
            fafnirArg:setMobMod(xi.mobMod.DRAW_IN_FRONT, 1)
        end,
        onMobFight = function(fafnirArg, target)
            local battletime = fafnirArg:getBattleTime()
            local twohourTime = fafnirArg:getLocalVar("twohourTime")

            if twohourTime == 0 then
                fafnirArg:setLocalVar("twohourTime", math.random(30, 90))
            end

            if battletime >= twohourTime then
                fafnirArg:useMobAbility(1053) -- Legitimately captured super_buff ID
                fafnirArg:setLocalVar("twohourTime", battletime + math.random(60, 120))
            end
        end,
        mixins =
        {
            require("scripts/mixins/rage")
        },
    })

    fafnir:setDropID(1781)
    fafnir:setSpawn(spawnPoints[zone:getID()][point].x, spawnPoints[zone:getID()][point].y, spawnPoints[zone:getID()][point].z, math.random(1, 255))
    fafnir:spawn()

    for _, player in pairs(zone:getPlayers()) do
        player:PrintToPlayer("You hear the roar of a great wyrm off in the distance...", xi.msg.channel.NS_SAY)
    end
end

hxi.hnm.spawnAddy = function(zone)
    local spawnPoints =
    {
        [xi.zone.VALLEY_OF_SORROWS] =
        {
            { x = -26.068, y = -0.038, z = 23.504 },
            { x = -47.618, y = 0.018,  z = -29.171 },
            { x = -1.446,  y = 0.543,  z = 13.472 },
            { x = -5.911,  y = 0.282,  z = 9.178 }
        },
        [xi.zone.GUSTAV_TUNNEL] =
        {
            { x = -272.3,  y = -9.6,   z = -1.2 },
            { x = -294,    y = -10.33, z = -23.04 },
            { x = -331.21, y = -9.83,  z = -0.092 },
            { x = -311.31, y = -9.53,  z = 8.47 }
        },
        [xi.zone.CAPE_TERIGGAN] =
        {
            { x = 94.3998, y = 0.39,  z = 165.7 },
            { x = -184, y = -0.31,    z = 466.83 },
            { x = -55,     y = 0,     z = 65 },
            { x = 152.48,  y = 8.1,  z = 196.7 }
        },
        [xi.zone.KUFTAL_TUNNEL] =
        {
            { x = 94.49, y = 29.3,  z = 107.56 },
            { x = 69.69, y = 29.48, z = 107.3 },
            { x = 66.7,  y = 29.48, z = 130.2, },
            { x = 90.85, y = 31.2,  z = 131.49 }
        }
    }

    local point = math.random(1, 4)

    local fafnir = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = 'Adamantoise',
        x = spawnPoints[zone:getID()][point].x,
        y = spawnPoints[zone:getID()][point].y,
        z = spawnPoints[zone:getID()][point].y,
        rotation = math.random(1, 255),
        groupId = 6,
        groupZoneId = 128,
        releaseIdOnDeath = true,
        widescan = 0,
        onMobDeath = function(fafnirArg, playerArg, isKiller)
            hxi.hnm.onDeath(fafnirArg)
            playerArg:addTitle(xi.title.TORTOISE_TORTURER)
        end,
        onMobSpawn = function(fafnirArg)
            fafnirArg:setLocalVar("HNMType", 2)
            fafnirArg:setLocalVar("[rage]timer", 1800) -- 30 minutes
            fafnirArg:setMod(xi.mod.DMGMAGIC, -3500)
        end,
        mixins = { require("scripts/mixins/rage") }
    })

    fafnir:setDropID(21)
    fafnir:setSpawn(spawnPoints[zone:getID()][point].x, spawnPoints[zone:getID()][point].y, spawnPoints[zone:getID()][point].z, math.random(1, 255))
    fafnir:spawn()

    for _, player in pairs(zone:getPlayers()) do
        player:PrintToPlayer("You feel the ground shake as a large monster stomps in the distance...", xi.msg.channel.NS_SAY)
    end
end

hxi.hnm.spawnAspid = function(zone)
    local spawnPoints =
    {
        [xi.zone.VALLEY_OF_SORROWS] =
        {
            { x = -26.068, y = -0.038, z = 23.504 },
            { x = -47.618, y = 0.018,  z = -29.171 },
            { x = -1.446,  y = 0.543,  z = 13.472 },
            { x = -5.911,  y = 0.282,  z = 9.178 }
        },
        [xi.zone.GUSTAV_TUNNEL] =
        {
            { x = -272.3,  y = -9.6,   z = -1.2 },
            { x = -294,    y = -10.33, z = -23.04 },
            { x = -331.21, y = -9.83,  z = -0.092 },
            { x = -311.31, y = -9.53,  z = 8.47 }
        },
        [xi.zone.CAPE_TERIGGAN] =
        {
            { x = 94.3998, y = 0.39,  z = 165.7 },
            { x = -184,    y = -0.31, z = 466.83 },
            { x = -55,     y = 0,     z = 65 },
            { x = 152.48,  y = 8.1,  z = 196.7 }
        },
        [xi.zone.KUFTAL_TUNNEL] =
        {
            { x = 94.49, y = 29.3,  z = 107.56 },
            { x = 69.69, y = 29.48, z = 107.3 },
            { x = 66.7,  y = 29.48, z = 130.2, },
            { x = 90.85, y = 31.2,  z = 131.49 }
        }
    }

    local point = math.random(1, 4)

    local fafnir = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = 'Aspidochelone',
        x = spawnPoints[zone:getID()][point].x,
        y = spawnPoints[zone:getID()][point].y,
        z = spawnPoints[zone:getID()][point].z,
        rotation = math.random(1, 255),
        groupId = 7,
        groupZoneId = 128,
        releaseIdOnDeath = true,
        widescan = 0,
        onMobDeath = function(fafnirArg, playerArg, isKiller)
            hxi.hnm.onDeath(fafnirArg)
            playerArg:addTitle(xi.title.ASPIDOCHELONE_SINKER)
            fafnirArg:removeListener("ASPID_TAKE_DAMAGE")
        end,
        onMobSpawn = function(fafnirArg)
            fafnirArg:setLocalVar("HNMType", 2)
            fafnirArg:setLocalVar("HQ", 1)
            fafnirArg:setLocalVar("[rage]timer", 3600) -- 60 minutes
            fafnirArg:setMobAbilityEnabled(true)
            fafnirArg:setAutoAttackEnabled(true)
            fafnirArg:setMagicCastingEnabled(false) -- will not cast until it goes into shell
            fafnirArg:setBehaviour(bit.band(fafnirArg:getBehaviour(), bit.bnot(xi.behavior.STANDBACK)))
            fafnirArg:setBehaviour(bit.bor(fafnirArg:getBehaviour(), xi.behavior.NO_TURN))
            fafnirArg:setMobMod(xi.mobMod.DRAW_IN, 1)
            fafnirArg:setMod(xi.mod.REGEN, 0)
            fafnirArg:setMod(xi.mod.DMGMAGIC, -3000)
            fafnirArg:setMod(xi.mod.DOUBLE_ATTACK, 20)
            fafnirArg:setMod(xi.mod.CURSERES, 100)

            local changeHP = fafnirArg:getHP() - (fafnirArg:getHP() * .05)
            fafnirArg:setLocalVar("changeHP", changeHP)
            fafnirArg:setLocalVar("DamageTaken", 0)
            fafnirArg:setAnimationSub(2)

            -- Forced out of shell after taking 2000 damage
            fafnirArg:addListener("TAKE_DAMAGE", "ASPID_TAKE_DAMAGE", function(mobArg, amount, attacker, attackType, damageType)
                local damageTaken = mobArg:getLocalVar("DamageTaken")
                local waitTime = mobArg:getLocalVar("waitTime")
                damageTaken = damageTaken + amount
                if damageTaken > 2000 then
                    mobArg:setLocalVar("DamageTaken", 0)
                    if mobArg:getAnimationSub() == 1 and os.time() > waitTime then
                        mobArg:setAnimationSub(2)
                        changeHP = mobArg:getHP() - (mobArg:getHP() * .05)
                        mobArg:setLocalVar("changeHP", changeHP)
                        mobArg:setLocalVar("waitTime", os.time() + 2)
                        hxi.hnm.outOfShell(mobArg)
                    end
                elseif os.time() > waitTime then
                    fafnirArg:setLocalVar("DamageTaken", damageTaken)
                end
            end)
        end,
        onMobFight = function(fafnirArg, target)
            local changeHP = fafnirArg:getLocalVar("changeHP")
            local waitTime = fafnirArg:getLocalVar("waitTime")

            if fafnirArg:getHP() < changeHP and fafnirArg:getAnimationSub() == 2 and os.time() > waitTime then
                fafnirArg:setLocalVar("DamageTaken", 0)
                fafnirArg:setAnimationSub(1)
                fafnirArg:setLocalVar("waitTime", os.time() + 2)
                hxi.hnm.intoShell(fafnirArg)
            elseif fafnirArg:getHPP() == 100 and fafnirArg:getAnimationSub() == 1 and os.time() > waitTime then
                fafnirArg:setLocalVar("DamageTaken", 0)
                fafnirArg:setAnimationSub(2)
                changeHP = fafnirArg:getHP() - (fafnirArg:getHP() * .05)
                fafnirArg:setLocalVar("changeHP", changeHP)
                fafnirArg:setLocalVar("waitTime", os.time() + 2)
                hxi.hnm.outOfShell(fafnirArg)
            end
        end,
        mixins = { require("scripts/mixins/rage") }
    })

    fafnir:setDropID(183)
    fafnir:setSpawn(spawnPoints[zone:getID()][point].x, spawnPoints[zone:getID()][point].y, spawnPoints[zone:getID()][point].z, math.random(1, 255))
    fafnir:spawn()

    for _, player in pairs(zone:getPlayers()) do
        player:PrintToPlayer("You feel the ground split as an enormous monster stomps in the distance...", xi.msg.channel.NS_SAY)
    end
end

hxi.hnm.spawnBehemoth = function(zone)
    local spawnPoints =
    {
        [xi.zone.BEHEMOTHS_DOMINION] =
        {
            { x = -277.763, y = -20.309, z = 72.189 },
            { x = -255.954, y = -19.209, z = 39.293 },
            { x = -209.320, y = -20.016, z = 48.118 },
            { x = -271.910, y = -19.543, z = 63.326 }
        },
        [xi.zone.QUFIM_ISLAND] =
        {
            { x = 103.47, y = -20.97, z = 136.66 },
            { x = 163.16, y = -20,    z = 161.87 },
            { x = 180.18, y = -19,    z = 115.97 },
            { x = 109.82, y = -19.69, z = 80.94 }
        },
        [xi.zone.ROLANBERRY_FIELDS] =
        {
            { x = 191.83, y = 14.27, z = 114.65 },
            { x = 304.16, y = 0.21,  z = 141.77 },
            { x = 284.2,  y = 10.75, z = 257.18 },
            { x = 160.4,  y = 16.39, z = 187.8 }
        },
        [xi.zone.SAUROMUGUE_CHAMPAIGN] =
        {
            { x = 466.02, y = 17.3,  z = 14.02 },
            { x = 502.72, y = 16.8,  z = -3.64 },
            { x = 488.57, y = 15.67, z = -75.64 },
            { x = 467.18, y = 16.76, z = -72.36 }
        },
        [xi.zone.BATALLIA_DOWNS] =
        {
            { x = 184.8,   y = 8.1,  z = -483.7 },
            { x = 283.18,  y = 8.35, z = 28.84 },
            { x = -556.05, y = -16,  z = 80.79 },
            { x = 101,   y = 8.9, z = -438 }
        }
    }

    local point =  math.random(1, 4)

    local fafnir = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = 'Behemoth',
        x = spawnPoints[zone:getID()][point].x,
        y = spawnPoints[zone:getID()][point].y,
        z = spawnPoints[zone:getID()][point].z,
        rotation = math.random(1, 255),
        groupId = 9,
        groupZoneId = 127,
        releaseIdOnDeath = true,
        widescan = 0,
        onMobDeath = function(fafnirArg, playerArg, isKiller)
            hxi.hnm.onDeath(fafnirArg)
            playerArg:addTitle(xi.title.BEHEMOTHS_BANE)
        end,
        onMobSpawn = function(fafnirArg)
            fafnirArg:setLocalVar("HNMType", 3)
            fafnirArg:setLocalVar("[rage]timer", 1800) -- 30 minutes
            fafnirArg:addMod(xi.mod.SLEEPRES, 90)
            fafnirArg:setMod(xi.mod.TRIPLE_ATTACK, 5)
            fafnirArg:setMod(xi.mod.MDEF, 20)
            fafnirArg:addMod(xi.mod.EVA, 50)
            if fafnirArg:getZoneID() ~= xi.zone.BEHEMOTHS_DOMINION then
                fafnirArg:setMobMod(xi.mobMod.DRAW_IN, 1)
                fafnirArg:setMobMod(xi.mobMod.DRAW_IN_CUSTOM_RANGE, 33)
                fafnirArg:setMobMod(xi.mobMod.DRAW_IN_FRONT, 1)
            end
        end,
        onMobFight = function(fafnirArg, target)
            local drawInWait = fafnirArg:getLocalVar("DrawInWait")
            if fafnirArg:getZone():getID() == xi.zone.BEHEMOTHS_DOMINION then
                if (target:getXPos() > -180 and target:getZPos() > 53) and os.time() > drawInWait then -- North Tunnel Draw In
                    local rot = target:getRotPos()
                    target:setPos(-182.19, -19.83, 58.34, rot)
                    fafnirArg:messageBasic(232, 0, 0, target)
                    fafnirArg:setLocalVar("DrawInWait", os.time() + 2)
                elseif (target:getXPos() > -230 and target:getZPos() < 5) and os.time() > drawInWait then  -- South Tunnel Draw In
                    local rot = target:getRotPos()
                    target:setPos(-235.35, -20.01, -4.47, rot)
                    fafnirArg:messageBasic(232, 0, 0, target)
                    fafnirArg:setLocalVar("DrawInWait", os.time() + 2)
                end
            end
        end,
        onSpellPrecast = function(fafnirArg, spell)
            if spell:getID() == 218 then
                spell:setAoE(xi.magic.aoe.RADIAL)
                spell:setFlag(xi.magic.spellFlag.HIT_ALL)
                spell:setRadius(30)
                spell:setAnimation(280)
                spell:setMPCost(0)
            end
        end,
        mixins = { require("scripts/mixins/rage") }
    })

    fafnir:setDropID()
    fafnir:setSpawn(spawnPoints[zone:getID()][point].x, spawnPoints[zone:getID()][point].y, spawnPoints[zone:getID()][point].z, math.random(1, 255))
    fafnir:spawn()

    for _, player in pairs(zone:getPlayers()) do
        player:PrintToPlayer("You hear the thundering roar of a monster in the distance...", xi.msg.channel.NS_SAY)
    end
end

hxi.hnm.spawnKingBehe = function(zone)
    local spawnPoints =
    {
        [xi.zone.BEHEMOTHS_DOMINION] =
        {
            { x = -277.763, y = -20.309, z = 72.189 },
            { x = -255.954, y = -19.209, z = 39.293 },
            { x = -209.320, y = -20.016, z = 48.118 },
            { x = -271.910, y = -19.543, z = 63.326 }
        },
        [xi.zone.QUFIM_ISLAND] =
        {
            { x = 103.47, y = -20.97, z = 136.66 },
            { x = 163.16, y = -20,    z = 161.87 },
            { x = 180.18, y = -19,    z = 115.97 },
            { x = 109.82, y = -19.69, z = 80.94 }
        },
        [xi.zone.ROLANBERRY_FIELDS] =
        {
            { x = 191.83, y = 14.27, z = 114.65 },
            { x = 304.16, y = 0.21,  z = 141.77 },
            { x = 284.2,  y = 10.75, z = 257.18 },
            { x = 160.4,  y = 16.39, z = 187.8 }
        },
        [xi.zone.SAUROMUGUE_CHAMPAIGN] =
        {
            { x = 466.02, y = 17.3,  z = 14.02 },
            { x = 502.72, y = 16.8,  z = -3.64 },
            { x = 488.57, y = 15.67, z = -75.64 },
            { x = 467.18, y = 16.76, z = -72.36 }
        },
        [xi.zone.BATALLIA_DOWNS] =
        {
            { x = 184.8,   y = 8.1,  z = -483.7 },
            { x = 283.18,  y = 8.35, z = 28.84 },
            { x = -556.05, y = -16,  z = 80.79 },
            { x = 101,     y = 8.9,  z = -438 }
        }
    }

    local point = math.random(1, 4)

    local fafnir = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = 'King Behemoth',
        x = spawnPoints[zone:getID()][point].x,
        y = spawnPoints[zone:getID()][point].y,
        z = spawnPoints[zone:getID()][point].z,
        rotation = math.random(1, 255),
        groupId = 10,
        groupZoneId = 127,
        releaseIdOnDeath = true,
        widescan = 0,
        onMobDeath = function(fafnirArg, playerArg, isKiller)
            hxi.hnm.onDeath(fafnirArg)
            playerArg:addTitle(xi.title.BEHEMOTH_DETHRONER)
        end,
        onMobSpawn = function(fafnirArg)
            fafnirArg:setLocalVar("HNMType", 3)
            fafnirArg:setLocalVar("HQ", 1)
            fafnirArg:setLocalVar("[rage]timer", 3600) -- 60 minutes
            fafnirArg:setMod(xi.mod.MDEF, 20)
            fafnirArg:addMod(xi.mod.ATT, 150)
            fafnirArg:addMod(xi.mod.DEF, 200)
            fafnirArg:addMod(xi.mod.EVA, 110)
            fafnirArg:addMod(xi.mod.GRAVITYRESBUILD, 30)
            fafnirArg:setMod(xi.mod.TRIPLE_ATTACK, 5)
            fafnirArg:setLocalVar("delay", os.time() + math.random(20, 25))
            if fafnirArg:getZoneID() ~= xi.zone.BEHEMOTHS_DOMINION then
                fafnirArg:setMobMod(xi.mobMod.DRAW_IN, 1)
                fafnirArg:setMobMod(xi.mobMod.DRAW_IN_CUSTOM_RANGE, 33)
                fafnirArg:setMobMod(xi.mobMod.DRAW_IN_FRONT, 1)
            end
            fafnirArg:setMobMod(xi.mobMod.ADD_EFFECT, 1)
            fafnirArg:setMobMod(xi.mobMod.MAGIC_COOL, 60)
        end,
        onMobFight = function(fafnirArg, target)
            if fafnirArg:getHPP() >= 50 then
                fafnirArg:setMod(xi.mod.REGAIN, 160)
            elseif fafnirArg:getHPP() < 50 and fafnirArg:getHPP() > 25 then
                fafnirArg:setMod(xi.mod.REGAIN, 100)
            else
                fafnirArg:setMod(xi.mod.REGAIN, 80)
            end

            local delay = fafnirArg:getLocalVar("delay")
            if os.time() > delay then -- Use Meteor every 40s, based on capture
                fafnirArg:castSpell(218, target) -- meteor
                fafnirArg:setLocalVar("delay", os.time() + 40)
            end

            local drawInWait = fafnirArg:getLocalVar("DrawInWait")

            if fafnirArg:getZoneID() == xi.zone.BEHEMOTHS_DOMINION then
                if (target:getXPos() > -180 and target:getZPos() > 53) and os.time() > drawInWait then -- North Tunnel Draw In
                    local rot = target:getRotPos()
                    target:setPos(-182.19, -19.83, 58.34, rot)
                    fafnirArg:messageBasic(232, 0, 0, target)
                    fafnirArg:setLocalVar("DrawInWait", os.time() + 2)
                elseif (target:getXPos() > -230 and target:getZPos() < 5) and os.time() > drawInWait then  -- South Tunnel Draw In
                    local rot = target:getRotPos()
                    target:setPos(-235.35, -20.01, -4.47, rot)
                    fafnirArg:messageBasic(232, 0, 0, target)
                    fafnirArg:setLocalVar("DrawInWait", os.time() + 2)
                end
            end
        end,
        onAdditionalEffect = function(fafnirArg, target, damage)
            local params = {}
            params.chance = 20
            params.duration = math.random(4, 8) -- Based on captures
            return xi.mob.onAddEffect(fafnirArg, target, damage, xi.mob.ae.STUN, params)
        end,
        mixins = { require("scripts/mixins/rage") }
    })

    fafnir:setDropID(1450)
    fafnir:setSpawn(spawnPoints[zone:getID()][point].x, spawnPoints[zone:getID()][point].y, spawnPoints[zone:getID()][point].z, math.random(1, 255))
    fafnir:spawn()

    for _, player in pairs(zone:getPlayers()) do
        player:PrintToPlayer("You hear the thundering roar of a great Behemoth in the distance...", xi.msg.channel.NS_SAY)
    end
end

hxi.hnm.intoShell = function(mob)
    mob:setAnimationSub(1)
    mob:setMobAbilityEnabled(false)
    mob:setAutoAttackEnabled(false)
    mob:setMagicCastingEnabled(true)
    mob:setMod(xi.mod.REGEN, 200)
    mob:setMod(xi.mod.UDMGRANGE, -9500)
    mob:setMod(xi.mod.UDMGPHYS, -9500)
    mob:setBehaviour(bit.bor(mob:getBehaviour(), xi.behavior.STANDBACK))
    mob:setBehaviour(bit.bor(mob:getBehaviour(), xi.behavior.NO_TURN))
end

hxi.hnm.outOfShell = function(mob)
    mob:setTP(3000) -- Immediately TPs coming out of shell
    mob:setAnimationSub(2)
    mob:setMobAbilityEnabled(true)
    mob:setAutoAttackEnabled(true)
    mob:setMagicCastingEnabled(false)
    mob:setMod(xi.mod.REGEN, 0)
    mob:setMod(xi.mod.UDMGRANGE, 0)
    mob:setMod(xi.mod.UDMGPHYS, 0)
    mob:setBehaviour(bit.band(mob:getBehaviour(), bit.bnot(xi.behavior.STANDBACK)))
    mob:setBehaviour(bit.band(mob:getBehaviour(), bit.bnot(xi.behavior.NO_TURN)))
end
