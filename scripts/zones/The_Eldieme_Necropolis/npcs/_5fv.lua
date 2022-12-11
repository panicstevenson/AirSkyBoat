-----------------------------------
-- Area: The Eldieme Necropolis
--  NPC: Tallow Candle
-- !pos 139.96 -18.29 306.27
-----------------------------------
local ID = require("scripts/zones/The_Eldieme_Necropolis/IDs")
local func = require("scripts/zones/The_Eldieme_Necropolis/globals")
require('scripts/globals/npc_util')
require('scripts/globals/items')
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    func.candleOnTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    func.candleOnTrigger(player, npc)
end

return entity
