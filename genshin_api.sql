-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2025 at 04:47 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `genshin_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `artifacts`
--
CREATE DATABASE genshin_api;
USE genshin_api;

CREATE TABLE `artifacts` (
  `artifact_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `set_bonus_2pc` text DEFAULT NULL,
  `set_bonus_4pc` text DEFAULT NULL,
  `rarity` varchar(20) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `artifacts` (`name`, `set_bonus_2pc`, `set_bonus_4pc`, `rarity`) VALUES
('Initiate', NULL, NULL, '1 star'),
('Adventurer', 'Max HP increased by 1000.', 'Opening a chest regenerates 30% Max HP over 5s.', '1-3 star'),
('Lucky_Dog', 'DEF increased by 100.', 'Picking up Mora restores 300 HP.', '1-3 star'),
('Traveling_Doctor', 'Increases incoming healing by 20%.', 'Using Elemental Burst restores 20% HP.', '1-3 star'),
('Resolution_of_Sojourner', 'ATK +18%.', 'Increases Charged Attack CRIT Rate by 30%.', '3-4 star'),
('Tiny_Miracle', 'All Elemental RES increased by 20%.', 'Incoming Elemental DMG increases corresponding Elemental RES by 30% for 10s. Can only occur once every 10s.', '3-4 star'),
('Berserker', 'CRIT Rate +12%', 'When HP is below 70%, CRIT Rate increases by an additional 24%.', '3-4 star'),
('Instructor', 'Increases Elemental Mastery by 80.', 'Upon triggering an Elemental Reaction, increases all party members'' Elemental Mastery by 120 for 8s.', '3-4 star'),
('The_Exile', 'Energy Recharge +20%', 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.', '3-4 star'),
('Defender''s_Will', 'DEF +30%', 'For each different element present in your own party, the wearer''s Elemental RES to that corresponding element is increased by 30%.', '3-4 star'),
('Brave_Heart', 'ATK +18%.', 'Increases DMG by 30% against opponents with more than 50% HP.', '3-4 star'),
('Martial_Artist', 'Normal and Charged Attack DMG +15%', 'After using Elemental Skill, increases Normal Attack and Charged Attack DMG by 25% for 8s.', '3-4 star'),
('Gambler', 'Increases Elemental Skill DMG by 20%.', 'Defeating an opponent has a 100% chance to remove Elemental Skill CD. Can only occur once every 15s.', '3-4 star'),
('Scholar', 'Energy Recharge +20%', 'Gaining Elemental Particles or Orbs gives 3 Energy to all party members who have a bow or a catalyst equipped. Can only occur once every 3s.', '3-4 star'),
('Prayers_for_Wisdom', 'Affected by Electro for 40% less time.', NULL, '3-4 star'),
('Prayers_for_Destiny', 'Affected by Hydro for 40% less time.', NULL, '3-4 star'),
('Prayers_for_Illumination', 'Affected by Pyro for 40% less time.', NULL, '3-4 star'),
('Prayers_to_Springtime', 'Affected by Cryo for 40% less time.', NULL, '3-4 star'),
('Gladiator''s_Finale', 'ATK +18%.', 'If the wielder of this artifact set uses a Sword, Claymore or Polearm, increases their Normal Attack DMG by 35%.', '4-5 star'),
('Wanderer''s_Troupe', 'Increases Elemental Mastery by 80.', 'Increases Charged Attack DMG by 35% if the character uses a Catalyst or Bow.', '4-5 star'),
('Noblesse_Oblige', 'Elemental Burst DMG +20%', 'Using an Elemental Burst increases all party members'' ATK by 20% for 12s. This effect cannot stack.', '4-5 star'),
('Bloodstained_Chivalry', 'Physical DMG Bonus +25%', 'After defeating an opponent, increases Charged Attack DMG by 50%, and reduces its Stamina cost to 0 for 10s.', '4-5 star'),
('Maiden_Beloved', 'Character Healing Effectiveness +15%', 'Using an Elemental Skill or Burst increases healing received by all party members by 20% for 10s.', '4-5 star'),
('Viridescent_Venerer', 'Anemo DMG Bonus +15%', 'Increases Swirl DMG by 60%. Decreases opponent''s Elemental RES to the element infused in the Swirl by 40% for 10s.', '4-5 star'),
('Archaic_Petra', 'Geo DMG Bonus +15%.', 'Upon obtaining an Elemental Shard created through a Crystallize Reaction, all party members gain 35% DMG Bonus for that particular element for 10s. Only one form of Elemental DMG Bonus can be gained in this manner at any one time.', '4-5 star'),
('Retracing_Bolide', 'Increases Shield Strength by 35%.', 'While protected by a shield, gain an additional 40% Normal and Charged Attack DMG.', '4-5 star'),
('Thundersoother', 'Electro RES increased by 40%.', 'Increases DMG against opponents affected by Electro by 35%.', '4-5 star'),
('Thundering_Fury', 'Electro DMG Bonus +15%', 'Increases DMG caused by Overloaded, Electro-Charged, Superconduct, and Hyperbloom by 40%, and the DMG Bonus conferred by Aggravate is increased by 20%, and the DMG caused by Lunar-Charged by 20%. When Quicken or the aforementioned Elemental Reactions are triggered, Elemental Skill CD is decreased by 1s. Can only occur once every 0.8s.', '4-5 star'),
('Lavawalker', 'Pyro RES increased by 40%.', 'Increases DMG against opponents affected by Pyro by 35%.', '4-5 star'),
('Crimson_Witch_of_Flames', 'Pyro DMG Bonus +15%', 'Increases Overloaded and Burning, and Burgeon DMG by 40%. Increases Vaporize and Melt DMG by 15%. Using Elemental Skill increases the 2-Piece Set Bonus by 50% of its starting value for 10s. Max 3 stacks.', '4-5 star'),
('Blizzard_Strayer', 'Cryo DMG Bonus +15%', 'When a character attacks an opponent affected by Cryo, their CRIT Rate is increased by 20%. If the opponent is Frozen, CRIT Rate is increased by an additional 20%.', '4-5 star'),
('Heart_of_Depth', 'Hydro DMG Bonus +15%', 'After using an Elemental Skill, increases Normal Attack and Charged Attack DMG by 30% for 15s.', '4-5 star'),
('Tenacity_of_the_Millelith', 'HP +20%', 'When an Elemental Skill hits an opponent, the ATK of all nearby party members is increased by 20% and their Shield Strength is increased by 30% for 3s. This effect can be triggered once every 0.5s. This effect can still be triggered even when the character who is using this artifact set is not on the field.', '4-5 star'),
('Pale_Flame', 'Physical DMG Bonus +25%.', 'When an Elemental Skill hits an opponent, ATK is increased by 9% for 7s. This effect stacks up to 2 times and can be triggered once every 0.3s. Once 2 stacks are reached, the 2-set effect is increased by 100%.', '4-5 star'),
('Shimenawa''s_Reminiscence', 'ATK +18%.', 'When casting an Elemental Skill, if the character has 15 or more Energy, they lose 15 Energy and Normal/Charged/Plunging Attack DMG is increased by 50% for 10s. This effect will not trigger again during that duration.', '4-5 star'),
('Emblem_of_Severed_Fate', 'Energy Recharge +20%', 'Increases Elemental Burst DMG by 25% of Energy Recharge. A maximum of 75% bonus DMG can be obtained in this way.', '4-5 star'),
('Husk_of_Opulent_Dreams', 'DEF +30%', 'A character equipped with this Artifact set will obtain the Curiosity effect in the following conditions: When on the field, the character gains 1 stack after hitting an opponent with a Geo attack, triggering a maximum of once every 0.3s. When off the field, the character gains 1 stack every 3s. Curiosity can stack up to 4 times, each providing 6% DEF and a 6% Geo DMG Bonus. When 6 seconds pass without gaining a Curiosity stack, 1 stack is lost.', '4-5 star'),
('Ocean-Hued_Clam', 'Healing Bonus +15%.', 'When the character equipping this artifact set heals a character in the party, a Sea-Dyed Foam will appear for 3 seconds, accumulating the amount of HP recovered from healing (including overflow healing). At the end of the duration, the Sea-Dyed Foam will explode, dealing DMG to nearby opponents based on 90% of the accumulated healing. Only one Sea-Dyed Foam can be produced every 3.5 seconds. Each Sea-Dyed Foam can accumulate up to 30,000 HP (including overflow healing). There can be no more than one Sea-Dyed Foam active at any given time. This effect can still be triggered even when the character who is using this artifact set is not on the field.', '4-5 star'),
('Vermillion_Hereafter', 'ATK +18%.', 'After using an Elemental Burst, this character will gain the Nascent Light effect, increasing their ATK by 8% for 16s. When the character''s HP decreases, their ATK will further increase by 10%. This increase can occur this way maximum of 4 times. This effect can be triggered once every 0.8s. Nascent Light will be dispelled when the character leaves the field. If an Elemental Burst is used again during the duration of Nascent Light, the original Nascent Light will be dispelled.', '4-5 star'),
('Echoes_of_an_Offering', 'ATK +18%.', 'When Normal Attacks hit opponents, there is a 36% chance that it will trigger Valley Rite, which will increase Normal Attack DMG by 70% of ATK. This effect will be dispelled 0.05s after a Normal Attack deals DMG. If a Normal Attack fails to trigger Valley Rite, the odds of it triggering the next time will increase by 20%. This trigger can occur once every 0.2s.', '4-5 star'),
('Deepwood_Memories', 'Dendro DMG Bonus +15%.', 'After Elemental Skills or Bursts hit opponents, the targets'' Dendro RES will be decreased by 30% for 8s. This effect can be triggered even if the equipping character is not on the field.', '4-5 star'),
('Gilded_Dreams', 'Increases Elemental Mastery by 80.', 'Within 8s of triggering an Elemental Reaction, the character equipping this will obtain buffs based on the Elemental Type of the other party members. ATK is increased by 14% for each party member whose Elemental Type is the same as the equipping character, and Elemental Mastery is increased by 50 for every party member with a different Elemental Type. Each of the aforementioned buffs will count up to 3 characters. This effect can be triggered once every 8s. The character who equips this can still trigger its effects when not on the field.', '4-5 star'),
('Desert_Pavilion_Chronicle', 'Anemo DMG Bonus +15%.', 'When Charged Attacks hit opponents, the equipping character''s Normal Attack SPD will increase by 10% while Normal, Charged, and Plunging Attack DMG will increase by 40% for 15s.', '4-5 star'),
('Flower_of_Paradise_Lost', 'Increases Elemental Mastery by 80.', 'The equipping character''s Bloom, Hyperbloom, and Burgeon reaction DMG are increased by 40%, and their Lunar-Bloom reaction DMG is increased by 10%. Additionally, after the equipping character triggers Bloom, Hyperbloom, Lunar-Bloom, or Burgeon, they will gain another 25% bonus to the effect mentioned prior. Each stack of this lasts 10s. Max 4 stacks simultaneously. This effect can only be triggered once per second. The character who equips this can still trigger its effects when not on the field.', '4-5 star');
('Nymph''s_Dream', 'Hydro DMG Bonus +15%', 'After Normal, Charged, and Plunging Attacks, Elemental Skills, and Elemental Bursts hit opponents, 1 stack of Mirrored Nymph will be triggered, lasting 8s. When under the effect of 1, 2, or 3 or more Mirrored Nymph stacks, ATK will be increased by 7%/16%/25%, and Hydro DMG will be increased by 4%/9%/15%. Mirrored Nymph created by Normal, Charged, and Plunging Attacks, Elemental Skills, and Elemental Bursts exist independently.', '4-5 star'),
('Vourukasha''s_Glow', 'HP +20%', 'Elemental Skill and Elemental Burst DMG will be increased by 10%. After the equipping character takes DMG, the aforementioned DMG Bonus is increased by 80% for 5s. This effect increase can have 5 stacks. The duration of each stack is counted independently. These effects can be triggered even when the equipping character is not on the field.', '4-5 star'),
('Marechaussee_Hunter', 'Normal and Charged Attack DMG +15%.', 'When current HP increases or decreases, CRIT Rate will be increased by 12% for 5s. Max 3 stacks.', '4-5 star'),
('Golden_Troupe', 'Increases Elemental Skill DMG by 20%.', 'Increases Elemental Skill DMG by 25%. Additionally, when not on the field, Elemental Skill DMG will be further increased by 25%. This effect will be cleared 2s after taking the field.', '4-5 star'),
('Song_of_Days_Past', 'Healing Bonus +15%.', 'When the equipping character heals a party member, the Yearning effect will be created for 6s, which records the total amount of healing provided (including overflow healing). When the duration expires, the Yearning effect will be transformed into the "Waves of Days Past" effect: When your active party member hits an opponent with a Normal Attack, Charged Attack, Plunging Attack, Elemental Skill, or Elemental Burst, the DMG dealt will be increased by 8% of the total healing amount recorded by the Yearning effect. The "Waves of Days Past" effect is removed after it has taken effect 5 times or after 10s. A single instance of the Yearning effect can record up to 15,000 healing, and only a single instance can exist at once, but it can record the healing from multiple equipping characters. Equipping characters on standby can still trigger this effect.', '4-5 star'),
('Nighttime_Whispers_in_the_Echoing_Woods', 'ATK +18%.', 'After using an Elemental Skill, gain a 20% Geo DMG Bonus for 10s. While under a shield granted by the Crystallize reaction, the above effect will be increased by 150%, and this additional increase disappears 1s after that shield is lost.', '4-5 star'),
('Fragment_of_Harmonic_Whimsy', 'ATK +18%.', 'When the value of a Bond of Life increases or decreases, this character deals 18% increased DMG for 6s. Max 3 stacks.', '4-5 star'),
('Unfinished_Reverie', 'ATK +18%', 'After leaving combat for 3s, DMG dealt increased by 50%. In combat, if no Burning opponents are nearby for more than 6s, this DMG Bonus will decrease by 10% per second until it reaches 0%. When a Burning opponent exists, it will increase by 10% instead until it reaches 50%. This effect still triggers if the equipping character is off-field.', '4-5 star'),
('Scroll_of_the_Hero_of_Cinder_City', 'When a nearby party member triggers a Nightsoul Burst, the equipping character regenerates 6 Elemental Energy.', 'After the equipping character triggers a reaction related to their Elemental Type, all nearby party members gain a 12% Elemental DMG Bonus for the Elemental Types involved in the elemental reaction for 15s. If the equipping character is in the Nightsoul''s Blessing state when triggering this effect, all nearby party members gain an additional 28% Elemental DMG Bonus for the Elemental Types involved in the elemental reaction for 20s. The equipping character can trigger this effect while off-field, and the DMG bonus from Artifact Sets with the same name do not stack.', '4-5 star'),
('Obsidian_Codex', 'While the equipping character is in Nightsoul''s Blessing and is on the field, their DMG dealt is increased by 15%.', 'After the equipping character consumes 1 Nightsoul point while on the field, CRIT Rate increases by 40% for 6s. This effect can trigger once every second.', '4-5 star'),
('Finale_of_the_Deep_Galleries', 'Cryo DMG Bonus +15%', 'When the equipping character has 0 Elemental Energy, Normal Attack DMG is increased by 60% and Elemental Burst DMG is increased by 60%. After the equipping character deals Normal Attack DMG, the aforementioned Elemental Burst effect will stop applying for 6s. After the equipping character deals Elemental Burst DMG, the aforementioned Normal Attack effect will stop applying for 6s. This effect can trigger even if the equipping character is off the field.', '4-5 star'),
('Long_Night''s_Oath', 'Plunging Attack DMG increased by 25%', 'After the equipping character''s Plunging Attack/Charged Attack/Elemental Skill hits an opponent, they will gain 1/2/2 stack(s) of "Radiance Everlasting." Plunging Attacks, Charged Attacks or Elemental Skills can each trigger this effect once every 1s. Radiance Everlasting: Plunging Attacks deal 15% increased DMG for 6s. Max 5 stacks. Each stack''s duration is counted independently.', '4-5 star'),
('Night_of_the_Sky''s_Unveiling', 'Increases Elemental Mastery by 80.', 'When nearby party members trigger Lunar Reactions, if the equipping character is on the field, gain the Gleaming Moon: Intent effect for 4s: Increases CRIT Rate by 15%/30% when the party''s Moonsign is Nascent Gleam/Ascendant Gleam. All party members'' Lunar Reaction DMG is increased by 10% for each different Gleaming Moon effect that party members have. Effects from Gleaming Moon cannot stack.', '4-5 star'),
('Silken_Moon''s_Serenade', 'Energy Recharge +20%.', 'When dealing Elemental DMG, gain the Gleaming Moon: Devotion effect for 8s: Increases all party members'' Elemental Mastery by 60/120 when the party''s Moonsign is Nascent Gleam/Ascendant Gleam. The equipping character can trigger this effect while off-field. All party members'' Lunar Reaction DMG is increased by 10% for each different Gleaming Moon effect that party members have. Effects from Gleaming Moon cannot stack.', '4-5 star');

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE `characters` (
  `character_id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `element` varchar(50) NOT NULL,
  `weapon_type` varchar(50) NOT NULL,
  `rarity` int(11) DEFAULT NULL CHECK (`rarity` between 1 and 5),
  `region` varchar(50) DEFAULT NULL

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO characters (name, element, weapon_type, rarity, region) VALUES
('amber', 'Amber', 'Pyro', 'Bow', 4, 'Mondstadt'),
('barbara', 'Barbara', 'Hydro', 'Catalyst', 4, 'Mondstadt'),
('beidou', 'Beidou', 'Electro', 'Claymore', 4, 'Liyue'),
('bennett', 'Bennett', 'Pyro', 'Sword', 4, 'Mondstadt'),
('chongyun', 'Chongyun', 'Cryo', 'Claymore', 4, 'Liyue'),
('diluc', 'Diluc', 'Pyro', 'Claymore', 5, 'Mondstadt'),
('fischl', 'Fischl', 'Electro', 'Bow', 4, 'Mondstadt'),
('jean', 'Jean', 'Anemo', 'Sword', 5, 'Mondstadt'),
('kaeya', 'Kaeya', 'Cryo', 'Sword', 4, 'Mondstadt'),
('keqing', 'Keqing', 'Electro', 'Sword', 5, 'Liyue'),
('lisa', 'Lisa', 'Electro', 'Catalyst', 4, 'Mondstadt'),
('mona', 'Mona', 'Hydro', 'Catalyst', 5, 'Mondstadt'),
('ningguang', 'Ningguang', 'Geo', 'Catalyst', 4, 'Liyue'),
('noelle', 'Noelle', 'Geo', 'Claymore', 4, 'Mondstadt'),
('qiqi', 'Qiqi', 'Cryo', 'Sword', 5, 'Liyue'),
('razor', 'Razor', 'Electro', 'Claymore', 4, 'Mondstadt'),
('sucrose', 'Sucrose', 'Anemo', 'Catalyst', 4, 'Mondstadt'),
('traveler_anemo', 'Traveler', 'Anemo', 'Sword', 5, 'None'),
('traveler_geo', 'Traveler', 'Geo', 'Sword', 5, 'None'),
('traveler_electro', 'Traveler', 'Electro', 'Sword', 5, 'None'),
('traveler_dendro', 'Traveler', 'Dendro', 'Sword', 5, 'None'),
('traveler_hydro', 'Traveler', 'Hydro', 'Sword', 5, 'None'),
('traveler_pyro', 'Traveler', 'Pyro', 'Sword', 5, 'None'),
('venti', 'Venti', 'Anemo', 'Bow', 5, 'Mondstadt'),
('xiangling', 'Xiangling', 'Pyro', 'Polearm', 4, 'Liyue'),
('xingqiu', 'Xingqiu', 'Hydro', 'Sword', 4, 'Liyue'),
('klee', 'Klee', 'Pyro', 'Catalyst', 5, 'Mondstadt'),
('diona', 'Diona', 'Cryo', 'Bow', 4, 'Mondstadt'),
('tartaglia', 'Tartaglia', 'Hydro', 'Bow', 5, 'Snezhnaya'),
('xinyan', 'Xinyan', 'Pyro', 'Claymore', 4, 'Liyue'),
('zhongli', 'Zhongli', 'Geo', 'Polearm', 5, 'Liyue'),
('albedo', 'Albedo', 'Geo', 'Sword', 5, 'Mondstadt'),
('ganyu', 'Ganyu', 'Cryo', 'Bow', 5, 'Liyue'),
('xiao', 'Xiao', 'Anemo', 'Polearm', 5, 'Liyue'),
('hu_tao', 'Hu Tao', 'Pyro', 'Polearm', 5, 'Liyue'),
('rosaria', 'Rosaria', 'Cryo', 'Polearm', 4, 'Mondstadt'),
('yanfei', 'Yanfei', 'Pyro', 'Catalyst', 4, 'Liyue'),
('eula', 'Eula', 'Cryo', 'Claymore', 5, 'Mondstadt'),
('kaedehara_kazuha', 'Kaedehara Kazuha', 'Anemo', 'Sword', 5, 'Inazuma'),
('kamisato_ayaka', 'Kamisato Ayaka', 'Cryo', 'Sword', 5, 'Inazuma'),
('sayu', 'Sayu', 'Anemo', 'Claymore', 4, 'Inazuma'),
('yoimiya', 'Yoimiya', 'Pyro', 'Bow', 5, 'Inazuma'),
('aloy', 'Aloy', 'Cryo', 'Bow', 5, 'None'),
('kujou_sara', 'Kujou Sara', 'Electro', 'Bow', 4, 'Inazuma'),
('raiden_shogun', 'Raiden Shogun', 'Electro', 'Polearm', 5, 'Inazuma'),
('sangonomiya_kokomi', 'Sangonomiya Kokomi', 'Hydro', 'Catalyst', 5, 'Inazuma'),
('thoma', 'Thoma', 'Pyro', 'Polearm', 4, 'Inazuma'),
('arataki_itto', 'Arataki Itto', 'Geo', 'Claymore', 5, 'Inazuma'),
('gorou', 'Gorou', 'Geo', 'Bow', 4, 'Inazuma'),
('shenhe', 'Shenhe', 'Cryo', 'Polearm', 5, 'Liyue'),
('yun_jin', 'Yun Jin', 'Geo', 'Polearm', 4, 'Liyue'),
('yae_miko', 'Yae Miko', 'Electro', 'Catalyst', 5, 'Inazuma'),
('kamisato_ayato', 'Kamisato Ayato', 'Hydro', 'Sword', 5, 'Inazuma'),
('yelan', 'Yelan', 'Hydro', 'Bow', 5, 'Liyue'),
('kuki_shinobu', 'Kuki Shinobu', 'Electro', 'Sword', 4, 'Inazuma'),
('shikanoin_heizou', 'Shikanoin Heizou', 'Anemo', 'Catalyst', 4, 'Inazuma'),
('collei', 'Collei', 'Dendro', 'Bow', 4, 'Sumeru'),
('tighnari', 'Tighnari', 'Dendro', 'Bow', 5, 'Sumeru'),
('dori', 'Dori', 'Electro', 'Claymore', 4, 'Sumeru'),
('candace', 'Candace', 'Hydro', 'Polearm', 4, 'Sumeru'),
('cyno', 'Cyno', 'Electro', 'Polearm', 5, 'Sumeru'),
('nilou', 'Nilou', 'Hydro', 'Sword', 5, 'Sumeru'),
('nahida', 'Nahida', 'Dendro', 'Catalyst', 5, 'Sumeru'),
('layla', 'Layla', 'Cryo', 'Sword', 4, 'Sumeru'),
('faruzan', 'Faruzan', 'Anemo', 'Bow', 4, 'Sumeru'),
('wanderer', 'Wanderer', 'Anemo', 'Catalyst', 5, 'Sumeru'),
('alhaitham', 'Alhaitham', 'Dendro', 'Sword', 5, 'Sumeru'),
('yaoyao', 'Yaoyao', 'Dendro', 'Polearm', 4, 'Liyue'),
('dehya', 'Dehya', 'Pyro', 'Claymore', 5, 'Sumeru'),
('mika', 'Mika', 'Cryo', 'Polearm', 4, 'Mondstadt'),
('baizhu', 'Baizhu', 'Dendro', 'Catalyst', 5, 'Liyue'),
('kaveh', 'Kaveh', 'Dendro', 'Claymore', 4, 'Sumeru'),
('kirara', 'Kirara', 'Dendro', 'Sword', 4, 'Inazuma'),
('lynette', 'Lynette', 'Anemo', 'Sword', 4, 'Fontaine'),
('lyney', 'Lyney', 'Pyro', 'Bow', 5, 'Fontaine'),
('freminet', 'Freminet', 'Cryo', 'Claymore', 4, 'Fontaine'),
('neuvillette', 'Neuvillette', 'Hydro', 'Catalyst', 5, 'Fontaine'),
('wriothesley', 'Wriothesley', 'Cryo', 'Catalyst', 5, 'Fontaine'),
('charlotte', 'Charlotte', 'Cryo', 'Catalyst', 4, 'Fontaine'),
('furina', 'Furina', 'Hydro', 'Sword', 5, 'Fontaine'),
('navia', 'Navia', 'Geo', 'Claymore', 5, 'Fontaine'),
('chevreuse', 'Chevreuse', 'Pyro', 'Polearm', 4, 'Fontaine'),
('gaming', 'Gaming', 'Pyro', 'Claymore', 4, 'Liyue'),
('xianyun', 'Xianyun', 'Anemo', 'Catalyst', 5, 'Liyue'),
('chiori', 'Chiori', 'Geo', 'Sword', 5, 'Inazuma'),
('arlecchino', 'Arlecchino', 'Pyro', 'Polearm', 5, 'Snezhnaya'),
('clorinde', 'Clorinde', 'Cryo', 'Polearm', 4, 'Fontaine'),
('sethos', 'Sethos', 'Dendro', 'Bow', 5, 'Sumeru'),
('sigewinne', 'Sigewinne', 'Anemo', 'Catalyst', 5, 'Fontaine'),
('emilie', 'Emilie', 'Hydro', 'Claymore', 4, 'Fontaine'),
('kachina', 'Kachina', 'Hydro', 'Polearm', 4, 'Natlan'),
('mualani', 'Mualani', 'Hydro', 'Catalyst', 5, 'Natlan'),
('kinich', 'Kinich', 'Electro', 'Claymore', 5, 'Natlan'),
('xilonen', 'Xilonen', 'Dendro', 'Bow', 4, 'Natlan'),
('chasca', 'Chasca', 'Anemo', 'Bow', 5, 'Natlan'),
('ororon', 'Ororon', 'Electro', 'Bow', 4, 'Natlan'),
('citlali', 'Citlali', 'Cryo', 'Catalyst', 5, 'Natlan'),
('mavuika', 'Mavuika', 'Pyro', 'Claymore', 5, 'Natlan'),
('lan_yan', 'Lan Yan', 'Anemo', 'Catalyst', 4, 'Natlan'),
('yumemizuki_mizuki', 'Yumemizuki Mizuki', 'Anemo', 'Catalyst', 5, 'Inazuma'),
('iansan', 'Iansan', 'Electro', 'Polearm', 4, 'Natlan'),
('varesa', 'Varesa', 'Electro', 'Catalyst', 5, 'Natlan'),
('escoffier', 'Escoffier', 'Cryo', 'Polearm', 5, 'Fontaine'),
('ifa', 'Ifa', 'Hydro', 'Claymore', 4, 'Natlan'),
('skirk', 'Skirk', 'Cryo', 'Sword', 5, 'None'),
('dahlia', 'Dahlia', 'Hydro', 'Sword', 4, 'Mondstadt'),
('ineffa', 'Ineffa', 'Hydro', 'Claymore', 4, 'Nod-Krai'),
('aino', 'Aino', 'Hydro', 'Claymore', 4, 'Nod-Krai'),
('lauma', 'Lauma', 'Dendro', 'Catalyst', 5, 'Nod-Krai'),
('flins', 'Flins', 'Electro', 'Polearm', 5, 'Nod-Krai'),
('nefer', 'Nefer', 'Dendro', 'Catalyst', 5, 'Nod-Krai'),
('wonderland_manekin', 'Wonderland Manekin', 'None', 'Sword', 5, 'None');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` char(36) NOT NULL DEFAULT uuid(),
  `username` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum(`user`, `admin`) NOT NULL DEFAULT `user`,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO users (username, email, password, created_at) VALUES
('skywalker', 'skywalker@gmail.com', 'pw1234abc', '2024-01-05 10:15:23'),
('aurora', 'aurora@gmail.com', 'pass9981', '2024-01-06 14:22:10'),
('blitz', 'blitz@gmail.com', 'blitzpw55', '2024-01-07 09:01:45'),
('zenitsu', 'zenitsu@gmail.com', 'ztn89123', '2024-01-08 22:17:59'),
('keystone', 'keystone@gmail.com', 'key8800pw', '2024-01-09 11:45:32'),
('moonblade', 'moonblade@gmail.com', 'mb_pw778', '2024-01-11 08:29:14'),
('crimsonwolf', 'crimsonwolf@gmail.com', 'cw199222', '2024-01-11 12:41:05'),
('silverfox', 'silverfox@gmail.com', 'sf_pw443', '2024-01-12 18:55:33'),
('ember', 'ember@gmail.com', 'emB333pw', '2024-01-13 07:25:50'),
('pixelbyte', 'pixelbyte@gmail.com', 'pxB9090', '2024-01-14 15:37:12'),
('nova', 'nova@gmail.com', 'nvA121pw', '2024-01-15 21:11:09'),
('dragonstrike', 'dragonstrike@gmail.com', 'ds_pw786', '2024-01-17 16:24:47'),
('hikari', 'hikari@gmail.com', 'hkPw5551', '2024-01-18 19:58:11'),
('obsidian', 'obsidian@gmail.com', 'obPwd112', '2024-01-19 10:33:40'),
('stormwing', 'stormwing@gmail.com', 'sw_9912pw', '2024-01-20 13:20:28'),
('felicity', 'felicity@gmail.com', 'flc_pw882', '2024-01-21 09:47:55'),
('glacier', 'glacier@gmail.com', 'glc721pw', '2024-01-22 04:18:33'),
('cipher', 'cipher@gmail.com', 'cp_7781', '2024-01-23 23:12:44'),
('luminara', 'luminara@gmail.com', 'lm9933pw', '2024-01-24 17:16:00'),
('vanguard', 'vanguard@gmail.com', 'vg_p3318', '2024-01-25 20:49:27');


-- --------------------------------------------------------

--
-- Table structure for table `weapons`
--

CREATE TABLE `weapons` (
  `weapon_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `rarity` int(11) DEFAULT NULL CHECK (`rarity` between 1 and 5),
  `base_attack` int(11) DEFAULT NULL,
  `secondary_stat` varchar(100) DEFAULT NULL,
  `effect` text DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO weapons (name, type, rarity, base_attack, secondary_stat, effect) VALUES
('Dull Blade', 'Sword', 1, 185, NULL, 'None'),
('Silver Sword', 'Sword', 2, 243, NULL, 'None'),
('Cool Steel', 'Sword', 3, 401, 'ATK 35.2%', 'Bane of Water and Ice - Increases DMG against opponents affected by Hydro or Cryo by 12~24%.'),
('Dark Iron Sword', 'Sword', 3, 401, 'Elemental Mastery 141', 'Overloaded - \nUpon causing an Overloaded, Superconduct, Electro-Charged, Quicken, Aggravate, Hyperbloom, Lunar-Charged, or Electro-infused Swirl reaction, ATK is increased by 20~?% for 12s.'),
('Fillet Blade', 'Sword', 3, 401, 'ATK 35.2%', 'Gash\nOn hit, has 50% chance to deal 240~400% ATK DMG to a single enemy. Can only occur once every 15~11s.'),
('Harbinger of Dawn', 'Sword', 3, 401, 'CRIT DMG 46.9%', 'Vigorous\nWhen HP is above 90%, increases CRIT Rate by 14~28%.'),
('Skyrider Sword', 'Sword', 3, 354, 'Energy Recharge 51.7%', 'Determination\nUsing an Elemental Burst grants a 12~24% increase in ATK and Movement SPD for 15s.'),
('Traveler''s Handy Sword', 'Sword', 3, 448, 'DEF 29.3%', 'Journey\nEach Elemental Orb or Particle collected restores 1~2% HP.'),
('Amenoma Kageuchi', 'Sword', 4, 454, 'ATK 55.1%', 'Iwakura Succession\nAfter casting an Elemental Skill, gain 1 Succession Seed. This effect can be triggered once every 5s. The Succession Seed lasts for 30s. Up to 3 Succession Seeds may exist simultaneously. After using an Elemental Burst, all Succession Seeds are consumed and after 2s, the character regenerates 6~12 Energy for each seed consumed.'),
('Blackcliff Longsword', 'Sword', 4, 565, 'CRIT DMG 36.8%', 'Press the Advantage\nAfter defeating an opponent, ATK is increased by 12~24% for 30s. This effect has a maximum of 3 stacks, and the duration of each stack is independent of the others'),
('Calamity of Eshu', 'Sword', 4, 565, 'ATK 27.6%', 'Diffusing Boundary\nWhile characters are protected by a Shield, DMG dealt by Normal and Charged Attacks is increased by 20~40%, and Normal and Charged Attack CRIT Rate is increased by 8~16%.'),
('Cinnabar Spindle', 'Sword', 4, 454, 'DEF 69.0%', 'Spotless Heart\nElemental Skill DMG is increased by 40~80% of DEF. The effect will be triggered no more than once every 1.5s and will be cleared 0.1s after the Elemental Skill deals DMG.'),
('Favonius Sword', 'Sword', 4, 454, 'Energy Recharge 61.3%', 'Windfall\nCRIT hits have a 60~100% chance to generate a small amount of Elemental Particles, which will regenerate 6 Energy for the character. Can only occur once every 12~6s.'),
('Festering Desire', 'Sword', 4, 510, 'Energy Recharge 45.9%', 'Undying Admiration\nIncreases Elemental Skill DMG by 16~32% and Elemental Skill CRIT Rate by 6~12%.'),
('Finale of the Deep', 'Sword', 4, 565, 'ATK 27.6%', 'An End Sublime\nWhen using an Elemental Skill, ATK will be increased by 12~24% for 15s, and a Bond of Life worth 25% of Max HP will be granted. This effect can be triggered once every 10s. When the Bond of Life is cleared, a maximum of 150~300 ATK will be gained based on 2.4~4.8% of the total amount of the Life Bond cleared, lasting for 15s.'),
('Fleuve Cendre Ferryman', 'Sword', 4, 510, 'Energy Recharge 45.9%', 'Ironbone\nIncreases Elemental Skill CRIT Rate by 8~16%. Additionally, increases Energy Recharge by 16~32% for 5s after using an Elemental Skill.'),
('Flute of Ezpitzal', 'Sword', 4, 454, 'DEF 69.0%', 'Smoke-and-Mirror Mystery\nUsing an Elemental Skill increases DEF by 16~32% for 15s.'),
('Iron Sting', 'Sword', 4, 510, 'Elemental Mastery 165', 'Infusion Stinger\nDealing Elemental DMG increases all DMG by 6~12% for 6s. Max 2 stacks. Can only occur once every 1s.'),
('Kagotsurube Isshin', 'Sword', 4, 510, 'ATK 41.3%', 'Isshin Art Clarity\nWhen a Normal, Charged, or Plunging Attack hits an opponent, it will whip up a Hewing Gale, dealing AoE DMG equal to 180% of ATK and increasing ATK by 15% for 8s. This effect can be triggered once every 8s.'),
('Lion''s Roar', 'Sword', 4, 510, 'ATK 41.3%', 'Bane of Fire and Thunder\nIncreases DMG against enemies affected by Pyro or Electro by 20~36%.'),
('Moonweaver''s Dawn', 'Sword', 4, 565, 'ATK 27.6%', 'Secret Silver''s Testament\nIncreases Elemental Burst DMG by 20~40%. When the equipping character''s Energy Capacity does not exceed 60/40, their Elemental Burst DMG is increased by an additional 16%/28~32%/56%.'),
('Prototype Rancour', 'Sword', 4, 565, 'Physical DMG Bonus 34.5%', 'Smashed Stone\nOn hit, Normal or Charged Attacks increase ATK and DEF by 4~8% for 6s. Max 4 stacks. This effect can only occur once every 0.3s.'),
('Royal Longsword', 'Sword', 4, 510, 'ATK 41.3%', 'Focus\nUpon dealing damage to an opponent, increases CRIT Rate by 8~16%. Max 5 stacks. A CRIT hit removes all existing stacks.'),
('Sacrificial Sword', 'Sword', 4, 454, 'Energy Recharge 61.3%', 'Composed\nAfter dealing damage to an opponent with an Elemental Skill, the skill has a 40~80% chance to end its own CD. Can only occur once every 30~16s.'),
('Sapwood Blade', 'Sword', 4, 565, 'Energy Recharge 30.6%', 'Forest Sanctuary\nAfter triggering Burning, Quicken, Aggravate, Spread, Bloom, Lunar-Bloom, Hyperbloom, or Burgeon, a Leaf of Consciousness will be created around the character for a maximum of 10s. When picked up, the Leaf will grant the character 60~120 Elemental Mastery for 12s. Only 1 Leaf can be generated this way every 20s. This effect can still be triggered if the character is not on the field. The Leaf of Consciousness'' effect cannot stack.'),
('Serenity''s Call', 'Sword', 4, 454, 'Energy Recharge 61.3%', 'Solemn Silence\nUpon causing an Elemental Reaction, increases Max HP by 16~32% for 12s. Moonsign: Ascendant Gleam: Max HP from this effect is further increased by 16~32%. This effect can be triggered even if the equipping character is off-field.'),
('Sturdy Bone', 'Sword', 4, 565, 'ATK 27.6%', 'Trapper''s Pride\nSprint or Alternate Sprint Stamina Consumption decreased by 15%. Additionally, after using Sprint or Alternate Sprint, Normal Attack DMG is increased by 16~32% of ATK. This effect expires after triggering 18 times or 7s.'),
('Sword of Descension', 'Sword', 4, 440, 'ATK 35.2%', 'Descension\nEffective only on the following platform: PlayStation Network\nHitting enemies with Normal or Charged Attacks grants a 50% chance to deal 200% ATK as DMG in a small AoE. This effect can only occur once every 10s.\nAdditionally, if the Traveler equips the Sword of Descension, their ATK is increased by 66.'),
('Sword of Narzissenkreuz', 'Sword', 4, 510, 'ATK 41.3%', 'Hero''s Blade\nWhen the equipping character does not have an Arkhe: When Normal Attacks, Charged Attacks, or Plunging Attacks strike, a Pneuma or Ousia energy blast will be unleashed, dealing 160~320% of ATK as DMG. This effect can be triggered once every 12s. The energy blast type is determined by the current type of the Sword of Narzissenkreuz.'),
('The Alley Flash', 'Sword', 4, 620, 'Elemental Mastery 55', 'Itinerant Hero\nIncreases DMG dealt by the character equipping this weapon by 12~24%. Taking DMG disables this effect for 5s.'),
('The Black Sword', 'Sword', 4, 510, 'CRIT Rate 27.6%', 'Justice\nIncreases DMG dealt by Normal and Charged Attacks by 20~40%.\nAdditionally, regenerates 60~100% of ATK as HP when Normal and Charged Attacks score a CRIT Hit. This effect can occur once every 5s.'),
('The Dockhand''s Assistant', 'Sword', 4, 510, 'HP 41.3%', 'Sea Shanty\nWhen the wielder is healed or heals others, they will gain a Stoic''s Symbol that lasts 30s, up to a maximum of 3 Symbols. When using their Elemental Skill or Burst, all Symbols will be consumed and the Roused effect will be granted for 10s. For each Symbol consumed, gain 40~80 Elemental Mastery, and 2s after the effect occurs, 2~4 Energy per Symbol consumed will be restored for said character. The Roused effect can be triggered once every 15s, and Symbols can be gained even when the character is not on the field.'),
('The Flute', 'Sword', 4, 510, 'ATK 41.3%', 'Chord\nNormal or Charged Attacks grant a Harmonic on hits. Gaining 5 Harmonics triggers the power of music and deals 100~200% ATK DMG to surrounding enemies. Harmonics last up to 30s, and a maximum of 1 can be gained every 0.5s.'),
('Toukabou Shigure', 'Sword', 4, 510, 'Elemental Mastery 165', 'Kaidan: Rainfall Earthbinder\nAfter an attack hits opponents, it will inflict an instance of Cursed Parasol upon one of them for 10s. This effect can be triggered once every 15s. If this opponent is defeated during Cursed Parasol''s duration, Cursed Parasol''s CD will be refreshed immediately. The character wielding this weapon will deal 16~32% more DMG to the opponent affected by Cursed Parasol.'),
('Wolf-Fang', 'Sword', 4, 510, 'CRIT Rate 27.6%', 'Northwind Wolf\nDMG dealt by Elemental Skill and Elemental Burst is increased by 16~32%. When an Elemental Skill hits an opponent, its CRIT Rate will be increased by 2~4%. When an Elemental Burst hits an opponent, its CRIT Rate will be increased by 2~4%. Both of these effects last 10s separately, have 4 max stacks, and can be triggered once every 0.1s.'),
('Xiphos'' Moonlight', 'Sword', 4, 510, 'Elemental Mastery 165', 'Jinni''s Whisper\nThe following effect will trigger every 10s: The equipping character will gain 0.036~0.072% Energy Recharge for each point of Elemental Mastery they possess for 12s, with nearby party members gaining 30% of this buff for the same duration. Multiple instances of this weapon can allow this buff to stack. This effect will still trigger even if the character is not on the field.'),
('Absolution', 'Sword', 5, 674, 'CRIT DMG 44.1%', 'Deathly Pact\nCRIT DMG increased by 20~40%. Increasing the value of a Bond of Life increases the DMG the equipping character deals by 16~32% for 6s. Max 3 stacks.'),
('Aquila Favonia', 'Sword', 5, 674, 'Physical DMG Bonus 41.3%', 'Falcon''s Defiance\nATK is increased by 20~40%. Triggers on taking DMG: the soul of the Falcon of the West awakens, holding the banner of the resistance aloft, regenerating HP equal to 100~160% of ATK and dealing 200~320% of ATK as DMG to surrounding opponents. This effect can only occur once every 15s.'),
('Azurelight', 'Sword', 5, 674, 'CRIT Rate 22.1%', 'White Mountain''s Bounty\nWithin 12s after an Elemental Skill is used, ATK is increased by 24~48%. During this time, when the equipping character has 0 Energy, ATK will be further increased by 24~48%, and CRIT DMG will be increased by 40~80%.'),
('Freedom-Sworn', 'Sword', 5, 608, 'Elemental Mastery 198', 'Revolutionary Chorale\nA part of the Millennial Movement that wanders amidst the winds.\nIncreases DMG by 10~20%.\nWhen the character wielding this weapon triggers Elemental Reactions, they gain a Sigil of Rebellion. This effect can be triggered once every 0.5s and can be triggered even if said character is not on the field.\nWhen you possess 2 Sigils of Rebellion, all of them will be consumed and all nearby party members will obtain Millennial Movement: Song of Resistance for 12s.\nMillennial Movement: Song of Resistance increases Normal, Charged, and Plunging Attack DMG by 16~32% and increases ATK by 20~40%. Once this effect is triggered, you will not gain Sigils of Rebellion for 20s.\nOf the many effects of the Millennial Movement, buffs of the same type will not stack.'),
('Haran Geppaku Futsu', 'Sword', 5, 608, 'CRIT Rate 33.1%', 'Honed Flow\nObtain 12~24% All Elemental DMG Bonus. When other nearby party members use Elemental Skills, the character equipping this weapon will gain 1 Wavespike stack. Max 2 stacks. This effect can be triggered once every 0.3s. When the character equipping this weapon uses an Elemental Skill, all stacks of Wavespike will be consumed to gain Rippling Upheaval: each stack of Wavespike consumed will increase Normal Attack DMG by 20~40% for 8s.'),
('Key of Khaj-Nisut', 'Sword', 5, 542, 'HP 66.2%', 'Sunken Song of the Sands\nHP increased by 20~40%. When an Elemental Skill hits opponents, you gain the Grand Hymn effect for 20s. This effect increases the equipping character''s Elemental Mastery by 0.12~0.24% of their Max HP. This effect can trigger once every 0.3s. Max 3 stacks. When this effect gains 3 stacks, or when the third stack''s duration is refreshed, the Elemental Mastery of all nearby party members will be increased by 0.2~0.4% of the equipping character''s max HP for 20s.'),
('Light of Foliar Incision', 'Sword', 5, 542, 'CRIT DMG 88.2%', 'Whitemoon Bristle\nCRIT Rate is increased by 4~8%. After Normal Attacks deal Elemental DMG, the Foliar Incision effect will be obtained, increasing DMG dealt by Normal Attacks and Elemental Skills by 120~240% of Elemental Mastery. This effect will disappear after 28 DMG instances or 12s. You can obtain Foliar Incision once every 12s.'),
('Mistsplitter Reforged', 'Sword', 5, 674, 'CRIT DMG 44.1%', 'Mistsplitter''s Edge\nGain a 12~24% Elemental DMG Bonus for all elements and receive the might of the Mistsplitter''s Emblem. At stack levels 1/2/3, Mistsplitter''s Emblem provides a 8/16/28~16/32/56% Elemental DMG Bonus for the character''s Elemental Type. The character will obtain 1 stack of Mistsplitter''s Emblem in each of the following scenarios: Normal Attack deals Elemental DMG (stack lasts 5s), casting Elemental Burst (stack lasts 10s); Energy is less than 100% (stack disappears when Energy is full). Each stack''s duration is calculated independently.'),
('Peak Patrol Song', 'Sword', 5, 542, 'DEF 82.7%', 'Halcyon Years Unending\nGain Ode to Flowers after Normal or Plunging Attacks hit an opponent: DEF increases by 8~16% and gain a 10~20% All Elemental DMG Bonus for 6s. Max 2 stacks. Can trigger once per 0.1s. When this effect reaches 2 stacks or the 2nd stack''s duration is refreshed, increase all nearby party members'' All Elemental DMG Bonus by 8~16% for every 1,000 DEF the equipping character has, up to a maximum of 25.6~51.2%, for 15s.'),
('Primordial Jade Cutter', 'Sword', 5, 542, 'CRIT Rate 44.1%', 'Protector''s Virtue\nHP increased by 20~40%. Additionally, provides an ATK Bonus based on 1.2~2.4% of the wielder''s Max HP.'),
('Skyward Blade', 'Sword', 5, 608, 'Energy Recharge 55.1%', 'Sky-Piercing Fang\nCRIT Rate increased by 4~8%. Gains Skypiercing Might upon using an Elemental Burst: Increases Movement SPD by 10%, increases ATK SPD by 10%, and Normal and Charged hits deal additional DMG equal to 20~40% of ATK. Skypiercing Might lasts for 12s.'),
('Splendor of Tranquil Waters', 'Sword', 5, 542, 'CRIT DMG 88.2%', 'Dawn and Dusk by the Lake\nWhen the equipping character''s current HP increases or decreases, Elemental Skill DMG dealt will be increased by 8~16% for 6s. Max 3 stacks. This effect can be triggered once every 0.2s. When other party members'' current HP increases or decreases, the equipping character''s Max HP will be increased by 14~28% for 6s. Max 2 stacks. This effect can be triggered once every 0.2s. The aforementioned effects can be triggered even if the wielder is off-field.'),
('Summit Shaper', 'Sword', 5, 608, 'ATK 49.6%', 'Golden Majesty\nIncreases Shield Strength by 20~40%. Scoring hits on opponents increases ATK by 4~8% for 8s. Max 5 stacks. Can only occur once every 0.3s. While protected by a shield, this ATK increase effect is increased by 100%.'),
('Uraku Misugiri', 'Sword', 5, 542, 'CRIT DMG 88.2%', 'Brocade Bloom, Shrine Sword\nNormal Attack DMG is increased by 16~32% and Elemental Skill DMG is increased by 24~48%. After a nearby active character deals Geo DMG, the aforementioned effects increase by 100% for 15s. Additionally, the wielder''s DEF is increased by 20~40%.');
('Waster Greatsword', 'Claymore', 1, 185, 'None', 'None'),
('Old Merc''s Pal', 'Claymore', 2, 243, 'None', 'None'),
('Bloodtainted Greatsword', 'Claymore', 3, 354, 'Elemental Mastery 187', 'Bane of Fire and Thunder\nIncreases DMG against opponents affected by Pyro or Electro by 12~24%.'),
('Debate Club', 'Claymore', 3, 401, 'ATK 35.2%', 'Blunt Conclusion\nAfter using an Elemental Skill, Normal or Charged Attacks, on hit, deal an additional 60~120% ATK DMG in a small area. Effect lasts 15s. DMG can only occur once every 3s.'),
('Ferrous Shadow', 'Claymore', 3, 401, 'HP 35.2%', 'Unbending\nWhen HP falls below 70~90%, increases Charged Attack DMG by 30~50%, and Charged Attacks become much harder to interrupt.'),
('Skyrider Greatsword', 'Claymore', 3, 401, 'Physical DMG Bonus 43.9%', 'Courage\nOn hit, Normal or Charged Attacks increase ATK by 6~10% for 6s. Max 4 stacks. Can only occur once every 0.5s.'),
('White Iron Greatsword', 'Claymore', 3, 401, 'DEF 43.9%', 'Cull the Weak\nDefeating an opponent restores 8~16% HP.'),
('Ultimate Overlord''s Mega Magic Sword', 'Claymore', 4, 565, 'Energy Recharge 30.6%', 'Melussistance!\nATK increased by 12~24%. That''s not all! The support from all Melusines you''ve helped in Merusea Village fills you with strength! Based on the number of them you''ve helped, your ATK is increased by up to an additional 12~24%.'),
('Akuoumaru', 'Claymore', 4, 510, 'ATK 41.3%', 'Watatsumi Wavewalker\nFor every point of the entire party''s combined maximum Energy capacity, the Elemental Burst DMG of the character equipping this weapon is increased by 0.12~0.24%. A maximum of 40~80% increased Elemental Burst DMG can be achieved this way.'),
('Blackcliff Slasher', 'Claymore', 4, 510, 'CRIT DMG 55.1%', 'Press the Advantage\nAfter defeating an opponent, ATK is increased by 12~24% for 30s. This effect has a maximum of 3 stacks, and the duration of each stack is independent of the others.'),
('Earth Shaker', 'Claymore', 4, 565, 'ATK 27.6%', 'Oath of Qhapaq Nan\nAfter a party member triggers a Pyro-related reaction, the equipping character''s Elemental Skill DMG is increased by 16~32% for 8s. This effect can be triggered even when the triggering party member is not on the field.'),
('Favonius Greatsword', 'Claymore', 4, 454, 'Energy Recharge 61.3%', 'Windfall\nCRIT hits have a 60~100% chance to generate a small amount of Elemental Particles, which will regenerate 6 Energy for the character. Can only occur once every 12~6s.'),
('Flame-Forged Insight', 'Claymore', 4, 510, 'Elemental Mastery 165', 'Mind in Bloom\nWhen Electro-Charged, Lunar-Charged, Bloom, or Lunar-Bloom is triggered, restore 12~24 Elemental Energy and increase Elemental Mastery by 60~120 for 15 seconds. This effect can be triggered once every 15s and can be triggered even when the equipping character is off-field.'),
('Forest Regalia', 'Claymore', 4, 565, 'Energy Recharge 30.6%', 'Forest Sanctuary\nAfter triggering Burning, Quicken, Aggravate, Spread, Bloom, Hyperbloom, or Burgeon, a Leaf of Consciousness will be created around the character for a maximum of 10s. When picked up, the Leaf will grant the character 60~120 Elemental Mastery for 12s. Only 1 Leaf can be generated this way every 20s. This effect can still be triggered if the character is not on the field. The Leaf of Consciousness'' effect cannot stack.'),
('Fruitful Hook', 'Claymore', 4, 565, 'ATK 27.6%', 'The Weight of Falling Branches\nIncrease Plunging Attack CRIT Rate by 16~32%; After a Plunging Attack hits an opponent, Normal, Charged, and Plunging Attack DMG increased by 16~32% for 10s'),
('Katsuragikiri Nagamasa', 'Claymore', 4, 510, 'Energy Recharge 45.9%', 'Samurai Conduct\nIncreases Elemental Skill DMG by 6~12%. After Elemental Skill hits an opponent, the character loses 3 Energy but regenerates 3~5 Energy every 2s for the next 6s. This effect can occur once every 10s. Can be triggered even when the character is not on the field.'),
('Lithic Blade', 'Claymore', 4, 510, 'ATK 41.3%', 'Lithic Axiom: Unity\nFor every character in the party who hails from Liyue, the character who equips this weapon gains 7~11% ATK increase and 3~7% CRIT Rate increase. This effect stacks up to 4 times.'),
('Luxurious Sea-Lord', 'Claymore', 4, 454, 'ATK 55.1%', 'Oceanic Victory\nIncreases Elemental Burst DMG by 12~24%. When Elemental Burst hits opponents, there is a 100% chance of summoning a huge onrush of tuna that deals 100~200% ATK as AoE DMG. This effect can occur once every 15s.'),
('Mailed Flower', 'Claymore', 4, 565, 'Elemental Mastery 110', 'Whispers of Wind and Flower\nWithin 8s after the character''s Elemental Skill hits an opponent or the character triggers an Elemental Reaction, their ATK and Elemental Mastery will be increased by 12~24% and 48~96 respectively.'),
('Makhaira Aquamarine', 'Claymore', 4, 510, 'Elemental Mastery 165', 'Desert Pavilion\nThe following effect will trigger every 10s: The equipping character will gain 24~48% of their Elemental Mastery as bonus ATK for 12s, with nearby party members gaining 30% of this buff for the same duration. Multiple instances of this weapon can allow this buff to stack. This effect will still trigger even if the character is not on the field.'),
('Master Key', 'Claymore', 4, 454, 'Energy Recharge 61.3%', 'Fall Into Place\nUpon causing an Elemental Reaction, increases Elemental Mastery by 60~120 for 12s. Moonsign: Ascendant Gleam: Elemental Mastery from this effect is further increased by 60~120. This effect can be triggered even if the equipping character is off-field.'),
('Portable Power Saw', 'Claymore', 4, 454, 'HP 55.1%', 'Sea Shanty\nWhen the wielder is healed or heals others, they will gain a Stoic''s Symbol that lasts 30s, up to a maximum of 3 Symbols. When using their Elemental Skill or Burst, all Symbols will be consumed and the Roused effect will be granted for 10s. For each Symbol consumed, gain 40~80 Elemental Mastery, and 2s after the effect occurs, 2~4 Energy per Symbol consumed will be restored for said character. The Roused effect can be triggered once every 15s, and Symbols can be gained even when the character is not on the field'),
('Prototype Archaic', 'Claymore', 4, 565, 'ATK 27.6%', 'Crush\nOn hit, Normal or Charged Attacks have a 50% chance to deal an additional 240~480% ATK DMG to opponents within a small AoE. Can only occur once every 15s.'),
('Rainslasher', 'Claymore', 4, 510, 'Elemental Mastery 165', 'Bane of Storm and Tide\nIncreases DMG against opponents affected by Hydro or Electro by 20~36%.'),
('Royal Greatsword', 'Claymore', 4, 565, 'ATK 27.6%', 'Focus\nUpon dealing damage to an opponent, increases CRIT Rate by 8~16%. Max 5 stacks. A CRIT hit removes all existing stacks.'),
('Sacrificial Greatsword', 'Claymore', 4, 565, 'Energy Recharge 30.6%', 'Composed\nAfter dealing damage to an opponent with an Elemental Skill, the skill has a 40~80% chance to end its own CD. Can only occur once every 30~16s.'),
('Serpent Spine', 'Claymore', 4, 510, 'CRIT Rate 27.6%', 'Wavesplitter\nEvery 4s a character is on the field, they will deal 6~10% more DMG and take 3~2% more DMG. This effect has a maximum of 5 stacks and will not be reset if the character leaves the field, but will be reduced by 1 stack when the character takes DMG.'),
('Snow-Tombed Starsilver', 'Claymore', 4, 565, 'Physical DMG Bonus 34.5%', 'Frost Burial\nHitting an opponent with Normal and Charged Attacks has a 60~100% chance of forming and dropping an Everfrost Icicle above them, dealing AoE DMG equal to 80~140% of ATK. Opponents affected by Cryo are instead dealt DMG equal to 200~360% of ATK. Can only occur once every 10s.'),
('Talking Stick', 'Claymore', 4, 565, 'CRIT Rate 18.4%', 'The Silver Tongue\nATK will be increased by 16~32% for 15s after being affected by Pyro. This effect can be triggered once every 12s. All Elemental DMG Bonus will be increased by 12~24% for 15s after being affected by Hydro, Cryo, Electro, or Dendro. This effect can be triggered once every 12s.'),
('The Bell', 'Claymore', 4, 510, 'HP 41.3%', 'Rebellious Guardian\nTaking DMG generates a shield which absorbs DMG up to 20~32% of max HP. This shield lasts for 10s or until broken, and can only be triggered once every 45s. While protected by a shield, the character gains 12~24% increased DMG.'),
('Tidal Shadow', 'Claymore', 4, 510, 'ATK 41.3%', 'White Cruising Wave\nAfter the wielder is healed, ATK will be increased by 24~48% for 8s. This can be triggered even when the character is not on the field.'),
('Whiteblind', 'Claymore', 4, 510, 'DEF 51.7%', 'Infusion Blade\nOn hit, Normal or Charged Attacks increase ATK and DEF by 6~12% for 6s. Max 4 stacks (24~48% total). Can only occur once every 0.5s.'),
('A Thousand Blazing Suns', 'Claymore', 5, 741, 'CRIT Rate 33.1%', 'Sunset Reignites the Dawn\nGain the Scorching Brilliance effect when using an Elemental Skill or Burst: CRIT DMG increased by 20~40% and ATK increased by 28~56% for 6s. This effect can trigger once every 10s.\nWhile a Scorching Brilliance instance is active, its duration is increased by 2s after Normal or Charged attacks deal Elemental DMG. This effect can trigger once every second, and the max duration increase is 6s.\nAdditionally, when the equipping character is in the Nightsoul''s Blessing state, Scorching Brilliance effects are increased by 75%, and its duration will not count down when the equipping character is off-field.'),
('Beacon of the Reed Sea', 'Claymore', 5, 608, 'CRIT Rate 33.1%', 'Desert Watch\nAfter the character''s Elemental Skill hits an opponent, their ATK will be increased by 20~40% for 8s. After the character takes DMG, their ATK will be increased by 20~40% for 8s. The 2 aforementioned effects can be triggered even when the character is not on the field. Additionally, when not protected by a shield, the character''s Max HP will be increased by 32~64%.'),
('Fang of the Mountain King', 'Claymore', 5, 741, 'CRIT Rate 11.0%', 'Turquoise Hunt\nGain 1 stack of Canopy''s Favor after hitting an opponent with an Elemental Skill. This can be triggered once every 0.5s. After a nearby party member triggers a Burning or Burgeon reaction, the equipping character will gain 3 stacks. This effect can be triggered once every 2s and can be triggered even when the triggering party member is off-field. Canopy''s Favor: Elemental Skill and Burst DMG is increased by 10~20% for 6s. Max 6 stacks. Each stack is counted independently.');


--
-- Indexes for dumped tables
--

--
-- Indexes for table `artifacts`
--
ALTER TABLE `artifacts`
  ADD PRIMARY KEY (`artifact_id`);

--
-- Indexes for table `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`character_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `weapons`
--
ALTER TABLE `weapons`
  ADD PRIMARY KEY (`weapon_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artifacts`
--
ALTER TABLE `artifacts`
  MODIFY `artifact_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `weapons`
--
ALTER TABLE `weapons`
  MODIFY `weapon_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
