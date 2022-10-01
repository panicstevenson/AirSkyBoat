-- ------------------------------------------------------------
-- Horizon Job Traits Changes
-- ------------------------------------------------------------

INSERT INTO traits VALUES (4,'defense bonus',7,30,2,427,15,NULL,0); -- PLD Enmity Loss Reduction
INSERT INTO traits VALUES (4,'defense bonus',7,50,3,427,25,NULL,0); -- PLD Enmity Loss Reduction
INSERT INTO traits VALUES (4,'defense bonus',7,70,4,427,35,NULL,0); -- PLD Enmity Loss Reduction
INSERT INTO traits VALUES (24,'clear mind',3,40,2,1400,20,NULL,0); -- Clear Mind Add -20% Cure/Regen Cost

UPDATE traits SET content_tag = 'COP' WHERE name = 'auto refresh' AND job = '7'; -- PLD Auto Refresh to COP

UPDATE traits SET content_tag = 'COP' WHERE name = 'assassin'; -- THF Assassin Trait
UPDATE traits SET content_tag = 'COP' WHERE name = 'strafe'; -- DRG Strafe (Change to COP)
UPDATE traits SET content_tag = 'COP' WHERE name = 'desperate blows';
UPDATE traits SET content_tag = 'COP', level = 40, value = 5 WHERE name = 'ninja tool expert.';
UPDATE traits SET content_tag = 'COP' WHERE name = 'shield mastery' AND job = '7';
UPDATE traits SET level = 30 WHERE name = "triple attack" AND rank = 1;
REPLACE INTO `traits` (`traitid`, `name`, `job`, `level`, `rank`, `modifier`, `value`, `content_tag`, `meritid`) VALUES
    (87,'ninja tool expert.',13,60,2,308,10,'TOAU',2818),
    (87,'ninja tool expert.',13,75,2,308,15,'TOAU',2818);
