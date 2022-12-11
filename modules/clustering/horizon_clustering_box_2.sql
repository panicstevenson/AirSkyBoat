LOCK TABLES `zone_settings` WRITE;

UPDATE `zone_settings` SET `zoneip` = '66.85.137.110', `zoneport` = 54230 WHERE `zoneid` IN (105, 188, 243, 244, 245, 246, 119, 120, 41, 157, 158, 184, 126, 127, 197, 195, 110, 200, 199); -- Jeuno Large Area Cluster 1
UPDATE `zone_settings` SET `zoneip` = '66.85.137.110', `zoneport` = 54231 WHERE `zoneid` IN (100, 101, 167, 185, 230, 231, 232, 233, 190, 1, 2, 166, 139, 140, 141, 142, 104, 149, 150, 219); -- Sandoria Large Area Cluster 2
UPDATE `zone_settings` SET `zoneip` = '66.85.137.110', `zoneport` = 54232 WHERE `zoneid` IN (102, 193, 103, 227, 228, 220, 221, 248, 249, 3, 4, 39, 40, 118, 223, 224, 225, 226, 213, 196, 212); -- Middle Region + Transports Cluster 3
UPDATE `zone_settings` SET `zoneip` = '66.85.137.110', `zoneport` = 54233 WHERE `zoneid` IN (7, 8, 115, 116, 117, 238, 239, 240, 241, 242, 169, 170, 145, 146, 187, 192, 194, 198, 152, 151, 214); -- Windurst Region Cluster 4
UPDATE `zone_settings` SET `zoneip` = '66.85.137.110', `zoneport` = 54234 WHERE `zoneid` IN (5, 6, 9, 10, 111, 112, 134, 135, 161, 162, 165, 203, 204, 206, 153, 154, 202, 210, 0); -- Northlands Cluster 5
UPDATE `zone_settings` SET `zoneip` = '66.85.137.110', `zoneport` = 54235 WHERE `zoneid` IN (14, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 42); -- CoP Major Zones Cluster 6
UPDATE `zone_settings` SET `zoneip` = '66.85.137.110', `zoneport` = 54236 WHERE `zoneid` IN (32, 33, 34, 35, 36, 37, 38, 121, 122, 177, 178, 179, 180, 181, 130, 251); -- Sea + Sky Zone Cluster 7
UPDATE `zone_settings` SET `zoneip` = '66.85.137.110', `zoneport` = 54237 WHERE `zoneid` IN (11, 12, 13, 106, 107, 108, 109, 234, 235, 236, 237, 172, 173, 143, 144, 186, 147, 148, 191, 189); -- Bastok Cluster 8
UPDATE `zone_settings` SET `zoneip` = '66.85.137.110', `zoneport` = 54238 WHERE `zoneid` IN (159, 160, 163, 123, 124, 176, 252, 250, 211, 207, 205, 168, 174, 113, 125, 128, 114, 247, 209, 208, 201, 131, 43, 44); -- Outlands Cluster 9

-- Disabled Zones
UPDATE `zone_settings` SET `zoneip` = '', `zoneport` = 0 WHERE `zoneid` IN (46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79); -- TOAU Cluster
UPDATE `zone_settings` SET `zoneip` = '', `zoneport` = 0 WHERE `zoneid` IN (80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 129, 136, 137, 138, 155, 156, 164, 171, 175, 182, 183, 222); -- WOTG Cluster
UPDATE `zone_settings` SET `zoneip` = '', `zoneport` = 0 WHERE `zoneid` IN (15, 45, 132, 215, 216, 217, 218, 253, 254, 255); -- Abyssea Cluster
UPDATE `zone_settings` SET `zoneip` = '', `zoneport` = 0 WHERE `zoneid` IN (256, 257, 258, 259, 260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 276, 277, 279, 280, 281, 282, 283, 284, 285, 287, 288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298); -- SoA + RoV
UPDATE `zone_settings` SET `zoneip` = '', `zoneport` = 0 WHERE `zoneid` IN (133, 229, 278, 286); -- Junk Zones

UNLOCK TABLES;
