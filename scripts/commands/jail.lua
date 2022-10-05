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
    local maxID = 0xFFFFFFFF
    local targID = 0

    -- Validate the target..
    local targ = GetPlayerByName( target )

    if (targ == nil) then
        -- Try seeing if the given name is a legit player, and get the ID
        targID = GetPlayerIDAnywhere(target)

        -- If we can find an offline player, we can use it, but have to do something different
        if targID > 0 and targID < maxID then
            player:PrintToPlayer ( string.format( "Player '%s' (ID:%s) found, but is offline.", target, targID ) )
        else
            player:PrintToPlayer( string.format( "Invalid player '%s' given.", target ) )
            return
        end

        targ = GetPlayerByID(targID)
    end

    local cellId = xi.jail.sendToJail(player, targ)

    -- Print that we have jailed someone..
    local message = string.format( '%s jailed %s(%d) into cell %d. Reason: %s', player:getName(), target, targ:getID(), cellId, reason )
    printf( message )
end
