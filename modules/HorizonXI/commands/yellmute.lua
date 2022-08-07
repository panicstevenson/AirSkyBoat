-----------------------------------------------------------------------
-- func: yellmute
-- desc:
-----------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
}

function onTrigger(player, name)
    if name == nil then
        player:PrintToPlayer("!yellmute: You must provide a player name.")
        player:PrintToPlayer("!yellmute: usage: !yellmute <player>")
        return
    end

    local target = GetPlayerByName(name)

    local infractions = target:getCharVar("YellInfractions")

    if infractions == nil then
        player:PrintToPlayer(string.format("!yellmute: Player \"%s\" not found!", name))
        return
    end

    local currentTime = os.time()

    local muteTime = target:getCharVar("YellMuteTime")

    local isMuted = muteTime > currentTime

    if isMuted then
        player:PrintToPlayer(string.format("!yellmute: \"%s\" is already muted.", name))
        return
    end

    -- Increase infraction count by one.
    infractions = infractions + 1
    target:setCharVar("YellInfractions", infractions)

    if infractions > 10 then
        -- At this point, 512 weeks is pretty much a ban.
        infractions = 10
    end

    -- Mute the player.
    local muteTime = os.time() + math.pow(2, infractions - 1) * 86400 * 7
    local result = target:setCharVar("YellMuteTime", muteTime)
    if result == nil then
        player:PrintToPlayer(string.format("!yellmute: Failed to yell mute \"%s\"!", name))
        return
    end

    -- reset their rules state
    target:setCharVar("YellReadRules", 0)
    target:setCharVar("YellOptedIn", 0)

    player:PrintToPlayer(string.format("\"%s\" is muted from yell until %s.", name, os.date("%c", muteTime)), 29)
end
