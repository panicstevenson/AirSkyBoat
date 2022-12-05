-----------------------------------
-- Spell: Slow
-----------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
require("scripts/globals/utils")
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    if target:hasStatusEffect(xi.effect.HASTE) then
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
        return xi.effect.SLOW
    end

    local dMND = caster:getStat(xi.mod.MND) - target:getStat(xi.mod.MND)

    --Power
    -- Lowest ~7.3%
    -- Highest ~29.2%
    local power = utils.clamp(math.floor(dMND * 73 / 5) + 1825, 730, 2920)
    power = xi.magic.calculatePotency(power, spell:getSkillType(), caster, target)

    --Duration
    local duration = xi.magic.calculateDuration(180, spell:getSkillType(), spell:getSpellGroup(), caster, target)

    local params = {}
    params.diff = dMND
    params.skillType = xi.skill.ENFEEBLING_MAGIC
    params.bonus = 0
    params.effect = xi.effect.SLOW
    params.tier = 1

    if not xi.magic.differentEffect(caster, target, spell, params) then
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
        return params.effect
    end

    local resist = xi.magic.applyResistanceEffect(caster, target, spell, params)

    if resist >= 0.5 then --Do it!
        local resduration = duration * resist

        resduration = xi.magic.calculateBuildDuration(target, duration, params.effect, caster)

        if resduration == 0 then
            spell:setMsg(xi.msg.basic.NONE)
        elseif target:addStatusEffect(params.effect, power, 0, resduration, 0, params.tier) then
            spell:setMsg(xi.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(xi.msg.basic.MAGIC_RESIST)
    end

    return params.effect
end

return spellObject
