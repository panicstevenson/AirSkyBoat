/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `world_pass` (
  `worldpass` int(10) NOT NULL,
  `purchaseid` int(10) DEFAULT 0,
  `rafid` int(10) DEFAULT 0,
  `createtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `redeemtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`worldpass`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
