-----------------------------------
-- HorizonXI Lua Module
-- Used to change Tiamat.
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
-----------------------------------

local m = Module:new("horizon_tiamat")

m:addOverride("xi.zones.Attohwa_Chasm.mobs.Tiamat.onMobInitialize", function(mob)
    mob:setMod(xi.mod.SOUL_EATER_NULLIFICATION, 1)
    mob:setCarefulPathing(true)
end)

return m
