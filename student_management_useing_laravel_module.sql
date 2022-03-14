-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2022 at 02:18 AM
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
-- Database: `student_management_useing_laravel_module`
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
(2, 4, '2022-03-04', 'Oral warning', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Molestiae doloribus expedita quaerat repellendus facilis laborum magni cum quae corporis, odit recusandae praesentium, inventore odio eveniet rerum. Facere modi error accusamus.', '2022-02-28 04:01:58', '2022-02-28 04:01:58'),
(3, 6, '2022-03-02', 'Notation', 'test', '2022-02-28 04:10:34', '2022-02-28 04:10:51');

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
(7, '2022_02_17_065324_Score', 3),
(8, '2022_02_16_055542_Disciple', 4);

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
(2, 5, '2022-03-02', '2022-03-05', 'Authorize', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Molestiae doloribus expedita quaerat repellendus facilis laborum magni cum quae corporis, odit recusandae praesentium, inventore odio eveniet rerum. Facere modi error accusamus.', '2022-02-28 04:01:17', '2022-02-28 04:01:17'),
(4, 6, '2022-03-04', '2022-03-07', 'Unauthorize', 'test', '2022-02-28 04:10:10', '2022-02-28 04:10:10'),
(5, 2, '2022-03-03', '2022-03-05', 'Authorize', 'Test', '2022-03-02 07:48:03', '2022-03-02 07:48:03');

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
(1, 'App\\Models\\User', 1, 'MyToken', 'cdbbf72eac46d70494d12b63d259d7d096e7cab3326976040aefbbbd900fc3d7', '[\"*\"]', NULL, '2022-02-28 03:36:36', '2022-02-28 03:36:36'),
(2, 'App\\Models\\User', 1, 'MyToken', '639065dfb08429fdf72709715309a605bbff7736215ff5d0e861c5b3c5aee297', '[\"*\"]', NULL, '2022-02-28 03:37:16', '2022-02-28 03:37:16'),
(3, 'App\\Models\\User', 1, 'MyToken', '026779861ce20ed4f6a20473dd0f34a662620795cbfa27838abb75ec73e15088', '[\"*\"]', NULL, '2022-02-28 03:42:26', '2022-02-28 03:42:26'),
(4, 'App\\Models\\User', 2, 'MyToken', '4062cff1782031fc976da83353e8fa10609d4e536587eb308bfe8eae111df09e', '[\"*\"]', NULL, '2022-02-28 03:43:10', '2022-02-28 03:43:10'),
(5, 'App\\Models\\User', 3, 'MyToken', 'f97a65a4f3f70efc0b914bbd6168c3001312de5d3f8f6983ff35cd133e842011', '[\"*\"]', NULL, '2022-02-28 03:46:49', '2022-02-28 03:46:49'),
(6, 'App\\Models\\User', 3, 'MyToken', '7c1b2d28139ab36b423b422a858dad45f5a629b708a96e7e0f1b14e11809c2fc', '[\"*\"]', NULL, '2022-02-28 03:47:01', '2022-02-28 03:47:01'),
(7, 'App\\Models\\User', 1, 'MyToken', 'd703eec6f4cceb6e42beb15118cabc372915548c385f5b2a95b932f7b178d1d9', '[\"*\"]', NULL, '2022-02-28 03:47:32', '2022-02-28 03:47:32'),
(8, 'App\\Models\\User', 2, 'MyToken', '49cf3b220a4877c5479cbd95eac117eca6ff8badcb37d4a28241a021e45fd618', '[\"*\"]', NULL, '2022-02-28 03:47:59', '2022-02-28 03:47:59'),
(9, 'App\\Models\\User', 1, 'MyToken', '0d22d78575691412f7d9ac4be30f887dcd62a32ef74deead02fc448b4a92fc55', '[\"*\"]', NULL, '2022-02-28 03:48:36', '2022-02-28 03:48:36'),
(10, 'App\\Models\\User', 4, 'MyToken', 'f9fd746df160a7543bc7956900a3cff8f06e5b9f106fbbbc75925e55802b7b26', '[\"*\"]', NULL, '2022-02-28 03:56:05', '2022-02-28 03:56:05'),
(11, 'App\\Models\\User', 5, 'MyToken', 'ed9f7703d05d426c8857da63852f1419a019bee364707439685f02c1486487cd', '[\"*\"]', NULL, '2022-02-28 03:56:39', '2022-02-28 03:56:39'),
(12, 'App\\Models\\User', 6, 'MyToken', '47fba467cdccb8f9dc778e003a9620871ecafc63f8df7804039805b8ea26d0b1', '[\"*\"]', NULL, '2022-02-28 03:57:08', '2022-02-28 03:57:08'),
(13, 'App\\Models\\User', 7, 'MyToken', '798df5b232b4f1ea26e83ba24fe95b5fd38b2e798228e0b80df4dae6baf0b76a', '[\"*\"]', NULL, '2022-02-28 03:57:33', '2022-02-28 03:57:33'),
(14, 'App\\Models\\User', 1, 'MyToken', '9232113e8eabbd3713b5adff103a4417ae4e4ca4a57099b48659cf7f3bb2fa2f', '[\"*\"]', NULL, '2022-02-28 04:04:16', '2022-02-28 04:04:16'),
(15, 'App\\Models\\User', 8, 'MyToken', 'f77ef6515e3e2a6207c3d2e97afcb0e9c1fa6071ecdc0914b433cb94e230c608', '[\"*\"]', NULL, '2022-02-28 04:05:48', '2022-02-28 04:05:48'),
(16, 'App\\Models\\User', 4, 'MyToken', '8d3b9958473193f9a4c89937fa13fc7d9440f636e73aeecf8030416e18023f23', '[\"*\"]', NULL, '2022-02-28 04:11:16', '2022-02-28 04:11:16'),
(17, 'App\\Models\\User', 1, 'MyToken', '38314b0b20dcf56f37e2be33cbb63461afa850a5fa95762214c85377d5d3ab9f', '[\"*\"]', NULL, '2022-02-28 04:12:07', '2022-02-28 04:12:07'),
(18, 'App\\Models\\User', 1, 'MyToken', 'fb883be7c3f6ecfe70227d229fd9ae3467d793ec2dd35c3ff146ed56867fb646', '[\"*\"]', NULL, '2022-02-28 04:29:40', '2022-02-28 04:29:40'),
(19, 'App\\Models\\User', 1, 'MyToken', '5731cf4aa33b1745fd782435efc22e873e83c2e7a941ebbd651292a8321a24b6', '[\"*\"]', NULL, '2022-03-02 02:14:03', '2022-03-02 02:14:03'),
(20, 'App\\Models\\User', 1, 'MyToken', '2c13be8c5cf155dc44d586e42652eb9855214fdc531e66a91f30bbaa35304cad', '[\"*\"]', NULL, '2022-03-02 02:14:04', '2022-03-02 02:14:04'),
(21, 'App\\Models\\User', 1, 'MyToken', '88ce61a47c2e37c12732a2664bae6a0cbfe72c26eef0bee106040340ec235fed', '[\"*\"]', NULL, '2022-03-02 07:41:36', '2022-03-02 07:41:36'),
(22, 'App\\Models\\User', 6, 'MyToken', 'd9da73fa92bbb8dca9713673b7863b2f3d41b9dcb03124268e1a9847ceeaf6d1', '[\"*\"]', NULL, '2022-03-02 08:45:05', '2022-03-02 08:45:05'),
(23, 'App\\Models\\User', 1, 'MyToken', '37406c048bb1835a72207ac0492cdf8bd45d9f91ead601fccecd1f2d64d30b79', '[\"*\"]', NULL, '2022-03-02 08:45:36', '2022-03-02 08:45:36'),
(24, 'App\\Models\\User', 1, 'MyToken', '4fb1ee2034576eae65b043ce76760cd38ba3cbbabcb7570af8266886d971f331', '[\"*\"]', NULL, '2022-03-02 09:13:04', '2022-03-02 09:13:04'),
(25, 'App\\Models\\User', 9, 'MyToken', 'd0e502052468a9eb6841df658aed72385ab10ab297105af46a847de7adb1230e', '[\"*\"]', NULL, '2022-03-02 09:14:06', '2022-03-02 09:14:06'),
(26, 'App\\Models\\User', 1, 'MyToken', '78e6c2f9b36cb9367ffffbb7485f6a35c76ad34b9b686da06cde6201f9009e61', '[\"*\"]', NULL, '2022-03-02 09:17:02', '2022-03-02 09:17:02'),
(27, 'App\\Models\\User', 1, 'MyToken', '21fbaf80f8dc765306f9bdf6f0d1c11b146a491a7edce8a3f8743acf2e48f0bf', '[\"*\"]', NULL, '2022-03-03 03:38:48', '2022-03-03 03:38:48'),
(28, 'App\\Models\\User', 1, 'MyToken', 'c82db07d96dd244906b533e7832847bd381a2458946d41f3bfd253ba6c93b760', '[\"*\"]', NULL, '2022-03-03 03:42:39', '2022-03-03 03:42:39'),
(29, 'App\\Models\\User', 1, 'MyToken', '2fcd79374103151c50c2b262cf8e6f788b326834bc795e583836f100b117d8fd', '[\"*\"]', NULL, '2022-03-04 06:48:39', '2022-03-04 06:48:39'),
(30, 'App\\Models\\User', 1, 'MyToken', 'bb66e4d1c576a63099d2f497ac7752521c3b8f5bd98a7de7fa103777a464c314', '[\"*\"]', NULL, '2022-03-04 08:18:12', '2022-03-04 08:18:12');

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
(2, 2, 89, 78, 80, 90, 84, 78, '2022-02-28 03:58:12', '2022-02-28 03:58:12'),
(3, 3, 87, 65, 78, 78, 67, 56, '2022-02-28 03:58:46', '2022-02-28 03:58:46'),
(4, 4, 86, 67, 75, 56, 78, 80, '2022-02-28 03:59:18', '2022-02-28 03:59:18'),
(5, 5, 75, 87, 83, 86, 90, 79, '2022-02-28 04:00:30', '2022-02-28 04:00:30'),
(6, 6, 80, 77, 90, 89, 78, 100, '2022-02-28 04:08:46', '2022-02-28 04:09:00');

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
(2, 'Vichka', 'Lo', 'WEB-2021 A', 695875401, 'Female', 'UC3i3tuf4gJAkKyMr8ge4H0aftG7LXj7KvzbQwod.jpg', '2022-02-28 03:53:42', '2022-02-28 03:53:42'),
(3, 'Sopheak', 'Vun', 'WEB-2021 B', 978468445, 'Female', '81RF9oHNbmOhtmq8k9UIEYVvZgzTFnPsNWucHsoh.jpg', '2022-02-28 03:54:26', '2022-02-28 03:54:26'),
(4, 'Chanthy', 'Tha', 'WEB-2021 A', 964846544, 'Male', 'hL8xtHN9dP2MY2SgPNjfKgU6oGHTdix5cKCTlRls.jpg', '2022-02-28 03:54:58', '2022-02-28 03:54:58'),
(5, 'Lyden', 'Chai', 'WEB-2021 A', 70645336, 'Male', 'UGsUoLwYEeThvN3sWGjcbjJOgREVwTnyjp6aPK5X.jpg', '2022-02-28 03:55:25', '2022-02-28 03:55:25'),
(6, 'Vun', 'Yin', 'WEB-2021 A', 155468487, 'Female', '8gtrlUDTYgXBcAGu9DPO3tXueJ3DGS68jbKwEBb1.png', '2022-02-28 04:07:31', '2022-02-28 04:07:41'),
(9, 'Sara', 'Veyy', 'WEB-2021 B', 885484854, 'Female', 'ALKnMVpcU1PPP2AfSDofTZAUIU3R3bVru4TA9izo.jpg', '2022-03-03 03:45:08', '2022-03-03 03:54:06'),
(10, 'Channary', 'Pha', 'WEB-2021 A', 978485455, 'Female', 'ucMbeE4IoFq0gACJXZoRmYkOz5bHxcXWPCIy6Lvx.jpg', '2022-03-03 09:35:55', '2022-03-03 09:49:18'),
(11, 'Sophea', 'Soun', 'WEB-2021 A', 978445454, 'Female', 'IjQ3DSqeGxCWc02IqOuRcfD55Kw8KNEwHyhy8hwy.jpg', '2022-03-03 09:49:46', '2022-03-03 09:49:46');

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
(1, NULL, 'Admin', 'admin@gmail.com', NULL, '$2y$10$bSonm/myBvwtMGlnRvVkgOTyu3oBo8y6ECSpOfo7iN93N2B6f0R.W', 'Admin', 'mSlLVbx71kAKFtQ5HDSISHwWq2C2CJ1PZUF0zqRs.png', NULL, '2022-02-28 03:36:36', '2022-02-28 03:36:36'),
(2, NULL, 'Vandy', 'vandy@gmail.com', NULL, '$2y$10$cwYhB5e/V7jMameS8uFL1.wNGwS/ZBIlrA.f37PM7xST5BqCCwESC', 'TEACHER', '9L6addikG8mc9ja42cSxeEZHwJLZR6MDLzrdJQYq.jpg', NULL, '2022-02-28 03:43:10', '2022-03-02 09:13:21'),
(4, 2, 'Vicheka', 'vicheka@gmail.com', NULL, '$2y$10$4.EDvh6JRqgSiXQs3WHOp.zHyFfTdtQ2jAEQyen3K7OK3IHp5h5IW', 'STUDENT', 'WjwLqubsKdei23JubAfAdXRurqkjBgsXBRMUJDes.jpg', NULL, '2022-02-28 03:56:05', '2022-02-28 03:56:05'),
(5, 3, 'Sopheak', 'sopheak@gmail.com', NULL, '$2y$10$owcnHl42w6LI7G7GTcYndeKcq4.xIMt3SiE5I5AkrUlCo7vwBb6Fe', 'STUDENT', 'cJm0J2wi3TkRKVLn8aI5tdDjRzG12Z5WD9Ues9gc.jpg', NULL, '2022-02-28 03:56:39', '2022-02-28 03:56:39'),
(6, 5, 'Lyden', 'lyden@gmail.com', NULL, '$2y$10$NzIUDo36aRXVHbiWSk5pQu8PbaL3RhedMKz0IBpoexlGkiOLgAjPi', 'STUDENT', 'GQT6QDrEmkfOpjibjFMqbIJrlXCNfE4CcPxx1D0b.jpg', NULL, '2022-02-28 03:57:08', '2022-02-28 03:57:08'),
(7, 4, 'Chanthy', 'chanthy@gmail.com', NULL, '$2y$10$cRmACAmMuJ4XIl30UWXmPeGTTyS3gjA2wmuAa3QOt0knHLyxxVRcq', 'STUDENT', '6FEcBhjomW2traaxb25pCAE1QXCQICRt032iCXTU.jpg', NULL, '2022-02-28 03:57:33', '2022-02-28 03:57:33'),
(9, NULL, 'Somkhan', 'somkhan@gmail.com', NULL, '$2y$10$B3YE3cXedPyT.NyEhtSTD.BVdVoSQqK0T7pyDy4fmoMTPRpOptKsq', 'TEACHER', 'UthGIt0Lma8RzGyqAXZv1SGVb6ovTNOXvmfY0Gel.jpg', NULL, '2022-03-02 09:14:06', '2022-03-02 09:14:06');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `scores`
--
ALTER TABLE `scores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
