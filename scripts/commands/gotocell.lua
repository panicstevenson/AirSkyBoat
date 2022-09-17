-----------------------------------
-- func: gotocell
-- desc: Goes to the target cell.
-----------------------------------

require("scripts/globals/jail")

cmdprops =
{
    permission = 2,
    parameters = "si"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!gotocell cellId")
end

function onTrigger(player, cellId)

    if not cellId then
        error(player, "You must enter a cellId.")
        return
    end

    xi.jail.goToCell(player, cellId)
end
