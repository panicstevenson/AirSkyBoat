---------------------------------------------------------------------------------------------------
-- func: spin
-- desc: Spins a player 180 degrees (127 rad)
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 2,
    parameters = "ss"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!spin <player> <deg>")
end

function onTrigger(player, targ, amount)
    local target = nil
    local rot = target:getRotPos()
    -- validate target
    if targ then
        target = GetPlayerByName(targ)
    elseif player:getCursorTarget() then
        target = player:getCursorTarget()
    else
        return error(player, "Invalid target.")
    end

    if not amount then
        return error(player, "No rotation inputted")
    else
        rot = tonumber(amount)
    end

    target:setRotation(target:getRotPos() + rot)
end
