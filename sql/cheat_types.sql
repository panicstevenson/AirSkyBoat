SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Table structure for table `cheat_types`
--

DROP TABLE IF EXISTS `cheat_types`;
CREATE TABLE IF NOT EXISTS `cheat_types` (
  `cheatid` int(10) unsigned NOT NULL,
  `name` varchar(15) NOT NULL,
  `description` varchar(128) NOT NULL,
  `argument` int(10) unsigned NOT NULL,
  `action_bitmask` int(10) unsigned NOT NULL,
  `warning_message` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cheat_types`
--

INSERT INTO `cheat_types` (`cheatid`, `name`, `description`, `argument`, `action_bitmask`, `warning_message`) VALUES
(1, 'FASTSYNTH', 'Player injects a synth done (0x59) packet to perform synth and craft skillups faster than the game allows.', 0, 3, 'A fast craft cheating attempt has been attempted. Successful craft has been blocked and the incident will be reported.'),
(2, 'CLAIMBOT', 'Player attempts to claim a mob before it is visible and claimable.', 0, 1, 'A non-standard claiming method has been attempted. This incident will be reported.'),
(3, 'POS_HACK', 'Player is moving too fast or is teleporting. Speed has been recorded.', 0, 3, 'A non-standard movement has been attempted. This incident will be reported.'),
(4, 'FAST_DIG', 'Player is digging before the animation should have completed. Last animation time difference recorded in ms.', 0, 1, 'A non-standard dig has been attempted. This incident will be reported.'),
(5, 'DIG_BOT', 'Player is dig botting, dig times and movement are too close. Last minimum position difference recorded should be divided by 100.', 0, 1, 'A non-standard dig has been attempted. This incident will be reported.'),
(6, 'CRAFT_BOT', 'Player swapped crafts in under alloted and is using crafty to auto recipe swap. Recipe start time diff has been recorded in seconds.', 0, 1, 'A non-standard synthesis has been attempted. This incident will be reported.'),
(7, 'AUTO_CRAFT', 'Player did multiple crafts with low variance, likely using an auto craft bot. Lowest start time diff has been recorded in seconds.', 0, 1, 'A non-standard synthesis has been attempted. This incident will be reported.'),
(8, 'FISH_BOT', 'Player is either fishing packet manipulating or running a fish bot. Number of strikes has been recorded.', 0, 1, 'A non-standard fishing method has been attempted. This incident will be reported.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cheat_types`
--
ALTER TABLE `cheat_types`
  ADD PRIMARY KEY (`cheatid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
