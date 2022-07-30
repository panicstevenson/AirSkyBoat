-----------------------------------
-- HorizonXI Lua Module
-- Used to change magical weaponskill luas.
-----------------------------------
require("modules/module_utils")
require("scripts/globals/weaponskills")
require("scripts/globals/status")
require("scripts/globals/settings")
-----------------------------------

local m = Module:new("horizon_weaponskills")

m:addOverride("xi.globals.weaponskills.avalanche_axe.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftp100 = 2.0 params.ftp200 = 2.5 params.ftp300 = 3.0
    params.str_wsc = 0.3 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200= 0.0 params.acc300= 0.0
    params.atk100 = 1; params.atk200 = 1; params.atk300 = 1

    if (xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 0.6
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end)

m:addOverride("xi.globals.weaponskills.blade_ku.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 5
    params.ftp100 = 1.0 params.ftp200 = 1.0 params.ftp300 = 1.0
    params.str_wsc = 0.3 params.dex_wsc = 0.3 params.vit_wsc = 0.0
    params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    -- Sufficient data for ACC bonus/penalty does not exist; assuming no penalty and 10% increase per 1,000 TP
    -- http://wiki.ffo.jp/html/732.html does not list ACC Bonus
    -- https://www.bg-wiki.com/ffxi/Blade:_Ku does not list ACC Bonus
    params.acc100 = 1.0 params.acc200 = 1.1 params.acc300 = 1.2 -- TODO: verify -- "Accuracy varies with TP" in retail. All current evidence points to that this modifier is static values, not percentages.
    params.atk100 = 1.0 params.atk200 = 1.0 params.atk300 = 1.0

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftp100 = 1.25 params.ftp200 = 1.25 params.ftp300 = 1.25
        params.str_wsc = 0.3 params.dex_wsc = 0.3
        params.multiHitfTP = true
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end)

m:addOverride("xi.globals.weaponskills.blade_ten.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftp100 = 2.5 params.ftp200 = 3.0 params.ftp300 = 3.5
    params.str_wsc = 0.3 params.dex_wsc = 0.3 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200= 0.0 params.acc300= 0.0
    params.atk100 = 1; params.atk200 = 1; params.atk300 = 1

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftp100 = 4.5 params.ftp200 = 11.5 params.ftp300 = 15.5
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end)

m:addOverride("xi.globals.weaponskills.calamity.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftp100 = 2.5 params.ftp200 = 3.0 params.ftp300 = 3.5
    params.str_wsc = 0.32 params.dex_wsc = 0.0 params.vit_wsc = 0.32 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200= 0.0 params.acc300= 0.0
    params.atk100 = 1; params.atk200 = 1; params.atk300 = 1

    if (xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp100 = 2.5 params.ftp200 = 6.5 params.ftp300 = 10.375
        params.str_wsc = 0.5 params.vit_wsc = 0.5
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end)

m:addOverride("xi.globals.weaponskills.crescent_moon.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    -- ftp damage mods (for Damage Varies with TP lines are calculated in the function
    params.ftp100 = 2.0 params.ftp200 = 2.5 params.ftp300 = 3.0
    -- wscs are in % so 0.2=20%
    params.str_wsc = 0.35 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.2 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    -- critical mods, again in % (ONLY USE FOR CRITICAL HIT VARIES WITH TP)
    params.crit100 = 0.0 params.crit200=0.0 params.crit300=0.0
    params.canCrit = false
    -- params.accuracy mods (ONLY USE FOR ACCURACY VARIES WITH TP) , should be the acc at those %s NOT the penalty values. Leave 0 if acc doesnt vary with tp.
    params.acc100 = 0 params.acc200=0 params.acc300=0
    -- attack multiplier (only some WSes use this, this varies the actual ratio value, see Tachi: Kasha) 1 is default.
    params.atk100 = 1; params.atk200 = 1; params.atk300 = 1

    if (xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp100 = 1.5 params.ftp200 = 1.75 params.ftp300 = 2.75
        params.str_wsc = 0.8
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end)

m:addOverride("xi.globals.weaponskills.decimation.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 3
    params.ftp100 = 1.0 params.ftp200 = 1.0 params.ftp300 = 1.0
    params.str_wsc = 0.5 params.dex_wsc = 0.0 params.vit_wsc = 0.0
    params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 1.0 params.acc200 = 1.0 params.acc300 = 1.0 -- TODO: verify -- "Accuracy varies with TP" in retail. All current evidence points to that this modifier is static values, not percentages.
    params.atk100 = 1.0 params.atk200 = 1.0 params.atk300 = 1.0
    params.ignoresDef = true
    params.ignored100 = 0.25
    params.ignored200 = 0.5
    params.ignored300 = 0.75
    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftp100 = 1.75 params.ftp200 = 1.75 params.ftp300 = 1.75
        params.multiHitfTP = true
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end)

m:addOverride("xi.globals.weaponskills.evisceration.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 5
    params.ftp100 = 1 params.ftp200 = 1 params.ftp300 = 1
    params.str_wsc = 0.0 params.dex_wsc = 0.3 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.3
    params.crit100 = 0.1 params.crit200 = 0.3 params.crit300 = 0.5
    params.canCrit = true
    params.acc100 = 0.0 params.acc200= 0.0 params.acc300= 0.0
    params.atk100 = 1; params.atk200 = 1; params.atk300 = 1

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.multiHitfTP = true
        params.ftp100 = 1.25 params.ftp200 = 1.25 params.ftp300 = 1.25
        params.crit200 = 0.25
        params.dex_wsc = 0.5
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end)

m:addOverride("xi.globals.weaponskills.ground_strike.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    -- ftp damage mods (for Damage Varies with TP lines are calculated in the function
    params.ftp100 = 1.75 params.ftp200 = 2.0 params.ftp300 = 3.0
    -- wscs are in % so 0.2=20%
    params.str_wsc = 0.5 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.5 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    -- critical mods, again in % (ONLY USE FOR CRITICAL HIT VARIES WITH TP)
    params.crit100 = 0.0 params.crit200=0.0 params.crit300=0.0
    params.canCrit = false
    -- accuracy mods (ONLY USE FOR ACCURACY VARIES WITH TP) , should be the params.acc at those %s NOT the penalty values. Leave 0 if params.acc doesnt vary with tp.
    params.acc100 = 0 params.acc200=0 params.acc300=0
    -- attack multiplier (only some WSes use this, this varies the actual ratio value, see Tachi: Kasha) 1 is default.
    params.atk100 = 1.75; params.atk200 = 1.75; params.atk300 = 1.75

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end)

m:addOverride("xi.globals.weaponskills.hard_slash.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    -- ftp damage mods (for Damage Varies with TP lines are calculated in the function
    params.ftp100 = 1.75 params.ftp200 = 2.0 params.ftp300 = 2.25
    -- wscs are in % so 0.2=20%
    params.str_wsc = 0.3 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    -- critical mods, again in % (ONLY USE FOR params.critICAL HIT VARIES WITH TP)
    params.crit100 = 0.0 params.crit200=0.0 params.crit300=0.0
    params.canCrit = false
    -- accuracy mods (ONLY USE FOR accURACY VARIES WITH TP) , should be the acc at those %s NOT the penalty values. Leave 0 if acc doesnt vary with tp.
    params.acc100 = 0 params.acc200=0 params.acc300=0
    -- attack multiplier (only some WSes use this, this varies the actual ratio value, see Tachi: Kasha) 1 is default.
    params.atk100 = 1; params.atk200 = 1; params.atk300 = 1

    if (xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 1.0
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end)

m:addOverride("xi.globals.weaponskills.impulse_drive.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 2
    params.ftp100 = 1.75 params.ftp200 = 2.5 params.ftp300 = 3.5
    params.str_wsc = 0.5 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200= 0.0 params.acc300= 0.0
    params.atk100 = 1; params.atk200 = 1; params.atk300 = 1

    if (xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp200 = 3 params.ftp300 = 5.5
        params.str_wsc = 1.0
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end)

m:addOverride("xi.globals.weaponskills.iron_tempest.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftp100 = 1.5 params.ftp200 = 2.5 params.ftp300 = 3.5
    params.str_wsc = 0.3 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200= 0.0 params.acc300= 0.0
    params.atk100 = 1; params.atk200 = 1; params.atk300 = 1

    if (xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 0.6
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end)

m:addOverride("xi.globals.weaponskills.keen_edge.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftp100 = 1.5 params.ftp200 = 1.5 params.ftp300 = 1.5
    params.str_wsc = 0.35 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.5 params.crit200 = 0.75 params.crit300 = 0.9
    params.canCrit = true
    params.acc100 = 0.0 params.acc200= 0.0 params.acc300= 0.0
    params.atk100 = 1; params.atk200 = 1; params.atk300 = 1

    if (xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 1.0
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end)

m:addOverride("xi.globals.weaponskills.mistral_axe.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftp100 = 2.5 params.ftp200 = 3 params.ftp300 = 3.5
    params.str_wsc = 0.5 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.3
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200= 0.0 params.acc300= 0.0
    params.atk100 = 1; params.atk200 = 1; params.atk300 = 1

    if (xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp100 = 4 params.ftp200 = 10.5 params.ftp300 = 13.625
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end)

m:addOverride("xi.globals.weaponskills.one_inch_punch.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftp100 = 1 params.ftp200 = 1 params.ftp300 = 1
    params.str_wsc = 0.0 params.dex_wsc = 0.0 params.vit_wsc = 0.4 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200= 0.0 params.acc300= 0.0
    params.atk100 = 1; params.atk200 = 1; params.atk300 = 1
    -- Defense ignored is 0%, 25%, 50% as per http://www.bg-wiki.com/bg/One_Inch_Punch
    params.ignoresDef = true
    params.ignored100 = .50
    params.ignored200 = 0.625
    params.ignored300 = 0.75

    if (xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.vit_wsc = 1.0
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end)

m:addOverride("xi.globals.weaponskills.power_slash.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    -- ftp damage mods (for Damage Varies with TP lines are calculated in the function
    params.ftp100 = 1.25 params.ftp200 = 1.25 params.ftp300 = 1.25
    -- wscs are in % so 0.2=20%
    params.str_wsc = 0.2 params.dex_wsc = 0.0 params.vit_wsc = 0.2 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    -- critical mods, again in % (ONLY USE FOR CRITICAL HIT VARIES WITH TP)
    params.crit100 = 0.3 params.crit200=0.5 params.crit300=0.7
    params.canCrit = true
    -- accuracy mods (ONLY USE FOR ACCURACY VARIES WITH TP) , should be the acc at those %s NOT the penalty values. Leave 0 if acc doesnt vary with tp.
    params.acc100 = 0 params.acc200=0 params.acc300=0
    -- attack multiplier (only some WSes use this, this varies the actual ratio value, see Tachi: Kasha) 1 is default.
    params.atk100 = 1; params.atk200 = 1; params.atk300 = 1

    if (xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 0.6 params.vit_wsc = 0.6
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end)

m:addOverride("xi.globals.weaponskills.savage_blade.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 2
    params.ftp100 = 1.75 params.ftp200 = 2.5 params.ftp300 = 3.5
    params.str_wsc = 0.3 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.5 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200= 0.0 params.acc300= 0.0
    params.atk100 = 1; params.atk200 = 1; params.atk300 = 1

    if (xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp100 = 4 params.ftp200 = 10.25 params.ftp300 = 13.75
        params.str_wsc = 0.5
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end)

m:addOverride("xi.globals.weaponskills.shark_bite.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 2
    params.ftp100 = 2 params.ftp200 = 2.5 params.ftp300 = 3
    params.str_wsc = 0.0 params.dex_wsc = 0.5 params.vit_wsc = 0.0 params.agi_wsc = 0.3 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200= 0.0 params.acc300= 0.0
    params.atk100 = 1; params.atk200 = 1; params.atk300 = 1

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftp100 = 4.5 params.ftp200 = 6.8 params.ftp300 = 8.5
        params.dex_wsc = 0.4 params.agi_wsc = 0.4
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end)

m:addOverride("xi.globals.weaponskills.sickle_moon.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 2
    -- ftp damage mods (for Damage Varies with TP lines are calculated in the function
    params.ftp100 = 1.75 params.ftp200 = 2 params.ftp300 = 2.75
    -- wscs are in % so 0.2=20%
    params.str_wsc = 0.5 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.2 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    -- critical mods, again in % (ONLY USE FOR CRITICAL HIT VARIES WITH TP)
    params.crit100 = 0.0 params.crit200=0.0 params.crit300=0.0
    params.canCrit = false
    -- accuracy mods (ONLY USE FOR ACCURACY VARIES WITH TP) , should be the acc at those %s NOT the penalty values. Leave 0 if acc doesnt vary with tp.
    params.acc100 = 0 params.acc200=0 params.acc300=0
    -- attack multiplier (only some WSes use this, this varies the actual ratio value, see Tachi: Kasha) 1 is default.
    params.atk100 = 1; params.atk200 = 1; params.atk300 = 1

    if (xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 0.4 params.agi_wsc = 0.4
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end)

m:addOverride("xi.globals.weaponskills.skewer.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 3
    params.ftp100 = 1 params.ftp200 = 1 params.ftp300 = 1
    params.str_wsc = 0.35 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.1 params.crit200 = 0.25 params.crit300 = 0.4
    params.canCrit = true
    params.acc100 = 0.0 params.acc200= 0.0 params.acc300= 0.0
    params.atk100 = 1; params.atk200 = 1; params.atk300 = 1

    if (xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 0.5
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end)

m:addOverride("xi.globals.weaponskills.spiral_hell.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    -- ftp damage mods (for Damage Varies with TP lines are calculated in the function
    params.ftp100 = 2.25 params.ftp200 = 2.75 params.ftp300 = 3.25
    -- wscs are in % so 0.2=20%
    params.str_wsc = 0.5 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.5 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    -- critical mods, again in % (ONLY USE FOR critICAL HIT VARIES WITH TP)
    params.crit100 = 0.0 params.crit200=0.0 params.crit300=0.0
    params.canCrit = false
    -- accuracy mods (ONLY USE FOR accURACY VARIES WITH TP) , should be the acc at those %s NOT the penalty values. Leave 0 if acc doesnt vary with tp.
    params.acc100 = 0 params.acc200=0 params.acc300=0
    -- attack multiplier (only some WSes use this, this varies the actual ratio value, see Tachi: Kasha) 1 is default.
    params.atk100 = 1; params.atk200 = 1; params.atk300 = 1

    if (xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp200 = 2.75 params.ftp300 = 4.75
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end)

m:addOverride("xi.globals.weaponskills.steel_cyclone.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftp100 = 1.75 params.ftp200 = 2.25 params.ftp300 = 3
    params.str_wsc = 0.5 params.dex_wsc = 0.0 params.vit_wsc = 0.5 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200= 0.0 params.acc300= 0.0
    params.atk100 = 1.66; params.atk200 = 1.66; params.atk300 = 1.66

    if (xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp200 = 2.5 params.ftp300 = 4
        params.str_wsc = 0.6 params.vit_wsc = 0.6
        params.atk100 = 1.5; params.atk200 = 1.5; params.atk300 = 1.5
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end)

m:addOverride("xi.globals.weaponskills.swift_blade.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 3
    params.ftp100 = 1.25 params.ftp200 = 1.25 params.ftp300 = 1.25
    params.str_wsc = 0.3 params.dex_wsc = 0.0 params.vit_wsc = 0.0
    params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.3
    params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = true
    -- Sufficient data for ACC bonus/penalty does not exist; assuming no penalty and 10% increase per 1,000 TP
    -- http://wiki.ffo.jp/html/382.html does not list ACC Bonus
    -- https://www.bg-wiki.com/ffxi/Swift_Blade does not list ACC Bonus
    params.acc100 = 1.0 params.acc200 = 1.1 params.acc300 = 1.2 -- TODO: verify -- "Accuracy varies with TP" in retail. All current evidence points to that this modifier is static values, not percentages.
    params.atk100 = 1.0 params.atk200 = 1.0 params.atk300 = 1.0

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.str_wsc = 0.5 params.mnd_wsc = 0.5
        params.multiHitfTP = true
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end)

m:addOverride("xi.globals.weaponskills.tachi_gekko.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftp100 = 1.5625 params.ftp200 = 1.88 params.ftp300 = 2.5
    params.str_wsc = 0.5 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200= 0.0 params.acc300= 0.0
    params.atk100 = 2; params.atk200 = 2; params.atk300 = 2

    if (xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp100 = 1.5625 params.ftp200 = 2.6875 params.ftp300 = 4.125
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    -- Silence duration changed from 60 to 45 as per bg-wiki: http://www.bg-wiki.com/bg/Tachi:_Gekko
    if (damage > 0 and target:hasStatusEffect(xi.effect.SILENCE) == false) then
        local duration = 60 * applyResistanceAddEffect(player, target, xi.magic.ele.WIND, 0)
        target:addStatusEffect(xi.effect.SILENCE, 1, 0, duration)
    end

    return tpHits, extraHits, criticalHit, damage
end)

m:addOverride("xi.globals.weaponskills.tachi_kasha.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftp100 = 1.56 params.ftp200 = 1.88 params.ftp300 = 2.5
    params.str_wsc = 0.5 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200= 0.0 params.acc300= 0.0
    params.atk100 = 1.5; params.atk200 = 1.5; params.atk300 = 1.5

    if (xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp100 = 1.5625 params.ftp200 = 2.6875 params.ftp300 = 4.125
        params.str_wsc = 0.75
        params.atk100 = 1.65; params.atk200 = 1.65; params.atk300 = 1.65
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    if (damage > 0 and target:hasStatusEffect(xi.effect.PARALYSIS) == false) then
        local duration = 60 * applyResistanceAddEffect(player, target, xi.magic.ele.ICE, 0)
        target:addStatusEffect(xi.effect.PARALYSIS, 25, 0, duration)
    end

    return tpHits, extraHits, criticalHit, damage
end)

m:addOverride("xi.globals.weaponskills.tachi_yukikaze.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftp100 = 1.5625 params.ftp200 = 1.88 params.ftp300 = 2.5
    params.str_wsc = 0.5 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200= 0.0 params.acc300= 0.0
    params.atk100 = 1.33; params.atk200 = 1.33; params.atk300 = 1.33

    if (xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp200 = 2.6875 params.ftp300 = 4.125
        params.atk100 = 1.5; params.atk200 = 1.5; params.atk300 = 1.5
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    if (damage > 0 and target:hasStatusEffect(xi.effect.BLINDNESS) == false) then
        local duration = 60 * applyResistanceAddEffect(player, target, xi.magic.ele.DARK, 0)
        target:addStatusEffect(xi.effect.BLINDNESS, 25, 0, duration)
    end

    return tpHits, extraHits, criticalHit, damage
end)

m:addOverride("xi.globals.weaponskills.vorpal_blade.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 4
    params.ftp100 = 1.0 params.ftp200 = 1.0 params.ftp300 = 1.0
    params.str_wsc = 0.3 params.dex_wsc = 0.0 params.vit_wsc = 0.0
    params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.1 params.acc200 = 0.3 params.acc300 = 0.5
    params.atk100 = 1.0 params.atk200 = 1.0 params.atk300 = 1.0

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftp100 = 1.375 params.ftp200 = 1.375 params.ftp300 = 1.375
        params.str_wsc = 0.6
        params.multiHitfTP = true
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end)

m:addOverride("xi.globals.weaponskills.vorpal_scythe.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    -- ftp damage mods (for Damage Varies with TP lines are calculated in the function
    params.ftp100 = 1.5 params.ftp200 = 1.5 params.ftp300 = 1.5
    -- wscs are in % so 0.2=20%
    params.str_wsc = 0.35 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    -- critical mods, again in % (ONLY USE FOR critICAL HIT VARIES WITH TP)
    params.crit100 = 0.5 params.crit200=0.75 params.crit300=0.9
    params.canCrit = true
    -- accuracy mods (ONLY USE FOR accURACY VARIES WITH TP) , should be the acc at those %s NOT the penalty values. Leave 0 if acc doesnt vary with tp.
    params.acc100 = 0 params.acc200=0 params.acc300=0
    -- attack multiplier (only some WSes use this, this varies the actual ratio value, see Tachi: Kasha) 1 is default.
    params.atk100 = 1; params.atk200 = 1; params.atk300 = 1

    if (xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 1.0
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end)

m:addOverride("xi.globals.weaponskills.vorpal_thrust.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftp100 = 1.5 params.ftp200 = 1.5 params.ftp300 = 1.5
    params.str_wsc = 0.2 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.2 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.5 params.crit200 = 0.75 params.crit300 = 0.9
    params.canCrit = true
    params.acc100 = 0.0 params.acc200= 0.0 params.acc300= 0.0
    params.atk100 = 1; params.atk200 = 1; params.atk300 = 1

    if (xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 0.5 params.agi_wsc = 0.5
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end)

m:addOverride("xi.globals.weaponskills.wasp_sting.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftp100 = 1 params.ftp200 = 1 params.ftp300 = 1
    params.str_wsc = 0.0 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200= 0.0 params.acc300= 0.0
    params.atk100 = 1.5; params.atk200 = 1.5; params.atk300 = 1.5

    if (xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.dex_wsc = 1.0
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    if (damage > 0 and target:hasStatusEffect(xi.effect.POISON) == false) then
        local duration = (75 + (tp/1000 * 15)) * applyResistanceAddEffect(player, target, xi.magic.ele.WATER, 0)
        target:addStatusEffect(xi.effect.POISON, 1, 0, duration)
    end

    return tpHits, extraHits, criticalHit, damage
end)

return m
