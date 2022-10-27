-----------------------------------
-- Area: Waughroon Shrine
--  Mob: Titanis Max
-- KSNM: Prehistoric Pigeons
-----------------------------------
mixins = { require("scripts/mixins/job_special") }
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
end

entity.onMobDeath = function(mob, player, optParams)
    local id = mob:getID()
    for i = 1, 3 do
        GetMobByID(id + i):addMod(xi.mod.DELAY, 1000)
    end
end

return entity
