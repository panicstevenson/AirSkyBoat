-- ------------------------------------------------------------
-- Horizon Job Traits Changes
-- ------------------------------------------------------------

LOCK TABLES `traits` WRITE;

ALTER TABLE `traits`
    ADD COLUMN IF NOT EXISTS `modifier2` smallint(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `value`,
    ADD COLUMN IF NOT EXISTS `value2` smallint(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `modifier2`;

UPDATE traits SET modifier2 = '427', value2 = '15' WHERE traitid = '4' AND job = '7' AND level = '30'; -- PLD Enmity Loss Reduction
UPDATE traits SET modifier2 = '427', value2 = '25' WHERE traitid = '4' AND job = '7' AND level = '50'; -- PLD Enmity Loss Reduction
UPDATE traits SET modifier2 = '427', value2 = '35' WHERE traitid = '4' AND job = '7' AND level = '70'; -- PLD Enmity Loss Reduction

UPDATE traits SET rank = '7' WHERE traitid = '24' AND job = '7' AND Level = '96'; -- WHM Clear Mind Adjustment
UPDATE traits SET rank = '6' WHERE traitid = '24' AND job = '7' AND level = '80'; -- WHM Clear Mind Adjustment
UPDATE traits SET rank = '5' WHERE traitid = '24' AND job = '7' AND level = '65'; -- WHM Clear Mind Adjustment
UPDATE traits SET rank = '4' WHERE traitid = '24' AND job = '7' AND level = '50'; -- WHM Clear Mind Adjustment

UPDATE traits SET content_tag = 'COP' WHERE name = 'auto refresh' AND job = '7'; -- PLD Auto Refresh to COP

UPDATE traits SET content_tag = 'COP' WHERE name = 'assassin'; -- THF Assassin Trait
UPDATE traits SET content_tag = 'COP' WHERE name = 'strafe'; -- DRG Strafe (Change to COP)
UPDATE traits SET content_tag = 'COP' WHERE name = 'desperate blows';
UPDATE traits SET content_tag = 'COP', level = 40, value = 5 WHERE name = 'ninja tool expert.';
UPDATE traits SET content_tag = 'COP' WHERE name = 'shield mastery' AND job = '7';
UPDATE traits SET level = 30 WHERE name = "triple attack" AND rank = 1;
REPLACE INTO `traits` (`traitid`, `name`, `job`, `level`, `rank`, `modifier`, `value`, `modifier2`, `value2`, `content_tag`, `meritid`) VALUES
    (24,'clear mind',3,40,3,71,6,1400,20,NULL,0),
    (87,'ninja tool expert.',13,60,2,308,10,0,0,NULL,2818),
    (87,'ninja tool expert.',13,75,2,308,15,0,0,NULL,2818);

UNLOCK TABLES;
