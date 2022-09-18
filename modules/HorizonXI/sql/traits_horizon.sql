-- ------------------------------------------------------------
-- Horizon Job Traits Changes
-- ------------------------------------------------------------

INSERT INTO traits VALUES (4,'defense bonus',7,30,2,427,15,NULL,0); -- PLD Enmity Loss Reduction
INSERT INTO traits VALUES (4,'defense bonus',7,50,3,427,25,NULL,0); -- PLD Enmity Loss Reduction
INSERT INTO traits VALUES (4,'defense bonus',7,70,4,427,35,NULL,0); -- PLD Enmity Loss Reduction
INSERT INTO traits VALUES (24,'clear mind',3,40,2,1400,20,NULL,0); -- Clear Mind Add -20% Cure/Regen Cost

UPDATE traits SET content_tag = 'COP' WHERE name = 'auto refresh' AND job = '7'; -- PLD Auto Refresh to COP

UPDATE traits SET value = '5' WHERE name = 'fast cast' AND rank = '1'; -- RDM Fast Cast 1
UPDATE traits SET value = '10' WHERE name = 'fast cast' AND rank = '2'; -- RDM Fast Cast 2
UPDATE traits SET value = '15' WHERE name = 'fast cast' AND rank = '3'; -- RDM Fast Cast 3
UPDATE traits SET value = '20' WHERE name = 'fast cast' AND rank = '4'; -- RDM Fast Cast 4
UPDATE traits SET value = '25' WHERE name = 'fast cast' AND rank = '5'; -- RDM Fast Cast 5

UPDATE traits SET content_tag = 'COP' WHERE name = 'assassin'; -- THF Assassin Trait
UPDATE traits SET content_tag = 'COP' WHERE name = 'strafe'; -- DRG Strafe (Change to COP)
