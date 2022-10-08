-- ------------------------------------------------------------
-- Horizon Merits Changes
-- ------------------------------------------------------------
LOCK TABLES
    `merits` WRITE;

UPDATE merits SET value = '10' WHERE meritid = '832'; -- ID 832: Souleater (Reduce Recast Redcution to 10s/merit)

UNLOCK TABLES;
