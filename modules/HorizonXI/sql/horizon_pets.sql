-- ------------------------------------------------------------
-- Horizon Pet Changes
-- ------------------------------------------------------------
LOCK TABLES
    `pet_list` WRITE;

UPDATE pet_list SET maxLevel = '75' WHERE petid > '35' AND petid < '48'; -- Set all HQ to cap at 75

UNLOCK TABLES;
