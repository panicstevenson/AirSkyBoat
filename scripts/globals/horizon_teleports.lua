require("scripts/globals/status")
require("scripts/globals/conquest")
require("scripts/globals/settings")
require("settings/main")

xi = xi or { }
xi.horizon = xi.horizon or { }
xi.horizon.teleport = xi.horizon.teleport or { }

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
        text5 = 'Also, depending on your level, there may be some areas I am not authorized to telepoort you to.',
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
        text1 = "Due to reports of dangerous monsters attacking adventurers we cannot offer services at this time.",
        text2 = "We are working with the Duchy of Jeuno to clear monsters from the surrounding area so we can ensure the safety of our adventurers.",
    },
    noOPs =
    {
        text1 = 'Greetings, adventurer. My name is %s. I have been sent by the Specialty Goods Trade Union.',
        text2 = 'At the previous Conference of Nations, it was decided that the restriction on "regional teleporting" would be lifted, and that cities could now offer teleportation services to various outposts.',
        text3 = 'We are now authorized to teleport you to any outpost you have previously visited on a supplies quest.',
        text4 = 'The nominal fee we require varies with the current control of the region.',
        text5 = 'Also, depending on your level, there may be some areas I am not authorized to telepoort you to.',
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
    '[OP_Warp]Unlock_Mob_Batallia',
    '[OP_Warp]Unlock_Mob_Rolanberry',
    '[OP_Warp]Unlock_Mob_Sauromague',
}

local priceMenu =
{
    onStart = function(playerArg)
        playerArg:addStatusEffectEx(xi.effect.TERROR, xi.effect.TERROR, 69, 0, 99999, 0, 0, 1, xi.effectFlag.ON_ZONE, true)
    end,
    title = "",
    options = { },
    onEnd = function(playerArg)
        if playerArg:hasStatusEffect(xi.effect.TERROR) then
            playerArg:delStatusEffectSilent(xi.effect.TERROR)
        end
    end,
}

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
        playerArg:addStatusEffectEx(xi.effect.TERROR, xi.effect.TERROR, 69, 0, 99999, 0, 0, 1, xi.effectFlag.ON_ZONE, true)
    end,
    title = "Which region would you like to teleport to?",
    options = { },
    onEnd = function(playerArg)
        if playerArg:hasStatusEffect(xi.effect.TERROR) then
            playerArg:delStatusEffectSilent(xi.effect.TERROR)
        end
    end,
}
local function hasOPWarp(player, region)
    local hasOP = player:getTeleport(player:getNation(), region + 5)

    if not hasOP then
        if xi.settings.main.UNLOCK_OUTPOST_WARPS == 2 then
            hasOP = true
        elseif xi.settings.main.UNLOCK_OUTPOST_WARPS == 1 then
            hasOP = region <= xi.region.ELSHIMOUPLANDS
        end
    end

    return hasOP
end

local function getAvailableWarps(player)
    local availableWarps = { }
    local mainLvl = player:getMainLvl()

    for region, data in pairs(outposts) do
        if hasOPWarp(player, region) then
            if player:getZoneID() == xi.zone.LOWER_JEUNO and data.lvlRed <= mainLvl then
                table.insert(availableWarps, region)
            elseif data.lvlOrg <= mainLvl then
                table.insert(availableWarps, region)
            end
        end
    end

    return availableWarps
end

local delaySendMenu = function(player, menu)
    player:timer(50, function(playerArg)
        playerArg:customMenu(menu)
    end)
end

xi.horizon.teleport.checkOPEnable = function()
    local killCount = 0

    for _, var in pairs(enableOPWarps) do
        if GetServerVariable(var) == 1 then
            killCount = killCount + 1
        end
    end

    if killCount == 3 then
        SetServerVariable('[OP_Warp]Enabled', 1)
        xi.horizon.teleport.handleOPEnable()
    end
end

xi.horizon.teleport.handleOPEnable = function()
    if GetServerVariable('[OP_Warp]Enabled') == 1 or xi.settings.main.ENABLE_OP_WARPS then
        local zoneIds = { xi.zone.METALWORKS, xi.zone.NORTHERN_SAN_DORIA, xi.zone.PORT_WINDURST, xi.zone.LOWER_JEUNO }
        for _, zoneId in pairs(zoneIds) do
            GetZone(zoneId):setLocalVar("[OP_Warp]Enabled", 1)
        end
    end
end

xi.horizon.teleport.triggerOPWarp = function(player, npc)
    local dialogTable = dialogTableOrg
    local npcNation = npcTable[player:getZoneID()].nation
    local zoneId = player:getZoneID()
    local name = npcTable[zoneId].name

    player:setLocalVar('[OP_Warp]npcId', npc:getID())

    if zoneId == xi.zone.LOWER_JEUNO then
        dialogTable = dialogTableGob
    end

    player:PrintToPlayer(dialogTable.welcome, 0, name)

    if zoneId ~= xi.zone.LOWER_JEUNO and npcNation ~= player:getNation() then
        player:PrintToPlayer(string.format(dialogTable.notAuthorized, npcTable[zoneId].nationString), 0, name)
        return
    end

    if player:getZone():getLocalVar('[OP_Warp]Enabled') == 1 then
        player:timer(250, function(playerArg)
            playerArg:PrintToPlayer(dialogTable.notEnabled.text1, 0, name)
        end)

        player:timer(250, function(playerArg)
            playerArg:PrintToPlayer(dialogTable.notEnabled.text2, 0, name)
        end)

        return
    end

    local availableWarps = getAvailableWarps(player)

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

    xi.horizon.teleport.createRegionMenus(player, availableWarps)
    teleportMenu.options = pagesTable[1]
    delaySendMenu(player, teleportMenu)
end

xi.horizon.teleport.createRegionMenus = function(player, availableWarps)
    local warpIndex = 1
    local pagesNeeded = math.ceil(#availableWarps / 3)
    for page = 1, pagesNeeded, 1 do
        local pageArg = { }

        for optionIndex = 3, 1, -1 do
            local region = availableWarps[warpIndex]
            if region then
                local optionArg =
                {
                    outpostOptions[region].optionString,
                    function(playerArg)
                        xi.horizon.teleport.sendPriceMenu(playerArg, region)
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
                    delaySendMenu(player, teleportMenu)
                end
            }
        else
            nextPageArg =
            {
                "Next Page",
                function(playerArg)
                    teleportMenu.options = pagesTable[page + 1]
                    delaySendMenu(playerArg, teleportMenu)
                end
            }
        end

        table.insert(pageArg, nextPageArg)
        pagesTable[page] = pageArg
    end

end

xi.horizon.teleport.sendPriceMenu = function(player, region)
    local price = outpostOptions[region].feeOrg
    local dialogTable = dialogTableOrg
    local name = npcTable[player:getZoneID()].name
    local owner = GetRegionOwner(region)

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
                xi.horizon.teleport.handleOPWarp(playerArg, region)
            end
        },
        {
            "No",
            function(playerArg)
                player:PrintToPlayer(dialogTable.noteleport, 0, name)
            end
        },
    }

    delaySendMenu(player, priceMenu)
    if owner == player:getNation() then
        player:PrintToPlayer(string.format(dialogTable.teleportControlled, price), 0, name)
    else
        player:PrintToPlayer(string.format(dialogTable.teleportNotControlled, price), 0, name)
    end
end

xi.horizon.getDialogTable = function(player)

    local dialogTable = dialogTableOrg

    if player:getZoneID() == xi.zone.LOWER_JEUNO then
        dialogTable = dialogTableGob
    end

    return dialogTable
end

xi.horizon.teleport.handleOPWarp = function(player, region)
    local dialogTable = xi.horizon.getDialogTable(player)
    local cost = outpostOptions[region].feeOrg
    local npc = GetNPCByID(player:getLocalVar('[OP_Warp]npcId'))
    local name = npcTable[player:getZoneID()].name

    if player:getZoneID() == xi.zone.LOWER_JEUNO then
        cost = outpostOptions[region].feeRed
    end

    if player:getGil() >= cost then
        player:PrintToPlayer(dialogTable.thanks, 0, name)
        if player:delGil(cost) then
            npc:independentAnimation(player, 122, 0)

            player:timer(750, function(playerArg)
                playerArg:addStatusEffectEx(xi.effect.TELEPORT, 0, xi.teleport.id.OUTPOST, 0, 1, 0, region)
            end)
        end
    else
        player:PrintToPlayer(dialogTable.noGil, 0, name)
    end
end

xi.horizon.teleport.addNPC = function(zone)
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
                xi.horizon.teleport.triggerOPWarp(player, npc)
            end,
        },
    }
    zone:insertDynamicEntity(dynamicTable[zone:getID()])
end

xi.horizon.teleport.triggerTaruWarp = function(player, npc)
    local taru = taruTable[player:getZoneID()]
    local warpMenu =
    {
        onStart = function(playerArg)
            playerArg:addStatusEffectEx(xi.effect.TERROR, xi.effect.TERROR, 69, 0, 99999, 0, 0, 1, xi.effectFlag.ON_ZONE, true)
        end,
        title = string.format(dialogTableTaru.menu, taru.destZoneString),
        options =
        {
            {
                "Yes",
                function(playerArg)
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
            if playerArg:hasStatusEffect(xi.effect.TERROR) then
                playerArg:delStatusEffectSilent(xi.effect.TERROR)
            end
        end,
    }

    player:timer(250, function(playerArg)
        player:PrintToPlayer(string.format(dialogTableTaru.text1, taru.orgZoneString), 0, npc:getName())
    end)

    player:timer(250, function(playerArg)
        player:PrintToPlayer(string.format(dialogTableTaru.text2, taru.destZoneString), 0, npc:getName())
    end)

    delaySendMenu(player, warpMenu)
end
