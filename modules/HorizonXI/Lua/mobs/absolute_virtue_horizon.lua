-----------------------------------
-- HorizonXI Lua Module
-- Used to change Absolute Virtue.
-----------------------------------
local ID = require("scripts/zones/AlTaieu/IDs")
require("scripts/globals/status")
require("scripts/globals/titles")
require("scripts/globals/magic")
-----------------------------------

local m = Module:new("horizon_absolute_virtue")

m:addOverride("xi.zones.AlTaieu.mobs.Absolute_Virtue.onMobInitialize", function(mob)
    mob:setMod(xi.mod.SOUL_EATER_NULLIFICATION, 1)
end)

return m
