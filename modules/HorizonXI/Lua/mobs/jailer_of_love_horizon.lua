-----------------------------------
-- HorizonXI Lua Module
-- Used to change Jailer of Love.
-----------------------------------
local ID = require("scripts/zones/AlTaieu/IDs")
require("scripts/globals/status")
-----------------------------------

local m = Module:new("horizon_jailer_of_love")

m:addOverride("xi.zones.AlTaieu.mobs.Jailer_of_Love.onMobInitialize", function(mob)
    mob:setMod(xi.mod.SOUL_EATER_NULLIFICATION, 1)
end)

return m
