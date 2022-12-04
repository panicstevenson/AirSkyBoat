-----------------------------------
-- Era+ EXP Rings
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local m = Module:new("horizon_exp_rings")

m:addOverride("xi.globals.items.empress_band.onItemUse", function(target)
    target:addStatusEffect(xi.effect.DEDICATION, 50, 0, 10800, 0, 1000)
end)

m:addOverride("xi.globals.items.emperor_band.onItemUse", function(target)
    target:addStatusEffect(xi.effect.DEDICATION, 75, 0, 9000, 0, 2250)
end)

m:addOverride("xi.globals.items.chariot_band.onItemUse", function(target)
    target:addStatusEffect(xi.effect.DEDICATION, 100, 0, 7200, 0, 4000)
end)

m:addOverride("xi.globals.items.anniversary_ring.onItemUse", function(target)
    target:addStatusEffect(xi.effect.DEDICATION, 100, 0, 43200, 0, 3000)
end)

return m
