LOCK TABLES 
    `accounts` WRITE;

ALTER TABLE `accounts`
    ADD COLUMN IF NOT EXISTS `email_code` varchar(45) NOT NULL DEFAULT 0 AFTER `priv`;

UNLOCK TABLES;
