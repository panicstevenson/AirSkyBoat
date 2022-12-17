-----------------------------------
-- func: poscam <x> <y> <z> <optional zone> <optional target>
-- desc: Sets the players position. Used for HorizonXI Live Cam
-----------------------------------

cmdprops =
{
    permission = 3,
    parameters = "ssssss"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!poscam (x) (y) (z) (rot) (zone ID)")
end

function onTrigger(player, arg1, arg2, arg3, arg4, arg5)
    local target
    local zoneId
    local x
    local y
    local z
    local rot
    local targ

    x = tonumber(arg1)
    y = tonumber(arg2)
    z = tonumber(arg3)
    rot = tonumber(arg4)
    zoneId = arg5

    targ = player

    -- validate zone
    if zoneId ~= nil then
        zoneId = tonumber(zoneId)
        if zoneId == nil or zoneId < 0 or zoneId > 298 then
            error(player, "Invalid zone ID.")
            return
        end
    end

    if zoneId == nil then
        zoneId = targ:getZoneID()
        targ:setPos(x, y, z, rot)
    else
        targ:setPos(x, y, z, rot, zoneId)
    end

    if player:getID() ~= targ:getID() then
        player:PrintToPlayer(string.format("Moved %s to (%.4f, %.4f, %.4f) in zone %i.", targ:getName(), x, y, z, zoneId))
    end
end
