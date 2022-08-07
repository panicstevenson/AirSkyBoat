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
		--ele staves + grip + tathlum + h bomb
        17545, 17557, 17559, 17555, 17553, 17551, 17549, 17547, 19018, 18136, 17277,
		--Gear
		12605, 14741, 14812, 13779, 14006, 13450, 13587, 15907, 15292, 14498,
		14301, 15350, 16263, 14792, 14380, 15242, 14907, 15663, 15578, 14782, 13301,
		--Blessed set
		14436, 14875, 15329, 15391,
		--AF Below
		12640, 13855, 14091, 13963, 14216,
		
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
