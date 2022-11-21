local m = Module:new("horizon_mobkills")

m:addOverride("xi.globals.mobskills.infrasonics.onMobWeaponSkill", function(target, mob, skill)
    local typeEffect = xi.effect.EVASION_DOWN
    local evasion   = target:getStat(xi.mod.EVA) * 0.25

    if mob:isPet() and mob:getMaster() and mob:getMaster():isPC() then
        evasion = 40
    end

    print(evasion)

    skill:setMsg(xi.mobskills.mobStatusEffectMove(mob, target, typeEffect, evasion, 0, 120))

    return typeEffect
end)

m:addOverride("xi.globals.mobskills.hi-freq_field.onMobWeaponSkill", function(target, mob, skill)
    local typeEffect = xi.effect.EVASION_DOWN
    local evasion   = target:getStat(xi.mod.EVA) * 0.25

    if mob:isPet() and mob:getMaster() and mob:getMaster():isPC() then
        evasion = 40
    end

    print(evasion)

    skill:setMsg(xi.mobskills.mobStatusEffectMove(mob, target, typeEffect, evasion, 0, 120))

    return typeEffect
end)

return m
