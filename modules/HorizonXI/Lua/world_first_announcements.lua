-----------------------------------
-- World First Announcements
--
-- Send worldwide messages when certain conditions are met for the first time.
--
-- NOTE: GetVolatileServerVariable/SetVolatileServerVariable are cached, so are cheap to use every time (*apart from the first).
--     : It is recommended you go and look at the implementation to see how these work.
--
-- You can look up who did what with this SQL query:
-- SELECT
--     server_variables.`name`, chars.charname
-- FROM
--     server_variables
-- INNER JOIN
--     chars ON server_variables.value = chars.charid
-- WHERE
--     server_variables.`name` LIKE "WF_%" OR
--     server_variables.`name` LIKE "WT_%"
-----------------------------------
require("modules/module_utils")
require("scripts/globals/mobs")
require("scripts/globals/player")
require("scripts/globals/status")
-----------------------------------
local m = Module:new("world_first_announcements")

local openingDecoration = "\129\154"
local closingDecoration = "\129\154"

hxi = hxi or { }
hxi.worldFirst = hxi.worldFirst or { }

local nmList =
{
    "Kirin",
    "Jailer_of_Love",
    "Jormungand",
    "Tiamat",
    "Vrtra",
    "King_Vinegaroon",
    "Nidhogg",
    "Aspidochelone",
    "King_Behemoth"
}

local skillList =
{
    {xi.skill.FISHING, "Fishing"},
    {xi.skill.WOODWORKING, "Woodworking"},
    {xi.skill.SMITHING, "Smithing"},
    {xi.skill.GOLDSMITHING, "Goldsmithing"},
    {xi.skill.CLOTHCRAFT, "Clothcraft"},
    {xi.skill.LEATHERCRAFT, "Leathercraft"},
    {xi.skill.BONECRAFT, "Bonecraft"},
    {xi.skill.ALCHEMY, "Alchemy"},
    {xi.skill.COOKING, "Cooking"},
}

hxi.worldFirst.checkWorldFirstServerVar = function(player, varName, worldMessage)
    local worldFirst = string.format("WF_%s", varName)
    local worldTime  = string.format("WT_%s", varName)

    if GetServerVariable(worldFirst) == 0 then -- Record hasn't been set yet
        local decoratedMessage = string.format("%s %s %s", openingDecoration, worldMessage, closingDecoration)
        player:PrintToArea(decoratedMessage, xi.msg.channel.SYSTEM_3, 0, "") -- Sends announcement via ZMQ to all processes and zones

        -- Write out World First (WF) and World First Time (WT) to server vars)
        SetServerVariable(worldFirst, player:getID())
        SetServerVariable(worldTime, os.time())

        -- Summon big swirly starry animation which lingers on the players client in the location
        -- where this event happened. It will linger in that area for anyone that saw it until
        -- they zone.
        player:independentAnimation(player, 12, 3)
    end
end

m:addOverride("xi.player.onPlayerDeath", function(player)
    super(player)

    hxi.worldFirst.checkWorldFirstServerVar(player,
        "PLAYER_DEATH",
        string.format("%s has been the first player to die!", player:getName()))
end)

m:addOverride("xi.player.onPlayerLevelUp", function(player)
    super(player)

    if player:getMainLvl() == 75 then
        if player:getCharVar("hardcore") == 1 then
            hxi.worldFirst.checkWorldFirstServerVar(player,
                string.format("JOB_75_%s_HARDCORE", xi.jobNames[player:getMainJob()][1]),
                string.format("%s has been the first hardcore player to reach level 75 on %s!", player:getName(), xi.jobNames[player:getMainJob()][2]))
        else
            hxi.worldFirst.checkWorldFirstServerVar(player,
            string.format("JOB_75_%s", xi.jobNames[player:getMainJob()][1]),
            string.format("%s has been the first player to reach level 75 on %s!", player:getName(), xi.jobNames[player:getMainJob()][2]))
        end
    end
end)

m:addOverride("xi.player.onPlayerLevelDown", function(player)
    super(player)

    hxi.worldFirst.checkWorldFirstServerVar(player,
        "PLAYER_LEVEL_DOWN",
        string.format("%s has been the first player to level down!", player:getName()))
end)

m:addOverride("xi.mob.onMobDeathEx", function(mob, player, isKiller, isWeaponSkillKill)
    super(mob, player, isKiller, isWeaponSkillKill)

    if mob:isNM() and isKiller then
        for _, v in pairs(nmList) do
            if mob:getName() == v and player then
                local linkshell = player:getLinkshellName()
                local nmName, _ = string.gsub(mob:getName(), "_", " ")

                if not linkshell or linkshell == '' then
                    hxi.worldFirst.checkWorldFirstServerVar(player,
                        "NM_KILL_" .. string.upper(mob:getName()),
                        string.format("%s has been killed for the first time by %s's group!", nmName, player:getName()))
                else
                    hxi.worldFirst.checkWorldFirstServerVar(player,
                        "NM_KILL_" .. string.upper(mob:getName()),
                        string.format("%s has been killed for the first time by the linkshell %s!", nmName, linkshell))
                end
            end
        end
    end
end)

m:addOverride("xi.player.onPlayerCraftLevelUp", function(player, skillID)
    super(player)

    for _, v in pairs(skillList) do
        if skillID == v[1] and player:getSkillLevel(v[1]) == 3209 then
            hxi.worldFirst.checkWorldFirstServerVar(player,
                "CRAFT_SKILL_" .. string.upper(v[2]),
                string.format("%s has been the first player to attain level 100 %s!", player:getName(), v[2]))
        end
    end
end)

return m
