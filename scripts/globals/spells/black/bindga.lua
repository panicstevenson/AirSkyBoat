-----------------------------------
-- Spell: Bind
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------
local spell_object = {}

spell_object.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spell_object.onSpellCast = function(caster, target, spell)

    --Pull base stats.
    -- local dINT = (caster:getStat(xi.mod.INT) - target:getStat(xi.mod.INT))

    --Duration, including resistance.  May need more research.
    local duration = 60

    --Resist
    local params = {}
    params.diff = nil
    params.attribute = xi.mod.INT
    params.skillType = xi.skill.ENFEEBLING_MAGIC
    params.bonus = 0
    params.effect = xi.effect.BIND
    local resist = applyResistanceEffect(caster, target, spell, params)

    if (resist >= 0.5) then --Do it!
        local resduration = duration * resist

        resduration = calculateBuildDuration(target, duration, params.effect, caster)

        if resduration == 0 then
            spell:setMsg(xi.msg.basic.NONE)
        --Try to erase a weaker bind.
        elseif (target:addStatusEffect(xi.effect.BIND, target:getSpeed(), 0, resduration)) then
            spell:setMsg(xi.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(xi.msg.basic.MAGIC_RESIST)
    end

    return xi.effect.BIND

end

return spell_object
