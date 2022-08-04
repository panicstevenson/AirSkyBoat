-----------------------------------
-- xi.effect.MOUNTED
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local effect_object = {}

effect_object.onEffectGain = function(target, effect)
    -- Retail sends a music change packet (packet ID 0x5F) in both cases.

    -- TODO: This isn't quite right. The IDs we use for mounts vs what we use for power etc.
    -- seem to be off-by-one.
    if effect:getPower() < 2 then
        target:ChangeMusic(4, 212)
        target:setAnimation(xi.anim.CHOCOBO)
    else
        target:ChangeMusic(4, 84)
        target:setAnimation(xi.anim.MOUNT)
    end

    -- No pets while on a chocobo
    if target:getPet() ~= nil then
        target:despawnPet()
    end
end

effect_object.onEffectTick = function(target, effect)
end

effect_object.onEffectLose = function(target, effect)
    target:setAnimation(xi.anim.NONE)
end

return effect_object
