-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 01, 2022 at 07:54 PM
-- Server version: 5.7.31
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `form_builder_hulk_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
CREATE TABLE IF NOT EXISTS `answers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `form_details_id` int(10) UNSIGNED NOT NULL,
  `users_id` int(10) UNSIGNED NOT NULL,
  `answers` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `answers_form_details_id_foreign` (`form_details_id`),
  KEY `answers_users_id_foreign` (`users_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `form_details_id`, `users_id`, `answers`, `created_at`, `updated_at`) VALUES
(1, 6, 1, 'Employed', '2022-04-01 12:29:39', '2022-04-01 12:29:39'),
(2, 7, 1, 'UnEmployed', '2022-04-01 12:29:39', '2022-04-01 12:29:39'),
(3, 8, 1, 'Male', '2022-04-01 12:29:39', '2022-04-01 12:29:39'),
(4, 6, 1, 'Employed', '2022-04-01 12:30:23', '2022-04-01 12:30:23'),
(5, 7, 1, 'UnEmployed', '2022-04-01 12:30:23', '2022-04-01 12:30:23'),
(6, 8, 1, 'Male', '2022-04-01 12:30:23', '2022-04-01 12:30:23'),
(7, 6, 1, 'Employed', '2022-04-01 12:30:44', '2022-04-01 12:30:44'),
(8, 7, 1, 'Confirm', '2022-04-01 12:30:44', '2022-04-01 12:30:44'),
(9, 8, 1, 'Female', '2022-04-01 12:30:44', '2022-04-01 12:30:44'),
(10, 6, 1, 'Employed', '2022-04-01 12:31:07', '2022-04-01 12:31:07'),
(11, 7, 1, 'Confirm', '2022-04-01 12:31:07', '2022-04-01 12:31:07'),
(12, 8, 1, 'Female', '2022-04-01 12:31:07', '2022-04-01 12:31:07'),
(13, 6, 1, 'Employed', '2022-04-01 12:31:37', '2022-04-01 12:31:37'),
(14, 7, 1, 'Confirm', '2022-04-01 12:31:37', '2022-04-01 12:31:37'),
(15, 8, 1, 'Female', '2022-04-01 12:31:37', '2022-04-01 12:31:37'),
(16, 6, 1, 'Employed', '2022-04-01 12:32:58', '2022-04-01 12:32:58'),
(17, 7, 1, 'Confirm', '2022-04-01 12:32:58', '2022-04-01 12:32:58'),
(18, 8, 1, 'Female', '2022-04-01 12:32:58', '2022-04-01 12:32:58'),
(19, 1, 1, 'Lalu@3.com', '2022-04-01 12:33:17', '2022-04-01 12:33:17'),
(20, 2, 1, 'stra', '2022-04-01 12:33:17', '2022-04-01 12:33:17'),
(21, 1, 3, 'kslalu@123.com', '2022-04-01 12:39:12', '2022-04-01 12:39:12'),
(22, 2, 3, '12355', '2022-04-01 12:39:12', '2022-04-01 12:39:12'),
(23, 1, 3, NULL, '2022-04-01 13:10:59', '2022-04-01 13:10:59'),
(24, 2, 3, NULL, '2022-04-01 13:10:59', '2022-04-01 13:10:59'),
(25, 1, 3, NULL, '2022-04-01 13:13:27', '2022-04-01 13:13:27'),
(26, 2, 3, NULL, '2022-04-01 13:13:27', '2022-04-01 13:13:27');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `form_details`
--

DROP TABLE IF EXISTS `form_details`;
CREATE TABLE IF NOT EXISTS `form_details` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `form_id` int(10) UNSIGNED NOT NULL,
  `question_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `questions` text COLLATE utf8mb4_unicode_ci,
  `answer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `form_details_form_id_foreign` (`form_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `form_details`
--

INSERT INTO `form_details` (`id`, `form_id`, `question_id`, `questions`, `answer_type`, `created_at`, `updated_at`) VALUES
(1, 1, '1', 'UserName', '1', '2022-04-01 07:14:03', '2022-04-01 07:14:03'),
(2, 1, '2', 'Password', '1', '2022-04-01 07:14:03', '2022-04-01 07:14:03'),
(3, 2, '1', 'Name', '1', '2022-04-01 10:36:24', '2022-04-01 10:36:24'),
(4, 2, '2', 'Email', '1', '2022-04-01 10:36:24', '2022-04-01 10:36:24'),
(5, 2, '3', 'Address', '2', '2022-04-01 10:36:24', '2022-04-01 10:36:24'),
(6, 3, '1', 'Employment status', '3', '2022-04-01 11:19:34', '2022-04-01 11:19:34'),
(7, 3, '2', 'Confirm', '4', '2022-04-01 11:19:34', '2022-04-01 11:19:34'),
(8, 3, '3', 'Gender', '5', '2022-04-01 11:19:34', '2022-04-01 11:19:34');

-- --------------------------------------------------------

--
-- Table structure for table `form_masters`
--

DROP TABLE IF EXISTS `form_masters`;
CREATE TABLE IF NOT EXISTS `form_masters` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `form_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `form_opened` int(11) NOT NULL DEFAULT '0',
  `form_submitted` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `form_masters`
--

INSERT INTO `form_masters` (`id`, `form_name`, `form_opened`, `form_submitted`, `created_at`, `updated_at`) VALUES
(1, 'Login Form', 0, 0, '2022-04-01 07:14:03', '2022-04-01 07:14:03'),
(2, 'Contact Form-1', 3, 0, '2022-04-01 10:36:24', '2022-04-01 13:19:36'),
(3, 'Employment status form', 20, 0, '2022-04-01 11:19:34', '2022-04-01 13:33:51');

-- --------------------------------------------------------

--
-- Table structure for table `form_rules`
--

DROP TABLE IF EXISTS `form_rules`;
CREATE TABLE IF NOT EXISTS `form_rules` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `form_details_id` int(10) UNSIGNED NOT NULL,
  `rules_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `form_rules_form_details_id_foreign` (`form_details_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `form_rules`
--

INSERT INTO `form_rules` (`id`, `form_details_id`, `rules_type`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, '4', '', '2022-04-01 07:14:03', '2022-04-01 07:14:03'),
(2, 2, '1', '1', '2022-04-01 07:14:03', '2022-04-01 07:14:03'),
(3, 2, '2', '10', '2022-04-01 07:14:03', '2022-04-01 07:14:03'),
(4, 3, '3', '', '2022-04-01 10:36:24', '2022-04-01 10:36:24'),
(5, 4, '4', '', '2022-04-01 10:36:24', '2022-04-01 10:36:24'),
(6, 5, '3', '1', '2022-04-01 10:36:24', '2022-04-01 10:36:24'),
(7, 5, '1', '12', '2022-04-01 10:36:24', '2022-04-01 10:36:24'),
(8, 5, '2', '', '2022-04-01 10:36:24', '2022-04-01 10:36:24'),
(9, 6, '5', 'Employed', '2022-04-01 11:19:34', '2022-04-01 11:19:34'),
(10, 6, '5', 'UnEmployed', '2022-04-01 11:19:34', '2022-04-01 11:19:34'),
(11, 7, '5', 'Confirm', '2022-04-01 11:19:34', '2022-04-01 11:19:34'),
(12, 8, '5', 'Male', '2022-04-01 11:19:34', '2022-04-01 11:19:34'),
(13, 8, '5', 'Female', '2022-04-01 11:19:34', '2022-04-01 11:19:34');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(47, '2014_10_12_000000_create_users_table', 1),
(48, '2014_10_12_100000_create_password_resets_table', 1),
(49, '2019_08_19_000000_create_failed_jobs_table', 1),
(50, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(51, '2022_03_31_174142_create_form_masters_table', 1),
(52, '2022_03_31_174216_create_form_details_table', 1),
(53, '2022_03_31_174227_create_form_rules_table', 1),
(54, '2022_03_31_174306_create_answers_table', 1),
(55, '2022_04_01_095218_alter_roles_to_table_name', 1),
(56, '2022_04_01_095553_create_user_form_submition', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles_id` int(11) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `roles_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'LALU ks KS', 'admin@123.com', NULL, '$2y$10$1dW74bwIUfoyvKqAtfnGQeLNKL2KQi.Cgr4UkpM5vgicdZ1ZacCTK', 1, NULL, '2022-04-01 05:01:51', '2022-04-01 05:01:51'),
(2, 'Lalu Ks', 'admin@1231.com', NULL, '$2y$10$7SYt3n85rS/G6xZxQCXlLe7mQLxaXbl3OgYx/wnCaYNokGmD6O4Ju', 1, NULL, '2022-04-01 05:02:25', '2022-04-01 05:02:25'),
(3, 'Laluks', 'kslalu@123.com', NULL, '$2y$10$.lQQt1NUE8XDIG0stGuIquZLBYiOocBglmYN.LBmXgVVtAkrFefae', 2, NULL, '2022-04-01 05:03:17', '2022-04-01 05:03:17'),
(4, 'xs', 'xs@d.com', NULL, '$2y$10$amhxVxW/rQ8avX/ye27lB.GTe3Xjn1WmEjTWd2Pc060J/TPA4nmJy', 2, NULL, '2022-04-01 05:41:44', '2022-04-01 05:41:44'),
(5, 'xd', 'xde@v.com', NULL, '$2y$10$6VbabeqVAgJ.Ac.FPfdag.JBklvRBCtt/dfnKSeobK6nrmfUwNMKG', 2, NULL, '2022-04-01 05:43:06', '2022-04-01 05:43:06'),
(6, 'LALU ks KS', 'laluks0105@gmail.com', NULL, '$2y$10$df1eIQC9NmMWDG5/rVAAjedfo1n/R8e6DrxxW.5lfEctGpGRC6gO2', 2, NULL, '2022-04-01 05:52:27', '2022-04-01 05:52:27'),
(7, 'LALU ks KS', 'laluks0051@gmail.com', NULL, '$2y$10$0b0Z.TK4MtjVpmAvrjN3guGypR5TUCLs2rqlrxpde5h2R1X3.ckoq', 1, NULL, '2022-04-01 05:52:57', '2022-04-01 05:52:57');

-- --------------------------------------------------------

--
-- Table structure for table `user_form_submition`
--

DROP TABLE IF EXISTS `user_form_submition`;
CREATE TABLE IF NOT EXISTS `user_form_submition` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `form_opened` int(10) UNSIGNED NOT NULL,
  `form_id` int(10) UNSIGNED NOT NULL,
  `form_submitted` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_form_submition_form_id_foreign` (`form_id`),
  KEY `user_form_submition_user_id_foreign` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
