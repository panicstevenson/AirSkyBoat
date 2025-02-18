-----------------------------------
-- Area: Grand Palace of Hu'Xzoi
--  Mob: Eo'zdei
-----------------------------------
require("scripts/globals/status")
mixins = { require("scripts/mixins/families/zdei") }
-----------------------------------
local entity = {}

entity.onPath = function(mob)
    local spawnPos = mob:getSpawnPos()
    mob:pathThrough({ spawnPos.x, spawnPos.y, spawnPos.z })
    local pos = mob:getPos()
    if spawnPos.x == pos.x and spawnPos.z == pos.z and mob:getYPos() > -1 then
        mob:setPos(spawnPos.x, spawnPos.y, spawnPos.z, mob:getRotPos() + 16)
    end
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
