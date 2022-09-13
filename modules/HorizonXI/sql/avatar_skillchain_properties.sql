-- HorizonXI Era Accuracy
-- Remove skillchain properties from avatar bloodpacts

UPDATE `mob_skills` 
SET  `primary_sc` = 0, `secondary_sc` = 0, `tertiary_sc` = 0
WHERE `mob_skill_flag` & 64 = 64 OR `mob_skill_flag` & 128 = 128;
