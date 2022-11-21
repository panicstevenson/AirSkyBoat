-----------------------------------
-- func: addfish <fishId> <length> <weight>
-- desc: Adds a measured fish to the GMs inventory.
-----------------------------------
require("scripts/globals/fish")
-----------------------------------

cmdprops =
{
    permission = 4,
    parameters = "sii"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!addfish <fish> <length> <weight>")
end

function onTrigger(player, item, length, weight)
    -- Load needed text ids for players current zone..
    local ID = zones[player:getZoneID()]
    local itemToGet = 0

    -- validate item
    if item == nil then
        -- No Item Provided
        error(player, "No Item ID given.")
        return
    elseif item ~= nil and tonumber(item) == nil then
        -- Item was provided, but was not a number.  Try text lookup.
        local retItem = xi.fishing.findFishId(item)
        if retItem == 0 then
            player:PrintToPlayer(string.format("Item %s not found in fish table.", item))
            return
        end
        itemToGet = retItem
    else
        -- Number was provided, so just use it
        itemToGet = tonumber(item)
    end

    -- Confirm the size/weight
    if
        length == 0 or
        length == nil or
        weight == 0 or
        weight == nil
    then
        error(player, "Size/Weight not provided.")
        return
    end

    -- At this point, if there's no item found, exit out of the function
    if itemToGet == 0 then
        error(player, "Item not found.")
        return
    end

    -- Confirm the item is in the fish table as a big fish
    if not xi.fishing.isBigFish(itemToGet) then
        error(player, "Item is not a fish.")
        return
    end

    -- TODO: check qty and stack size + remaining inventory space instead of hardcoded == 0 check
    -- Ensure the GM has room to obtain the item...
    if player:getFreeSlotsCount() == 0 then
        player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, itemToGet)
        return
    end

    -- Give the GM the item...
    local obtained = player:addItem({ id = itemToGet,
                                      quantity = 1,
                                      exdata =
                                      {
                                          [0] = bit.band(length, 0x00FF),
                                          [1] = bit.rshift(bit.band(length, 0xFF00), 8),
                                          [2] = bit.band(weight, 0x00FF),
                                          [3] = bit.rshift(bit.band(weight, 0xFF00), 8),
                                          [4] = 0, -- Ensures fish is not previously ranked
                                      } })
    if obtained then
        player:messageSpecial(ID.text.ITEM_OBTAINED, itemToGet)
    end
end
