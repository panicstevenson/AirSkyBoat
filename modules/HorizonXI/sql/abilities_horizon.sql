-- ------------------------------------------------------------
-- Horizon Ability Changes
-- ------------------------------------------------------------
UPDATE abilities SET level = '15' WHERE name = 'focus'; -- ID 37: Focus (Change to level 15)
UPDATE abilities SET level = '25' WHERE name = 'dodge'; -- ID 37: Dodge (Change to level 25)
UPDATE abilities SET recastTime = '115' WHERE name = 'chakra'; -- ID 38: Chakra (Change to 115s Recast)
UPDATE abilities SET recastTime = '30' WHERE name = 'boost'; -- ID 39: Boost (Change to 30s Recast)
UPDATE abilities SET recastTime = '300' WHERE name = 'souleater'; -- ID 40: Souleater (Change to 300s Recast)
UPDATE abilities SET content_tag = 'COP' WHERE name = 'spirit_link'; -- ID 80: Spirit Link (Change to COP)
UPDATE abilities set recastTime = '900' WHERE name = 'convert'; -- ID 83: Convert (Change to 900s Recast)
UPDATE abilities SET level = '45', content_tag= 'COP', addType = '0' WHERE name = 'devotion'; -- ID 154: Devotion (Change to level 45 and COP)
UPDATE abilities SET content_tag = 'COP', recastTime = '90' WHERE name = 'hasso' OR name = 'seigan'; -- ID 173 and 174: Hasso & Seigan (Change to COP)
UPDATE abilities SET content_tag = 'WOTG' WHERE name = 'avatars_favor'; -- ID 250: Avatar's Favor (Gate to COP for now)
UPDATE abilities SET content_tag = 'COP' WHERE name = 'ready'; -- ID 251: Ready (Change to COP)
UPDATE abilities SET recastTime = '1' WHERE abilityId > '671' AND abilityId < '773'; -- Ready Charge Changes
