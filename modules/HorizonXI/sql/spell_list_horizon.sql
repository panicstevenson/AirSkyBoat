-- ------------------------------------------------------------
-- Horizon Spell List Changes
-- ------------------------------------------------------------
UPDATE spell_list SET mpCost = '60' WHERE name = "refresh";
UPDATE spell_list SET recastTime = '60000' WHERE name = "utsusemi_ni";
UPDATE spell_list SET recastTime = '60000' AND castTime = '2000' WHERE name LIKE 'absorb-%';
UPDATE spell_list SET VE = '350' WHERE name = "hojo_ni" OR "kurayami_ni";
