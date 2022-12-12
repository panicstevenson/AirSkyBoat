cmdprops =
{
    permission = 5,
    parameters = "s"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!givestafflinkshell <target>")
end

function onTrigger(player, target)
    local targ = nil
    local cursor_target = player:getCursorTarget()

    if target then
        targ = GetPlayerByName(target)
        if not targ then
            error(player, string.format( "Player named '%s' not found!", target ) )
            return
        end
    elseif cursor_target and not cursor_target:isNPC() then
        targ = cursor_target
    else
        targ = player
    end

    targ:setUnityLeader(5)
    player:PrintToPlayer(string.format("%s has been given the staff linkshell.", targ:getName()))

end
