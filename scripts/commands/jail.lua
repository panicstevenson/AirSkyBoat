-----------------------------------
-- func: jail
-- desc: Sends the target player to jail. (Mordion Gaol)
-----------------------------------

require("scripts/globals/jail")

cmdprops =
{
    permission = 1,
    parameters = "ss"
}

function onTrigger(player, target, reason)
    -- Validate the target..
    local targ = GetPlayerByName( target )
    if (targ == nil) then
        player:PrintToPlayer( string.format( "Invalid player '%s' given.", target ) )
        return
    end

    local cellId = xi.jail.sendToJail(player, targ)

    -- Print that we have jailed someone..
    local message = string.format( '%s jailed %s(%d) into cell %d. Reason: %s', player:getName(), target, targ:getID(), cellId, reason )
    printf( message )
end
