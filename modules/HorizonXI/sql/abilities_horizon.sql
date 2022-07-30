-- ------------------------------------------------------------
-- Horizon Ability Changes
-- ------------------------------------------------------------
UPDATE abilities SET level = '15' WHERE abilityId = '36'; -- ID 37: Focus (Change to level 15)
UPDATE abilities SET level = '25' WHERE abilityId = '37'; -- ID 37: Dodge (Change to level 25)
UPDATE abilities SET recastTime = '115' WHERE abilityId = '38'; -- ID 38: Chakra (Change to 115s Recast)
UPDATE abilities SET recastTime = '30' WHERE abilityId = '39'; -- ID 39: Boost (Change to 30s Recast)
UPDATE abilities SET recastTime = '300' WHERE abilityId = '49'; -- ID 40: Souleater (Change to 300s Recast)
UPDATE abilities SET content_tag = 'COP' WHERE abilityId = '80'; -- ID 80: Spirit Link (Change to COP)
UPDATE abilities set recastTime = '900' WHERE abilityId = '83'; -- ID 83: Convert (Change to 900s Recast)
UPDATE abilities SET level = '45' WHERE abilityId = '154'; -- ID 154: Devotion (Change to level 45)
UPDATE abilities SET content_tag = 'COP' WHERE abilityId = '173'; -- ID 173: Hasso (Change to COP)
UPDATE abilities SET content_tag = 'COP' WHERE abilityId = '174'; -- ID 174: Seigan (Change to COP)
UPDATE abilities SET content_tag = 'WOTG' WHERE abilityId = '250'; -- ID 250: Avatar's Favor (Gate to COP for now)
UPDATE abilities SET content_tag = 'COP' WHERE abilityId = '251'; -- ID 251: Ready (Change to COP)
UPDATE abilities SET recastTime = '1' WHERE abilityId > '671' AND abilityId < '773'; -- Ready Charge Changes
