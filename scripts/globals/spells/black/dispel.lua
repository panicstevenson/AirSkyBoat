-----------------------------------
-- Spell: Dispel
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
    local params = {}
    params.attribute = xi.mod.INT
    params.skillType = xi.skill.ENFEEBLING_MAGIC
    local resist = applyResistance(caster, target, spell, params)
    local effect = xi.effect.NONE

    if (resist > 0.0625) then
        spell:setMsg(xi.msg.basic.MAGIC_ERASE)
        effect = target:dispelStatusEffect()
        if (effect == xi.effect.NONE) then
            -- no effect
            spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(xi.msg.basic.MAGIC_RESIST)
    end

    if target:hasImmunity(32768) then --dispel immunity enum needed as core immunity only looks at effects and not spell land
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
        return 0
    end

    return effect
end

return spell_object
