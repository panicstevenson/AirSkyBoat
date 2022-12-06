-----------------------------------
-- Area: Windurst Woods
--  NPC: Erpolant
-- Type: Standard NPC
-- !pos -63.224 -0.749 -33.424 241
-----------------------------------
require("scripts/globals/zone")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if player:getNation() == xi.nation.SANDORIA then
        player:startEvent(447)
    else
        player:startEvent(444)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
