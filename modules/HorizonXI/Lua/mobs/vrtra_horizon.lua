-----------------------------------
-- HorizonXI Lua Module
-- Used to change Vrtra.
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

local m = Module:new("horizon_vrtra")

m:addOverride("xi.zones.King_Ranperres_Tomb.mobs.Vrtra.onMobInitialize", function(mob)
    mob:setMod(xi.mod.SOUL_EATER_NULLIFICATION, 1)
end)

return m
