-----------------------------------
-- func: fishcontest <args>
-- desc: Controls elements of the fishing contest system
-----------------------------------
require("scripts/globals/fish")
require("scripts/globals/msg")
require("scripts/globals/status")
require("scripts/globals/utils")

cmdprops =
{
    permission = 1,
    parameters = "sssss"
}

local function error(player, msg, sendDefault)
    sendDefault = sendDefault or false
    if msg ~= "" then
        player:PrintToPlayer(msg, xi.msg.channel.SYSTEM_3)
    end

    if sendDefault then
        player:PrintToPlayer("!fishcontest [ help | stage | fish | time | show | close | resume | reward ]", xi.msg.channel.SYSTEM_3)
    end
end

local function confirmPlayer(player, target)
    local targ = GetPlayerByName(target)
    if targ == nil then
        error (player, string.format("Unable to find player: %s", target))
        return nil
    end
    return targ
end

local function cmdReward(player, subCommand, target, contestId)
    -- Check for a subcommand
    if
        not subCommand or
        not target
    then
        error(player, "Missing parameters for 'reward'.  Use '!fishcontest help reward' for info.")
        return
    else
        subCommand = string.lower(subCommand)
    end

    -- Confirm the player target
    local targ = confirmPlayer(player, target)
    if targ == nil then
        return
    end

    -- Confirm the contest id
    contestId = utils.ternary(contestId == nil, 0, tonumber(contestId))

    if subCommand == "check" then
        local rewards = targ:getAvailableContestRewards(contestId)
        if
            rewards ~= nil and
            #rewards > 0
        then
            if contestId == 0 then
                player:PrintToPlayer(string.format("Found %s unclaimed rewards for %s:", #rewards, target), xi.msg.channel.SYSTEM_3)
            end
            -- Cycle through the awards list
            for _, reward in pairs (rewards) do
                player:PrintToPlayer(string.format("Contest #%s -> Final Rank: %s", reward['id'], reward['rank']), xi.msg.channel.SYSTEM_3)
            end
        else
            player:PrintToPlayer(string.format("No unclaimed rewards found for %s.", target), xi.msg.channel.SYSTEM_3)
        end
        return

    elseif subCommand == "grant" then
        -- Grant the specified award
        if contestId == 0 then
            player:PrintToPlayer(string.format("Must specify a contest number.", target), xi.msg.channel.SYSTEM_3)
            return
        end

        local reward = xi.fishing.contest.playerReward(targ, contestId)
        if
            reward ~= nil and
            npcUtil.giveReward(targ, reward)
        then
            targ:giveContestReward(contestId)
            player:PrintToPlayer(string.format("Granted reward for contest #%s -> %s", contestId, target), xi.msg.channel.SYSTEM_3)
        else
            player:PrintToPlayer(string.format("No eligible rewards found for %s.", target), xi.msg.channel.SYSTEM_3)
        end
        return
    end
end

local function cmdHelp(player, subCommand, option)

    if subCommand == nil then
        player:PrintToPlayer("FISHING CONTEST UTILITIES", xi.msg.channel.SYSTEM_3)
        player:PrintToPlayer("----------------------------", xi.msg.channel.SYSTEM_3)
        player:PrintToPlayer("stage: Set the current stage of the active contest (for testing).", xi.msg.channel.SYSTEM_3)
        player:PrintToPlayer("fish: Set the current fish ID (see fish.lua for a list).", xi.msg.channel.SYSTEM_3)
        player:PrintToPlayer("time: Show the amount of time remaining in the current contest stage.", xi.msg.channel.SYSTEM_3)
        player:PrintToPlayer("show: Display the conditions for the current contest.", xi.msg.channel.SYSTEM_3)
        player:PrintToPlayer("close: Suspend the competition until further notice.", xi.msg.channel.SYSTEM_3)
        player:PrintToPlayer("resume: Resume the competition at its previous state.", xi.msg.channel.SYSTEM_3)
        player:PrintToPlayer("reward: Checks award status and can grant earned rewards not taken.", xi.msg.channel.SYSTEM_3)

    elseif string.lower(subCommand) == "reward" then
        if option == nil then
            player:PrintToPlayer("!fishcontest reward [ check | grant ] <player> <contestid>", xi.msg.channel.SYSTEM_3)
        elseif string.lower(option) == "check" then
            player:PrintToPlayer("!fishcontest reward check <player> : List all unrewarded (but qualified) contests.", xi.msg.channel.SYSTEM_3)
            player:PrintToPlayer("!fishcontest reward check <player> <contestid> : Check status on specific contest.", xi.msg.channel.SYSTEM_3)
        elseif string.lower(option) == "grant" then
            player:PrintToPlayer("!fishcontest reward grant <player> : Grants player reward on current contest.", xi.msg.channel.SYSTEM_3)
            player:PrintToPlayer("!fishcontest reward grant <player> <contestid> : Grants reward on specific past contest.", xi.msg.channel.SYSTEM_3)
        else
            error(player, "Unknown command.", true)
        end

    elseif string.lower(subCommand) == "stage" then
        player:PrintToPlayer("!fishcontest stage <stage #> [ force ]", xi.msg.channel.SYSTEM_3)
        player:PrintToPlayer("WARNING: Adding 'force' will adjust the baseline starting time of the contest.", xi.msg.channel.SYSTEM_3)
        player:PrintToPlayer("If you just want to test, omit this parameter.", xi.msg.channel.SYSTEM_3)

    elseif string.lower(subCommand) == "fish" then
        player:PrintToPlayer("!fishcontest fish [ <fishId> | random ]", xi.msg.channel.SYSTEM_3)
        player:PrintToPlayer("Set the new fish ID for the current contest.", xi.msg.channel.SYSTEM_3)
    end
end

local function cmdStage(player, stage, force)
    if player:getGMLevel() < 4 then
        error(player, "This command requires GM Level 4.")
        return
    end

    force = force or ""
    local doForce = string.lower(force) == "force"
    if
        tonumber(stage) == nil or
        tonumber(stage) > 6
    then
        error(player, "status: [0] = Contesting, [1] = Opening, [2] = Accepting, [3] = Preparing, [4] = Presenting, [5] = Hiatus.")
        return
    elseif tonumber(stage) <= 6 then
        local newStage = tonumber(stage)
        -- This will hard set the stage by changing the start time and adjusting the stage
        local startTime = 0
        if newStage > 0 then
            startTime = xi.fishing.contest.interval[newStage - 1]
        end

        if doForce then
            SetContestStartTime(os.time() - startTime)
            player:PrintToPlayer("Updating contest start time baseline.", xi.msg.channel.SYSTEM_3)
        end

        UpdateContestStatus(newStage, not doForce)
        player:PrintToPlayer(string.format("Contest set to stage %s.", newStage), xi.msg.channel.SYSTEM_3)
    end
end

local function cmdShow(player, contest)
    local criteria = ""
    local measure = ""

    if contest['criteria'] == xi.fishing.contest.criteria.SIZE then
        criteria = "size"
    elseif contest['criteria'] == xi.fishing.contest.criteria.WEIGHT then
        criteria = "weight"
    else
        criteria = "size and weight combined"
    end

    if contest['measure'] == xi.fishing.contest.measure.SMALLEST then
        measure = "smallest"
    else
        measure = "greatest"
    end

    local message = "Contest #" .. contest['id'] .. ": The " .. xi.fishing.getFishName(contest['fishid']) .. " with the " .. measure .. " " .. criteria .. "."
    player:PrintToPlayer(message, xi.msg.channel.SYSTEM_3)
end

local function cmdResume(player, contest)
    local defaultStage = xi.fishing.contest.defaultStatus(contest['starttime'])
    UpdateContestStatus(defaultStage, false)
    player:PrintToPlayer(string.format("Fishing contest resumed at stage %s.", defaultStage), xi.msg.channel.SYSTEM_3)
end

local function cmdTime(player, contest)
    local time = xi.fishing.contest.timeRemaining(contest['changetime'])
    player:PrintToPlayer(string.format("Current Time: %s | Start Time: %s | Change Time: %s", os.time(), contest['starttime'], contest['changetime']), xi.msg.channel.SYSTEM_3)
    player:PrintToPlayer(string.format("Time until stage change: %s days, %s hours, %s minutes.", time['days'], time['hours'], time['minutes']), xi.msg.channel.SYSTEM_3)
end

local function cmdClose(player, contest, hardClose)
    if player:getGMLevel() < 4 then
        error(player, "This command requires GM Level 4.")
        return
    end

    local isTest = true
    if
        hardClose ~= nil and
        hardClose == "hard"
    then
        isTest = false
        player:PrintToPlayer("Contest permanently closed.  New contest can be initiated with '!fishcontest new'.", xi.msg.channel.SYSTEM_3)
    else
        player:PrintToPlayer("Contest temporarily paused.  To resume, use !fishcontest resume.  To make permanent, use '!fishcontest close hard'", xi.msg.channel.SYSTEM_3)
    end

    UpdateContestStatus(xi.fishing.contest.status.CLOSED, isTest)
end

local function cmdFish(player, contest, fishId)
    if player:getGMLevel() < 3 then
        error(player, "This command requires GM Level 3.")
        return
    end

    local newFish = 0

    if
        fishId == nil
    then
        error(player, "!fishcontest fish [ <fishId> | random ]")
        return
    elseif
        xi.fishing.findFishId(fishId) ~= 0
    then
        newFish = xi.fishing.findFishId(fishId)
    elseif
        tonumber(fishId) ~= nil and
        xi.fishing.isBigFish(tonumber(fishId))
    then
        newFish = tonumber(fishId)
    elseif
        string.lower(fishId) == "random"
    then
        newFish = xi.fishing.contest.randomFish()
    else
        error(player, "Invalid fish ID.  Check fish.lua or use !fishcontest fish random to let the server decide.")
        return
    end

    if newFish > 0 then
        SetContestFish(newFish)
        player:PrintToPlayer(string.format("Contest updated with Fish ID %s (%s).", newFish, xi.fishing.getFishName(newFish)), xi.msg.channel.SYSTEM_3)
    end
end

local function cmdNew(player, contest)
    if player:getGMLevel() < 4 then
        error(player, "This command requires GM Level 4.")
        return
    end

    local defaultStage = xi.fishing.contest.defaultStatus(contest['starttime'])
    if defaultStage < 6 then
        player:PrintToPlayer("Cannot create new contest with another one active.  Close current contest first.", xi.msg.channel.SYSTEM_3)
        return
    else
        NewFishingContest()
    end
end

function onTrigger(player, command, ...)
    local arg = { ... }
    -- Check for an empty command string
    if not command then
        error(player, "", true)
        return
    end

    local contest = GetCurrentFishingContest()
    command = string.lower(command)

    -- Command: HELP
    if command == "help" then
        cmdHelp(player, unpack(arg))
        return

    -- Command: REWARD
    elseif command == "reward" then
        cmdReward(player, unpack(arg))
        return
    end

    -- The commands below this line must be called from Selbina or they risk failure
    if string.lower(player:getZoneName()) ~= "selbina" then
        error(player, "This fishing contest command must be called from Selbina.")
        return
    end

    -- COMMAND: STAGE
    if command == "stage" then
        cmdStage(player, unpack(arg))

    -- Command: CLOSE
    elseif command == "close" then
        cmdClose(player, contest, unpack(arg))

    -- Command: RESUME
    elseif command == "resume" then
        cmdResume(player, contest)

    -- Command: TIME
    elseif command == "time" then
        cmdTime(player, contest)

    -- Command: SHOW
    elseif command == "show" then
        cmdShow(player, contest)

    -- Command: fish
    elseif command == "fish" then
        cmdFish(player, contest, unpack(arg))

    -- Command: New
    elseif command == "new" then
        cmdNew(player, contest)

    end
end
