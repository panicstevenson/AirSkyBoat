-----------------------------------
-- func: !instance <instance_id>
-- desc: Load an instance and take you there
-----------------------------------

cmdprops =
{
    permission = 5,
    parameters = "i"
}

function error(player, msg)
    player:PrintToPlayer(msg .. "\n!instance <instance_id>")
end

function onTrigger(player, instance_id)
    if instance_id == nil then
        error(player, "You must provide an instance id")
        return
    end

    local currentInstance = player:getInstance()
    if currentInstance then
        player:PrintToPlayer("It is not safe to use this command while inside an instance, try again after exiting.")
        currentInstance:fail()
    else
        player:PrintToPlayer("Creating instance: " .. instance_id)
        player:createInstance(instance_id)
    end
end
