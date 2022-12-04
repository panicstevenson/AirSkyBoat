-- --------------------------------------------------------
-- AirSkyBoat Database Conversion File
-- --------------------------------------------------------
-- Table Structure Definition
-- --------------------------------------------------------

LOCK TABLE `item_usable` WRITE;

REPLACE INTO `item_usable` (`itemid`, `name`, `validTargets`, `activation`, `animation`, `animationTime`, `maxCharges`, `useDelay`, `reuseDelay`, `aoe`) VALUES
    (15761,'chariot_band',1,3,76,0,3,5,57600,0),
    (15762,'empress_band',1,3,76,0,10,5,3600,0),
    (15763,'emperor_band',1,3,76,0,5,5,900,0);
