-----------------------------------
-- func: equipjob
-- desc: Adds all gear appropriate for testing Dynamis
-----------------------------------

cmdprops =
{
    permission = 3,
    parameters = "s"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!equipjob {player}")
end

function onTrigger(player, target)
    local itemsToGet =
    {
		--joyeuse, g shield, chanters staff
		17652, 12296, 17133,
        --singing weaps
        17833, 17853, 17838, 17379, 17841, 17378, 17349, 17371, 17845, 17846, 17842, 17374, 17839,
		--vermi
		13748,
		--ele staves + grip + tathlum + h bomb
        17545, 17557, 17559, 17555, 17553, 17551, 17549, 17547, 19018, 18136, 17277,
		--Gear 
		14380, 14247, 13301, 14782, 14812, 15293, 15813, 13295, 14123, 13876, 13463,
        15961, 15473, 13136, 13161, 13160, 14301,
        --shair set minus body
        15303, 14846, 14315, 15153,
		--AF Below
		14223, 13970, 12647, 13857, 14098,
		
    }

    -- validate target
    local targ
    if (target == nil) then
        targ = player
    else
        targ = GetPlayerByName(target)
        if (targ == nil) then
            error(player, string.format("Player named '%s' not found!", target))
            return
        end
    end

    -- add all items
    local save = true
    local silent = true
    local sendUpdate = false -- prevent packet spam

    for _, item in pairs(itemsToGet) do
        silent = false
        sendUpdate = false
        save = true
		
		if player:getFreeSlotsCount() == 0 then
			player:PrintToPlayer("IInventory is full, please check your inventory and try again.")
        return
		end
				
		itemToGet = tonumber(item)
		
		if (targ:hasItem(itemToGet)) then
			--player:PrintToPlayer(string.format("%s has item %i.", targ:getName(), itemToGet))
		else
			player:addItem(itemToGet, quantity, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val, trialId)
			--player:messageSpecial(ID.text.ITEM_OBTAINED, itemToGet)
		end
    end

    player:PrintToPlayer(string.format("%s now has all items for testing dynamis/hnm.", targ:getName()))
end
