-- Thief's Knife quest rework
UPDATE mob_droplist set itemRate = '100' where itemId = '16480' and dropId = '2298';
INSERT INTO `mob_droplist` VALUES (2298,0,0,1000,8889,1000); -- levigated rock -> Pinch of Thief's Dust
