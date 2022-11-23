-----------------------------------
-- func: fishcontest <args>
-- desc: Controls elements of the fishing contest system
-----------------------------------
require("scripts/globals/fish")
require("scripts/globals/msg")
require("scripts/globals/status")

cmdprops =
{
    permission = 4,
    parameters = "ssss"
}

function error(player, msg, sendDefault)
    sendDefault = sendDefault or false
    if msg ~= "" then
        player:PrintToPlayer(msg)
    end

    if sendDefault then
        player:PrintToPlayer("!fishcontest [ help | stage | time | show | close | resume | reward ]", xi.msg.channel.SYSTEM_3)
    end
end

function onTrigger(player, command, ...)
    local arg = { ... }
    -- Check for an empty command string
    if not command then
        error(player, "", true)
        return
    end

    local contest = GetFishingContest()
    command = string.lower(command)

    if command == "help" then
        player:PrintToPlayer("stage: Set the current stage of the active contest (for testing).", xi.msg.channel.SYSTEM_3)
        player:PrintToPlayer("time: Show the amount of time remaining in the current contest stage.", xi.msg.channel.SYSTEM_3)
        player:PrintToPlayer("show: Display the conditions for the current contest.", xi.msg.channel.SYSTEM_3)
        player:PrintToPlayer("close: Suspend the competition until further notice.", xi.msg.channel.SYSTEM_3)
        player:PrintToPlayer("resume: Resume the competition at its previous state.", xi.msg.channel.SYSTEM_3)

    -- COMMAND: STAGE
    elseif command == "stage" then
        local status = tonumber(arg[1])
        if status == nil or status > 6 then
            error(player, "status: [0] = Contesting, [1] = Opening, [2] = Accepting, [3] = Preparing, [4] = Presenting.")
            return
        else
            UpdateContestStatus(status, true) -- True indicates a testing mode that won't allow the server tick to force a stage change
        end

    -- Command: CLOSE
    elseif command == "close" then
        UpdateContestStatus(xi.fishing.contest.status.CLOSED)
        player:PrintToPlayer("Contest now paused.  To resume, use !fishcontest resume.", xi.msg.channel.SYSTEM_3)

    -- Command: RESUME
    elseif command == "resume" then
        local defaultStage = xi.fishing.contest.defaultStatus(contest['starttime'])
        UpdateContestStatus(defaultStage, false)
        player:PrintToPlayer(string.format("Fishing contest resumed at stage %s.", defaultStage), xi.msg.channel.SYSTEM_3)

    -- Command: TIME
    elseif command == "time" then
        local time = xi.fishing.contest.timeRemaining(contest['changetime'])
        player:PrintToPlayer(string.format("Current Time: %s | Start Time: %s | Change Time: %s", os.time(), contest['starttime'], contest['changetime']), xi.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Time until stage change: %s days, %s hours, %s minutes.", time['days'], time['hours'], time['minutes']), xi.msg.channel.SYSTEM_3)

    -- Command: SHOW
    elseif command == "show" then
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

    -- Command: REWARD
    elseif command == "reward" then
        if not arg[1] or not arg[2] then
            error(player, "Missing parameters for 'reward'.  Use '!fishcontest help reward' for info.")
            return
        end

        --local pName = arg[1]
        --local contestId = tonumber(arg[2])
        -- TODO: Get the contest reward status for the player and contest ID
    end
end
