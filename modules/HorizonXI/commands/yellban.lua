-----------------------------------------------------------------------
-- func: yellban
-- desc:
-----------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
}

function onTrigger(player, name)
    if name == nil then
        player:PrintToPlayer("!yellban: You must provide a player name.")
        player:PrintToPlayer("!yellban: usage: !yellban <player>")
        return
    end

    local target = GetPlayerByName(name)
    local infractions = target:getCharVar("YellInfractions")

    if infractions == nil then
        player:PrintToPlayer(string.format("!yellban: Player \"%s\" not found!", name))
        return
    end

    -- Increase infraction count by one.
    infractions = infractions + 1
    target:setCharVar("YellInfractions", infractions)

    -- Mute the player for a very, very long time.
    local muteTime = os.time() + 10 * 366 * 86400;
    local result = target:setCharVar("YellMuteTime", muteTime)
    if result == nil then
        player:PrintToPlayer(string.format("!yellban: Failed to yell mute \"%s\"!", name))
        return
    end

    -- reset their rules state
    target:setCharVar("YellReadRules", 0)
    target:setCharVar("YellOptedIn", 0)

    player:PrintToPlayer(string.format("\"%s\" is muted from yell until %s.", name, os.date("%c", muteTime)), 29)
end
