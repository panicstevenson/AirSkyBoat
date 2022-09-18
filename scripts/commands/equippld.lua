-----------------------------------
-- func: createjob
-- desc: Adds all gear appropriate for testing Dynamis
-- Hiadate 12818, Swift Belt 15457, pole grip 19025, Bomb core 18139,
-- brutal earring 14813, rajas ring 15543, snipers 13280, amem. mantle 13645, Royal Guard's Collar 13106
-- life belt 13231, warwolf belt 15294, hauberk 12556, dusk gloves 12701, dusk boots 12957, voyager sallet 15184, ohat 13915
-- pallas bracelets 14021
-- SH 12579
-- Rutter sab 15349
-- heavy xbow 17220
-----------------------------------

cmdprops =
{
    permission = 3,
    parameters = "s"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!createjob {player}")
end

function onTrigger(player, target)
    local itemsToGet =
    {
		--Weapon joyeuse, durandal,
        17652, 17700, 12387, 18372,
		--Gear
		12420, 15457, 19025, 15543, 13280, 13645, 13106, 13231, 15294, 
		12701, 12957, 15184, 13915, 15506, 13748, 12804, 12548, 15468,
		14021, 12579, 15349, 14764, 13805, 14782, 13301, 12677, 14758,
		13014, 14260, 13061, 13123, 14806, 13740, 13453, 14659, 
		--AF Below
		14220, 12515, 13967, 14095, 12644,
		
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
