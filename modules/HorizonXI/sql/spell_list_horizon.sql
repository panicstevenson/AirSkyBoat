-- ------------------------------------------------------------
-- Horizon Spell List Changes
-- ------------------------------------------------------------
UPDATE spell_list SET mpCost = '80' WHERE name = "refresh";
UPDATE spell_list SET recastTime = '60000' WHERE name = "utsusemi_ni";
UPDATE spell_list SET recastTime = '60000' AND castTime = '2000' WHERE name LIKE 'absorb-%';
