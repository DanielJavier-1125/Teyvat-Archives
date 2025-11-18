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
  `artifact_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `set_bonus_2pc` text DEFAULT NULL,
  `set_bonus_4pc` text DEFAULT NULL,
  `rarity` int(11) DEFAULT NULL CHECK (`rarity` between 1 and 5),
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
