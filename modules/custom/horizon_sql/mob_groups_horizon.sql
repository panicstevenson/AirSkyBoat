-- ------------------------------------------------------------
-- Horizon Respawn Time Changes (7 min dungeon, 12 min stronghold)
-- ------------------------------------------------------------
UPDATE mob_groups SET respawntime = '420' WHERE zoneid = 2      -- Carpenters_Landing
                                             OR zoneid = 9      -- PsoXja
                                             OR zoneid = 34     -- Grand_Palace_of_HuXzoi
                                             OR zoneid = 35     -- The_Garden_of_RuHmet
                                             OR zoneid = 153    -- The_Boyahda_Tree
                                             OR zoneid = 154    -- Dragons_Aery
                                             OR zoneid = 166    -- Ranguemont_Pass
                                             OR zoneid = 167    -- Bostaunieux_Oubliette
                                             OR zoneid = 169    -- Toraimarai_Canal
                                             OR zoneid = 172    -- Zeruhn_Mines
                                             OR zoneid = 173    -- Korroloka_Tunnel
                                             OR zoneid = 174    -- Kuftal_Tunnel
                                             OR zoneid = 177    -- VeLugannon_Palace
                                             OR zoneid = 178    -- The_Shrine_of_RuAvitau
                                             OR zoneid = 190    -- King_Ranperres_Tomb
                                             OR zoneid = 191    -- Dangruf_Wadi
                                             OR zoneid = 192    -- Inner_Horutoto_Ruins
                                             OR zoneid = 193    -- Ordelles_Caves
                                             OR zoneid = 194    -- Outer_Horutoto_Ruins
                                             OR zoneid = 195    -- The_Eldieme_Necropolis
                                             OR zoneid = 196    -- Gusgen_Mines
                                             OR zoneid = 197    -- Crawlers_Nest
                                             OR zoneid = 198    -- Maze_of_Shakhrami
                                             OR zoneid = 200    -- Garlaige_Citadel
                                             OR zoneid = 204    -- FeiYin
                                             OR zoneid = 212    -- Gustav_Tunnel
                                             OR zoneid = 213;   -- Labyrinth_of_Onzozo

UPDATE mob_groups SET respawntime = '960' WHERE zoneid = 11     -- Oldton_Movalpolos
                                             OR zoneid = 12     -- Newton_Movalpolos
                                             OR zoneid = 27     -- Phomiuna_Aqueducts
                                             OR zoneid = 28     -- Sacrarium
                                             OR zoneid = 140    -- Ghelsba_Outpost
                                             OR zoneid = 141    -- Fort_Ghelsba
                                             OR zoneid = 142    -- Yughott_Grotto
                                             OR zoneid = 143    -- Palborough_Mines
                                             OR zoneid = 145    -- Giddeus
                                             OR zoneid = 147    -- Beadeaux
                                             OR zoneid = 148    -- Qulun_Dome
                                             OR zoneid = 149    -- Davoi
                                             OR zoneid = 150    -- Monastic_Cavern
                                             OR zoneid = 151    -- Castle_Oztroja
                                             OR zoneid = 152    -- Altar_Room
                                             OR zoneid = 157    -- Middle_Delkfutts_Tower
                                             OR zoneid = 158    -- Upper_Delkfutts_Tower
                                             OR zoneid = 159    -- Temple_of_Uggalepih
                                             OR zoneid = 160    -- Den_of_Rancor
                                             OR zoneid = 161    -- Castle_Zvahl_Baileys
                                             OR zoneid = 162    -- Castle_Zvahl_Keep
                                             OR zoneid = 176    -- Sea_Serpent_Grotto
                                             OR zoneid = 184    -- Lower_Delkfutts_Tower
                                             OR zoneid = 208;   -- Quicksand_Caves
