-- ------------------------------------------------------------
-- Horizon Merits Changes
-- ------------------------------------------------------------
LOCK TABLES
    `merits` WRITE;

UPDATE merits SET `value` = 10 WHERE `meritid` = 832; -- ID 832: Souleater (Reduce Recast Redcution to 10s/merit)
UPDATE merits SET `value` = 12 WHERE `meritid` = 640; -- ID : Convert (Reduce Recast Reduction to 10s/merit)

UNLOCK TABLES;
