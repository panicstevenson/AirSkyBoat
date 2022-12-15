-- Thief's Knife quest rework
UPDATE mob_droplist SET itemRate = '100' WHERE itemId = '16480' AND dropId = '2298';
UPDATE mob_droplist SET itemRate = '50' WHERE itemId = '2387' AND dropId = '2444'; -- Pop item to 5%
UPDATE mob_droplist SET itemRate = '50' WHERE itemId = '2387' AND dropId = '2450'; -- Pop item to 5%

INSERT INTO `mob_droplist` VALUES (2298,0,0,1000,8889,1000); -- levigated rock -> Pinch of Thief's Dust
