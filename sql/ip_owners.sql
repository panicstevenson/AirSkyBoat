DROP TABLE IF EXISTS `ip_owners`;
CREATE TABLE IF NOT EXISTS `ip_owners` (
    `client_ip` tinytext NOT NULL,
    `accid` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`client_ip`(15))
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;
