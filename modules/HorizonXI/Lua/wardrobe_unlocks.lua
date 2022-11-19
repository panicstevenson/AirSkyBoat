-----------------------------------
-- Unlock Mog Wardrobe slots as you complete criteria
-----------------------------------
require("modules/module_utils")
require("scripts/globals/missions")
require("scripts/globals/quests")
require("scripts/globals/msg")
require("scripts/globals/utils")
-----------------------------------
local m = Module:new("mission_wardrobe_unlocks")

local bagNames =
{
    [xi.inv.INVENTORY]  = "Inventory",
    [xi.inv.MOGSAFE]    = "Mog Safe",
    [xi.inv.STORAGE]    = "Storage",
    [xi.inv.TEMPITEMS]  = "Temp. Items",
    [xi.inv.MOGLOCKER]  = "Mog Locker",
    [xi.inv.MOGSATCHEL] = "Mog Satchel",
    [xi.inv.MOGSACK]    = "Mog Sack",
    [xi.inv.MOGCASE]    = "Mog Case",
    [xi.inv.WARDROBE]   = "Mog Wardrobe 1",
    [xi.inv.MOGSAFE2]   = "Mog Safe 2",
    [xi.inv.WARDROBE2]  = "Mog Wardrobe 2",
    [xi.inv.WARDROBE3]  = "Mog Wardrobe 3",
    [xi.inv.WARDROBE4]  = "Mog Wardrobe 4",
    [xi.inv.WARDROBE5]  = "Mog Wardrobe 5",
    [xi.inv.WARDROBE6]  = "Mog Wardrobe 6",
    [xi.inv.WARDROBE7]  = "Mog Wardrobe 7",
    [xi.inv.WARDROBE8]  = "Mog Wardrobe 8",
    [xi.inv.RECYCLEBIN] = "Recycle Bin",
}

-- Several missions zone you immediately upon completing the mission
-- This causes the messaging from this module to not display for players
-- Due to this, several of the rewards below have been moved to a location
-- that players will be able to receive the message properly
local unlocks =
{
    [xi.mission.log_id.ZILART] =
    {
        [xi.mission.id.zilart.THE_TEMPLE_OF_UGGALEPIH]     = { xi.inv.WARDROBE2, 5 },
        [xi.mission.id.zilart.THROUGH_THE_QUICKSAND_CAVES] = { xi.inv.WARDROBE2, 5 },
        [xi.mission.id.zilart.RETURN_TO_DELKFUTTS_TOWER]   = { xi.inv.WARDROBE2, 5 },
        [xi.mission.id.zilart.THE_MITHRA_AND_THE_CRYSTAL]  = { xi.inv.WARDROBE2, 5 },
        [xi.mission.id.zilart.ARK_ANGELS]                  = { xi.inv.WARDROBE2, 5 },
        -- [xi.mission.id.zilart.THE_CELESTIAL_NEXUS]         = { xi.inv.WARDROBE2, 5 }, Moved to BCNM/Mission Luas due to messaging issue
    },
    [xi.mission.log_id.COP] =
    {
        -- [xi.mission.id.cop.THE_MOTHERCRYSTALS]   = { xi.inv.WARDROBE2, 5 }, Moved to OnEventFinish for Lufaise due to messaging issue
        -- [xi.mission.id.cop.ANCIENT_VOWS]         = { xi.inv.WARDROBE2, 2 }, Moved to OnEventFinish for S Gustaberg due to messaging issue
        [xi.mission.id.cop.DARKNESS_NAMED]       = { xi.inv.WARDROBE2, 5 },
        [xi.mission.id.cop.THE_SAVAGE]           = { xi.inv.WARDROBE2, 3 },
        [xi.mission.id.cop.DESIRES_OF_EMPTINESS] = { xi.inv.WARDROBE2, 5 },
        [xi.mission.id.cop.THREE_PATHS]          = { xi.inv.WARDROBE2, 5 },
        -- [xi.mission.id.cop.ONE_TO_BE_FEARED]     = { xi.inv.WARDROBE2, 3 }, Moved to OnEventFinish for Lufaise due to messaging issue
        [xi.mission.id.cop.THE_WARRIORS_PATH]    = { xi.inv.WARDROBE2, 5 },
        [xi.mission.id.cop.WHEN_ANGELS_FALL]     = { xi.inv.WARDROBE2, 2 },
        -- [xi.mission.id.cop.DAWN]                 = { xi.inv.WARDROBE2, 5 }, Moved to Dawn lua since you don't actually finish until Apoc Nigh
    },
}

local unlockVar =
{
    [1] = -- Missions
    {
        [xi.mission.log_id.SANDORIA] =
        {
            [xi.mission.id.sandoria.JOURNEY_ABROAD]         = { "[Wardrobe]Nation_1", xi.inv.WARDROBE, 10 },
            [xi.mission.id.sandoria.THE_SHADOW_LORD]        = { "[Wardrobe]Nation_2", xi.inv.WARDROBE, 10 },
            [xi.mission.id.sandoria.THE_SECRET_WEAPON]      = { "[Wardrobe]Nation_3", xi.inv.WARDROBE, 10 },
            [xi.mission.id.sandoria.THE_HEIR_TO_THE_LIGHT]  = { "[Wardrobe]Nation_4", xi.inv.WARDROBE, 10 },
        },
        [xi.mission.log_id.BASTOK] =
        {
            [xi.mission.id.bastok.THE_EMISSARY]             = { "[Wardrobe]Nation_1", xi.inv.WARDROBE, 10 },
            [xi.mission.id.bastok.XARCABARD_LAND_OF_TRUTHS] = { "[Wardrobe]Nation_2", xi.inv.WARDROBE, 10 },
            [xi.mission.id.bastok.ON_MY_WAY]                = { "[Wardrobe]Nation_3", xi.inv.WARDROBE, 10 },
            [xi.mission.id.bastok.WHERE_TWO_PATHS_CONVERGE] = { "[Wardrobe]Nation_4", xi.inv.WARDROBE, 10 },
        },
        [xi.mission.log_id.WINDURST] =
        {
            [xi.mission.id.windurst.THE_THREE_KINGDOMS]     = { "[Wardrobe]Nation_1", xi.inv.WARDROBE, 10 },
            [xi.mission.id.windurst.THE_SHADOW_AWAITS]      = { "[Wardrobe]Nation_2", xi.inv.WARDROBE, 10 },
            [xi.mission.id.windurst.AWAKENING_OF_THE_GODS]  = { "[Wardrobe]Nation_3", xi.inv.WARDROBE, 10 },
            [xi.mission.id.windurst.MOON_READING]           = { "[Wardrobe]Nation_4", xi.inv.WARDROBE, 10 },
        },
    },
    [2] = -- Quests
    {
        [xi.quest.log_id.SANDORIA] =
        {
            [xi.quest.id.sandoria.A_KNIGHT_S_TEST] = { "[Wardrobe]Advanced", xi.inv.WARDROBE, 5 }, -- PLD
            [xi.quest.id.sandoria.THE_HOLY_CREST]   = { "[Wardrobe]Advanced", xi.inv.WARDROBE, 5 }, -- DRG
        },
        [xi.quest.log_id.BASTOK] =
        {
            [xi.quest.id.bastok.BLADE_OF_DARKNESS] = { "[Wardrobe]Advanced", xi.inv.WARDROBE, 5 }, -- DRK
            [xi.quest.id.bastok.AYAME_AND_KAEDE]   = { "[Wardrobe]Advanced", xi.inv.WARDROBE, 5 }, -- NIN
        },
        [xi.quest.log_id.WINDURST] =
        {
            [xi.quest.id.windurst.THE_FANGED_ONE]       = { "[Wardrobe]Advanced", xi.inv.WARDROBE, 5 }, -- RNG
            [xi.quest.id.windurst.I_CAN_HEAR_A_RAINBOW] = { "[Wardrobe]Advanced", xi.inv.WARDROBE, 5 }, -- SMN
        },
        [xi.quest.log_id.JEUNO] =
        {
            [xi.quest.id.jeuno.PATH_OF_THE_BEASTMASTER]    = { "[Wardrobe]Advanced", xi.inv.WARDROBE, 5 }, -- BST
            [xi.quest.id.jeuno.PATH_OF_THE_BARD]           = { "[Wardrobe]Advanced", xi.inv.WARDROBE, 5 }, -- BRD
            [xi.quest.id.jeuno.LAKESIDE_MINUET]            = { "[Wardrobe]Advanced", xi.inv.WARDROBE, 5 }, -- DNC
            [xi.quest.id.jeuno.IN_DEFIANT_CHALLENGE]       = { "[Wardrobe]Limit_1", xi.inv.WARDROBE, 5 },
            [xi.quest.id.jeuno.ATOP_THE_HIGHEST_MOUNTAINS] = { "[Wardrobe]Limit_2", xi.inv.WARDROBE, 5 },
            [xi.quest.id.jeuno.WHENCE_BLOWS_THE_WIND]      = { "[Wardrobe]Limit_3", xi.inv.WARDROBE, 5 },
            [xi.quest.id.jeuno.RIDING_ON_THE_CLOUDS]       = { "[Wardrobe]Limit_4", xi.inv.WARDROBE, 5 },
            [xi.quest.id.jeuno.SHATTERING_STARS]           = { "[Wardrobe]Limit_5", xi.inv.WARDROBE, 5 },
            -- [xi.quest.id.jeuno.NEW_WORLDS_AWAIT]           = { "[Wardrobe]Limit_6", xi.inv.WARDROBE, 5 } Put in quest lua as this quest complete is OOE
        },
        [xi.quest.log_id.OTHER_AREAS] =
        {
            [xi.quest.id.otherAreas.ELDER_MEMORIES] = { "[Wardrobe]Subjob", xi.inv.WARDROBE, 5 },
            [xi.quest.id.otherAreas.THE_OLD_LADY]   = { "[Wardrobe]Subjob", xi.inv.WARDROBE, 5 },
        },
        [xi.quest.log_id.OUTLANDS] =
        {
            [xi.quest.id.outlands.FORGE_YOUR_DESTINY] = { "[Wardrobe]Advanced", xi.inv.WARDROBE, 5 }, -- SAM
        },
        [xi.quest.log_id.AHT_URHGAN] =
        {
            [xi.quest.id.ahtUrhgan.AN_EMPTY_VESSEL]     = { "[Wardrobe]Advanced", xi.inv.WARDROBE, 5 }, -- BLU
            [xi.quest.id.ahtUrhgan.LUCK_OF_THE_DRAW]    = { "[Wardrobe]Advanced", xi.inv.WARDROBE, 5 }, -- COR
            [xi.quest.id.ahtUrhgan.NO_STRINGS_ATTACHED] = { "[Wardrobe]Advanced", xi.inv.WARDROBE, 5 }, -- PUP
        },
        [xi.quest.log_id.CRYSTAL_WAR] =
        {
            [xi.quest.id.crystalWar.A_LITTLE_KNOWLEDGE] = { "[Wardrobe]Advanced", xi.inv.WARDROBE, 5 }, -- SCH
        },
        [xi.quest.log_id.ADOULIN] =
        {
            [xi.quest.id.adoulin.DANCES_WITH_LUOPANS]  = { "[Wardrobe]Advanced", xi.inv.WARDROBE, 5 }, -- GEO
            [xi.quest.id.adoulin.CHILDREN_OF_THE_RUNE] = { "[Wardrobe]Advanced", xi.inv.WARDROBE, 5 }, -- RUN
        },
    },
}

local announcement = function(player, bag, bagIncrease)
    local bagName = bagNames[bag]
    player:changeContainerSize(bag, bagIncrease)

    local str = string.format(
        "Your %s capacity has been increased by %i!",
        bagName, bagIncrease)

    player:PrintToPlayer(str, xi.msg.channel.SYSTEM_3, "")
end

m:addOverride("npcUtil.completeMission", function(player, logId, missionId, params)
    local result = super(player, logId, missionId, params)

    -- Unlock table logic
    if result then
        local bag = 0
        local bagIncrease = 0
        if unlocks[logId] and unlocks[logId][missionId] then
            local unlock = unlocks[logId][missionId]
            bag = unlock[1]
            bagIncrease = unlock[2]
            announcement(player, bag, bagIncrease)
        elseif
            unlockVar[1][logId] and
            unlockVar[1][logId][missionId] and
            player:getCharVar(unlockVar[1][logId][missionId][1]) == 0
        then
            local unlock = unlockVar[1][logId][missionId]
            bag = unlock[2]
            bagIncrease = unlock[3]
            player:setCharVar(unlock[1], 1)
            announcement(player, bag, bagIncrease)
        end
    end

    return result
end)

m:addOverride("npcUtil.completeQuest", function(player, logId, questId, params)
    local result = super(player, logId, questId, params)


    -- Unlock table logic
    if result then
        local bag = 0
        local bagIncrease = 0
        if
            unlockVar[2][logId] and
            unlockVar[2][logId][questId] and
            player:getCharVar(unlockVar[2][logId][questId][1]) == 0
        then
            local unlock = unlockVar[2][logId][questId]
            bag = unlock[2]
            bagIncrease = unlock[3]
            player:setCharVar(unlock[1], 1)

            announcement(player, bag, bagIncrease)
        end
    end

    return result
end)

return m
