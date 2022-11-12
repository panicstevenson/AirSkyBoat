LOCK TABLE
    `account_ip_record` WRITE;

ALTER TABLE `account_ip_record`
    ADD COLUMN IF NOT EXISTS `client_mac` varchar(20) NOT NULL AFTER `client_ip`;

UNLOCK TABLE;
