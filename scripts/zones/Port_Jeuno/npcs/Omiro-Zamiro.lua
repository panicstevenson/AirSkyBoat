-----------------------------------
-- Area: Port Jeuno
--  NPC: Omiro-Zamiro
-- !pos 3 7 -54 246
-----------------------------------
require("scripts/globals/keyitems")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if player:getCharVar("Quest[0][67]Stage") > os.time() then
        player:startEvent(43)
    else
        if
            player:hasKeyItem(xi.ki.AIRSHIP_PASS) and
            player:getGil() >= 200
        then
            player:startEvent(39)
        else
            player:startEvent(47)
        end
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 39 then
        local zPos = player:getZPos()

        if zPos >= -61 and zPos <= -58 then
            player:delGil(200)
            player:setLocalVar('[AIRSHIP]Paid', 1)
        end
    end
end

return entity
