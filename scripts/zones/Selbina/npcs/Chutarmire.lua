-----------------------------------
-- Area: Selbina
--  NPC: Chutarmire
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Selbina/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        4768,  5751 * 0.6,    -- Scroll of Stone II
        4778,  8100 * 0.6,    -- Scroll of Water II
        4763, 11970 * 0.6,    -- Scroll of Aero II
        4753, 16560 * 0.6,    -- Scroll of Fire II
        4758, 21870 * 0.6,    -- Scroll of Blizzard II
        4773, 27900 * 0.6,    -- Scroll of Thunder II
        4797,  1165 * 0.6,    -- Scroll of Stonega
        4807,  2097 * 0.6,    -- Scroll of Waterga
        4792,  4147 * 0.6,    -- Scroll of Aeroga
        4782,  7025 * 0.6,    -- Scroll of Firaga
        4787, 10710 * 0.6,    -- Scroll of Blizzaga
        4802, 15120 * 0.6,    -- Scroll of Thundaga
        4829, 22680,    -- Scroll of Poison II
        4839, 12600,    -- Scroll of Bio II
        4833,  4644,    -- Scroll of Poisonga
        4859,  8100,    -- Scroll of Shock Spikes
    }

    player:showText(npc, ID.text.CHUTARMIRE_SHOP_DIALOG)
    xi.shop.general(player, stock, xi.quest.fame_area.SELBINA_RABAO)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
