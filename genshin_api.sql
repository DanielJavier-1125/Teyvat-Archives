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
  `image_url` varchar(255) DEFAULT NULL,
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
  `region` varchar(50) DEFAULT NULL,

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
