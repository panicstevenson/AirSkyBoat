-----------------------------------
-- Area: Pashhow Marshlands [S]
--  NPC: Milloure
-- Type: Chocobo Renter
-- !pos 336.765 24.416 -124.592 90
-----------------------------------
require("scripts/globals/chocobo")
-----------------------------------
local entity = {}

local eventSucceed = 103
local eventFail    = 104

entity.onTrade = function(player, npc, trade)
    xi.chocobo.renterOnTrade(player, npc, trade, eventSucceed, eventFail)
end

entity.onTrigger = function(player, npc)
    xi.chocobo.renterOnTrigger(player, eventSucceed, eventFail)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    xi.chocobo.renterOnEventFinish(player, csid, option, eventSucceed)
end

return entity
