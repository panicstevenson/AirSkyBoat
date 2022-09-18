-----------------------------------
-- func: test 
-- desc: shows testers the available commands that will help with testing
-----------------------------------

cmdprops =
{
    permission = 3,
    parameters = ""
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!test")
end

function onTrigger(player)

    -- validate target
    local targ
    if (player == nil) then
        targ = player

    if (targ == nil) then
        error(player, string.format("Player named '%s' not found!", target))
            return
        end
    end

    -- add spell
    local save = true
    local silent = false
    player:PrintToPlayer("Welcome to HorizonXI Dynamis/HNM testing. Please use the following GM commands to setup your character.")
	player:PrintToPlayer("!setbag 80; !capallskills; !addallspells; !addallweaponskills; !changejob JOB 75; !changesjob JOB 37; !equipJOB;")
    player:PrintToPlayer("!getconsumes - will provide you with shiehei, ginger cookies, sole sushi, acid bolts, rolan pies, pot au feu")
	player:PrintToPlayer("!addkeyitem 492 for vial_of_shrouded_sands, !additem 4236 for timeless hourglass.")

end
