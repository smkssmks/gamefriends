-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2023-07-16 21:11:41
-- サーバのバージョン： 10.4.27-MariaDB
-- PHP のバージョン: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `gamefriends`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `games`
--

CREATE TABLE `games` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'gameimage.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `games`
--

INSERT INTO `games` (`id`, `name`, `image`, `created_at`, `updated_at`) VALUES
(1, 'スマッシュブラザーズSPECIAL（ガチ）', 'img/sumabura.png', '2023-06-03 14:39:55', '2023-06-03 14:39:55'),
(2, 'スマッシュブラザーズSPECIAL（エンジョイ）', 'img/sumabura.png', '2023-06-03 14:42:24', '2023-06-03 14:42:24'),
(3, 'スプラトゥーン3（ガチ）', 'img/spla.png', '2023-06-03 14:42:24', '2023-06-03 14:42:24'),
(4, 'スプラトゥーン3（エンジョイ）', 'img/spla.png', '2023-06-03 14:48:10', '2023-06-03 14:48:10'),
(5, 'モンスターハンターライズ（ガチ）', 'img/monhan.png', '2023-06-04 04:57:09', '2023-06-04 04:57:09'),
(6, 'モンスターハンターライズ（エンジョイ）', 'img/monhan.png', '2023-06-03 14:50:05', '2023-06-03 14:50:05'),
(7, 'APEX LEGENDS（ガチ）', 'img/apex.png', '2023-06-03 14:50:05', '2023-06-03 14:50:05'),
(8, 'APEX LEGENDS（エンジョイ）', 'img/apex.png', NULL, NULL),
(9, 'Dead by Daylight（ガチ）', 'img/dead.png', NULL, NULL),
(10, 'Dead by Daylight（エンジョイ）', 'img/dead.png', NULL, NULL),
(11, 'VALORANT（ガチ）', 'img/valo.png', NULL, NULL),
(12, 'VALORANT（エンジョイ）', 'img/valo.png', NULL, NULL),
(13, 'Shadowverse（ガチ）', 'img/shadove.png', NULL, NULL),
(14, 'Shadowverse（エンジョイ）', 'img/shadove.png', NULL, NULL);

-- --------------------------------------------------------

--
-- テーブルの構造 `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `play_games`
--

CREATE TABLE `play_games` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `game_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `play_games`
--

INSERT INTO `play_games` (`id`, `user_id`, `game_id`, `created_at`, `updated_at`) VALUES
(24, 3, 3, '2023-06-12 11:54:02', '2023-06-12 11:54:02'),
(28, 4, 1, '2023-06-25 13:20:57', '2023-06-25 13:20:57'),
(29, 4, 2, '2023-06-25 13:20:57', '2023-06-25 13:20:57'),
(30, 4, 3, '2023-06-25 13:20:57', '2023-06-25 13:20:57'),
(31, 4, 4, '2023-06-25 13:20:57', '2023-06-25 13:20:57'),
(32, 4, 5, '2023-06-25 13:20:57', '2023-06-25 13:20:57'),
(33, 4, 6, '2023-06-25 13:20:57', '2023-06-25 13:20:57'),
(34, 4, 7, '2023-06-25 13:20:57', '2023-06-25 13:20:57'),
(35, 5, 5, '2023-06-26 13:56:34', '2023-06-26 13:56:34'),
(36, 6, 6, '2023-06-26 13:58:20', '2023-06-26 13:58:20'),
(37, 7, 7, '2023-06-26 14:00:11', '2023-06-26 14:00:11'),
(38, 8, 2, '2023-06-26 14:03:45', '2023-06-26 14:03:45'),
(39, 8, 4, '2023-06-26 14:03:45', '2023-06-26 14:03:45'),
(40, 8, 6, '2023-06-26 14:03:45', '2023-06-26 14:03:45'),
(41, 9, 3, '2023-06-26 14:06:08', '2023-06-26 14:06:08'),
(42, 9, 7, '2023-06-26 14:06:08', '2023-06-26 14:06:08'),
(43, 13, 1, '2023-07-10 11:12:37', '2023-07-10 11:12:37'),
(44, 13, 2, '2023-07-10 11:12:37', '2023-07-10 11:12:37'),
(45, 13, 3, '2023-07-10 11:12:37', '2023-07-10 11:12:37'),
(46, 13, 4, '2023-07-10 11:12:37', '2023-07-10 11:12:37'),
(47, 13, 5, '2023-07-10 11:12:37', '2023-07-10 11:12:37'),
(48, 13, 6, '2023-07-10 11:12:37', '2023-07-10 11:12:37'),
(49, 13, 7, '2023-07-10 11:12:37', '2023-07-10 11:12:37'),
(50, 17, 1, '2023-07-11 12:12:08', '2023-07-11 12:12:08'),
(51, 17, 2, '2023-07-11 12:12:08', '2023-07-11 12:12:08'),
(52, 17, 3, '2023-07-11 12:12:08', '2023-07-11 12:12:08'),
(53, 17, 4, '2023-07-11 12:12:08', '2023-07-11 12:12:08'),
(54, 17, 5, '2023-07-11 12:12:08', '2023-07-11 12:12:08'),
(55, 17, 6, '2023-07-11 12:12:08', '2023-07-11 12:12:08'),
(56, 17, 7, '2023-07-11 12:12:08', '2023-07-11 12:12:08'),
(57, 18, 1, '2023-07-11 12:20:11', '2023-07-11 12:20:11'),
(58, 18, 2, '2023-07-11 12:20:11', '2023-07-11 12:20:11'),
(59, 18, 3, '2023-07-11 12:20:11', '2023-07-11 12:20:11'),
(60, 18, 4, '2023-07-11 12:20:11', '2023-07-11 12:20:11'),
(61, 18, 5, '2023-07-11 12:20:11', '2023-07-11 12:20:11'),
(62, 18, 6, '2023-07-11 12:20:11', '2023-07-11 12:20:11'),
(63, 18, 7, '2023-07-11 12:20:11', '2023-07-11 12:20:11'),
(64, 19, 1, '2023-07-11 12:41:14', '2023-07-11 12:41:14'),
(65, 19, 2, '2023-07-11 12:41:14', '2023-07-11 12:41:14'),
(66, 19, 3, '2023-07-11 12:41:14', '2023-07-11 12:41:14'),
(67, 19, 4, '2023-07-11 12:41:14', '2023-07-11 12:41:14'),
(68, 19, 5, '2023-07-11 12:41:14', '2023-07-11 12:41:14'),
(69, 19, 6, '2023-07-11 12:41:14', '2023-07-11 12:41:14'),
(70, 19, 7, '2023-07-11 12:41:14', '2023-07-11 12:41:14'),
(84, 2, 1, '2023-07-12 13:21:16', '2023-07-12 13:21:16'),
(85, 2, 2, '2023-07-12 13:21:16', '2023-07-12 13:21:16'),
(86, 2, 3, '2023-07-12 13:29:30', '2023-07-12 13:29:30'),
(87, 2, 8, '2023-07-12 13:29:36', '2023-07-12 13:29:36'),
(88, 2, 12, '2023-07-12 13:29:36', '2023-07-12 13:29:36'),
(89, 1, 1, '2023-07-12 13:32:33', '2023-07-12 13:32:33'),
(90, 1, 14, '2023-07-12 13:32:38', '2023-07-12 13:32:38'),
(91, 3, 5, '2023-07-13 12:59:41', '2023-07-13 12:59:41'),
(92, 3, 8, '2023-07-13 12:59:41', '2023-07-13 12:59:41'),
(93, 3, 11, '2023-07-13 12:59:41', '2023-07-13 12:59:41'),
(94, 3, 14, '2023-07-13 12:59:41', '2023-07-13 12:59:41'),
(95, 5, 4, '2023-07-13 13:08:47', '2023-07-13 13:08:47'),
(96, 5, 8, '2023-07-13 13:08:47', '2023-07-13 13:08:47'),
(97, 5, 9, '2023-07-13 13:08:47', '2023-07-13 13:08:47'),
(98, 5, 12, '2023-07-13 13:08:47', '2023-07-13 13:08:47'),
(99, 5, 13, '2023-07-13 13:08:47', '2023-07-13 13:08:47'),
(100, 6, 2, '2023-07-13 13:09:28', '2023-07-13 13:09:28'),
(101, 6, 4, '2023-07-13 13:09:28', '2023-07-13 13:09:28'),
(102, 6, 8, '2023-07-13 13:09:28', '2023-07-13 13:09:28'),
(103, 6, 11, '2023-07-13 13:09:28', '2023-07-13 13:09:28'),
(104, 6, 13, '2023-07-13 13:09:28', '2023-07-13 13:09:28'),
(105, 7, 1, '2023-07-13 13:11:38', '2023-07-13 13:11:38'),
(106, 7, 3, '2023-07-13 13:11:38', '2023-07-13 13:11:38'),
(107, 7, 5, '2023-07-13 13:11:38', '2023-07-13 13:11:38'),
(108, 7, 9, '2023-07-13 13:11:38', '2023-07-13 13:11:38'),
(109, 7, 11, '2023-07-13 13:11:38', '2023-07-13 13:11:38'),
(110, 7, 13, '2023-07-13 13:11:38', '2023-07-13 13:11:38'),
(111, 16, 1, '2023-07-13 13:20:29', '2023-07-13 13:20:29'),
(112, 16, 5, '2023-07-13 13:20:29', '2023-07-13 13:20:29'),
(113, 16, 6, '2023-07-13 13:20:29', '2023-07-13 13:20:29'),
(114, 16, 7, '2023-07-13 13:20:29', '2023-07-13 13:20:29'),
(115, 16, 8, '2023-07-13 13:20:29', '2023-07-13 13:20:29'),
(116, 16, 9, '2023-07-13 13:20:29', '2023-07-13 13:20:29'),
(117, 16, 11, '2023-07-13 13:20:29', '2023-07-13 13:20:29'),
(118, 16, 12, '2023-07-13 13:20:29', '2023-07-13 13:20:29'),
(119, 16, 13, '2023-07-13 13:20:29', '2023-07-13 13:20:29'),
(120, 16, 14, '2023-07-13 13:20:29', '2023-07-13 13:20:29'),
(121, 20, 2, '2023-07-15 09:54:31', '2023-07-15 09:54:31'),
(122, 20, 4, '2023-07-15 09:54:31', '2023-07-15 09:54:31'),
(123, 20, 6, '2023-07-15 09:54:31', '2023-07-15 09:54:31'),
(124, 20, 8, '2023-07-15 09:54:31', '2023-07-15 09:54:31'),
(125, 20, 10, '2023-07-15 09:54:31', '2023-07-15 09:54:31'),
(126, 20, 12, '2023-07-15 09:54:31', '2023-07-15 09:54:31'),
(127, 20, 14, '2023-07-15 09:54:31', '2023-07-15 09:54:31'),
(128, 21, 1, '2023-07-15 09:55:52', '2023-07-15 09:55:52'),
(129, 21, 5, '2023-07-15 09:55:52', '2023-07-15 09:55:52'),
(130, 21, 6, '2023-07-15 09:55:52', '2023-07-15 09:55:52'),
(131, 21, 7, '2023-07-15 09:55:52', '2023-07-15 09:55:52'),
(132, 21, 8, '2023-07-15 09:55:52', '2023-07-15 09:55:52'),
(133, 21, 10, '2023-07-15 09:55:52', '2023-07-15 09:55:52'),
(134, 21, 13, '2023-07-15 09:55:52', '2023-07-15 09:55:52'),
(135, 22, 1, '2023-07-15 09:58:17', '2023-07-15 09:58:17'),
(136, 22, 3, '2023-07-15 09:58:17', '2023-07-15 09:58:17'),
(137, 22, 4, '2023-07-15 09:58:17', '2023-07-15 09:58:17'),
(138, 22, 6, '2023-07-15 09:58:17', '2023-07-15 09:58:17'),
(139, 22, 8, '2023-07-15 09:58:17', '2023-07-15 09:58:17'),
(140, 22, 10, '2023-07-15 09:58:17', '2023-07-15 09:58:17'),
(141, 22, 12, '2023-07-15 09:58:17', '2023-07-15 09:58:17'),
(142, 22, 14, '2023-07-15 09:58:17', '2023-07-15 09:58:17'),
(143, 23, 3, '2023-07-15 09:59:12', '2023-07-15 09:59:12'),
(144, 23, 4, '2023-07-15 09:59:12', '2023-07-15 09:59:12'),
(145, 23, 5, '2023-07-15 09:59:12', '2023-07-15 09:59:12'),
(146, 23, 6, '2023-07-15 09:59:12', '2023-07-15 09:59:12'),
(147, 23, 7, '2023-07-15 09:59:12', '2023-07-15 09:59:12'),
(148, 23, 8, '2023-07-15 09:59:12', '2023-07-15 09:59:12'),
(149, 23, 11, '2023-07-15 09:59:12', '2023-07-15 09:59:12'),
(150, 23, 12, '2023-07-15 09:59:12', '2023-07-15 09:59:12'),
(151, 24, 1, '2023-07-15 10:01:12', '2023-07-15 10:01:12'),
(152, 24, 2, '2023-07-15 10:01:12', '2023-07-15 10:01:12'),
(153, 24, 3, '2023-07-15 10:01:12', '2023-07-15 10:01:12'),
(154, 24, 4, '2023-07-15 10:01:12', '2023-07-15 10:01:12'),
(155, 24, 13, '2023-07-15 10:01:12', '2023-07-15 10:01:12'),
(156, 24, 14, '2023-07-15 10:01:12', '2023-07-15 10:01:12'),
(157, 25, 9, '2023-07-15 10:28:02', '2023-07-15 10:28:02'),
(158, 25, 5, '2023-07-15 10:49:09', '2023-07-15 10:49:09'),
(159, 25, 6, '2023-07-15 10:49:09', '2023-07-15 10:49:09'),
(160, 25, 10, '2023-07-15 10:49:09', '2023-07-15 10:49:09'),
(161, 25, 11, '2023-07-15 10:49:09', '2023-07-15 10:49:09'),
(162, 25, 12, '2023-07-15 10:49:09', '2023-07-15 10:49:09'),
(163, 26, 2, '2023-07-15 10:50:45', '2023-07-15 10:50:45'),
(164, 26, 3, '2023-07-15 10:50:45', '2023-07-15 10:50:45'),
(165, 26, 4, '2023-07-15 10:50:45', '2023-07-15 10:50:45'),
(166, 26, 13, '2023-07-15 10:50:45', '2023-07-15 10:50:45'),
(167, 26, 14, '2023-07-15 10:50:45', '2023-07-15 10:50:45'),
(168, 27, 1, '2023-07-15 12:13:15', '2023-07-15 12:13:15'),
(169, 27, 2, '2023-07-15 12:13:15', '2023-07-15 12:13:15'),
(170, 27, 4, '2023-07-15 12:13:15', '2023-07-15 12:13:15'),
(171, 27, 6, '2023-07-15 12:13:15', '2023-07-15 12:13:15'),
(172, 27, 9, '2023-07-15 12:13:15', '2023-07-15 12:13:15'),
(173, 27, 10, '2023-07-15 12:13:15', '2023-07-15 12:13:15'),
(174, 27, 11, '2023-07-15 12:13:15', '2023-07-15 12:13:15'),
(175, 27, 12, '2023-07-15 12:13:15', '2023-07-15 12:13:15'),
(176, 27, 13, '2023-07-15 12:13:15', '2023-07-15 12:13:15'),
(177, 27, 14, '2023-07-15 12:13:15', '2023-07-15 12:13:15'),
(178, 28, 2, '2023-07-16 05:01:08', '2023-07-16 05:01:08'),
(179, 28, 4, '2023-07-16 05:01:08', '2023-07-16 05:01:08'),
(180, 28, 6, '2023-07-16 05:01:08', '2023-07-16 05:01:08'),
(181, 28, 8, '2023-07-16 05:01:08', '2023-07-16 05:01:08'),
(182, 28, 10, '2023-07-16 05:01:08', '2023-07-16 05:01:08'),
(183, 28, 12, '2023-07-16 05:01:08', '2023-07-16 05:01:08'),
(184, 28, 14, '2023-07-16 05:01:08', '2023-07-16 05:01:08'),
(185, 29, 1, '2023-07-16 05:02:34', '2023-07-16 05:02:34'),
(186, 29, 2, '2023-07-16 05:02:34', '2023-07-16 05:02:34'),
(187, 29, 7, '2023-07-16 05:02:34', '2023-07-16 05:02:34'),
(188, 29, 8, '2023-07-16 05:02:34', '2023-07-16 05:02:34'),
(189, 29, 9, '2023-07-16 05:02:34', '2023-07-16 05:02:34'),
(190, 29, 10, '2023-07-16 05:02:34', '2023-07-16 05:02:34'),
(191, 29, 11, '2023-07-16 05:02:34', '2023-07-16 05:02:34'),
(192, 29, 12, '2023-07-16 05:02:34', '2023-07-16 05:02:34'),
(193, 29, 13, '2023-07-16 05:02:34', '2023-07-16 05:02:34'),
(194, 29, 14, '2023-07-16 05:02:34', '2023-07-16 05:02:34'),
(195, 30, 2, '2023-07-16 05:03:33', '2023-07-16 05:03:33'),
(196, 30, 4, '2023-07-16 05:03:33', '2023-07-16 05:03:33'),
(197, 30, 6, '2023-07-16 05:03:33', '2023-07-16 05:03:33'),
(198, 30, 8, '2023-07-16 05:03:33', '2023-07-16 05:03:33'),
(199, 30, 10, '2023-07-16 05:03:33', '2023-07-16 05:03:33'),
(200, 30, 12, '2023-07-16 05:03:33', '2023-07-16 05:03:33'),
(201, 30, 14, '2023-07-16 05:03:33', '2023-07-16 05:03:33'),
(202, 31, 1, '2023-07-16 05:04:21', '2023-07-16 05:04:21'),
(203, 31, 3, '2023-07-16 05:04:21', '2023-07-16 05:04:21'),
(204, 31, 5, '2023-07-16 05:04:21', '2023-07-16 05:04:21'),
(205, 31, 7, '2023-07-16 05:04:21', '2023-07-16 05:04:21'),
(206, 31, 9, '2023-07-16 05:04:21', '2023-07-16 05:04:21'),
(207, 31, 11, '2023-07-16 05:04:21', '2023-07-16 05:04:21'),
(208, 31, 13, '2023-07-16 05:04:21', '2023-07-16 05:04:21');

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT 'img/default.png',
  `playtime` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `role` int(2) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `image`, `playtime`, `comment`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'あaa', 'a@a', NULL, '$2y$10$0HedE42mVsBA6lenRBvFsOyRIvjjX5eNbna/O5M97P36K6m8dEz9C', 'public/profiles/74mE25usnHQzjbsR6lRylBsNZbVkdZdHO7jr5i2u.jpg', 'いつでも', 'よろしくお願いします。よろしくお願いします。よろしくお願いします。よろしくお願いします。よろしくお願いします。よろしくお願いします。よろしくお願いします。よろしくお願いします。よろしくお願いします。よろしくお願いします。よろしくお願いします。よろしくお願いします。よろしくお願いします。よろしくお願いします。よろしくお願いします。よろしくお願いします。よろしくお願いします。よろしくお願いします。よろしくお願いします。よろしくお願いします。よろしくお願いします。よろしくお願いします。よろしくお願いします。よろしくお願いします。よろしくお願いします。よろしくお願いします。よろしくお願いします。よろしくお願いします。', 1, 'Q8Gx8kJs51wuU4RUp2IshkOPk8XqrEOwlfqDLBYXyI7mWKOSTDvkOQoR3KEZ', '2023-06-03 13:50:55', '2023-07-12 13:12:16'),
(2, 'b', 'b@b', NULL, '$2y$10$zewSPj8SI4ANtRszU5QAl.T4LbC86GDvdoYNPL/N8Qw6riWi.eiZy', 'img/default.png', '不定期', '頑張ります。', 1, NULL, '2023-06-05 10:16:25', '2023-07-12 13:29:50'),
(3, 'ccccc', 'c@c', NULL, '$2y$10$IVvUcLYkc5kgKOnUE1262Oi2vegZ6OvtcQ4QGIQ5Q/uyD5dcYe0Pm', 'public/profiles/UW0PiXR8yv3LsMmvc5BFz5IEJu2BXsagn9wp7YZ6.jpg', '土日、祝日', 'よろしく', 1, NULL, '2023-06-12 11:45:40', '2023-06-12 11:55:20'),
(4, 'ddd', 'd@d', NULL, '$2y$10$9d1zLpe31.Xo1bIoO0NjneRNijHpw/mWMZFudCbFrmxuaLMbon6Ku', 'public/profiles/yJmBhNLzTF8sqkrvYMjKsIX7qkSwzXRK6UhxQbnt.jpg', '不定期', 'dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd', 1, NULL, '2023-06-25 13:19:16', '2023-06-25 13:49:31'),
(5, 'eeeee', 'e@e', NULL, '$2y$10$ThFEkxub8/iMLEKWU1zTceUbFdABsNcJasFDtbm3RAB5W/pPvza/6', 'public/profiles/DbbhKwylpdbcxpUUjVbb5DO7FiQpqSPV86tUL3Wh.jpg', '夜のみ', 'e\r\ne\r\ne\r\ne', 1, NULL, '2023-06-26 13:54:40', '2023-06-26 13:57:05'),
(6, 'ffffffff', 'f@f', NULL, '$2y$10$BpyhlgBNhjpblE.V1hEUcOWGTCXQi9c6rMaytOCBXgxu4TpWROgPa', 'public/profiles/p4THhlIvSx8W20QZfLOjmDgG6a69e0x9iHIkdd7n.jpg', 'いつでも', 'ffffffff\r\nffffffffffffff\r\nfffffffffffffffffff\r\nffffffffffffffffffffff', 1, NULL, '2023-06-26 13:57:42', '2023-06-26 13:58:20'),
(7, 'GGG', 'g@g', NULL, '$2y$10$VlB8pe1Foo1bIniuoxdWK.Bz4HtBSpDiF3PfceQ4viSvUgX.68I3O', 'public/profiles/yVKyQ55NP0Kku6LDZlyTrxXu8pYjF264zp8pWku5.jpg', '不定期', 'gggggggggggggggg', 1, NULL, '2023-06-26 13:59:25', '2023-06-26 14:00:11'),
(8, 'hhhhhhhhhh', 'h@h', NULL, '$2y$10$q63xM5NOtmoScnu7AN6so.7ZfCMIRn2AwdT4/nha08G5m1n8CtfOG', 'public/profiles/W95VU6Ir0QaXCRwTcXolex8y3RmswDjN9Vwm0kiM.jpg', '夜のみ', 'hhh', 1, NULL, '2023-06-26 14:02:26', '2023-06-26 14:04:01'),
(9, 'IIIIIIIIII', 'i@i', NULL, '$2y$10$2oQrPjvSFfjPoaI3aUFdtO.VAigGyP5x7hU6TQIPhNYw.sGWsKJT.', 'public/profiles/8Mwu3bSw88daOfZ4i7dfgEEz2ehn2HMIMn1mnm1u.jpg', 'いつでも', 'iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii', 1, NULL, '2023-06-26 14:04:58', '2023-06-26 14:06:08'),
(10, '首藤', 'syudou@syudou', NULL, '$2y$10$3oMypiSZai3J8IjR8NAdcOEudFNItur8Y97G0h9PzLXDgW9cgxFRO', 'img/default.png', NULL, NULL, 0, NULL, '2023-07-01 12:44:49', '2023-07-01 12:44:49'),
(13, 'JJJJ', 'j@j', NULL, '$2y$10$8WQNz.SUy5rJ0hvyKQCFY.mM5eoHjrPqmGXT7PcAMuuGk/w2fjt.i', 'img/default.png', '夜のみ', 'JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJj', 1, NULL, '2023-07-10 11:11:48', '2023-07-10 11:12:37'),
(16, 'kkkkkkkk', 'k@k', NULL, '$2y$10$pE8POFCvILdB31RZqMQ1DucaHZA4ODkSkbTAGaCFIqCkYNa68u6AW', 'img/default.png', '不定期', NULL, 1, NULL, '2023-07-10 11:30:28', '2023-07-13 13:20:29'),
(17, 'LLLLLLLL', 'l@l', NULL, '$2y$10$r2u47OhI7JpwsEx5FvdrYe96DAW4DDWgzAraxiqqSX.P2J/Vhy2hW', 'public/profiles/WloLmQp6EsRE37InXzP1NclnlRxum6zPYLs6km1D.jpg', '土日、祝日', NULL, 1, NULL, '2023-07-11 12:11:26', '2023-07-11 12:12:08'),
(18, 'mmmmmmm', 'm@m', NULL, '$2y$10$tvrj3j3a/Yi3tR/IAPDTRuwtrPFA8dq/P65YYzMmhPYJgL5I810eC', 'public/profiles/TJhycQB6b5nLVLe7adwGX1TVPvlDUxQkEwUcUd8I.jpg', '夜のみ', 'mmmmmmmmmmmmmmm\r\nmmmmmmmmmmmmmmmmmmmmmmmm\r\nmmmmmmmmmmmmmmm\r\nmmmmmmmm', 1, NULL, '2023-07-11 12:19:27', '2023-07-11 12:20:53'),
(19, 'nnnn', 'n@n', NULL, '$2y$10$6yl9OHriQnxVfhjovM5rFOtMNTFhScN1n3k2ffRn1fs8N6.wAkABq', 'public/profiles/wovs1DnTcX27NwtDp5PmNFJi97w5FCLdJrqfeQWv.jpg', '夜のみ', NULL, 1, NULL, '2023-07-11 12:40:48', '2023-07-11 12:41:14'),
(20, 'OOOO', 'o@o', NULL, '$2y$10$Ku3BMnIPNUyLEtqG0N/t5.MJgbpvoGwepLM97jGTajGgBJdQ78uQi', 'img/default.png', 'いつでも', 'ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo', 1, NULL, '2023-07-15 09:54:02', '2023-07-15 09:54:31'),
(21, 'pppppp', 'p@p', NULL, '$2y$10$cSC5ufIxy8RnOoVTbB/GFOFVGvtZ5MQHRyE8FvchpJUZWbuOo.zHq', 'img/default.png', '不定期', 'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp', 1, NULL, '2023-07-15 09:55:22', '2023-07-15 09:56:24'),
(22, 'QQ', 'q@q', NULL, '$2y$10$5d7TyDX3TYVeKGVI5PxvyO5ria5at9uQ0H8gNcbTjJ1khDVk/J/Cy', 'img/default.png', '不定期', 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqq', 1, NULL, '2023-07-15 09:57:52', '2023-07-15 09:58:17'),
(23, 'rrrrrrrr', 'r@r', NULL, '$2y$10$3yLwx7/K/VCteH3Ig4jucOtyNxCMR9hILI5DFQKQG8RTzq2x2U2A.', 'img/default.png', 'いつでも', 'rr\r\n\r\nrrrr', 1, NULL, '2023-07-15 09:58:47', '2023-07-15 09:59:12'),
(24, 'ssssssss', 's@s', NULL, '$2y$10$QSDoTj10oe5s5KSYM8BUieXlmLW71/dwPe6oIbXdagB7jF8VEtLzW', 'img/default.png', '土日、祝日', 'ssssssssssssssss', 1, NULL, '2023-07-15 10:00:52', '2023-07-15 10:01:12'),
(25, 'ttttt', 't@t', NULL, '$2y$10$3IBqL3enm2T8S5BNxh21PekT4WgbDkZWCCmdsiphTvS1hUEA5PQoq', 'img/default.png', '土日、祝日', NULL, 1, NULL, '2023-07-15 10:01:44', '2023-07-15 10:49:09'),
(26, 'UUU', 'u@u', NULL, '$2y$10$WGxZ1EYbLdTj/9VD2XuXl.dmDEWCxFmrLRAdbSHDgq.OtxCuwbJw2', 'img/default.png', 'いつでも', NULL, 1, NULL, '2023-07-15 10:50:14', '2023-07-15 10:50:45'),
(27, 'vvvv', 'v@v', NULL, '$2y$10$rCPkPzFmYPYR9KIzhLE75.T7yT7RBY3xgU9a3nBD9w6l9tee.Cplm', 'img/default.png', '土日、祝日', NULL, 1, NULL, '2023-07-15 12:12:46', '2023-07-15 12:13:15'),
(28, 'wwww', 'w@w', NULL, '$2y$10$sJcBXlewEy.p5WPz2dESv.6b5bDcmc0Ag9o6VMvoGQ2DWvTaPtrrC', 'img/default.png', 'いつでも', NULL, 1, NULL, '2023-07-16 05:00:42', '2023-07-16 05:01:08'),
(29, 'xxxx', 'x@x', NULL, '$2y$10$hNT1E2BMj0ZoliutWnlN2OFF8Fj1dZn6rN68/U0Zk/pVLBZtoKLBi', 'img/default.png', '夜のみ', NULL, 1, NULL, '2023-07-16 05:02:07', '2023-07-16 05:02:34'),
(30, 'YYYY', 'y@y', NULL, '$2y$10$dZV5iW2mWQTk/6zIIPAVqe9jGF9ftWWNlgS0Cy5Q4G2X793EHkgiq', 'img/default.png', '夜のみ', NULL, 1, NULL, '2023-07-16 05:03:06', '2023-07-16 05:03:33'),
(31, 'ZZZZ', 'z@z', NULL, '$2y$10$oEXt/BX9ivr0K9tsBmqSXe56cdwTZhMTJcuKZZ0cHS2vOwgX6t95e', 'img/default.png', NULL, NULL, 1, NULL, '2023-07-16 05:04:05', '2023-07-16 05:04:05');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- テーブルのインデックス `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- テーブルのインデックス `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- テーブルのインデックス `play_games`
--
ALTER TABLE `play_games`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `games`
--
ALTER TABLE `games`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- テーブルの AUTO_INCREMENT `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- テーブルの AUTO_INCREMENT `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `play_games`
--
ALTER TABLE `play_games`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- テーブルの AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
