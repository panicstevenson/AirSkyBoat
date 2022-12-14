require("scripts/globals/status")
require("scripts/globals/conquest")
require("scripts/globals/settings")
require("settings/main")

hxi = hxi or { }
hxi.teleport = hxi.teleport or { }

local dialogTableOrg =
{
    notEnabled =
    {
        text1 = "Due to reports of dangerous monsters attacking adventurers we cannot offer services at this time.",
        text2 = "We are working with the Duchy of Jeuno to clear monsters from the surrounding area so we can ensure the safety of our adventurers.",
    },
    noOPs =
    {
        text1 = 'Greetings, adventurer. My name is %s. I have been sent by the Specialty Goods Trade Union.',
        text2 = 'At the previous Conference of Nations, it was decided that the restriction on "regional teleporting" would be lifted, and that cities could now offer teleportation services to various outposts.',
        text3 = 'We are now authorized to teleport you to any outpost you have previously visited on a supplies quest.',
        text4 = 'The nominal fee we require varies with the current control of the region.',
        text5 = 'Also, depending on your level, there may be some areas I am not authorized to teleport you to.',
        text6 = 'Unfortunately, at this time there is nowhere I can teleport you to. Please come again.',
    },
    welcome               = 'Welcome to the regional Teleporation Service!',
    teleport              = 'Do you wish to teleport for %s gil?',
    teleportControlled    = "That region is currently under your home country's control. You will require %s gil to teleport.",
    teleportNotControlled = "That region is currently not under your home country's control. You will require %s gil to teleport.",
    noteleport            = 'We look forward to seeeing you again!',
    thanks                = 'Have a wonderful journey!',
    noGil                 = 'You do not have enough gil. Please come back again.',
    notAuthorized         = 'However, at this time I am only authorized to teleport citizens of %s.',
}

local dialogTableGob =
{
    notEnabled =
    {
        text1 = "Big Jeuno guards say we can't be servin' you at this time.",
        text2 = "The big guard guys say if you be doin' away with them monsters, we can start magicks again.",
    },
    tooLow = "No can tele you now, the beasties outside town are too restless.",
    noOPs =
    {
        text1 = 'Psh.. Hey you. My name is %s. I have the bestest secret magicks in town.',
        text2 = 'Them tarus in Windurst be giving me some secrets, and I have come here to make some gil',
        text3 = "Them Jeuno folk' be letting me use my magicks for you in return for some fees",
        text4 = 'It took me long time to learn, so it will cost you extra for certain places.',
        text5 = 'Also, depending on your level, there may be some areas I am not authorized to telepoort you to.',
        text6 = 'No can tele you now, you will have to come back later.',
    },
    welcome               = 'Welcome to my magicks service.',
    teleport              = 'Do you want to go somewhere? It\'ll cost ya',
    teleportControlled    = "Your nation home done has control of that area. I'll charge %s gil to magicks you.",
    teleportNotControlled = "Your nation home done has no control of that area. I'll charge %s gil to magicks you.",
    noteleport            = 'Comes backs soon..',
    thanks                = 'He He... Thanks for the gils.',
    noGil                 = 'No has coin? No gets magicks.',
    notAuthorized         = 'I can no magicks peoples of %s. Jeuno guys say no goes',
}

local dialogTableTaru =
{
    text1 = "Wee... We're now waltzing in %s",
    text2 = "Whoa! Want to whirl over to %s? Then let me move you in a moment with my mighty magic, maybe?",
    menu  = "Warp to %s?"
}

local npcTable =
{
    [xi.zone.METALWORKS] = { nation = xi.nation.BASTOK, nationString = "Bastok", name = "Conrad", },
    [xi.zone.NORTHERN_SAN_DORIA] = { nation = xi.nation.SANDORIA, nationString = "San d'Oria", name = "Jeanvirgaud", },
    [xi.zone.PORT_WINDURST] = { nation = xi.nation.WINDURST, nationString = "Windurst", name = "Rottata", },
    [xi.zone.LOWER_JEUNO] = { nation = xi.nation.OTHER, nationString = "Jeuno", name = "Twinkstix" },
}

local taruTable =
{
    [xi.zone.WINDURST_WOODS] = { dest = { x = -193.9643, y = -4.0000, z = 89.8859, rot = 115, zone = xi.zone.PORT_WINDURST }, orgZoneString = "Windurst Woods", destZoneString = "Port Windurst" },
    [xi.zone.PORT_WINDURST] = { dest = { x = -55.7462, y = 1.2137, z = -57.4257, rot = 121, zone = xi.zone.WINDURST_WOODS }, orgZoneString = "Port Windurst", destZoneString = "Windurst Woods" },
}

local outposts =
{
    [xi.region.RONFAURE]        = { ki = xi.ki.RONFAURE_SUPPLIES,              lvlOrg = 20, lvlRed = 10, },
    [xi.region.ZULKHEIM]        = { ki = xi.ki.ZULKHEIM_SUPPLIES,              lvlOrg = 20, lvlRed = 10, },
    [xi.region.NORVALLEN]       = { ki = xi.ki.NORVALLEN_SUPPLIES,             lvlOrg = 25, lvlRed = 15, },
    [xi.region.GUSTABERG]       = { ki = xi.ki.GUSTABERG_SUPPLIES,             lvlOrg = 20, lvlRed = 10, },
    [xi.region.DERFLAND]        = { ki = xi.ki.DERFLAND_SUPPLIES,              lvlOrg = 25, lvlRed = 15, },
    [xi.region.SARUTABARUTA]    = { ki = xi.ki.SARUTABARUTA_SUPPLIES,          lvlOrg = 20, lvlRed = 10, },
    [xi.region.KOLSHUSHU]       = { ki = xi.ki.KOLSHUSHU_SUPPLIES,             lvlOrg = 20, lvlRed = 10, },
    [xi.region.ARAGONEU]        = { ki = xi.ki.ARAGONEU_SUPPLIES,              lvlOrg = 25, lvlRed = 15, },
    [xi.region.FAUREGANDI]      = { ki = xi.ki.FAUREGANDI_SUPPLIES,            lvlOrg = 35, lvlRed = 35, },
    [xi.region.VALDEAUNIA]      = { ki = xi.ki.VALDEAUNIA_SUPPLIES,            lvlOrg = 40, lvlRed = 40, },
    [xi.region.QUFIMISLAND]     = { ki = xi.ki.QUFIM_SUPPLIES,                 lvlOrg = 25, lvlRed = 15, },
    [xi.region.LITELOR]         = { ki = xi.ki.LITELOR_SUPPLIES,               lvlOrg = 35, lvlRed = 25, },
    [xi.region.KUZOTZ]          = { ki = xi.ki.KUZOTZ_SUPPLIES,                lvlOrg = 40, lvlRed = 30, },
    [xi.region.VOLLBOW]         = { ki = xi.ki.VOLLBOW_SUPPLIES,               lvlOrg = 65, lvlRed = 50, },
    [xi.region.ELSHIMOLOWLANDS] = { ki = xi.ki.ELSHIMO_LOWLANDS_SUPPLIES,      lvlOrg = 35, lvlRed = 25, },
    [xi.region.ELSHIMOUPLANDS]  = { ki = xi.ki.ELSHIMO_UPLANDS_SUPPLIES,       lvlOrg = 45, lvlRed = 35, },
    [xi.region.TAVNAZIANARCH]   = { ki = xi.ki.TAVNAZIAN_ARCHIPELAGO_SUPPLIES, lvlOrg = 30, lvlRed = 30, },
}

local outpostOptions =
{
    [xi.region.RONFAURE]        = { optionString = "Ronfaure",         feeOrg = 200, feeRed = 100 },
    [xi.region.ZULKHEIM]        = { optionString = "Zulkheim",         feeOrg = 200, feeRed = 100 },
    [xi.region.NORVALLEN]       = { optionString = "Norvallen",        feeOrg = 250, feeRed = 150 },
    [xi.region.GUSTABERG]       = { optionString = "Gustaberg",        feeOrg = 200, feeRed = 100 },
    [xi.region.DERFLAND]        = { optionString = "Derfland",         feeOrg = 250, feeRed = 150 },
    [xi.region.SARUTABARUTA]    = { optionString = "Sarutabaruta",     feeOrg = 200, feeRed = 100 },
    [xi.region.KOLSHUSHU]       = { optionString = "Kolshushu",        feeOrg = 200, feeRed = 100 },
    [xi.region.ARAGONEU]        = { optionString = "Aragoneu",         feeOrg = 250, feeRed = 150 },
    [xi.region.FAUREGANDI]      = { optionString = "Fauregandi",       feeOrg = 350, feeRed = 350 },
    [xi.region.VALDEAUNIA]      = { optionString = "Valdeaunia",       feeOrg = 400, feeRed = 400 },
    [xi.region.QUFIMISLAND]     = { optionString = "Qufim",            feeOrg = 250, feeRed = 150 },
    [xi.region.LITELOR]         = { optionString = "Li'Telor",         feeOrg = 350, feeRed = 250 },
    [xi.region.KUZOTZ]          = { optionString = "Kuzotz",           feeOrg = 400, feeRed = 300 },
    [xi.region.VOLLBOW]         = { optionString = "Vollbow",          feeOrg = 650, feeRed = 500 },
    [xi.region.ELSHIMOLOWLANDS] = { optionString = "Elshimo Lowlands", feeOrg = 350, feeRed = 250 },
    [xi.region.ELSHIMOUPLANDS]  = { optionString = "Elshimo Uplands",  feeOrg = 450, feeRed = 350 },
    [xi.region.TAVNAZIANARCH]   = { optionString = "Tavnazia",         feeOrg = 300, feeRed = 300 },
}

local enableOPWarps =
{
    { ID = xi.zone.WEST_SARUTABARUTA,     string = "West Sarutabaruta",     killVar = '[OP_Warp]Saru_1'  },
    { ID = xi.zone.EAST_SARUTABARUTA,     string = "East Sarutabaruta",     killVar = '[OP_Warp]Saru_2'  },
    { ID = xi.zone.SOUTH_GUSTABERG,       string = "South Gustaberg",       killVar = '[OP_Warp]Gusta_1' },
    { ID = xi.zone.NORTH_GUSTABERG,       string = "North Gustaberg",       killVar = '[OP_Warp]Gusta_2' },
    { ID = xi.zone.WEST_RONFAURE,         string = "West Ronfaure",         killVar = '[OP_Warp]Ron_1'   },
    { ID = xi.zone.EAST_RONFAURE,         string = "East Ronfaure",         killVar = '[OP_Warp]Ron_2'   },
    { ID = xi.zone.JUGNER_FOREST,         string = "Jugner Forest",         killVar = '[OP_Warp]Jug_1'   },
    { ID = xi.zone.MERIPHATAUD_MOUNTAINS, string = "Meriphataud Mountains", killVar = '[OP_Warp]Merph_1' },
    { ID = xi.zone.PASHHOW_MARSHLANDS,    string = "Pashhow Marshlands",    killVar = '[OP_Warp]Pash_1'  },
    { ID = xi.zone.YUHTUNGA_JUNGLE,       string = "Yuhtunga Jungle",       killVar = '[OP_Warp]Yuht_1'  },
    { ID = xi.zone.BEAUCEDINE_GLACIER,    string = "Beaucedine Glacier",    killVar = '[OP_Warp]Beauc_1' },
    { ID = xi.zone.EASTERN_ALTEPA_DESERT, string = "Eastern Altepa Desert", killVar = '[OP_Warp]Altep_1' },
}

local nmInformation =
{
    [xi.zone.WEST_SARUTABARUTA    ] = { mob = { x = 145.6839,  y = -38.7177, z = 318.5830 }, npc = { x = 131.7015,  y = -0.5343,  z = -303.4812, rot = 105 } },
    [xi.zone.EAST_SARUTABARUTA    ] = { mob = { x = -55.8501, y = -34.0000,  z = 677.3773 }, npc = { x = -100.3674, y = -5.0000,  z = -530.9963, rot = 239 } },
    [xi.zone.SOUTH_GUSTABERG      ] = { mob = { x = 203.6385,  y = -59.6055, z = -430.2541 }, npc = { x = 277.4321,  y = 0.2846,   z = -211.5396, rot = 101 } },
    [xi.zone.NORTH_GUSTABERG      ] = { mob = { x = 262.2035,  y = -59.8284, z = 518.8541  }, npc = { x = 647.1167,  y = -0.4908,  z = 331.9160,  rot = 245 } },
    [xi.zone.WEST_RONFAURE        ] = { mob = { x = -126.5199, y = 0.3078,   z = -521.0609 }, npc = { x = -154.1909, y = -59.9531, z = 262.1125,  rot = 96  } },
    [xi.zone.EAST_RONFAURE        ] = { mob = { x = 282.3010,  y = 0.0000,   z = -519.4476 }, npc = { x = 97.8416,   y = -59.9542, z = 246.5332,  rot = 29  } },
    [xi.zone.JUGNER_FOREST        ] = { mob = { x = 125.2415,  y = 0.0609,   z = 441.9030  }, npc = { x = 67.0161,   y = 0.4000,   z = -11.9137,  rot = 191 } },
    [xi.zone.MERIPHATAUD_MOUNTAINS] = { mob = { x = 665.1182,  y = -0.3126,  z = -426.7532 }, npc = { x = -300.2154, y = 17.2139,  z = 425.6126,  rot = 94  } },
    [xi.zone.PASHHOW_MARSHLANDS   ] = { mob = { x = -406.5690, y = 24.5530,  z = 494.5933  }, npc = { x = 476.3608,  y = 24.6500,  z = 418.9649,  rot = 163 } },
    [xi.zone.YUHTUNGA_JUNGLE      ] = { mob = { x = 285.7129,  y = 4.3811,   z = 209.6454  }, npc = { x = -231.7470, y = 0.0000,   z = 469.4241,  rot = 201 } },
    [xi.zone.BEAUCEDINE_GLACIER   ] = { mob = { x = 393.0704,  y = 20.0478,  z = 471.9338  }, npc = { x = -29.8652,  y = -59.9276, z = -113.7092, rot = 163 } },
    [xi.zone.EASTERN_ALTEPA_DESERT] = { mob = { x = 255.3349,  y = 8.5113,   z = -288.5604 }, npc = { x = -268.4526, y = 8.3963,   z = -244.8563, rot = 186 } },
}

local handleEnableMessage = function(mob)
    SetVolatileServerVariable('[OP_Warp]Enabled', 1)
    local players = mob:getZone():getPlayers()
    local player = players[1]
    player:PrintToArea("Attention adventurers! The monsters threatening your fellow adventurers have been slain.", xi.msg.channel.LINKSHELL, 0, "Kam'lanaut") -- Sends announcement via ZMQ to all processes and zones
    player:PrintToArea("Per the agreement set by the Conference of Nations, the regional teleport service shall now commence operations.", xi.msg.channel.LINKSHELL, 0, "Kam'lanaut") -- Sends announcement via ZMQ to all processes and zones
end

local handleKillMessage = function(mob, string, varString)
    SetVolatileServerVariable(varString, 1)
    local players = mob:getZone():getPlayers()
    local player = players[1]
    player:PrintToArea(string.format("A Twinkling Treant has been slain by a group of adventurers in %s.", string), xi.msg.channel.NS_LINKSHELL3, 0, "") -- Sends announcement via ZMQ to all processes and zones
end

hxi.teleport.isOutpostEnabled = function()
    return utils.ternary(GetVolatileServerVariable('[OP_Warp]Enabled') == 1, true , GetServerVariable('[OP_Warp]Enabled') == 1) or
        xi.settings.main.ENABLE_OP_WARPS or
        hxi.teleport.processKills()
end

hxi.teleport.isNMKilled = function(var)
    return (GetVolatileServerVariable(var) and GetVolatileServerVariable(var) == 1) or GetServerVariable(var) == 1
end

hxi.teleport.isFirstEnable = function()
    return utils.ternary(GetVolatileServerVariable('[OP_Warp]First_Enable') == 0, GetServerVariable('[OP_Warp]First_Enable') == 0, false)
end

hxi.teleport.customMenu = function(player, contextTable)
    if player:getLocalVar("[Teleporter]Triggered") == 1 and player:getLocalVar("[Teleporter]Warping") ~= 1 then
        player:customMenu(contextTable)
        player:setLocalVar("[Teleporter]Triggered", 0)
    end
end

hxi.teleport.processKills = function()
    local killCount = 0

    for _, zoneTable in pairs(enableOPWarps) do
        killCount = utils.ternary(hxi.teleport.isNMKilled(zoneTable.killVar), killCount + 1, killCount)
    end

    return killCount == #enableOPWarps
end

hxi.teleport.checkOPEnable = function(mob)
    if hxi.teleport.isOutpostEnabled() then
        for _, zoneId in pairs(xi.zone) do
            SendLuaFuncStringToZone(zoneId, string.format([[
                SetVolatileServerVariable('[OP_Warp]Enabled', 1)
            ]], zoneId))
        end

        if mob and hxi.teleport.isFirstEnable() then
            SetServerVariable('[OP_Warp]Enabled', 1)
            handleEnableMessage(mob)
        end
    end
end

hxi.teleport.spawnNMs = function(zone)
    local enableVar = GetServerVariable('[OP_Warp]Enabled') == 1
    if not enableVar then
        for _, zoneTable in pairs(enableOPWarps) do
            if zoneTable.ID == zone:getID() then
                if GetServerVariable(zoneTable.killVar) == 0 then
                    local mob = zone:insertDynamicEntity({
                        objtype = xi.objType.MOB,
                        name = "T. Treant",
                        x = nmInformation[zone:getID()].mob.x,
                        y = nmInformation[zone:getID()].mob.y,
                        z = nmInformation[zone:getID()].mob.z,
                        rotation = 0,
                        groupId = 2,
                        groupZoneId = 210,
                        look = 389,
                        onMobDisengage = function(mob) mob:setHP(mob:getMaxHP()) end,
                        onMobDeath = function(mob, player, optParams) hxi.teleport.handleNMDeath(mob, player) end,
                        releaseIdOnDeath = true,
                    })
                    mob:setSpawn(nmInformation[zone:getID()].mob.x, nmInformation[zone:getID()].mob.y, nmInformation[zone:getID()].mob.z, 0)
                    mob:spawn()
                    mob:setClaimable(false)
                    mob:setLocalVar("DAMAGE_NULL", 1)
                    mob:addMobMod(xi.mobMod.MULTI_HIT, 2)

                    zone:insertDynamicEntity({
                        objtype = xi.objType.NPC,
                        name = "Moogle",
                        look = 82,
                        x = nmInformation[zone:getID()].npc.x,
                        y = nmInformation[zone:getID()].npc.y,
                        z = nmInformation[zone:getID()].npc.z,
                        rotation = nmInformation[zone:getID()].npc.rot,
                        widescan = 1,
                        onTrigger =
                        function(player, npc)
                            if player:getLocalVar("[OP_Warp]Explanation") == 0 and not hxi.teleport.isNMKilled(zoneTable.killVar) then
                                player:PrintToPlayer("Kupo! There are some scary treants walking around the world threatening adventurers!", 0, "Moogle")
                                player:PrintToPlayer("The council of nations is requesting your help kupo! Would you be willing to lend your sword kupo?", 0, "Moogle")
                                player:setLocalVar("[OP_Warp]Explanation", 1)
                            elseif hxi.teleport.isNMKilled(zoneTable.killVar) then
                                player:PrintToPlayer("Congratulations Kupo! This area has been freed from the treant that threatened the safety of your fellow adventurers!", 0, "Moogle")
                            else
                                player:PrintToPlayer("Kupo! Your fellow adventurers need help slaying the treant!", 0, "Moogle")
                            end
                        end
                    })
                end
                break
            end
        end
    end
end

hxi.teleport.handleNMDeath = function(mob, player)
    if mob:getLocalVar("deathTriggered") == 0 then
        mob:setLocalVar("deathTriggered", 1)

        local zone = mob:getZone()

        for _, zoneTable in pairs(enableOPWarps) do
            if zone:getID() == zoneTable.ID then
                if not hxi.teleport.isNMKilled(zoneTable.killVar) then
                    SetServerVariable(zoneTable.killVar, 1)
                    handleKillMessage(mob, zoneTable.string, zoneTable.killVar)
                    hxi.teleport.checkOPEnable(mob)
                    break
                end
            end
        end
    end
end

hxi.teleport.triggerOPWarp = function(player, npc)
    player:setLocalVar("[Teleporter]Triggered", 1)
    local dialogTable = dialogTableOrg
    local npcNation = npcTable[player:getZoneID()].nation
    local zoneId = player:getZoneID()
    local name = npcTable[zoneId].name
    local availableWarps = { }
    local mainLvl = player:getMainLvl()
    local teleportMenu =
    {
        onStart = function(playerArg)
        end,
        title = "Which region would you like to teleport to?",
        options = { },
        onEnd = function(playerArg)
        end,
    }

    player:setLocalVar('[OP_Warp]npcId', npc:getID())

    if zoneId == xi.zone.LOWER_JEUNO then
        dialogTable = dialogTableGob
    end

    player:PrintToPlayer(dialogTable.welcome, 0, name)

    if zoneId ~= xi.zone.LOWER_JEUNO and npcNation ~= player:getNation() then
        player:PrintToPlayer(string.format(dialogTable.notAuthorized, npcTable[zoneId].nationString), 0, name)
        return
    end

    if not hxi.teleport.isOutpostEnabled() then
        player:timer(250, function(playerArg)
            playerArg:PrintToPlayer(dialogTable.notEnabled.text1, 0, name)
        end)

        player:timer(250, function(playerArg)
            playerArg:PrintToPlayer(dialogTable.notEnabled.text2, 0, name)
        end)

        return
    end

    if zoneId == xi.zone.LOWER_JEUNO and player:getRank(player:getNation()) < 5 then
        player:PrintToPlayer(dialogTable.tooLow, 0, name)
        return
    end

    for region, data in pairs(outposts) do
        if player:hasTeleport(player:getNation(), region + 5) then
            if player:getZoneID() == xi.zone.LOWER_JEUNO and data.lvlRed <= mainLvl then
                table.insert(availableWarps, region)
            elseif data.lvlOrg <= mainLvl then
                table.insert(availableWarps, region)
            end
        end
    end

    if availableWarps[1] == nil then
        player:timer(250, function(playerArg)
            playerArg:PrintToPlayer(string.format(dialogTable.noOPs.text1, name), 0, name)
        end)

        player:timer(250, function(playerArg)
            playerArg:PrintToPlayer(dialogTable.noOPs.text2, 0, name)
        end)

        player:timer(250, function(playerArg)
            playerArg:PrintToPlayer(dialogTable.noOPs.text3, 0, name)
        end)

        player:timer(250, function(playerArg)
            playerArg:PrintToPlayer(dialogTable.noOPs.text4, 0, name)
        end)

        player:timer(250, function(playerArg)
            playerArg:PrintToPlayer(dialogTable.noOPs.text5, 0, name)
        end)

        player:timer(250, function(playerArg)
            playerArg:PrintToPlayer(dialogTable.noOPs.text6, 0, name)
        end)

        return
    end

    local pagesTable = hxi.teleport.createRegionMenus(player, availableWarps)
    teleportMenu.options = pagesTable[1]

    player:timer(50, function(playerArg)
        hxi.teleport.customMenu(playerArg, teleportMenu)
    end)
end

hxi.teleport.createRegionMenus = function(player, availableWarps)
    local warpIndex = 1
    local pagesNeeded = math.ceil(#availableWarps / 3)
    local pagesTable =
    {
        [1] = { },
        [2] = { },
        [3] = { },
        [4] = { },
        [5] = { },
        [6] = { },
    }
    local teleportMenu =
    {
        onStart = function(playerArg)
        end,
        title = "Which region would you like to teleport to?",
        options = { },
        onEnd = function(playerArg)
        end,
    }

    for page = 1, pagesNeeded, 1 do
        local pageArg = { }

        for optionIndex = 3, 1, -1 do
            local region = availableWarps[warpIndex]
            if region then
                local optionArg =
                {
                    outpostOptions[region].optionString,
                    function(playerArg)
                        hxi.teleport.sendPriceMenu(playerArg, region)
                    end
                }

                table.insert(pageArg, optionArg)
                warpIndex = warpIndex + 1
            end
        end

        local nextPageArg = { }

        if page == pagesNeeded then
            nextPageArg =
            {
                "Go Back",
                function(playerArg)
                    teleportMenu.options = pagesTable[1]
                    playerArg:timer(50, function(playerAr)
                        playerAr:customMenu(teleportMenu)
                    end)
                end
            }
        else
            nextPageArg =
            {
                "Next Page",
                function(playerArg)
                    teleportMenu.options = pagesTable[page + 1]
                    playerArg:timer(50, function(playerAr)
                        playerAr:customMenu(teleportMenu)
                    end)
                end
            }
        end

        table.insert(pageArg, nextPageArg)
        pagesTable[page] = pageArg
    end

    return pagesTable
end

hxi.teleport.sendPriceMenu = function(player, region)
    local price = outpostOptions[region].feeOrg
    local dialogTable = dialogTableOrg
    local name = npcTable[player:getZoneID()].name
    local owner = GetRegionOwner(region)
    local priceMenu =
    {
        onStart = function(playerArg)
        end,
        title = "",
        options = { },
        onEnd = function(playerArg)
        end,
    }

    if player:getZoneID() == xi.zone.LOWER_JEUNO then
        price = outpostOptions[region].feeRed
        dialogTable = dialogTableGob
    end

    priceMenu.title = string.format(dialogTable.teleport, price)
    priceMenu.options =
    {
        {
            "Yes",
            function(playerArg)
                hxi.teleport.handleOPWarp(playerArg, region)
            end
        },
        {
            "No",
            function(playerArg)
                player:PrintToPlayer(dialogTable.noteleport, 0, name)
            end
        },
    }

    player:timer(50, function(playerArg)
        playerArg:customMenu(priceMenu)
    end)

    if owner == player:getNation() then
        player:PrintToPlayer(string.format(dialogTable.teleportControlled, price), 0, name)
    else
        player:PrintToPlayer(string.format(dialogTable.teleportNotControlled, price), 0, name)
    end
end

hxi.teleport.handleOPWarp = function(player, region)
    local dialogTable = dialogTableOrg
    local cost = outpostOptions[region].feeOrg
    local npc = GetNPCByID(player:getLocalVar('[OP_Warp]npcId'))
    local name = npcTable[player:getZoneID()].name

    if player:getZoneID() == xi.zone.LOWER_JEUNO then
        cost = outpostOptions[region].feeRed
        dialogTable = dialogTableGob
    end

    if player:getGil() >= cost then
        player:PrintToPlayer(dialogTable.thanks, 0, name)
        if player:delGil(cost) then
            player:setLocalVar("[Teleporter]Warping", 1)
            npc:independentAnimation(player, 122, 0)
            player:timer(750, function(playerArg)
                playerArg:addStatusEffectEx(xi.effect.TELEPORT, 0, xi.teleport.id.OUTPOST, 0, 1, 0, region)
            end)
        end
    else
        player:PrintToPlayer(dialogTable.noGil, 0, name)
    end
end

hxi.teleport.addNPC = function(zone)
    local dynamicTable =
    {
        [xi.zone.LOWER_JEUNO] =
        {
            objtype = xi.objType.NPC,
            name = "Twinkstix",
            look = 85,
            x = -62.7357,
            y = 4.6989,
            z = -113.5064,
            rotation = 157,
            widescan = 1,
            onTrigger = function(player, npc)
                hxi.teleport.triggerOPWarp(player, npc)
            end,
        },
    }
    zone:insertDynamicEntity(dynamicTable[zone:getID()])
end

hxi.teleport.triggerTaruWarp = function(player, npc)
    player:setLocalVar("[Teleporter]Triggered", 1)
    local taru = taruTable[player:getZoneID()]
    local warpMenu =
    {
        onStart = function(playerArg)
        end,
        title = string.format(dialogTableTaru.menu, taru.destZoneString),
        options =
        {
            {
                "Yes",
                function(playerArg)
                    player:setLocalVar("[Teleporter]Warping", 1)
                    npc:independentAnimation(playerArg, 261, 0)
                    playerArg:timer(1300, function(playerArgg)
                        playerArgg:setPos(taru.dest.x, taru.dest.y, taru.dest.z, taru.dest.rot, taru.dest.zone)
                    end)
                end
            },
            {
                "No",
                function(playerArg)
                end
            },
        },
        onEnd = function(playerArg)
        end,
    }

    player:timer(250, function(playerArg)
        player:PrintToPlayer(string.format(dialogTableTaru.text1, taru.orgZoneString), 0, npc:getName())
    end)

    player:timer(250, function(playerArg)
        player:PrintToPlayer(string.format(dialogTableTaru.text2, taru.destZoneString), 0, npc:getName())
    end)

    player:timer(50, function(playerArg)
        hxi.teleport.customMenu(playerArg, warpMenu)
    end)
end
