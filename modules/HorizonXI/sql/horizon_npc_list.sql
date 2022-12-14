LOCK TABLES
    `npc_list` WRITE;

UPDATE `npc_list` SET `pos_rot` = 255, `pos_x` = -137.7822, `pos_y` = -5.5000, `pos_z` = 157.7986 WHERE `npcid` = 17760439; -- Windurst
UPDATE `npc_list` SET `pos_rot` = 241, `pos_x` = -239.9489, `pos_y` = 8.0000, `pos_z` = 17.4968 WHERE `npcid` = 17723597; -- San d'Oria
DELETE FROM `npc_list` WHERE `npcid` = 17735859; -- Fuck Conrad
INSERT INTO `npc_list` VALUES (17748066, 'Conrad','Conrad',77,130.6146,-16.9836,25.4512,21,40,40,0,1,0,0,27,0x01000E01121018200F3007401150006000700000,32,NULL,1); -- Bastok
INSERT INTO `npc_list` VALUES (17760466,'Mumbo-Bumbo','Mumbo-Bumbo',222,-195.6054,-4.5000,88.4034,20,40,40,0,1,0,0,27,0x0100000513101320133013401350006000700000,32,NULL,1); -- Port -> Woods Teletaru
INSERT INTO `npc_list` VALUES (17764831,'Polo-Colo','Polo-Colo',3,-57.3764,1.1267,-57.4019,1,40,40,0,1,0,0,27,0x0100020513101320133013401350006000700000,32,NULL,1); -- Woods->Port Teletaru

-- Make POP Hnms go away. Making this SOA so we dont accidently do WOTG and break something
UPDATE `npc_list` SET `content_tag` = 'SOA' WHERE `npcid` = 17301567; -- ADAMANTOISE_QM
UPDATE `npc_list` SET `content_tag` = 'SOA' WHERE `npcid` = 17297459; -- BEHEMOTH_QM
UPDATE `npc_list` SET `content_tag` = 'SOA' WHERE `npcid` = 17408033; -- FAFNIR_QM

UNLOCK TABLES;
