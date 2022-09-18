-----------------------------------
-- Area: FeiYin
--  Mob: Colossus
-- Note: PH for Goliath
-----------------------------------
local ID = require("scripts/zones/FeiYin/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.regime.checkRegime(player, mob, 715, 2, xi.regime.type.GROUNDS)

    -- Curses, Foiled A-Golem!?
    if (player:hasKeyItem(xi.ki.SHANTOTTOS_NEW_SPELL)) then
        player:delKeyItem(xi.ki.SHANTOTTOS_NEW_SPELL)
        player:addKeyItem(xi.ki.SHANTOTTOS_EX_SPELL)
    end
end

entity.onMobDespawn = function(mob)
    xi.mob.phOnDespawn(mob, ID.mob.GOLIATH_PH, 10, 1) -- No minimum respawn

    if mob:getID() == 17613052 then
        local path =
        {
            [1] = {-168.000, 0, 170.000, 125},
            [2] = {-168.000, 0, 150.000, 125},
            [3] = {-168.000, 0, 130.000, 125},
            [4] = {-192.000, 0, 130.000, 255},
            [5] = {-192.000, 0, 150.000, 255},
            [6] = {-192.000, 0, 170.000, 255},
        }
        local randompos = math.random(1,6)
        local xPos = path[randompos][1]
        local yPos = path[randompos][2]
        local zPos = path[randompos][3]
        local rot  = path[randompos][4]

        mob:setSpawn(xPos, yPos, zPos, rot)
    end
end

return entity
