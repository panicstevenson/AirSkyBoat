-- ------------------------------------------------------------
-- Horizon Spell List Changes
-- ------------------------------------------------------------
UPDATE spell_list SET mpCost = '80' WHERE name = "refresh";
UPDATE spell_list SET recastTime = '60' WHERE name = "utsusemi_ni";
