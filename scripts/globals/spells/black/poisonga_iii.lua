-----------------------------------
-- Spell: Poisonga III
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
    local effect = xi.effect.POISON

    local duration = 180

    -- local pINT = caster:getStat(xi.mod.INT)
    -- local mINT = target:getStat(xi.mod.INT)

    -- local dINT = (pINT - mINT)
    local power = caster:getSkillLevel(xi.skill.ENFEEBLING_MAGIC) / 10 + 1
    if power > 25 then
        power = 25
    end

    local params = {}

    params.diff = nil

    params.attribute = xi.mod.INT

    params.skillType = xi.skill.ENFEEBLING_MAGIC

    params.bonus = 0

    params.effect = effect

    local resist = applyResistanceEffect(caster, target, spell, params)
    if (resist == 1 or resist == 0.5) then -- effect taken
        local resduration = duration * resist

        resduration = calculateBuildDuration(target, duration, params.effect, caster)

        if resduration == 0 then
            spell:setMsg(xi.msg.basic.NONE)
        elseif (target:addStatusEffect(effect, power, 3, resduration)) then
            spell:setMsg(xi.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
        end

    else -- resist entirely.
        spell:setMsg(xi.msg.basic.MAGIC_RESIST)
    end

    return effect
end

return spell_object
