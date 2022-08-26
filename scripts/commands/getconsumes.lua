-----------------------------------
-- func: getconsumes
-- desc: Adds all gear appropriate for testing Dynamis
-----------------------------------

cmdprops =
{
    permission = 3,
    parameters = "s"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!getconsumes {player}")
end

function onTrigger(player, target)

	local consumes =
	{
		5314, --toolbag shihei
        5335, --acid quivers
        4224, --DEMON QUIVERS
        5752, --pot au feu
		4339, --rolan pie+1
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

	-- get consumes
	for _, item in pairs(consumes) do
	
		if player:getFreeSlotsCount() == 0 then
			player:PrintToPlayer("IInventory is full, please check your inventory and try again.")
        return
		end
	
		itemToGet = tonumber(item)
		player:addItem(itemToGet, 12, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val, trialId)
		--player:messageSpecial(ID.text.ITEM_OBTAINED, itemToGet)
	end

    itemToGet = tonumber(4394)	 --ginger cookie
    player:addItem(itemToGet, 99, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val, trialId)

    player:PrintToPlayer(string.format("%s now has added all consumables to inventory.", targ:getName()))
end
