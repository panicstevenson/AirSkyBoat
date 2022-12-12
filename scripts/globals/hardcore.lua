require("scripts/globals/player")

xi = xi or {}
xi.hardcore = xi.hardcore or {}

xi.hardcore.hardcoreFlag = 0x00010000

xi.hardcore.menu =
{
    title = "I'm going to be frank with you...",
    options = {},
}

xi.hardcore.delaySendMenu = function(player)
    player:timer(50, function(playerArg)
        playerArg:customMenu(xi.hardcore.menu)
    end)
end

xi.hardcore.pages =
{
    [1] =
    {
        {
            "Become a Hardcore Adventurer.",
            function(playerArg)
                playerArg:PrintToPlayer("You have become a hardcore adventurer!", xi.msg.channel.NS_SAY)
                xi.hardcore.startSystem(playerArg)
            end,
        },
        {
            "Disable Hardcore Adventuring: (Permanent)",
            function(playerArg)
                xi.hardcore.menu.options = xi.hardcore.pages[2]
                xi.hardcore.delaySendMenu(playerArg)
            end,
        },
    },
    [2] =
    {
        {
            "Confirm Declining Hardcore Adventuring",
            function(playerArg)
                playerArg:PrintToPlayer("You have declined becoming a hardcore adventurer.", xi.msg.channel.NS_SAY)
                playerArg:setCharVar("hardcoreAvail", 1)
            end,
        },
        {
            "Previous Page",
            function(playerArg)
                xi.hardcore.menu.options = xi.hardcore.pages[1]
                xi.hardcore.delaySendMenu(playerArg)
            end,
        },
    },
    [3] =
    {
        {
            "Enable/Disable Hardcore Flag",
            function(playerArg)
                playerArg:setFlag(xi.hardcore.hardcoreFlag)
            end,
        },
        {
            "Check Hardcore Rewards",
            function(playerArg)
                xi.hardcore.dialog(playerArg, 2)
                local rewardAmount = playerArg:getCharVar("rewardsAvail")
                local npcList =
                {
                    [xi.zone.LOWER_JEUNO] = "Frankstinx",
                    [xi.zone.BASTOK_MARKETS] = "Franklin",
                    [xi.zone.WINDURST_WOODS] = "Francine Tuft",
                    [xi.zone.SOUTHERN_SAN_DORIA] = "Francois",
                }
                if playerArg:getFreeSlotsCount() < rewardAmount then
                    playerArg:PrintToPlayer("Please make room in your inventory.", xi.msg.channel.SAY, npcList[playerArg:getZoneID()])
                    playerArg:PrintToPlayer("You need " .. tostring(rewardAmount) .. " spaces..", xi.msg.channel.SAY , npcList[playerArg:getZoneID()])
                elseif playerArg:getCharVar("hardcoreLvlRewardAvail") == 1 then
                    xi.hardcore.dialog(playerArg, 3)
                    xi.hardcore.giveRewards(playerArg)
                else
                    xi.hardcore.dialog(playerArg, 6)
                end
            end,
        },
    }
}

xi.hardcore.playerDeath = function(player)
    if player:getCharVar("hardcore") == 1 then
        player:setCharVar("hardcore", 0)
        player:setCharVar("hardcoreDied", 1)
        if player:checkNameFlags(xi.hardcore.hardcoreFlag) then
            player:setFlag(xi.hardcore.hardcoreFlag)
        end

        xi.hardcore.announceDeath(player)

        if player:getCharVar("hardcoreLvlRewards") >= 51 then
            player:timer(1500, function(playerArg)
                playerArg:homepoint()
            end)
        end

        local item = 28540 -- removing warp ring on death

        if player:hasItem(item) then
            local location = player:findItem(item):getLocationID()
            player:delItem(item, 1, location)
        end
    end
end

xi.hardcore.announceDeath = function(player)
    local playerLvlRewards = player:getCharVar("hardcoreLvlRewards")
    local playtime = tostring(math.floor(player:getPlaytime() / 3600))
    local name = player:getName()
    local lvl = tostring(player:getMainLvl())
    local jobs =
    {
        'WAR',
        'MNK',
        'WHM',
        'BLM',
        'RDM',
        'THF',
        'PLD',
        'DRK',
        'BST',
        'BRD',
        'RNG',
        'SAM',
        'NIN',
        'DRG',
        'SMN',
        'BLU',
        'COR',
        'PUP',
        'DNC',
        'SCH',
        'GEO',
        'RUN'
    }

    local job = jobs[player:getMainJob()]
    if playerLvlRewards >= 30 then
        -- turn this into death announcement
        player:PrintToArea(name .. " has fallen as a hardcore adventurer. While playing as: " .. lvl .. job .. " with a playtime of: " .. playtime .. " hours.", xi.msg.channel.NS_SHOUT, xi.msg.area.SYSTEM)
        player:PrintToPlayer("You have fallen as a hardcore adventurer..", xi.msg.channel.NS_SAY)
    else
        player:PrintToPlayer("You have fallen as a hardcore adventurer..", xi.msg.channel.NS_SAY)
    end
end

xi.hardcore.levelUp = function(player)
    local levelRewardTiers =
    {
        18, 30, 51, 56, 61, 66, 71, 75, 76, 77, 79, 84, 89, 96
    }

    local playerLvlRewards = player:getCharVar("hardcoreLvlRewards")
    local level = player:getMainLvl()
    local reward = 0

    if playerLvlRewards ~= 76 then
        for i, rewardlvl in pairs(levelRewardTiers) do
            if level == rewardlvl and level >= playerLvlRewards then
                reward = rewardlvl
                break
            end
        end

        if reward ~= 0 then
            player:setCharVar("hardcoreLvlRewards", reward)
            player:setCharVar("hardcoreLvlRewardAvail", 1)
            player:setCharVar("rewardsAvail", player:getCharVar("rewardsAvail") + 1)
        end

    elseif playerLvlRewards > 75 and player:getMainLvl() == 75 then
        player:setCharVar("hardcoreLvlRewards", playerLvlRewards + 1)
        for i in levelRewardTiers do
            if playerLvlRewards == i then
                player:setCharVar("hardcoreLvlRewardAvail", 1)
                player:setCharVar("rewardsAvail", player:getCharVar("rewardsAvail") + 1)
                break
            end
        end
    end
end

xi.hardcore.startSystem = function(player)
    if player:getCharVar("hardCoreAvail", 0) then
        player:setCharVar("hardcore", 1)
        player:setCharVar("hardcoreAvail", 1)
        player:setFlag(xi.hardcore.hardcoreFlag)
    end
end

xi.hardcore.setupNPC = function(zone)
    local dynamicTable =
    {
        [xi.zone.SOUTHERN_SAN_DORIA] =
        {
            objtype = xi.objType.NPC,
            name = "Francois",
            look = 131,
            x = -72.65,
            y = 2,
            z = -49.9,
            rotation = 153,
            widescan = 1,
            onTrigger = function(player, npc)
                local hardcoreStatus = player:getCharVar("hardcore")
                local hardcoreAvail = player:getCharVar("hardcoreAvail")
                local deathStatus = player:getCharVar("hardcoreDied")

                if hardcoreStatus == 0 and hardcoreAvail == 0 then
                    xi.hardcore.dialog(player, 1)
                    xi.hardcore.menus(player)
                elseif deathStatus == 1 then
                    xi.hardcore.dialog(player, 4)
                elseif hardcoreStatus == 1 then
                    xi.hardcore.hcmenu(player)
                elseif hardcoreAvail == 1 and deathStatus == 0 then
                    xi.hardcore.dialog(player, 5)
                end
            end,
        },
        [xi.zone.BASTOK_MARKETS] =
        {
            objtype = xi.objType.NPC,
            name = "Franklin",
            look = 146,
            x = -246.18,
            y = -12,
            z = -87.43,
            rotation = 146,
            widescan = 1,
            onTrigger = function(player, npc)
                local hardcoreStatus = player:getCharVar("hardcore")
                local hardcoreAvail = player:getCharVar("hardcoreAvail")
                local deathStatus = player:getCharVar("hardcoreDied")

                if hardcoreStatus == 0 and hardcoreAvail == 0 then
                    xi.hardcore.dialog(player, 1)
                    xi.hardcore.menus(player)
                elseif deathStatus == 1 then
                    xi.hardcore.dialog(player, 4)
                elseif hardcoreStatus == 1 then
                    xi.hardcore.hcmenu(player)
                elseif hardcoreAvail == 1 and deathStatus == 0 then
                    xi.hardcore.dialog(player, 5)
                end
            end,
        },
        [xi.zone.WINDURST_WOODS] =
        {
            objtype = xi.objType.NPC,
            name = "Francine Tuft",
            look = 251,
            x = -13,
            y = 2.75,
            z = -70.43,
            rotation = 43,
            widescan = 1,
            onTrigger = function(player, npc)
                local hardcoreStatus = player:getCharVar("hardcore")
                local hardcoreAvail = player:getCharVar("hardcoreAvail")
                local deathStatus = player:getCharVar("hardcoreDied")

                if hardcoreStatus == 0 and hardcoreAvail == 0 then
                    xi.hardcore.dialog(player, 1)
                    xi.hardcore.menus(player)
                elseif deathStatus == 1 then
                    xi.hardcore.dialog(player, 4)
                elseif hardcoreStatus == 1 then
                    xi.hardcore.hcmenu(player)
                elseif hardcoreAvail == 1 and deathStatus == 0 then
                    xi.hardcore.dialog(player, 5)
                end
            end,
        },
        [xi.zone.LOWER_JEUNO] =
        {
            objtype = xi.objType.NPC,
            name = "Frankstinx",
            look = 85,
            x = -54.21,
            y = 5.9,
            z = -115,
            rotation = 204,
            widescan = 1,
            onTrigger = function(player, npc)
                local hardcoreStatus = player:getCharVar("hardcore")
                local hardcoreAvail = player:getCharVar("hardcoreAvail")
                local deathStatus = player:getCharVar("hardcoreDied")

                if hardcoreStatus == 0 and hardcoreAvail == 0 then
                    xi.hardcore.dialog(player, 1)
                    xi.hardcore.menus(player)
                elseif deathStatus == 1 then
                    xi.hardcore.dialog(player, 4)
                elseif hardcoreStatus == 1 then
                    xi.hardcore.hcmenu(player)
                elseif hardcoreAvail == 1 and deathStatus == 0 then
                    xi.hardcore.dialog(player, 5)
                end
            end,
        },
    }
    zone:insertDynamicEntity(dynamicTable[zone:getID()])
end

xi.hardcore.menus = function(player)
    xi.hardcore.menu.options = xi.hardcore.pages[1]
    xi.hardcore.delaySendMenu(player)
end

xi.hardcore.dialog = function(player, dialogOption)
    local dialogTable =
    {
        [1] = "Greetings, I am the hardcore adventurer tutor. Hardcore adventurers risk their all for guts and glory.",
        [2] = "Ah, welcome back. Let me see if you have any earned any rewards since your last visit..",
        [3] = "Congratulations, you have earned even greater reputation amongst our ranks.",
        [4] = "I see you have lost your membership amonst our ranks.. Unfortunately, I can no longer serve you.",
        [5] = "I see you have declined membership amonst our ranks.. You must therefore find another way..",
        [6] = "I'm sorry you havn't earned any more glory since your last visit..",
        [7] = "Hardcore Adventures who fall unconsious are no longer welcome in our ranks.",
        [8] = "But those who survive and succeed will find themselves rewarded.. And will join the ranks of Legends.",
    }

    local npcList =
    {
        [xi.zone.LOWER_JEUNO] = "Frankstinx",
        [xi.zone.BASTOK_MARKETS] = "Franklin",
        [xi.zone.WINDURST_WOODS] = "Francine Tuft",
        [xi.zone.SOUTHERN_SAN_DORIA] = "Francois",
    }

    player:PrintToPlayer(dialogTable[dialogOption], xi.msg.channel.SAY, npcList[player:getZoneID()])
    if dialogOption == 1 then
        player:PrintToPlayer(dialogTable[7], xi.msg.channel.SAY, npcList[player:getZoneID()])
        player:PrintToPlayer(dialogTable[8], xi.msg.channel.SAY, npcList[player:getZoneID()])
    end
end

xi.hardcore.hcmenu = function(player)
    xi.hardcore.menu.options = xi.hardcore.pages[3]
    xi.hardcore.delaySendMenu(player)
end

xi.hardcore.giveRewards = function(player)
    local lvlRewardsTier = player:getCharVar("hardcoreLvlRewards")
    local rewardAmount = player:getCharVar("rewardsAvail")
    local count = 1
    local rewardTier = 0

    local levelRewardItems =
    {
        20571, 25735, 28188, 28324, 27783, 26958, 15213, 28540, 21967, 21509, 26729, 26944, 1, 1
    }

    local levelRewardTiers =
    {
        18, 30, 51, 56, 61, 66, 71, 75, 76, 77, 79, 84, 89, 96
    }

    if player:getCharVar("hardcoreLvlRewardAvail") == 1 then
        player:setCharVar("hardcoreLvlRewardAvail", 0)
        for i in pairs(levelRewardTiers) do
            if lvlRewardsTier == levelRewardTiers[i] then
                rewardTier = count
                break
            end
            count = count + 1
        end
        if rewardAmount >= 1 then
            for i = 0, rewardAmount - 1 do
                player:addItem(levelRewardItems[rewardTier - i])
                player:messageSpecial(zones[player:getZoneID()].text.ITEM_OBTAINED, levelRewardItems[rewardTier - i])
            end
        else
            player:addItem(levelRewardItems[rewardTier])
            player:messageSpecial(zones[player:getZoneID()].text.ITEM_OBTAINED, levelRewardItems[rewardTier])
        end

        player:setCharVar("rewardsAvail", 0)
    end
end
