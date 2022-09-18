-----------------------------------
-- HorizonXI Lua Module
-- Used to change Bahamut.
-----------------------------------
local ID = require("scripts/zones/Riverne-Site_B01/IDs")
require("scripts/globals/quests")
require("scripts/globals/status")
-----------------------------------

local m = Module:new("horizon_bahamut")

m:addOverride("xi.zones.Riverne-Site_B01.mobs.Bahamut.onMobInitialize", function(mob)
    mob:setMod(xi.mod.SOUL_EATER_NULLIFICATION, 1)
    mob:setMobMod(xi.mobMod.HP_STANDBACK, -1)
end)

return m
