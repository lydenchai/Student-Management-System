-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 18, 2022 at 09:22 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `disciples`
--

CREATE TABLE `disciples` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `dateWn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `disciples`
--

INSERT INTO `disciples` (`id`, `student_id`, `dateWn`, `type`, `description`, `created_at`, `updated_at`) VALUES
(1, 13, '2022-02-19', 'Oral warning', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Laudantium praesentium, officia inventore dolorum soluta sit ex quo illum, ad quas, autem nihil obcaecati reiciendis. Deserunt officia sapiente autem ducimus ut!', '2022-02-18 07:21:47', '2022-02-18 07:21:47'),
(2, 12, '2022-02-27', 'Warning letter', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Laudantium praesentium, officia inventore dolorum soluta sit ex quo illum, ad quas, autem nihil obcaecati reiciendis. Deserunt officia sapiente autem ducimus ut!', '2022-02-18 07:21:59', '2022-02-18 07:21:59'),
(3, 11, '2022-02-26', 'Termination', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Laudantium praesentium, officia inventore dolorum soluta sit ex quo illum, ad quas, autem nihil obcaecati reiciendis. Deserunt officia sapiente autem ducimus ut!', '2022-02-18 07:22:09', '2022-02-18 07:22:09'),
(4, 10, '2022-02-24', 'Notation', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Laudantium praesentium, officia inventore dolorum soluta sit ex quo illum, ad quas, autem nihil obcaecati reiciendis. Deserunt officia sapiente autem ducimus ut!', '2022-02-18 07:22:22', '2022-02-18 07:23:00'),
(5, 2, '2022-02-22', 'Oral warning', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Laudantium praesentium, officia inventore dolorum soluta sit ex quo illum, ad quas, autem nihil obcaecati reiciendis. Deserunt officia sapiente autem ducimus ut!', '2022-02-18 07:22:36', '2022-02-18 07:22:36'),
(6, 1, '2022-02-26', 'Warning letter', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Laudantium praesentium, officia inventore dolorum soluta sit ex quo illum, ad quas, autem nihil obcaecati reiciendis. Deserunt officia sapiente autem ducimus ut!', '2022-02-18 07:22:50', '2022-02-18 07:22:50'),
(7, 6, '2022-03-02', 'Termination', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Laudantium praesentium, officia inventore dolorum soluta sit ex quo illum, ad quas, autem nihil obcaecati reiciendis. Deserunt officia sapiente autem ducimus ut!', '2022-02-18 07:23:17', '2022-02-18 07:23:17');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_02_16_054400_create_students_table', 1),
(6, '2022_02_16_055529_Permission', 2),
(7, '2022_02_16_055542_Disciple', 3),
(8, '2022_02_17_065324_Score', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `startAt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `endAt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `student_id`, `startAt`, `endAt`, `type`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-02-24', '2022-02-26', 'Authorize', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Laudantium praesentium, officia inventore dolorum soluta sit ex quo illum, ad quas, autem nihil obcaecati reiciendis. Deserunt officia sapiente autem ducimus ut!', '2022-02-18 07:19:48', '2022-02-18 07:19:48'),
(2, 3, '2022-02-19', '2022-02-22', 'Unauthorize', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Laudantium praesentium, officia inventore dolorum soluta sit ex quo illum, ad quas, autem nihil obcaecati reiciendis. Deserunt officia sapiente autem ducimus ut!', '2022-02-18 07:20:08', '2022-02-18 07:20:08'),
(3, 5, '2022-02-19', '2022-02-21', 'Authorize', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Laudantium praesentium, officia inventore dolorum soluta sit ex quo illum, ad quas, autem nihil obcaecati reiciendis. Deserunt officia sapiente autem ducimus ut!', '2022-02-18 07:20:23', '2022-02-18 07:20:23'),
(4, 7, '2022-03-05', '2022-02-28', 'Unauthorize', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Laudantium praesentium, officia inventore dolorum soluta sit ex quo illum, ad quas, autem nihil obcaecati reiciendis. Deserunt officia sapiente autem ducimus ut!', '2022-02-18 07:20:37', '2022-02-18 07:20:37'),
(5, 9, '2022-03-04', '2022-03-06', 'Unauthorize', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Laudantium praesentium, officia inventore dolorum soluta sit ex quo illum, ad quas, autem nihil obcaecati reiciendis. Deserunt officia sapiente autem ducimus ut!', '2022-02-18 07:20:54', '2022-02-18 07:20:54'),
(6, 4, '2022-02-25', '2022-02-28', 'Authorize', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Laudantium praesentium, officia inventore dolorum soluta sit ex quo illum, ad quas, autem nihil obcaecati reiciendis. Deserunt officia sapiente autem ducimus ut!', '2022-02-18 07:21:15', '2022-02-18 07:21:15'),
(7, 12, '2022-02-26', '2022-03-03', 'Authorize', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Laudantium praesentium, officia inventore dolorum soluta sit ex quo illum, ad quas, autem nihil obcaecati reiciendis. Deserunt officia sapiente autem ducimus ut!', '2022-02-18 07:21:29', '2022-02-18 07:21:29');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'MyToken', 'fb33d4f38e26d7c22d6fd9d294329c388656370e628eeed0862a554eacb2a29e', '[\"*\"]', NULL, '2022-02-18 06:37:42', '2022-02-18 06:37:42'),
(2, 'App\\Models\\User', 1, 'MyToken', 'a3d78f54b3ece7ee005b105ee74790c34cc06dfa4cc7f7a088484ff050f5daf5', '[\"*\"]', NULL, '2022-02-18 06:38:09', '2022-02-18 06:38:09'),
(3, 'App\\Models\\User', 2, 'MyToken', '7ed2f744cca94204c3a79cf4fbee972c3ecf68656703ee77228c007fd3ffa06a', '[\"*\"]', NULL, '2022-02-18 06:47:29', '2022-02-18 06:47:29'),
(4, 'App\\Models\\User', 2, 'MyToken', '37ac6ac948e511d3e6d5691b787aebece0958b017264e671b3372790b2b17aaf', '[\"*\"]', NULL, '2022-02-18 06:48:22', '2022-02-18 06:48:22'),
(5, 'App\\Models\\User', 3, 'MyToken', '1c28fa7ecf81b1a28584655128c0d774493c6287f061627df3430688de704c48', '[\"*\"]', NULL, '2022-02-18 06:49:15', '2022-02-18 06:49:15'),
(6, 'App\\Models\\User', 3, 'MyToken', '998232bea44b6c948fffc3ae33a9033408348641f65bcc4ca54d44ecf331b064', '[\"*\"]', NULL, '2022-02-18 06:49:32', '2022-02-18 06:49:32'),
(7, 'App\\Models\\User', 4, 'MyToken', '2f9e27dac175f9d0e645f7a82f517adb1e02673959d05ebe47372fa2666b0f8a', '[\"*\"]', NULL, '2022-02-18 06:59:36', '2022-02-18 06:59:36'),
(8, 'App\\Models\\User', 5, 'MyToken', '5871888937e3afc04dea858b5c28b4b38b0d8a21cc2932c562df26893a1c6830', '[\"*\"]', NULL, '2022-02-18 07:00:06', '2022-02-18 07:00:06'),
(9, 'App\\Models\\User', 6, 'MyToken', 'c3f9a87fe1297a3118193e9a2c1049d10cb1e4be75b577822a0ef553b6970f3e', '[\"*\"]', NULL, '2022-02-18 07:00:36', '2022-02-18 07:00:36'),
(10, 'App\\Models\\User', 7, 'MyToken', '43e160f886b0edc93f66c5bfa9f14791ab32c099e548644b18293f477a696cab', '[\"*\"]', NULL, '2022-02-18 07:01:04', '2022-02-18 07:01:04'),
(11, 'App\\Models\\User', 8, 'MyToken', '6391228ea40426f163ea7f7c4fc2156dfd9bcde7044166ce8dacadcb61c7fcdc', '[\"*\"]', NULL, '2022-02-18 07:01:25', '2022-02-18 07:01:25'),
(12, 'App\\Models\\User', 9, 'MyToken', 'e64d461ce2a09b174f2191de6e2348bbb748c2f090c99308752ae2167bfc3038', '[\"*\"]', NULL, '2022-02-18 07:02:06', '2022-02-18 07:02:06'),
(13, 'App\\Models\\User', 10, 'MyToken', 'ea1640ab0f6d33361194e64635d86b6bfc7f612ac5b22b73c3b4c726fd03e857', '[\"*\"]', NULL, '2022-02-18 07:02:37', '2022-02-18 07:02:37'),
(14, 'App\\Models\\User', 11, 'MyToken', 'ae59991cebc52ecc8e7b8c1fb20730981169859bcd5272b6c6428d04db7be7a4', '[\"*\"]', NULL, '2022-02-18 07:03:03', '2022-02-18 07:03:03'),
(15, 'App\\Models\\User', 12, 'MyToken', 'bff4c241588b0209ec375432a4d676396ab0f9f09dbbb49a46c5c10a2e713a32', '[\"*\"]', NULL, '2022-02-18 07:03:28', '2022-02-18 07:03:28'),
(16, 'App\\Models\\User', 13, 'MyToken', 'dadb172e46329f974de814d407d6cd86a03d35144cc2c09ade1f38b66e1b9f3c', '[\"*\"]', NULL, '2022-02-18 07:03:53', '2022-02-18 07:03:53'),
(17, 'App\\Models\\User', 14, 'MyToken', 'a9600be60f1f56545ef1645a6841d578941b051ea400764ab15caba0aae83020', '[\"*\"]', NULL, '2022-02-18 07:04:21', '2022-02-18 07:04:21'),
(18, 'App\\Models\\User', 15, 'MyToken', '7c70a4c26a13ad5e9c405c211478382416c990ddbec50b9a8888428e8be5760f', '[\"*\"]', NULL, '2022-02-18 07:04:49', '2022-02-18 07:04:49'),
(19, 'App\\Models\\User', 16, 'MyToken', 'b9b71ee729b6f3bd2564c05a8f4b94ba83393fe529fe163808fae85254e1f5b0', '[\"*\"]', NULL, '2022-02-18 07:05:15', '2022-02-18 07:05:15'),
(20, 'App\\Models\\User', 17, 'MyToken', 'cb10a254a4a83bdd3363eceb776bb7b99420a5e8938468a241ac4060bbcd83a8', '[\"*\"]', NULL, '2022-02-18 07:05:39', '2022-02-18 07:05:39'),
(21, 'App\\Models\\User', 18, 'MyToken', '9792457c95fb73237e3eb6b0b37ef3b9e3266bc44bc6075a217f9f8bc3c4d0b9', '[\"*\"]', NULL, '2022-02-18 07:06:08', '2022-02-18 07:06:08'),
(22, 'App\\Models\\User', 19, 'MyToken', '816b087bfa08802eb0a8caf945eeb7a58b77a4a24aca5717d5f3f850d78f9354', '[\"*\"]', NULL, '2022-02-18 07:06:32', '2022-02-18 07:06:32'),
(23, 'App\\Models\\User', 20, 'MyToken', 'd0a1a975b0f1d73df74d4af24235ff7f0fbda345d3da446c9743d13099a8b9e4', '[\"*\"]', NULL, '2022-02-18 07:07:15', '2022-02-18 07:07:15'),
(24, 'App\\Models\\User', 21, 'MyToken', 'd2879c5495f59f163f4906f790ba2c6431428e5eb39a6243612e4845921dc0dc', '[\"*\"]', NULL, '2022-02-18 07:07:42', '2022-02-18 07:07:42'),
(25, 'App\\Models\\User', 9, 'MyToken', '2bdff23c131ab26d21cf59e6d471693d40b5e29362ec54bc2e703b41bc2f7027', '[\"*\"]', NULL, '2022-02-18 07:24:16', '2022-02-18 07:24:16'),
(26, 'App\\Models\\User', 20, 'MyToken', 'da0c1c944871e1ef399b9cb92da4a90afbe0d9a107bf86faad1e9f35b1caad7e', '[\"*\"]', NULL, '2022-02-18 07:32:13', '2022-02-18 07:32:13'),
(27, 'App\\Models\\User', 3, 'MyToken', 'f961061d7e959aa87f155c4458b1575c2981d96c349ab0d185dc0ef2b3b20fae', '[\"*\"]', NULL, '2022-02-18 07:39:38', '2022-02-18 07:39:38'),
(28, 'App\\Models\\User', 22, 'MyToken', 'b007fbcae5dd780bc78aef8426f385872044d21909ca292a2cc8c2b1878e096e', '[\"*\"]', NULL, '2022-02-18 07:41:08', '2022-02-18 07:41:08'),
(29, 'App\\Models\\User', 23, 'MyToken', '9123d049364fa230ad52d17b5fc5f993f05245ccb0de7ef0ed0a6d0e40fa5d7a', '[\"*\"]', NULL, '2022-02-18 07:43:19', '2022-02-18 07:43:19'),
(30, 'App\\Models\\User', 24, 'MyToken', 'f0be0f77658ec73d4ad6eabc11b3b31152de63ca440a607149c02328eb5650c1', '[\"*\"]', NULL, '2022-02-18 07:43:49', '2022-02-18 07:43:49'),
(31, 'App\\Models\\User', 25, 'MyToken', '4e838ce76b802316b38d314186d67eead1492e2b15e7b31817b9d6e5379a2c05', '[\"*\"]', NULL, '2022-02-18 07:44:23', '2022-02-18 07:44:23'),
(32, 'App\\Models\\User', 26, 'MyToken', 'e08862f6b0373cc1dc7477df5b022c8efd1b33ed9274399cb3d5c69dcd75b8ce', '[\"*\"]', NULL, '2022-02-18 07:44:57', '2022-02-18 07:44:57'),
(33, 'App\\Models\\User', 27, 'MyToken', '0754b8d5be001fdc1b47962ba16eb859906cc37db1c2ce318c9f8c98057a7633', '[\"*\"]', NULL, '2022-02-18 07:54:44', '2022-02-18 07:54:44'),
(34, 'App\\Models\\User', 28, 'MyToken', 'c180658bdedd5098981505cff844a6a4bdc5f28de7442b02e815f43e4716ba60', '[\"*\"]', NULL, '2022-02-18 08:09:25', '2022-02-18 08:09:25'),
(35, 'App\\Models\\User', 29, 'MyToken', '4d474659d0891c83399783ec55bcbd69d8b4d2d9b46535fa6bdf8d4c872ed2db', '[\"*\"]', NULL, '2022-02-18 08:09:54', '2022-02-18 08:09:54'),
(36, 'App\\Models\\User', 30, 'MyToken', 'd1ea66a51dc6f298f40d607ea44c1cee0e963712d7e9640cae3f48e15b571989', '[\"*\"]', NULL, '2022-02-18 08:10:32', '2022-02-18 08:10:32'),
(37, 'App\\Models\\User', 31, 'MyToken', '84fe34cbae5d013c4f664089d6baa7bc0b015531f43d8093baaa4a86abf52dbe', '[\"*\"]', NULL, '2022-02-18 08:11:30', '2022-02-18 08:11:30'),
(38, 'App\\Models\\User', 32, 'MyToken', 'ca5a184addfa8c04a75806618ef472d840d3eeecdff75036024602cc89ba2a74', '[\"*\"]', NULL, '2022-02-18 08:12:35', '2022-02-18 08:12:35'),
(39, 'App\\Models\\User', 33, 'MyToken', 'e88ad52c4c4ff41d59c656ea21c7b7cf7d24a0466f8493a2fcc31bea74a2c1ac', '[\"*\"]', NULL, '2022-02-18 08:13:04', '2022-02-18 08:13:04'),
(40, 'App\\Models\\User', 34, 'MyToken', 'a5d1b3231986a72b049a2140ebf76033cd3ba9dcb5a3412cb6ea95daf401f27d', '[\"*\"]', NULL, '2022-02-18 08:13:29', '2022-02-18 08:13:29'),
(41, 'App\\Models\\User', 35, 'MyToken', '43611a5f2b03c05f6c5cd06d603fd2afa12e815bfac59d9307511f6b41d24f14', '[\"*\"]', NULL, '2022-02-18 08:13:51', '2022-02-18 08:13:51'),
(42, 'App\\Models\\User', 36, 'MyToken', '10457ea40a948f7a8f74d7ecb1714ac9b528a85f73e6fe2cfd58ccca5cb34970', '[\"*\"]', NULL, '2022-02-18 08:14:21', '2022-02-18 08:14:21'),
(43, 'App\\Models\\User', 37, 'MyToken', '346ab4f84bb897aff75fe4a2584bf11f8e0f0c727afe438c8cc196b47f9840f9', '[\"*\"]', NULL, '2022-02-18 08:14:44', '2022-02-18 08:14:44'),
(44, 'App\\Models\\User', 38, 'MyToken', '509a9052b0c08b4a892cf34eff1396d803af31f10c9325821b606aa06a0aaa93', '[\"*\"]', NULL, '2022-02-18 08:15:16', '2022-02-18 08:15:16'),
(45, 'App\\Models\\User', 39, 'MyToken', '59a8448727b73156d09ddd7a419891e6131ed939026029ce8c023df4d35b604b', '[\"*\"]', NULL, '2022-02-18 08:15:44', '2022-02-18 08:15:44'),
(46, 'App\\Models\\User', 40, 'MyToken', '79e6b8aa0157a47f826226994e612421b3ce346ed22cafd93c71930889d834c4', '[\"*\"]', NULL, '2022-02-18 08:16:08', '2022-02-18 08:16:08'),
(47, 'App\\Models\\User', 41, 'MyToken', '2fe860faa4ff6b0171c63b9a4b3597da96ae482415fbf5d577f6ef443b842b19', '[\"*\"]', NULL, '2022-02-18 08:16:29', '2022-02-18 08:16:29'),
(48, 'App\\Models\\User', 29, 'MyToken', 'f0e76040cc3d14f8bc078c7fdf83562d7d3de55d307c6007628c41d492f8a1ac', '[\"*\"]', NULL, '2022-02-18 08:16:49', '2022-02-18 08:16:49'),
(49, 'App\\Models\\User', 3, 'MyToken', 'f0d419adc30bb05aa0efdc78596b1a822387704c41a3f088783a27abbb44fb68', '[\"*\"]', NULL, '2022-02-18 08:17:16', '2022-02-18 08:17:16');

-- --------------------------------------------------------

--
-- Table structure for table `scores`
--

CREATE TABLE `scores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `htmlcss` int(11) NOT NULL,
  `javascript` int(11) NOT NULL,
  `python` int(11) NOT NULL,
  `php` int(11) NOT NULL,
  `laravel` int(11) NOT NULL,
  `java` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `scores`
--

INSERT INTO `scores` (`id`, `student_id`, `htmlcss`, `javascript`, `python`, `php`, `laravel`, `java`, `created_at`, `updated_at`) VALUES
(1, 1, 76, 65, 65, 87, 57, 76, '2022-02-18 07:13:13', '2022-02-18 07:13:13'),
(2, 2, 76, 60, 80, 75, 83, 67, '2022-02-18 07:13:44', '2022-02-18 07:13:44'),
(3, 3, 67, 87, 76, 68, 55, 63, '2022-02-18 07:14:12', '2022-02-18 07:14:12'),
(4, 4, 80, 54, 68, 84, 84, 57, '2022-02-18 07:14:57', '2022-02-18 07:14:57'),
(5, 5, 70, 75, 83, 85, 89, 75, '2022-02-18 07:15:31', '2022-02-18 07:15:31'),
(6, 6, 61, 52, 52, 61, 50, 45, '2022-02-18 07:16:09', '2022-02-18 07:16:09'),
(7, 7, 70, 68, 68, 56, 58, 76, '2022-02-18 07:16:38', '2022-02-18 07:16:38'),
(8, 8, 89, 87, 75, 88, 64, 65, '2022-02-18 07:17:08', '2022-02-18 07:17:08'),
(9, 9, 68, 74, 84, 60, 45, 64, '2022-02-18 07:17:34', '2022-02-18 07:17:34'),
(10, 10, 99, 54, 64, 87, 54, 56, '2022-02-18 07:17:57', '2022-02-18 07:17:57'),
(11, 11, 50, 60, 55, 62, 53, 40, '2022-02-18 07:18:24', '2022-02-18 07:18:24'),
(12, 12, 90, 88, 85, 70, 67, 78, '2022-02-18 07:18:54', '2022-02-18 07:18:54'),
(13, 13, 76, 54, 87, 54, 56, 78, '2022-02-18 07:19:15', '2022-02-18 07:19:15');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int(11) NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `first_name`, `last_name`, `class`, `phone`, `gender`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Channary', 'Pha', 'WEB-2021 A', 315648786, 'Female', 'DdgTrvQ4gm8MiAbN5d3YSOVz3pNlKmF0kga2NM4A.jpg', '2022-02-18 06:52:09', '2022-02-18 06:52:09'),
(2, 'Chanry', 'Chory', 'WEB-2021 A', 465785456, 'Female', 'HGAn0NbWqXcVV7fEPnOgBR7chnffl1hvJUrNanJi.jpg', '2022-02-18 06:52:41', '2022-02-18 06:52:41'),
(3, 'Chanthea', 'Phon', 'WEB-2021 B', 456476854, 'Female', 'DEXvg6VEfVp7Uv0LbVVkHSdH3WF6qCJ9WIbiydVp.jpg', '2022-02-18 06:53:09', '2022-02-18 06:53:09'),
(4, 'Chanthy', 'Tha', 'WEB-2021 A', 974564865, 'Male', '84ClSceBRzwLGsgz5W52FhvzPwX3tIuWJPo08Cuz.jpg', '2022-02-18 06:53:40', '2022-02-18 06:53:40'),
(5, 'Lyden', 'Chai', 'WEB-2021 A', 70645336, 'Male', 'XLfQ37ZJITd9MYNuhwaqvLWf5YvmtsFDVmsMOUl7.jpg', '2022-02-18 06:54:29', '2022-02-18 06:54:29'),
(6, 'Sophanna', 'Mey', 'WEB-2021 B', 315456484, 'Male', '4bFp0xoxv81Q8PYCytDYL6P4j3RUZMWxDS4W2rDd.png', '2022-02-18 06:54:58', '2022-02-18 06:54:58'),
(7, 'Sara', 'Vey', 'WEB-2021 B', 694654864, 'Female', 'SB0YsquYgjP2SemeKiBtoPO0kAWGURA3VjYPrZmf.jpg', '2022-02-18 06:55:25', '2022-02-18 06:55:25'),
(8, 'Sinet', 'Sem', 'WEB-2021 A', 884564845, 'Female', 'TwUmDfy38UPZqNjxd7aR1cf285B4mQecGl7K6gbK.jpg', '2022-02-18 06:55:53', '2022-02-18 06:55:53'),
(9, 'Sophea', 'Soun', 'WEB-2021 A', 976456411, 'Female', '7m42tgV50O4FS25Yar7IGk8xf0etOfxpzefRZoUB.jpg', '2022-02-18 06:56:20', '2022-02-18 06:56:20'),
(10, 'Sopheak', 'Vun', 'WEB-2021 B', 976845644, 'Female', 'kRNhQETbRp7TQ6enNc0jJpkhV2wSBMDdKs5XDMAD.jpg', '2022-02-18 06:56:45', '2022-02-18 06:56:45'),
(11, 'Sreytuch', 'Mouch', 'WEB-2021 B', 884548648, 'Female', 'aeQXG3BiC6uNV1E0xPaBxOxAMR6sEDdh0NCncXec.jpg', '2022-02-18 06:57:14', '2022-02-18 06:57:14'),
(12, 'Vicheka', 'Lo', 'WEB-2021 A', 697846544, 'Female', 'kY7C259UQxDdHZRUIJbwWARlgkQ0bRZBueWhdQcC.jpg', '2022-02-18 06:57:42', '2022-02-18 06:57:42'),
(13, 'Vun', 'Yin', 'WEB-2021 A', 316546844, 'Female', '0PgQCSkA0mRJTuH61dkBoyFslLloockSYiF7kWpZ.png', '2022-02-18 06:58:07', '2022-02-18 06:58:07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `student_id`, `username`, `email`, `email_verified_at`, `password`, `role`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, NULL, 'Admin', 'admin@gmail.com', NULL, '$2y$10$28ZpYHjTHW.eRgD5fy4YmO120Qvm8rXdvRXOUCspaCL5r6xSUSDBq', 'Admin', 'PnK6x5VQPzeifYfrrHzHyL5IACLfJlmqbrKfklZH.png', NULL, '2022-02-18 06:49:15', '2022-02-18 06:49:15'),
(23, 1, 'Channary', 'channary@gmail.com', NULL, '$2y$10$bPRryD3fD7M6SPdv.4exnee6sH8iJDk35Q7.sgBjWdaSHnt5e7N.i', 'STUDENT', 'XfCUB1K9uXC4j2ivnRDOTkQj1wACelCu8BLgVh2E.jpg', NULL, '2022-02-18 07:43:19', '2022-02-18 07:43:19'),
(24, 2, 'Chanry', 'chanry@gmail.com', NULL, '$2y$10$Jf3YEuRkBtbvqsLiP9U7wuTKdGe.vNV27ZtSmniCscHn0M6XCFy3m', 'STUDENT', 'pwHI7L9qVRomH8PiAQwpZ81M32E21fzEBAQs8CBj.jpg', NULL, '2022-02-18 07:43:49', '2022-02-18 07:43:49'),
(25, 3, 'Chanthea', 'chanthea@gmail.com', NULL, '$2y$10$CYK7OZwgokHwi9WRGmqL3ugFs/4iL0s6ycD4Wm5AsVHhYp58Yz696', 'STUDENT', 'WfF5rvctJapRIdbaO7aZ3kol0NXvv3qsAQMklgQk.jpg', NULL, '2022-02-18 07:44:23', '2022-02-18 07:44:23'),
(26, 4, 'Chanthy', 'chanthy@gmail.com', NULL, '$2y$10$unv4kf.3wLgRFnTudPYPVO7KlVm8k.ChdOivra6P1Ar6psjTFiBA2', 'STUDENT', '9CsVzcpNX2F3kvUbt5zl9zROF7RjLB7FtAaJAQLq.jpg', NULL, '2022-02-18 07:44:57', '2022-02-18 07:44:57'),
(27, 4, 'vvv', 'vvv@gmail.com', NULL, '$2y$10$pH7jF3ItRqw70sLGSc6k.e6CGnP0OZUu/ALnsRDrrl2v1U92xwn0y', 'STUDENT', 'ee30bKj2ialfI14OCP4y3MwAPXq5CYZTU4frIvE2.jpg', NULL, '2022-02-18 07:54:44', '2022-02-18 07:54:44'),
(28, NULL, 'Davy', 'davy@gmail.com', NULL, '$2y$10$NL4sfjdOZG9od4nlXGSJtORKMVdkXlLySlts4xRZuvm0yWlPxdwm2', 'SOCIAL AFFAIR', 'jQAVZ3R88MZiN5I6tTp00sz7nleZwTuJVMUsKaFd.jpg', NULL, '2022-02-18 08:09:25', '2022-02-18 08:09:25'),
(29, 5, 'Lyden', 'lyden@gmail.com', NULL, '$2y$10$fllB1LkX2S41Or7iMfpYjevdr40LxOaepYfHDbIZIrdkEBUUMDYoy', 'STUDENT', 'dzjALSVdxT4i3eIF2Dg8VI7z1vPpKKwnLwyUlPvR.jpg', NULL, '2022-02-18 08:09:54', '2022-02-18 08:09:54'),
(30, 6, 'Sophanna', 'sophanna@gmail.com', NULL, '$2y$10$/m8kf.zikvETtRSf7q6KxuLdjtT2oFeRAWP5xW8UBn3Y9YIxj/PhC', 'STUDENT', 'OtWcnDs2u8L9smxCXMOs2LgeT7GkeklOg1QLya6K.png', NULL, '2022-02-18 08:10:32', '2022-02-18 08:10:32'),
(31, NULL, 'Puthy', 'puthy@gmail.com', NULL, '$2y$10$J1LMsUKY5FCFoBWLj36XXOz8J0igsk9hYletYSf1mgCAbiZpc2Ko2', 'SOCIAL AFFAIR', 'kipPmy9LCTqInPrGs8PSsPVyAK9UBLGTTUl1zE36.jpg', NULL, '2022-02-18 08:11:30', '2022-02-18 08:11:43'),
(32, 7, 'Sara', 'sara@gmail.com', NULL, '$2y$10$jEmUKqHM3rGHsBuKIMvB8OgmUlIXgfQe8pZWaW585VhdAcOtOrWY.', 'STUDENT', '4oGL5hjK3qm7YdNbCk1xMNU7XHzIQZ4ofa81UXP2.jpg', NULL, '2022-02-18 08:12:35', '2022-02-18 08:12:35'),
(33, NULL, 'Sim Hul', 'simhul@gmail.com', NULL, '$2y$10$FcYM9P20KJlRUFjdegyjP.fO/yfuM4dEqz/0rKZWF0.47k5H5xJfy', 'SOCIAL AFFAIR', 'EKvx88EMtBygRvSPK7eqc7V3cAlD0LApKE5ncq88.jpg', NULL, '2022-02-18 08:13:04', '2022-02-18 08:13:04'),
(34, 8, 'Sinet', 'sinet@gmail.com', NULL, '$2y$10$7EI3vFB.AEExRBJoIBkYbO.KBx2A4mfYDC1HLAN/pK6tBGXS7XhhG', 'STUDENT', 'dSX6IbUnvcPfaGJF35veSOjWd6Tx0q0qUNYlabZb.jpg', NULL, '2022-02-18 08:13:29', '2022-02-18 08:13:29'),
(35, NULL, 'Somkhan', 'somkhan@gmail.com', NULL, '$2y$10$s6ZoBkAtxy2XCtMgLw6ifeMj8QVcbAtLqXZXjMQzQI8LnW6ZYnWT6', 'SOCIAL AFFAIR', 'LxUpiH7i9zITbspec94CVTwuEaX8PgiglfjhHfLZ.jpg', NULL, '2022-02-18 08:13:51', '2022-02-18 08:13:51'),
(36, 9, 'Sophea', 'sophea@gmail.com', NULL, '$2y$10$eU86KzGbvSQ5I37mZ8aEHObm6CzUwUxoc0oXiKgqJJbj/vqtEa21a', 'STUDENT', 'GKpTEnbQl3rbuQwxFauT8PVNzJqJucSHL00KLkKq.jpg', NULL, '2022-02-18 08:14:21', '2022-02-18 08:14:21'),
(37, 10, 'Sopheak', 'sopheak@gmail.com', NULL, '$2y$10$lFeE4L/XruFkoaQuP5LOT..w1eYRDXIwhdGq/lL7DpR2.Tz5P3h4W', 'STUDENT', 'pzkjhL4DNdlpme9ZTcHec2xD3O9ihd4yEoinrx0S.jpg', NULL, '2022-02-18 08:14:44', '2022-02-18 08:14:44'),
(38, 11, 'Sreytouch', 'sreytuch@gmail.com', NULL, '$2y$10$SUfmdDiT7cU/.31duGZUvuQHg9sfFJ5jTs1R0Uc4QnSJjiuT5PJXG', 'STUDENT', 'bRfEfJdKGNERQR67SftaSZIaATcdRunO9rp3mmDT.jpg', NULL, '2022-02-18 08:15:16', '2022-02-18 08:15:16'),
(39, NULL, 'Vandy', 'vandy@gmail.com', NULL, '$2y$10$qfGk7MDo5YPf92gvgg69.OKiygTa/QfArDTIKs6tOO1GuP5Q8u38S', 'SOCIAL AFFAIR', 'EJMA49nqFXCLRARkzObD9qDoUHYuBG2as0OZpPUw.jpg', NULL, '2022-02-18 08:15:44', '2022-02-18 08:15:44'),
(40, 12, 'Vicheka', 'vicheka@gmail.com', NULL, '$2y$10$U2kgbrsOpgXlH7XXQ.COTOYIwU2fPpZb7NWVR0Z0BDUWBaOU4ZRUy', 'STUDENT', '6EfAnOMmzxSEKG5ZFyFM0XdRR5M61sSgsjg8r2IC.jpg', NULL, '2022-02-18 08:16:08', '2022-02-18 08:16:08'),
(41, 13, 'Vun', 'vun@gmail.com', NULL, '$2y$10$Z/Cr1lFPPDIToDBK/NS8FesdK9iML/Qhk/EsVNbSSIIsLpcGUBe62', 'STUDENT', 'iERMZsPv2hoKKpIlQCyS5C49fqIFpgykKJP58eQh.png', NULL, '2022-02-18 08:16:29', '2022-02-18 08:16:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `disciples`
--
ALTER TABLE `disciples`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disciples_student_id_foreign` (`student_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_student_id_foreign` (`student_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `scores`
--
ALTER TABLE `scores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `scores_student_id_foreign` (`student_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `disciples`
--
ALTER TABLE `disciples`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `scores`
--
ALTER TABLE `scores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `disciples`
--
ALTER TABLE `disciples`
  ADD CONSTRAINT `disciples_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `scores`
--
ALTER TABLE `scores`
  ADD CONSTRAINT `scores_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
