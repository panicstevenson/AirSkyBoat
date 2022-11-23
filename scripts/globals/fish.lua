-----------------------------------
-- Data for Fishing
-----------------------------------
require("scripts/globals/msg")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/titles")
require("scripts/globals/utils")
-----------------------------------
xi = xi or {}
xi.fishing = xi.fishing or {}
xi.fishing.contest = xi.fishing.contest or {}

xi.fishing.fish =
{
    -- A table of all fishable fish, including items that count as fish for Fisherman's Heart
    -- but excluding items and NMs that are not counted for that quest.
    -- NOTE: If you don't want certain fish included in the contest (era restrictions, or whatever),
    --   then you must comment out the lines containing unwanted fish.  The C++ core calls the
    --   random function in this file to select a fish for each contest, which uses this table.
    { id = 2216, size = "Small", name = "lamp_marimo"         , realname = "Lamp Marimo"          },
    { id = 4288, size = "Small", name = "zebra_eel"           , realname = "Zebra Eel"            },
    { id = 4289, size = "Small", name = "forest_carp"         , realname = "Forest Carp"          },
    { id = 4290, size = "Small", name = "elshimo_frog"        , realname = "Elshimo Frog"         },
    { id = 4291, size = "Small", name = "sandfish"            , realname = "Sandfish"             },
    { id = 4304, size = "Large", name = "grimmonite"          , realname = "Grimmonite"           },
    { id = 4305, size = "Small", name = "ryugu_titan"         , realname = "Ryugu Titan"          },
    { id = 4306, size = "Large", name = "giant_donko"         , realname = "Giant Donko"          },
    { id = 4307, size = "Large", name = "jungle_catfish"      , realname = "Jungle Catfish"       },
    { id = 4308, size = "Small", name = "giant_chirai"        , realname = "Giant Chirai"         },
    { id = 4309, size = "Small", name = "cave_cherax"         , realname = "Cave Cherax"          },
    { id = 4310, size = "Small", name = "tiny_goldfish"       , realname = "Tiny Goldfish"        },
    { id = 4313, size = "Small", name = "blindfish"           , realname = "Blindfish"            },
    { id = 4314, size = "Small", name = "bibikibo"            , realname = "Bibikibo"             },
    { id = 4315, size = "Small", name = "lungfish"            , realname = "Lungfish"             },
    { id = 4316, size = "Large", name = "armored_pisces"      , realname = "Armored Pisces"       },
    { id = 4317, size = "Small", name = "trilobite"           , realname = "Trilobite"            },
    { id = 4318, size = "Small", name = "bibiki_urchin"       , realname = "Bibiki Urchin"        },
    { id = 4319, size = "Large", name = "tricorn"             , realname = "Tricorn"              },
    { id = 4354, size = "Small", name = "shining_trout"       , realname = "Shining Trout"        },
    { id = 4360, size = "Small", name = "bastore_sardine"     , realname = "Bastore Sardine"      },
    { id = 4361, size = "Small", name = "nebimonite"          , realname = "Nebimonite"           },
    { id = 4379, size = "Small", name = "cheval_salmon"       , realname = "Cheval Salmon"        },
    { id = 4383, size = "Small", name = "gold_lobster"        , realname = "Gold Lobster"         },
    { id = 4384, size = "Small", name = "black_sole"          , realname = "Black Sole"           },
    { id = 4385, size = "Small", name = "zafmlug_bass"        , realname = "Zafmlug Bass"         },
    { id = 4399, size = "Small", name = "bluetail"            , realname = "Bluetail"             },
    { id = 4401, size = "Small", name = "moat_carp"           , realname = "Moat Carp"            },
    { id = 4402, size = "Small", name = "red_terrapin"        , realname = "Red Terrapin"         },
    { id = 4403, size = "Small", name = "yellow_globe"        , realname = "Yellow Globe"         },
    { id = 4426, size = "Small", name = "tricolored_carp"     , realname = "Tricolored Carp"      },
    { id = 4427, size = "Small", name = "gold_carp"           , realname = "Gold Carp"            },
    { id = 4428, size = "Small", name = "dark_bass"           , realname = "Dark Bass"            },
    { id = 4429, size = "Small", name = "black_eel"           , realname = "Black Eel"            },
    { id = 4443, size = "Small", name = "cobalt_jellyfish"    , realname = "Cobalt Jellyfish"     },
    { id = 4451, size = "Small", name = "silver_shark"        , realname = "Silver Shark"         },
    { id = 4454, size = "Large", name = "emperor_fish"        , realname = "Emperor Fish"         },
    { id = 4461, size = "Small", name = "bastore_bream"       , realname = "Bastore Bream"        },
    { id = 4462, size = "Large", name = "monke-onke"          , realname = "Monke-Onke"           },
    { id = 4463, size = "Large", name = "takitaro"            , realname = "Takitaro"             },
    { id = 4464, size = "Small", name = "pipira"              , realname = "Pipira"               },
    { id = 4469, size = "Large", name = "giant_catfish"       , realname = "Giant Catfish"        },
    { id = 4470, size = "Small", name = "icefish"             , realname = "Icefish"              },
    { id = 4471, size = "Large", name = "bladefish"           , realname = "Bladefish"            },
    { id = 4472, size = "Small", name = "crayfish"            , realname = "Crayfish"             },
    { id = 4473, size = "Small", name = "crescent_fish"       , realname = "Crescent Fish"        },
    { id = 4474, size = "Large", name = "gigant_squid"        , realname = "Gigant Squid"         },
    { id = 4475, size = "Small", name = "sea_zombie"          , realname = "Sea zombie"           },
    { id = 4476, size = "Small", name = "titanictus"          , realname = "Titanictus"           },
    { id = 4477, size = "Large", name = "gavial_fish"         , realname = "Gavial Fish"          },
    { id = 4478, size = "Large", name = "three-eyed_fish"     , realname = "Three-eyed Fish"      },
    { id = 4479, size = "Large", name = "bhefhel_marlin"      , realname = "Bhefhel Marlin"       },
    { id = 4480, size = "Large", name = "gugru_tuna"          , realname = "Gugru Tuna"           },
    { id = 4481, size = "Small", name = "ogre_eel"            , realname = "Ogre Eel"             },
    { id = 4482, size = "Small", name = "nosteau_herring"     , realname = "Nosteau Herring"      },
    { id = 4483, size = "Small", name = "tiger_cod"           , realname = "Tiger Cod"            },
    { id = 4484, size = "Small", name = "shall_shell"         , realname = "Shall Shell"          },
    { id = 4485, size = "Small", name = "noble_lady"          , realname = "Noble Lady"           },
    { id = 4500, size = "Small", name = "greedie"             , realname = "Greedie"              },
    { id = 4501, size = "Small", name = "fat_greedie"         , realname = "Fat Greedie"          },
    { id = 4514, size = "Small", name = "quus"                , realname = "Quus"                 },
    { id = 4515, size = "Small", name = "copper_frog"         , realname = "Copper Frog"          },
    { id = 4528, size = "Small", name = "crystal_bass"        , realname = "Crystal Bass"         },
    { id = 4579, size = "Small", name = "elshimo_newt"        , realname = "Elshimo Newt"         },
    { id = 4580, size = "Small", name = "coral_butterfly"     , realname = "Coral Butterfly"      },
    { id = 5120, size = "Large", name = "titanic_sawfish"     , realname = "Titanic Sawfish"      },
    { id = 5121, size = "Small", name = "moorish_idol"        , realname = "Moorish Idol"         },
    { id = 5125, size = "Small", name = "phanauet_newt"       , realname = "Phanauet Newt"        },
    { id = 5126, size = "Small", name = "muddy_siredon"       , realname = "Muddy Siredon"        },
    { id = 5127, size = "Large", name = "gugrusaurus"         , realname = "Gugrusaurus"          },
    { id = 5128, size = "Small", name = "cone_calamary"       , realname = "Cone Calamary"        },
    { id = 5129, size = "Large", name = "lik"                 , realname = "Lik"                  },
    { id = 5130, size = "Small", name = "tavnazian_goby"      , realname = "Tavnazian Goby"       },
    { id = 5131, size = "Small", name = "vongola_clam"        , realname = "Vongola Clam"         },
    { id = 5132, size = "Small", name = "gurnard"             , realname = "Gurnard"              },
    { id = 5133, size = "Large", name = "pterygotus"          , realname = "Pterygotus"           },
    { id = 5134, size = "Large", name = "mola_mola"           , realname = "Mola Mola"            },
    { id = 5135, size = "Large", name = "rhinochimera"        , realname = "Rhinochimera"         },
    { id = 5136, size = "Large", name = "istavrit"            , realname = "Istavrit"             },
    { id = 5137, size = "Large", name = "turnabaligi"         , realname = "Turnabaligi"          },
    { id = 5138, size = "Small", name = "black_ghost"         , realname = "Black Ghost"          },
    { id = 5139, size = "Small", name = "betta"               , realname = "Betta"                },
    { id = 5140, size = "Large", name = "kalkanbaligi"        , realname = "Kalkanbaligi"         },
    { id = 5141, size = "Large", name = "veydal_wrasse"       , realname = "Veydal Wrasse"        },
    { id = 5446, size = "Small", name = "red_bubble-eye"      , realname = "Red Bubble-eye"       },
    { id = 5447, size = "Small", name = "denizanasi"          , realname = "Denizanasi"           },
    { id = 5448, size = "Small", name = "kalamar"             , realname = "Kalamar"              },
    { id = 5449, size = "Small", name = "hamsi"               , realname = "Hamsi"                },
    { id = 5450, size = "Large", name = "lakerda"             , realname = "Lakerda"              },
    { id = 5451, size = "Large", name = "kilicbaligi"         , realname = "Kilicbaligi"          },
    { id = 5452, size = "Small", name = "uskumru"             , realname = "Uskumru"              },
    { id = 5453, size = "Small", name = "istakoz"             , realname = "Istakoz"              },
    { id = 5454, size = "Small", name = "mercanbaligi"        , realname = "Mercanbaligi"         },
    { id = 5455, size = "Large", name = "ahtapot"             , realname = "Ahtapot"              },
    { id = 5456, size = "Small", name = "istiridye"           , realname = "Istiridye"            },
    { id = 5457, size = "Small", name = "dil"                 , realname = "Dil"                  },
    { id = 5458, size = "Small", name = "yilanbaligi"         , realname = "Yilanbaligi"          },
    { id = 5459, size = "Small", name = "sazanbaligi"         , realname = "Sazanbaligi"          },
    { id = 5460, size = "Small", name = "kayabaligi"          , realname = "Kayabaligi"           },
    { id = 5461, size = "Small", name = "alabaligi"           , realname = "Alabaligi"            },
    { id = 5462, size = "Large", name = "morinabaligi"        , realname = "Morinabaligi"         },
    { id = 5463, size = "Large", name = "yayinbaligi"         , realname = "Yayinbaligi"          },
    { id = 5464, size = "Small", name = "kaplumbaga"          , realname = "Kaplumbaga"           },
    { id = 5465, size = "Small", name = "caedarva_frog"       , realname = "Caedarva Frog"        },
    { id = 5466, size = "Small", name = "trumpet_shell"       , realname = "Trumpet Shell"        },
    { id = 5467, size = "Large", name = "megalodon"           , realname = "Megalodon"            },
    { id = 5468, size = "Small", name = "matsya"              , realname = "Matsya"               },
    { id = 5469, size = "Small", name = "brass_loach"         , realname = "Brass Loach"          },
    { id = 5470, size = "Large", name = "pirarucu"            , realname = "Pirarucu"             },
    { id = 5471, size = "Large", name = "gerrothorax"         , realname = "Gerrothorax"          },
    { id = 5472, size = "Small", name = "garpike"             , realname = "Garpike"              },
    { id = 5473, size = "Small", name = "bastore_sweeper"     , realname = "Bastore Sweeper"      },
    { id = 5474, size = "Small", name = "ca_cuong"            , realname = "Ca Cuong"             },
    { id = 5475, size = "Large", name = "gigant_octopus"      , realname = "Gigant Octopus"       },
    { id = 5476, size = "Small", name = "abaia"               , realname = "Abaia"                },
    { id = 5534, size = "Large", name = "apkallufa"           , realname = "Apkallufa"            },
    { id = 5535, size = "Small", name = "deademoiselle"       , realname = "Deademoiselle"        },
    { id = 5536, size = "Small", name = "yorchete"            , realname = "Yorchete"             },
    { id = 5537, size = "Large", name = "soryu"               , realname = "Soryu"                },
    { id = 5538, size = "Large", name = "sekiryu"             , realname = "Sekiryu"              },
    { id = 5539, size = "Large", name = "hakuryu"             , realname = "Hakuryu"              },
    { id = 5540, size = "Large", name = "kokuryu"             , realname = "Kokuryu"              },
    { id = 5812, size = "Small", name = "blowfish"            , realname = "Blowfish"             },
    { id = 5813, size = "Large", name = "dorado_gar"          , realname = "Dorado Gar"           },
    { id = 5814, size = "Large", name = "crocodilos"          , realname = "Crocodilos"           },
    { id = 5815, size = "Large", name = "pelazoea"            , realname = "Pelazoea"             },
    { id = 5816, size = "Large", name = "king_perch"          , realname = "King Perch"           },
    { id = 5817, size = "Large", name = "tiger_shark"         , realname = "Tiger Shark"          },
    { id = 5948, size = "Small", name = "black_prawn"         , realname = "Black Prawn"          },
    { id = 5949, size = "Small", name = "mussel"              , realname = "Mussel"               },
    { id = 5950, size = "Small", name = "mackerel"            , realname = "Mackerel"             },
    { id = 5951, size = "Large", name = "bloodblotch"         , realname = "Bloodblotch"          },
    { id = 5952, size = "Small", name = "ruddy_seema"         , realname = "Ruddy Seema"          },
    { id = 5953, size = "Small", name = "dragonfly_trout"     , realname = "Dragonfly Trout"      },
    { id = 5955, size = "Large", name = "yawning_catfish"     , realname = "Yawning Catfish"      },
    { id = 5957, size = "Small", name = "shockfish"           , realname = "Shockfish"            },
    { id = 5959, size = "Small", name = "dragonfish"          , realname = "Dragonfish"           },
    { id = 5960, size = "Small", name = "ulbukan_lobster"     , realname = "Ulbukan Lobster"      },
    { id = 5961, size = "Small", name = "contortopus"         , realname = "Contortopus"          },
    { id = 5963, size = "Small", name = "senroh_sardine"      , realname = "Senroh Sardine"       },
    { id = 5993, size = "Small", name = "senroh_frog"         , realname = "Senroh Frog"          },
    { id = 5995, size = "Large", name = "malicious_perch"     , realname = "Malicious Perch"      },
    { id = 5997, size = "Large", name = "shen"                , realname = "Shen"                 },
    { id = 6001, size = "Small", name = "clotflagration"      , realname = "Clotflagration"       },
    { id = 6144, size = "Small", name = "frigorifish"         , realname = "Frigorifish"          },
    { id = 6145, size = "Small", name = "dwarf_remora"        , realname = "Dwarf Remora"         },
    { id = 6146, size = "Large", name = "remora"              , realname = "Remora"               },
    { id = 6333, size = "Small", name = "translucent_salpa"   , realname = "Translucent Salpa"    },
    { id = 6334, size = "Small", name = "ra_kaznar_shellfish" , realname = "Ra'Kaznar Shellfish"  },
    { id = 6335, size = "Small", name = "white_lobster"       , realname = "White Lobster"        },
    { id = 6336, size = "Small", name = "bonefish"            , realname = "Bonefish"             },
    { id = 6337, size = "Small", name = "thysanopeltis"       , realname = "Thysanopeltis"        },
    { id = 6338, size = "Large", name = "cameroceras"         , realname = "Cameroceras"          },
    { id = 6371, size = "Large", name = "quicksilver_blade"   , realname = "Quicksilver Blade"    },
    { id = 6372, size = "Large", name = "lord_of_ulbuka"      , realname = "Lord of Ulbuka"       },
    { id = 6373, size = "Large", name = "ancient_carp"        , realname = "Ancient Carp"         },
    { id = 6374, size = "Large", name = "dragon_s_tabernacle" , realname = "Dragon's Tabernacle"  },
    { id = 6375, size = "Large", name = "phantom_serpent"     , realname = "Phantom Serpent"      },
    { id = 6376, size = "Large", name = "tusoteuthis_longa"   , realname = "Tusoteuthis Longa"    },
    { id = 6489, size = "Large", name = "far_east_puffer"     , realname = "Far East Puffer"      },
    { id = 9077, size = "Small", name = "duskcrawler"         , realname = "Duskcrawler"          },
    { id = 9146, size = "Small", name = "ashen_crayfish"      , realname = "Ashen Crayfish"       },
    { id = 9216, size = "Small", name = "voidsnapper"         , realname = "Voidsnapper"          },
}

xi.fishing.contest.criteria =
{
    SIZE   = 0,
    WEIGHT = 1,
    BOTH   = 2,
}

xi.fishing.contest.measure =
{
    GREATEST = 0,
    SMALLEST = 1,
}

xi.fishing.contest.status =
{
    CONTESTING = 0,
    OPENING    = 1,
    ACCEPTING  = 2,
    RELEASING  = 3,
    PRESENTING = 4,
    HIATUS     = 5,
    CLOSED     = 6,
}

xi.fishing.contest.reward =
{
    -- Defines the reward at each rank
    [ 1] = { gil = 50000, item = xi.items.PELICAN_RING, title = xi.title.GOLD_HOOK    },
    [ 2] = { gil = 25000, item = xi.items.PELICAN_RING, title = xi.title.MYTHRIL_HOOK },
    [ 3] = { gil = 10000, item = xi.items.PELICAN_RING, title = xi.title.SILVER_HOOK  },
    [ 4] = { gil = 2000,  item = xi.items.PELICAN_RING, title = xi.title.COPPER_HOOK  },
    [ 5] = { gil = 2000,  item = xi.items.PELICAN_RING, title = xi.title.COPPER_HOOK  },
    [ 6] = { gil = 2000,  item = xi.items.PELICAN_RING, title = xi.title.COPPER_HOOK  },
    [ 7] = { gil = 2000,  item = xi.items.PELICAN_RING, title = xi.title.COPPER_HOOK  },
    [ 8] = { gil = 2000,  item = xi.items.PELICAN_RING, title = xi.title.COPPER_HOOK  },
    [ 9] = { gil = 2000,  item = xi.items.PELICAN_RING, title = xi.title.COPPER_HOOK  },
    [10] = { gil = 2000,  item = xi.items.PELICAN_RING, title = xi.title.COPPER_HOOK  },
    [11] = { gil = 0,     item = xi.items.PELICAN_RING, title = nil                   },
    [12] = { gil = 0,     item = xi.items.PELICAN_RING, title = nil                   },
    [13] = { gil = 0,     item = xi.items.PELICAN_RING, title = nil                   },
    [14] = { gil = 0,     item = xi.items.PELICAN_RING, title = nil                   },
    [15] = { gil = 0,     item = xi.items.PELICAN_RING, title = nil                   },
    [16] = { gil = 0,     item = xi.items.PELICAN_RING, title = nil                   },
    [17] = { gil = 0,     item = xi.items.PELICAN_RING, title = nil                   },
    [18] = { gil = 0,     item = xi.items.PELICAN_RING, title = nil                   },
    [19] = { gil = 0,     item = xi.items.PELICAN_RING, title = nil                   },
    [20] = { gil = 0,     item = xi.items.PELICAN_RING, title = nil                   },
}

xi.fishing.contest.interval =
{
    -- All time intervals are relative to the BASE start time of the contest, not the previous phase
    -- These intervals indicate how long each phase lasts before being automatically progressed.
    -- These intervals must match those in fishingutils.h
    [xi.fishing.contest.status.CONTESTING] = 300,     -- 5 minutes
    [xi.fishing.contest.status.OPENING]    = 1800,    -- 30 minutes (Prev + 25 mins)
    [xi.fishing.contest.status.ACCEPTING]  = 1211400, -- 14 days, 30 minutes (Prev + 14 days)
    [xi.fishing.contest.status.RELEASING]  = 1213200, -- 14 days, 1 hour (Prev + 30 mins)
    [xi.fishing.contest.status.PRESENTING] = 2419200, -- 28 days (Prev + 13 days, 23 hours),
    [xi.fishing.contest.status.HIATUS]     = 2421300, -- 28 days, 35 minutes (Prev + 35 minutes)
}

-------------------------------------------------------------
-- LOCAL FUNCTIONS
-------------------------------------------------------------

local function filterTable (func)
    local filteredTable = {}

    for _, fish in pairs(xi.fishing.fish) do
        if func(fish) then
            table.insert(filteredTable, fish)
        end
    end

    return filteredTable
end

local function findFishSlot (trade, fish)
    for i = 0, trade:getSlotCount()-1 do
        if trade:getItemId(i) == fish then
            return i
        end
    end
    return 0
end

local function giveFish(player, params)
    params = params or {}
    local ID = zones[player:getZoneID()]
    local fishid = params.id
    -- does player have enough inventory space?
    if player:getFreeSlotsCount() < 1 then
        local messageId = (ID.text.ITEM_CANNOT_BE_OBTAINED + 4) or ID.text.ITEM_CANNOT_BE_OBTAINED
        player:messageSpecial(messageId, fishid)
        return false
    end

    -- give items to player
    if player:addItem(params) then
        player:messageSpecial(ID.text.ITEM_OBTAINED, fishid)
    else
        player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, fishid)
        return false
    end
    return true
end

local function getAwardInteger(awardTable)
    return bit.lshift(awardTable[4], 24) + bit.lshift(awardTable[3], 16) + bit.lshift(awardTable[2], 8) + awardTable[1]
end

local function isRewardAvailable(player, contestId)
    local contest = GetFishingContest()
    local rank = player:getContestRank()
    local awardPending = player:hasContestRewardPending(contestId)

    if
        rank > 0 and
        rank <= 20 and
        awardPending == true and
        contest['status'] == xi.fishing.contest.status.PRESENTING
    then
        return 1
    end

    return 0
end

-------------------------------------------------------------
-- COMMON FISH-RELATED FUNCTIONS
-------------------------------------------------------------

xi.fishing.countFish = function (fishTable)
    local fishCount = 0
    for _, fish in pairs(fishTable) do
        fishCount = fishCount + utils.mask.countBits(fish)
    end

    return fishCount
end

xi.fishing.findFishId = function (fishName)
    for _, fish in pairs(xi.fishing.fish) do
        if fish['name'] == fishName then
            return fish['id']
        end
    end

    return 0
end

xi.fishing.isFish = function (itemid)
    for _, fish in pairs(xi.fishing.fish) do
        if fish['id'] == itemid then
            return true
        end
    end

    return false
end

xi.fishing.isBigFish = function (fishId)
    for _, fish in pairs(xi.fishing.fish) do
        if
            fish['size'] == "Large" and
            fish['id'] == fishId
        then
            return true
        end
    end

    return false
end

xi.fishing.getFishName = function (itemid)
    for _, fish in pairs(xi.fishing.fish) do
        if fish['id'] == itemid then
            return fish['realname']
        end
    end

    return nil
end

-------------------------------------------------------------
-- CONTEST-SPECIFIC FUNCTIONS
-------------------------------------------------------------

xi.fishing.contest.randomFish = function()
    local largeFish = filterTable (function (fish)
        return fish["size"] == "Large"
    end)

    local index = math.random(#largeFish)
    return largeFish[index]["id"]
end

xi.fishing.contest.timeRemaining = function(changeTime)
    local timeTable = {}
    local currentTime = os.time()
    if changeTime > currentTime then
        local timeDelta = changeTime - currentTime
        timeTable =
        {
            ['days']       = math.floor(timeDelta / (60 * 60 * 24)),
            ['hours']      = math.floor((timeDelta / (60 * 60)) % 24),
            ['minutes']    = math.floor((timeDelta / 60) % 60),
        }
    else
        timeTable =
        {
            ['days']       = 0,
            ['hours']      = 0,
            ['minutes']    = 0,
        }
    end

    return timeTable
end

xi.fishing.contest.statusTime = function(startTime)
    local timeTable = {}
    timeTable =
    {
        [0] = startTime + xi.fishing.contest.interval[0], -- 30 minutes from start
        [1] = startTime + xi.fishing.contest.interval[1], -- 60 minutes
        [2] = startTime + xi.fishing.contest.interval[2], -- 13 days, 23 hours, 30 minutes
        [3] = startTime + xi.fishing.contest.interval[3], -- 14 days
        [4] = startTime + xi.fishing.contest.interval[4], -- 27 days, 23 hours, 30 minutes
        [5] = 0xFFFFFFFF,
        [6] = 0xFFFFFFFF,
    }

    return timeTable
end

xi.fishing.contest.scoreFish = function(length, weight, criteria)
    local score = 0
    if criteria == xi.fishing.contest.criteria.SIZE then
        score = length
    elseif criteria == xi.fishing.contest.criteria.WEIGHT then
        score = weight
    else
        score = length + weight
    end

    return score
end

xi.fishing.contest.defaultStatus = function(startTime)
    local timeTable = xi.fishing.contest.statusTime(startTime)
    local timeNow = os.time()

    for i = xi.fishing.contest.status.PRESENTING, xi.fishing.contest.status.CONTESTING, -1 do
        if timeNow > timeTable[i] then
            return i + 1
        end
    end

    return 0
end

xi.fishing.contest.playerReward = function(player)
    if not isRewardAvailable(player) then
        return false
    end

    return xi.fishing.contest.reward[player:getContestRank()]
end

-------------------------------------------------------------
-- HOOKED FUNCTIONS
-------------------------------------------------------------
xi.fishing.onTrigger = function(player, npc)
    local contest = GetFishingContest()
    player:startEvent(10006, { [0] = contest["status"],
                               [1] = contest["fishid"],   -- Fish ID for the contest
                               [2] = contest["criteria"], -- 0 = Size, 1 = Weight, 2 = Size + Weight
                               [3] = contest["measure"],  -- 0 = greatest, 1 = smallest
                               })
end

xi.fishing.onTrade = function(player, npc, trade)
    -- Handle fish submission
    local contest = GetFishingContest()
    if contest['status'] ~= xi.fishing.contest.status.ACCEPTING then
        -- Ignore the trade.  This is retail behaviour ...
        return
    end

    -- Check to see if the traded fish is the right one
    if npcUtil.tradeHasExactly(trade, contest['fishid']) then
        local fishItem = trade:getItem(findFishSlot(trade, contest['fishid']))
        local fishData = fishItem:getFishData()

        if fishData['ranked'] == true then
            -- Fish has already been ranked previously
            player:startEvent(10007, { [4] = 1 })
        else
            -- Fish is a valid entry, not previously ranked
            player:setLocalVar("[FishContest]Length", fishData['length'])
            player:setLocalVar("[FishContest]Weight", fishData['weight'])
            player:startEvent(10007, { [5] = xi.fishing.contest.scoreFish(fishData['weight'], fishData['length'], contest['criteria']),
                                       [6] = player:getContestScore(),
                                       })
        end
    end
end

xi.fishing.onEventUpdate = function(player, csid, option)
    local contest = GetFishingContest()

    if csid == 10006 then
        if option == 147 then
        -- Award History
            player:updateEvent( { [5] = getAwardInteger(player:getAwardHistory()) })

        elseif option == 148 then
            -- Pushed by client after informing of ranking status?

        elseif option == 149 then
        -- View Current Rules | Ranking Results | Receive Award
            if contest['status'] == xi.fishing.contest.status.ACCEPTING then
                player:updateEvent( { [0] = contest['status'],
                                      [1] = contest["fishid"],
                                      [2] = contest["criteria"],
                                      [3] = contest["measure"],
                                  })
            elseif contest['status'] == xi.fishing.contest.status.PRESENTING then
                player:updateEvent( { [0] = contest['status'],
                                      [1] = contest["fishid"],
                                      [2] = contest["criteria"],
                                      [3] = contest["measure"],
                                      [4] = isRewardAvailable(player, contest['id']),
                                  })
            end
        elseif option == 150 then
        -- Initial option
            local time = xi.fishing.contest.timeRemaining( xi.fishing.contest.statusTime( contest['starttime'] )[contest['status']] )
            if contest['status'] == xi.fishing.contest.status.ACCEPTING then
                player:updateEvent( { [0] = contest['status'],
                                      [1] = contest["fishid"],
                                      [2] = contest["criteria"],
                                      [3] = contest["measure"],
                                      [4] = isRewardAvailable(player, contest['id']),
                                      [5] = time['days'],
                                      [6] = time['hours'],
                                      [7] = time['minutes'],
                                      })
            elseif contest['status'] == xi.fishing.contest.status.PRESENTING then
                player:updateEvent( { [0] = contest['status'],
                                      [1] = contest["fishid"],
                                      [2] = contest["criteria"],
                                      [3] = contest["measure"],
                                      [4] = isRewardAvailable(player, contest['id']),
                                      [5] = time['days'],
                                      [6] = time['hours'],
                                      [7] = time['minutes'],
                                  })
            end
        elseif option == 151 then
        -- Confirm request to confirm entry
            player:updateEvent( { [0] = contest['status'],
                                  [1] = contest["fishid"],
                                  [2] = contest["criteria"],
                                  [3] = contest["measure"],
                                  [5] = player:getContestScore(),
                                  })
        elseif option == 152 then
        -- Confirm request to withdraw entry
            player:withdrawContestFish()
        end
    elseif csid == 10007 then
        if option == 144 then
            local length = player:getLocalVar("[FishContest]Length")
            local weight = player:getLocalVar("[FishContest]Weight")
            player:submitContestFish(xi.fishing.contest.scoreFish(length, weight, contest['criteria']), true)
            player:updateEvent( { [0] = contest['status'],
                                  [1] = contest["fishid"],
                                  [2] = contest["criteria"],
                                  [3] = contest["measure"],
                                  })
        elseif option == 145 then
            player:updateEvent( { [0] = contest['status'],
                                  [1] = contest["fishid"],
                                  [2] = contest["criteria"],
                                  [3] = contest["measure"],
                                  })
        end
    end
end

xi.fishing.onEventFinish = function(player, csid, option)
    local contest = GetFishingContest()
    if csid == 10007 then
        -- Give the player back a fish with the same stats, but tagged for Ranking
        if option == 144 then
            local length = player:getLocalVar("[FishContest]Length")
            local weight = player:getLocalVar("[FishContest]Weight")
            local obtained = giveFish(player, { id = contest['fishid'],
                                                quantity = 1,
                                                exdata =
                                                {
                                                    [0] = bit.band(length, 0x00FF),
                                                    [1] = bit.rshift(bit.band(length, 0xFF00), 8),
                                                    [2] = bit.band(weight, 0x00FF),
                                                    [3] = bit.rshift(bit.band(weight, 0xFF00), 8),
                                                    [4] = 1, -- Flags fish as ranked
                                                } })
            if obtained then
                player:confirmTrade()
                player:delGil(500) -- Pay the registration fee of 500 gil.
                player:setLocalVar("[FishContest]Length", 0)
                player:setLocalVar("[FishContest]Weight", 0)
            end
        end

    elseif csid == 10006 then
        if
            option == 149 and
            isRewardAvailable(player, contest['id']) > 0
        then
            -- Issue the player a reward and flag it as awarded.
            local reward = xi.fishing.contest.playerReward(player)
            if reward ~= nil then
                npcUtil.giveReward(player, reward)
                player:giveContestReward(contest['id'])
            end
        end
    end
end
