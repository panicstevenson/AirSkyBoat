-- ------------------------------------------------------------
-- Horizon Pet Changes
-- ------------------------------------------------------------
UPDATE pet_list SET maxLevel = '75' WHERE petid > '35' AND petid < '48'; -- Set all HQ to cap at 75