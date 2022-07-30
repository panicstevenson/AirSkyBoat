-----------------------------------
-- HorizonXI Lua Module
-- Used to change Jormungand.
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

local m = Module:new("horizon_jormungand")

m:addOverride("xi.zones.Uleguerand_Range.mobs.Jormungand.onMobInitialize", function(mob)
    mob:setMod(xi.mod.SOUL_EATER_NULLIFICATION, 1)
end)

return m
