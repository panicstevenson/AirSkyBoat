-----------------------------------
-- HorizonXI Lua Module
-- Used to change spell luas.
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

local m = Module:new("horizon_spells")

m:addOverride("xi.globals.spells.black.drain.onSpellCast", function(caster, target, spell)
    --calculate raw damage (unknown function  -> only dark skill though) - using http://www.bluegartr.com/threads/44518-Drain-Calculations
    -- also have small constant to account for 0 dark skill
    local dmg = 10 + (1.035 * caster:getSkillLevel(xi.skill.DARK_MAGIC))

    if (dmg > (caster:getSkillLevel(xi.skill.DARK_MAGIC) + 20)) then
        dmg = (caster:getSkillLevel(xi.skill.DARK_MAGIC) + 20)
    end

    --get resist multiplier (1x if no resist)
    local params = {}
    params.diff = caster:getStat(xi.mod.INT)-target:getStat(xi.mod.INT)
    params.attribute = xi.mod.INT
    params.skillType = xi.skill.DARK_MAGIC
    params.bonus = 1.0
    local resist = applyResistance(caster, target, spell, params)

    --get the resisted damage
    dmg = dmg * resist

    --add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    dmg = addBonuses(caster, spell, target, dmg)

    --add in target adjustment
    dmg = adjustForTarget(target, dmg, spell:getElement())

    --add in final adjustments
    if (dmg < 0) then
        dmg = 0
    end

    if (target:isUndead()) then
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT) -- No effect
        return dmg
    end

    if caster:getSystem() == xi.ecosystem.UNDEAD and target:isPC() and target:hasStatusEffect(xi.effect.HOLY_CIRCLE) then
        dmg = dmg / 2
    end

    dmg = finalMagicAdjustments(caster, target, spell, dmg)

    caster:addHP(dmg)

    if (target:getHP() < dmg) then
        target:setHP(0)
    end

    return dmg
end)

m:addOverride("xi.globals.spells.black.drain_ii.onSpellCast", function(caster, target, spell)
    --calculate raw damage (unknown function  -> only dark skill though) - using http://www.bluegartr.com/threads/44518-Drain-Calculations
    -- also have small constant to account for 0 dark skill
    local dmg = 20 + (1.236 * caster:getSkillLevel(xi.skill.DARK_MAGIC))

    if (dmg > (caster:getSkillLevel(xi.skill.DARK_MAGIC) + 85)) then
        dmg = (caster:getSkillLevel(xi.skill.DARK_MAGIC) + 85)
    end

    --get resist multiplier (1x if no resist)
    local params = {}
    params.diff = caster:getStat(xi.mod.INT)-target:getStat(xi.mod.INT)
    params.attribute = xi.mod.INT
    params.skillType = xi.skill.DARK_MAGIC
    params.bonus = 1.0
    local resist = applyResistance(caster, target, spell, params)

    --get the resisted damage
    dmg = dmg * resist

    --add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    dmg = addBonuses(caster, spell, target, dmg)

    --add in target adjustment
    dmg = adjustForTarget(target, dmg, spell:getElement())

    --add in final adjustments
    if (dmg < 0) then
        dmg = 0
    end

    if (target:getHP() < dmg) then
        dmg = target:getHP()
    end

    if (target:isUndead()) then
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT) -- No effect
        return dmg
    end

    if caster:getSystem() == xi.ecosystem.UNDEAD and target:isPC() and target:hasStatusEffect(xi.effect.HOLY_CIRCLE) then
        dmg = dmg / 2
    end

    dmg = finalMagicAdjustments(caster, target, spell, dmg)

    local leftOver = (caster:getHP() + dmg) - caster:getMaxHP()

    if (leftOver > 0) then
        caster:addStatusEffect(xi.effect.MAX_HP_BOOST, (leftOver/caster:getMaxHP())*100, 0, 60)
    end

    dmg = finalMagicAdjustments(caster, target, spell, dmg)
    caster:addHP(dmg)
    spell:setMsg(xi.msg.basic.MAGIC_DRAIN_HP) --change msg to 'xxx hp drained from the yyyy.'

    if (target:getHP() < dmg) then
        target:setHP(0)
    end

    return dmg
end)

m:addOverride("xi.globals.spells.songs.horde_lullaby.onSpellCast", function(caster, target, spell)
    local duration = math.random(27, 32)
    -- local pCHR = caster:getStat(xi.mod.CHR)
    -- local mCHR = target:getStat(xi.mod.CHR)
    -- local dCHR = pCHR - mCHR
    local params = {}
    params.diff = nil
    params.attribute = xi.mod.CHR
    params.skillType = xi.skill.SINGING
    params.bonus = 0
    params.effect = xi.effect.LULLABY
    local resm = applyResistanceEffect(caster, target, spell, params)

    if resm < 0.5 then
        spell:setMsg(xi.msg.basic.MAGIC_RESIST) -- resist message
    else
        local iBoost = caster:getMod(xi.mod.LULLABY_EFFECT) + caster:getMod(xi.mod.ALL_SONGS_EFFECT)
        duration = duration * (iBoost * 0.1 + caster:getMod(xi.mod.SONG_DURATION_BONUS) / 100 + 1) + caster:getJobPointLevel(xi.jp.LULLABY_DURATION)

        if caster:hasStatusEffect(xi.effect.TROUBADOUR) then
            duration = duration * 2
        end

        duration = duration * resm
        duration = calculateBuildDuration(target, duration, params.effect)

        if duration == 0 then
            spell:setMsg(xi.msg.basic.NONE)
        elseif target:addStatusEffect(xi.effect.LULLABY, 1, 0, duration) then
            spell:setMsg(xi.msg.basic.MAGIC_ENFEEB)
        else
            spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
        end
    end

    return xi.effect.LULLABY
end)

return m
