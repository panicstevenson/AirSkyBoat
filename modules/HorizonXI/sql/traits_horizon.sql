-- ------------------------------------------------------------
-- Horizon Job Traits Changes
-- ------------------------------------------------------------

INSERT INTO traits VALUES (4,'defense bonus',7,30,2,427,15,NULL,0); -- PLD Enmity Loss Reduction
INSERT INTO traits VALUES (4,'defense bonus',7,50,3,427,25,NULL,0); -- PLD Enmity Loss Reduction
INSERT INTO traits VALUES (4,'defense bonus',7,70,4,427,35,NULL,0); -- PLD Enmity Loss Reduction

UPDATE traits SET content_tag = 'COP' WHERE traitid = '10' AND job = '7'; -- PLD Auto Refresh to COP

UPDATE traits SET value = '5' WHERE traitid = '12' AND rank = '1'; -- RDM Fast Cast 1
UPDATE traits SET value = '10' WHERE traitid = '12' AND rank = '2'; -- RDM Fast Cast 2
UPDATE traits SET value = '15' WHERE traitid = '12' AND rank = '3'; -- RDM Fast Cast 3
UPDATE traits SET value = '20' WHERE traitid = '12' AND rank = '4'; -- RDM Fast Cast 4
UPDATE traits SET value = '25' WHERE traitid = '12' AND rank = '5'; -- RDM Fast Cast 5

UPDATE traits SET rank = '4' WHERE traitid = '24' AND level = '50'; -- Clear Mind 3->4
UPDATE traits SET rank = '5' WHERE traitid = '24' AND level = '65'; -- Clear Mind 4->5
UPDATE traits SET rank = '6' WHERE traitid = '24' AND level = '80'; -- Clear Mind 5->6
UPDATE traits SET rank = '7' WHERE traitid = '24' AND level = '96'; -- Clear Mind 6->7
INSERT INTO traits VALUES (24,'clear mind',3,40,3,1400,20,NULL,0); -- Clear Mind Add -20% Cure/Regen Cost

UPDATE traits SET content_tag = 'COP' WHERE traitid = '68'; -- THF Assassin Trait
UPDATE abilities SET content_tag = 'COP' WHERE abilityId = '89'; -- DRG Strafe (Change to COP)
