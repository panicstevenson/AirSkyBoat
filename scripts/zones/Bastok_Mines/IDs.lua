-----------------------------------
-- Area: Bastok_Mines
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[xi.zone.BASTOK_MINES] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED        = 6384,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        DEFAULT_CANNOT_BE_OBTAINED     = 6386,  -- You cannot obtain the item. Come back after sorting your inventory.
        FULL_INVENTORY_AFTER_TRADE     = 6388,  -- You cannot obtain the <item>. Try trading again after sorting your inventory.
        ITEM_OBTAINED                  = 6390,  -- Obtained: <item>.
        GIL_OBTAINED                   = 6391,  -- Obtained <number> gil.
        KEYITEM_OBTAINED               = 6393,  -- Obtained key item: <keyitem>.
        KEYITEM_LOST                   = 6394,  -- Lost key item: <keyitem>.
        NOT_HAVE_ENOUGH_GIL            = 6395,  -- You do not have enough gil.
        YOU_MUST_WAIT_ANOTHER_N_DAYS   = 6426,  -- You must wait another <number> [day/days] to perform that action.
        CARRIED_OVER_POINTS            = 6429,  -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY        = 6430,  -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!
        LOGIN_NUMBER                   = 6431,  -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        MEMBERS_LEVELS_ARE_RESTRICTED  = 6451,  -- Your party is unable to participate because certain members' levels are restricted.
        HOMEPOINT_SET                  = 6490,  -- Home point set!
        YOU_ACCEPT_THE_MISSION         = 6519,  -- You have accepted the mission.
        ORIGINAL_MISSION_OFFSET        = 6524,  -- You can consult the Mission section of the main menu to review your objectives. Speed and efficiency are your priorities. Dismissed.
        CONQUEST_BASE                  = 6592,  -- Tallying conquest results...
        MARIADOK_DIALOG                = 6751,  -- Your fate rides on the changing winds of Vana'diel. I can give you insight on the local weather.
        MOG_LOCKER_OFFSET              = 6864,  -- Your Mog Locker lease is valid until <timestamp>, kupo.
        MAP_MARKER_TUTORIAL            = 7062,  -- Selecting Map from the main menu opens the map of the area in which you currently reside. Select Markers and press the right arrow key to see all the markers placed on your map.
        ALCHEMY_SUPPORT                = 7069,  -- Your [fishing/woodworking/smithing/goldsmithing/clothcraft/leatherworking/bonecraft/alchemy/cooking] skills went up [a little/ever so slightly/ever so slightly].
        HEMEWMEW_DIALOG                = 7076,  -- Hello, [sir/ma'am]. I have been appointed by the Guildworkers' Union to manage the trading of manufactured crafts and the exchange of guild points.
        GUILD_TERMINATE_CONTRACT       = 7083,  -- You have terminated your trading contract with the [Fishermen's/Carpenters'/Blacksmiths'/Goldsmiths'/Weavers'/Tanners'/Boneworkers'/Alchemists'/Culinarians'] Guild and formed a new one with the [Fishermen's/Carpenters'/Blacksmiths'/Goldsmiths'/Weavers'/Tanners'/Boneworkers'/Alchemists'/Culinarians'] Guild.
        GUILD_NEW_CONTRACT             = 7091,  -- You have formed a new trading contract with the [Fishermen's/Carpenters'/Blacksmiths'/Goldsmiths'/Weavers'/Tanners'/Boneworkers'/Alchemists'/Culinarians'] Guild.
        NO_MORE_GP_ELIGIBLE            = 7098,  -- You are not eligible to receive guild points at this time.
        GP_OBTAINED                    = 7103,  -- Obtained: <number> guild points.
        NOT_HAVE_ENOUGH_GP             = 7104,  -- You do not have enough guild points.
        RENOUNCE_CRAFTSMAN             = 7120,  -- You have successfully renounced your status as a [craftsman/artisan/adept] of the [Carpenters'/Blacksmiths'/Goldsmiths'/Weavers'/Tanners'/Boneworkers'/Alchemists'/Culinarians'] Guild.
        REGIME_CANCELED                = 7285,  -- Current training regime canceled.
        HUNT_ACCEPTED                  = 7303,  -- Hunt accepted!
        USE_SCYLDS                     = 7304,  -- You use <number> [scyld/scylds]. Scyld balance: <number>.
        HUNT_RECORDED                  = 7315,  -- You record your hunt.
        OBTAIN_SCYLDS                  = 7317,  -- You obtain <number> [scyld/scylds]! Current balance: <number> [scyld/scylds].
        HUNT_CANCELED                  = 7321,  -- Hunt canceled.
        ITEM_DELIVERY_DIALOG           = 10451, -- Need something sent to a friend's house? Sending items to your own house? You've come to the right place!
        DETZO_RIVALS_DIALOG            = 10602, -- Can I borrow it for just a few seconds? I'll give it back, promise! I'll even give you a reward!
        FAUSTIN_CLOSED_DIALOG          = 10795, -- Sorry, I don't have anything to sell you. I'm trying to start a business selling goods from Ronfaure, but it's not easy getting stuff from areas that aren't under Bastokan control.
        RODELLIEUX_CLOSED_DIALOG       = 10796, -- Sorry, I don't have anything to sell you. I'm trying to start a business selling goods from Fauregandi, but it's not easy getting stuff from areas that aren't under Bastokan control.
        MILLE_CLOSED_DIALOG            = 10797, -- Sorry, I don't have anything to sell you. I'm trying to start a business selling goods from Norvallen, but it's not easy getting stuff from areas that aren't under Bastokan control.
        TIBELDA_CLOSED_DIALOG          = 10798, -- Sorry, I don't have anything to sell you. I'm trying to start a business selling goods from Valdeaunia, but it's not easy getting stuff from areas that aren't under Bastokan control.
        GALDEO_CLOSED_DIALOG           = 10799, -- Sorry, I don't have anything to sell you. I'm trying to start a business selling goods from Li'Telor, but it's not easy getting stuff from areas that aren't under Bastokan control.
        TAMI_MY_HUSBAND                = 10801, -- My husband's name is Zelman. You'll find him in the Zeruhn Mines. He's a miner. All right, then, off you go!
        FISHING_MESSAGE_OFFSET         = 10816, -- You can't fish here.
        DEEGIS_SHOP_DIALOG             = 10916, -- The only things an adventurer needs are courage and a good suit of armor! Welcome to Deegis's Armour!
        ZEMEDARS_SHOP_DIALOG           = 10917, -- Everything in our store is top-grade and Galka-made! What're you lookin' for?
        BOYTZ_SHOP_DIALOG              = 10918, -- Welcome to Boytz's Knickknacks.
        GELZERIO_SHOP_DIALOG           = 10919, -- ...Yes?
        GRISELDA_SHOP_DIALOG           = 10920, -- Good of you to drop by the Bat's Lair Inn! Why don't you try some of our specialty plates?
        NEIGEPANCE_SHOP_DIALOG         = 10921, -- Hello there. A well-fed chocobo is a happy chocobo!
        FAUSTIN_OPEN_DIALOG            = 10922, -- Hello there! Might I interest you specialty goods from Ronfaure?
        MILLE_OPEN_DIALOG              = 10923, -- Hello there! Might I interest you specialty goods from Norvallen?
        RODELLIEUX_OPEN_DIALOG         = 10924, -- Hello there! Might I interest you specialty goods from Fauregandi?
        TIBELDA_OPEN_DIALOG            = 10925, -- Goods of all varieties, imported directly from the northern land of Valdeaunia!
        MAYMUNAH_SHOP_DIALOG           = 10926, -- Welcome to the Alchemists' Guild! Looking for something specific?
        ODOBA_SHOP_DIALOG              = 10927, -- Welcome to the Alchemists' Guild. How may I help you?
        CONQUEST                       = 11127, -- You've earned conquest points!
        GALDEO_OPEN_DIALOG             = 11487, -- Come! Take a look at all the wonderful goods from Li'Telor.
        AULAVIA_OPEN_DIALOG            = 11488, -- May I interest you in some specialty goods from Vollbow?
        AULAVIA_CLOSED_DIALOG          = 11489, -- I'm trying to start a business selling goods from Vollbow, but it's not easy getting stuff from areas that aren't under Bastokan control.
        EXTENDED_MISSION_OFFSET        = 11630, -- Go to Ore Street and talk to Medicine Eagle. He says he was there when the commotion started.
        PROUDBEARD_SHOP_DIALOG         = 11658, -- Would you be interested in a nice suit of adventurer-issue armor? Be careful when you buy, though. We offer no refunds.
        TRICK_OR_TREAT                 = 11702, -- Trick or treat...
        THANK_YOU_TREAT                = 11703, -- Thank you... And now for your treat...
        HERE_TAKE_THIS                 = 11704, -- Here, take this...
        IF_YOU_WEAR_THIS               = 11705, -- If you put this on and walk around, something...unexpected might happen...
        THANK_YOU                      = 11706, -- Thank you...
        GROUND_STRIKE_LEARNED          = 11728, -- You have learned the weapon skill Ground Strike!
        YOU_CANNOT_ENTER_DYNAMIS       = 11741, -- You cannot enter Dynamis - [Dummy/San d'Oria/Bastok/Windurst/Jeuno/Beaucedine/Xarcabard/Valkurm/Buburimu/Qufim/Tavnazia] for <number> [day/days] (Vana'diel time).
        PLAYERS_HAVE_NOT_REACHED_LEVEL = 11743, -- Players who have not reached level <number> are prohibited from entering Dynamis.
        DYNA_NPC_DEFAULT_MESSAGE       = 11754, -- There is an unusual arrangement of pebbles here.
        THE_GATE_IS_LOCKED             = 12176, -- The gate is locked.
        EMALIVEULAUX_COP_NOT_COMPLETED = 12257, -- I'd like to start my own business someday, but I just haven't found anything that truly interests me.
        EMALIVEULAUX_OPEN_DIALOG       = 12258, -- Rare Tavnazian imports! Get them before they're gone!
        EMALIVEULAUX_CLOSED_DIALOG     = 12259, -- I'd love to sell you goods imported from the island of Tavnazia, but with the area under foreign control, I can't secure my trade routes...
        CHOCOBO_FEEDING_SLEEP          = 12836, -- Your chocobo is sleeping soundly. You cannot feed it now.
        CHOCOBO_FEEDING_RUN_AWAY       = 12837, -- Your chocobo has run away. You cannot feed it now.
        CHOCOBO_FEEDING_STILL_EGG      = 12838, -- You cannot feed a chocobo that has not hatched yet.
        CHOCOBO_FEEDING_ITEM           = 13921, -- #: %
        COMMON_SENSE_SURVIVAL          = 16026, -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
        TEAR_IN_FABRIC_OF_SPACE        = 16625, -- There appears to be a tear in the fabric of space...
        -- Starlight Celebration Dialog --
        GIFT_THANK_YOU                 = 12264, -- Thank you! Thank you! Thank you!
        ONLY_TWO_HANDS                 = 12267, -- Another present? Sorry, but I only have two hands, (Player Gender)≻[Mr./Ms.] Adventurer!
        JOY_TO_CHILDREN                = 12271, -- You've brought joy to the children of Vana'diel!
        BARRELS_JOY_TO_CHILDREN        = 12272, -- You've brought barrelfuls of joy to the children of Vana'diel!
        STARLIGHT_CARD_1               = 12390, -- It's time once again for the Starlight Celebration!≺Prompt≻
        STARLIGHT_CARD_2               = 15577, -- Kupo ho ho! Merry Starlight! As with past celebrations, we've prepared a veritable mountain of presents for all adventurers, kupo.≺Prompt≻
        STARLIGHT_CARD_3               = 15607, -- We'd also appreciate your help in distributing cards, kupo. All you're required to do is deliver this card to the addressee. We're counting on you!≺Prompt≻
        STARLIGHT_CARD_4               = 15603, -- If you happen to forget who the card's recipient is, just show it to me, kupo.≺Prompt≻
        STARLIGHT_CARD_5               = 15602, -- You're truly a role model for all adventurers, kupo! Now then, we'd like you to take this card and give it to a ≺Multiple Choice (Parameter 0)≻[male Hume/female Hume/male Elvaan/female Elvaan/male Tarutaru/female Tarutaru/Mithra/Galka] adventurer.≺Prompt≻
        STARLIGHT_CARD_6               = 15587, -- Happy delivering, kupo!≺Prompt≻
        STARLIGHT_CARD_CHECK           = 15604, -- Let' see... This addressee of this card is a ≺Multiple Choice (Parameter 0)≻[male Hume/female Hume/male Elvaan/female Elvaan/male Tarutaru/female Tarutaru/Mithra/Galka] adventurer, kupo.≺Prompt≻
        STARLIGHT_CARD_RED             = 12397, -- Oh, I just remembered! I think that the cards are all addressed to people who are wearing red...≺Prompt≻
        STARLIGHT_CARD_WRONG           = 15605, -- Are you trying to pull a fast one, kupo!? This card isn't yours to give, nor is it addressed to you, so please take it back to where you found it.≺Prompt≻
        STARLIGHT_CARD_CONFIRM         = 15593, -- Here's a little something for your kindness.≺Prompt≻
        STARLIGHT_FAME_DIALOG          = 12414, -- ≺Multiple Choice (Parameter 1)≻[You haven't brought any happiness to the children!/You've done some good./You've done fairly well./You've made the children very happy!/You've brought lots of smiles!/You have the children bursting with glee!/The children love you!] ≺Multiple Choice (Parameter 1)≻[What a disappointment./You just need to give a little extra effort!/Keep it up!/You make a good smilebringer./Excellent work!/Stupendous job!/Even I think you're great!]≺Prompt≻
        STARLIGHT_VENDOR_MOOGLE        = 14457, -- Welcome, kupo!
    },
    mob =
    {
    },
    npc =
    {
        HALLOWEEN_SKINS =
        {
            [17735742] = 41, -- Faustin
            [17735744] = 43, -- Mille
            [17735747] = 42, -- Aulavia
            [17735795] = 40, -- Proud Beard
            [17735818] = 44, -- Emaliveulaux
        },
        STARLIGHT_DECORATIONS =
        {
            [17735996] = 17735996,  -- Starlight Celebration Planter
            [17735997] = 17735997,  -- Starlight Celebration Planter
            [17735998] = 17735998,  -- Starlight Celebration Planter
            [17735999] = 17735999,  -- Starlight Celebration Planter
            [17736000] = 17736000,  -- Starlight Celebration Planter
            [17736001] = 17736001,  -- Starlight Celebration Planter
            [17735995] = 17735995,  -- Christina
            [17736002] = 17736002,  -- Token Moogle
            [17736003] = 17736003,  -- Event Moogle
            [17736004] = 17736004,  -- Vendor Moogle
            [17736005] = 17736005,  -- Vendor Moogle
            [17735962] = 17735962,  -- Event Moogle Stall
        },
        LELEROON_BLUE_DOOR = 17735847,
        EXPLORER_MOOGLE    = 17735856,
    },
}

return zones[xi.zone.BASTOK_MINES]
