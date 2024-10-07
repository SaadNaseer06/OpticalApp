-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 07, 2024 at 11:51 PM
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
-- Database: `optical_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `address_details`
--

CREATE TABLE `address_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone` int(11) NOT NULL,
  `state` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `house_number` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `area` varchar(255) NOT NULL,
  `postal_code` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Color', '2024-08-06 13:04:48', '2024-08-06 13:04:48');

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks`
--

CREATE TABLE `bookmarks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
(4, 1, '2024-08-06 13:39:19', '2024-08-06 13:39:19'),
(5, 1, '2024-08-06 13:40:16', '2024-08-06 13:40:16'),
(6, 1, '2024-08-06 13:49:25', '2024-08-06 13:49:25'),
(7, 1, '2024-08-06 13:50:02', '2024-08-06 13:50:02'),
(8, 1, '2024-08-06 13:50:42', '2024-08-06 13:50:42'),
(9, 1, '2024-08-06 13:53:13', '2024-08-06 13:53:13'),
(10, 1, '2024-08-06 13:53:46', '2024-08-06 13:53:46'),
(11, 1, '2024-08-06 14:01:17', '2024-08-06 14:01:17'),
(12, 1, '2024-08-06 14:05:23', '2024-08-06 14:05:23');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `cart_id`, `product_id`, `quantity`, `attribute`, `created_at`, `updated_at`) VALUES
(10, 12, 1, 4, '\"{\\\"size\\\": \\\"small\\\", \\\"color\\\": \\\"brown\\\"}\"', '2024-08-06 14:05:23', '2024-08-06 14:05:23');

-- --------------------------------------------------------

--
-- Table structure for table `category_values`
--

CREATE TABLE `category_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_category_id` bigint(20) UNSIGNED NOT NULL,
  `sub_category` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_values`
--

INSERT INTO `category_values` (`id`, `product_id`, `product_category_id`, `sub_category`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Aviator', '2024-08-06 13:04:49', '2024-08-06 13:04:49');

-- --------------------------------------------------------

--
-- Table structure for table `descriptive_images`
--

CREATE TABLE `descriptive_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `descriptive_images` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `descriptive_images`
--

INSERT INTO `descriptive_images` (`id`, `product_id`, `descriptive_images`, `created_at`, `updated_at`) VALUES
(1, 1, 'descriptive_images/KVPRiRDduh8WOAy4oOqKWPWwJdaLsZMdSWI9sRM1.png', '2024-08-06 13:04:49', '2024-08-06 13:04:49'),
(2, 1, 'descriptive_images/QZc5e7bcJ3agvWGv4lAElkmEAMAJbgtBRKHh99E2.png', '2024-08-06 13:04:49', '2024-08-06 13:04:49');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
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
-- Table structure for table `forget_passwords`
--

CREATE TABLE `forget_passwords` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `otp` int(11) NOT NULL,
  `expires_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_05_24_190557_create_forget_passwords_table', 1),
(5, '2024_05_24_210959_create_products_table', 1),
(6, '2024_07_08_232111_create_product_images_table', 1),
(7, '2024_07_08_232548_create_descriptive_images_table', 1),
(8, '2024_07_08_232856_create_product_categories_table', 1),
(9, '2024_07_08_233455_create_product_colors_table', 1),
(10, '2024_07_09_221704_create_personal_access_tokens_table', 1),
(11, '2024_07_12_184839_create_attributes_table', 1),
(12, '2024_07_12_184926_create_product_attributes_table', 1),
(13, '2024_07_12_205459_update_product_attribute_table', 1),
(14, '2024_07_17_214359_create_category_values_table', 1),
(15, '2024_07_26_172604_create_bookmarks_table', 1),
(16, '2024_07_29_183459_create_carts_table', 1),
(17, '2024_07_30_173348_create_cart_items_table', 1),
(18, '2024_08_05_194942_create_orders_table', 1),
(19, '2024_08_07_165927_create_address_details_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `billing_address` varchar(255) NOT NULL,
  `shipping_address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `cart_id`, `user_id`, `name`, `email`, `billing_address`, `shipping_address`, `phone`, `created_at`, `updated_at`) VALUES
(4, 4, 1, 'John Doe', 'johndoe@gmail.com', '123 Main Street', '123 Main Street', '0123456789', '2024-08-06 13:40:26', '2024-08-06 13:40:26');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
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

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'Token', '15d722ed088bff2bbb2e61bffa03de249027d5297e86d27930d418f2fd251fd1', '[\"*\"]', '2024-08-06 17:21:07', NULL, '2024-08-06 13:04:26', '2024-08-06 17:21:07'),
(2, 'App\\Models\\User', 1, 'Token', 'fbf8297bc2e21dc1aa3df1e487362f5e8698e70a128620fe5e5f4d71b23ced03', '[\"*\"]', '2024-08-07 13:53:02', NULL, '2024-08-07 12:38:34', '2024-08-07 13:53:02'),
(3, 'App\\Models\\User', 2, 'Token', '514378eb234b7066bc52bd4c5f2b9076b60ef8d203a0d117e57b4a90aa30754a', '[\"*\"]', NULL, NULL, '2024-10-07 13:29:08', '2024-10-07 13:29:08');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'lorem ipsum', 'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsumLorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum', 1, '2024-08-06 13:04:48', '2024-08-06 13:04:48');

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `category` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `product_id`, `category`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Sunglasses', 1, '2024-08-06 13:04:49', '2024-08-06 13:04:49');

-- --------------------------------------------------------

--
-- Table structure for table `product_colors`
--

CREATE TABLE `product_colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color_family` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `images` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `images`, `created_at`, `updated_at`) VALUES
(1, 1, 'product_images/8OaaY673TXXxVVdQJKyTFieWbUBbmZvgnOurpx1p.png', '2024-08-06 13:04:49', '2024-08-06 13:04:49'),
(2, 1, 'product_images/7chZliotU9V5o6uiXvTxK7Ru0GY7e8IUnE4TuhrX.png', '2024-08-06 13:04:49', '2024-08-06 13:04:49');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0nbHmQNQDrcOjhRZDstFk4TzfIRspD04D5SGkETd', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYkJ0ZXByWHFVSE1JQ0RwZHhYTGw3ck40YU8yZGladm5GREZQck1PVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723137966),
('0ZjjwE3HQy15nMA5ruBrr5O8vjeYzMREdUPtDlKc', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidEJRU1ZyNFAzZkF2dFRzaWFKSnJTaVNPaFZlWDVZM1BKVFJYVkZ5RyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723140883),
('13pEyp0snHbmgKt8OfO6YCwEC123UEm1Wt6oUwMh', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOHpYeUJ5VTZiVkhkQ0FyRnNQN0J3SG1Ib2ZrakN3RHUzV3Rsa3ZYeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723138911),
('1XCkQZNkTOxxb1ixRBJhQv9vRjKk76suaWSm68KZ', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaXd0ajZoRDdaVDcxNzkxNGlTcXVrdDZNdXZ4VVdaczFzVnhoSlgwSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723141268),
('2eZKPduHBlC7R4KslxEJAyZOE2hhZFfG1L6XFoED', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVVIyaUwwY3lSVUNna2VBYXlLMEIyc2UzaWxXdFdtOGpVODh4Z2g2YyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723748398),
('2s2vOKgPnON6jjKQjKVJqvE43OBOnByIENaxThc2', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYzJPeGRUMW96RVNHWDluMVJNYnBudml0RTQxNUE0VGVJZEJ0c0xHNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723141166),
('395er1l59Y0zpJDVSDjZnDmoyFTrw7unBKCqdlV7', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYk01T2duUDc1ZGp2b21hNnV0Uk5sR3YwNlBlZDNSd3NyMmh1RTJ1ZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723139119),
('3nEJn1XbuI0FjkaaN45RTPZ3mfZsNmp1vYqqI14D', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaEFxUGlTSnhUakJ1eWM5Y3ZBbnRZdTU1YjNrWlRmNGtJWHNSbmtWTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723139631),
('4HuD9HoGObS4H8dZ5Rrsadh7oW8Hu0JjFEmCuWe1', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRFRwWmZiNWRJeWo2MThYWFpFSEVlekhCM3NWbWdDTFlBZHdHTkVVViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723503482),
('4ZQu8tpJHkGbhwZjFHQaZywX2VtS45rw9RtmjDhK', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic3BRZmNSSE5xM0ZZR29XemxIUW5wcnRKazFmaDBJV1psRk5VTEY1byI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723141036),
('5C7vvVEtOG6nSYPCk3MDJV7PY4udQHSBvcCA8yTA', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTzVvT283cW9hOVY5dVJTZVl6VUluN094OEU4T3NZQ2FRckJURDFNNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723140775),
('5igHNkJnqNzsAwSYbqC2ABdQNAWCkH0SixdfjchG', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia0dXMGtkR2ZJcUhsQlpkUU11dXBXTjRYZGEzdmRMa0xqc0lLOEtuZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723136701),
('5Uhe8kzofZY7aKnc7NKxGUpl5A16s7eKhX2HV05k', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidEZ1STVScHlwRkwwazhnaWo0NzIzYlVESGw0d0l1eVExUGJOYmtwVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723491766),
('5YlBixjkyyks4vAxVzzuWaKx3MRE9lZVjg4QXmBS', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiblZ4TGRhNHFwUU1CVlJYS1RWVkJETmJNalI1czc5YXR6dFlSaXNkWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723139059),
('71J276xIaY77HiDchWAvix2ON45LhiS3JiA2faOG', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMDl6UTBUSktMZnpMa1h3WmlCM2Q1TU9VeG9SZFA0WGxoVjhSTVlXTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723138216),
('749AbYaPbnAoHICKGKkD2Qzv0CV4IG9VVBWpys7E', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYjhGeUVodldTT1hGYWtiTURTVjRBclcyeE5vSHBmbm85Q3gzcHg0RiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723141373),
('7NsncGNEiJxIQwUe96CQMtRsS8u1i38cM5rfrg87', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidzZzSlFkQlFvMUZvdVMyQXRkWFJKYlc2RDdsWGxINXFOQUV0OFFZYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723140799),
('7utHx2H2i0965rJRhpUEI02h4nvHwHFoMSXtBLZz', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiamdUYTBhUGU5QXdBdEFSdENoVXdSeUxXOHNRVHc1ZXcycnZjWnF2UCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723503295),
('9xWnmRopKmtqPOYmcUOQfq2P2OhYBLoc3CfDbhbI', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY3hGQWpzTHJEUklGa1ZIUVZTV1lreGVYblF5SUFjTmpKTEVNMHR6RCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1728313799),
('a6ZQfqq7bU4ooJivHDJq4kUZO8SEUifC3Si3NQwS', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRHdEY2oyNnc3ZFZsc2lkN01mQ29VUVVnTFN5bDk2YUlrNTZLS3RGMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723140836),
('AgUKjezLd344AyD0PpEhagKCmnOcD6dLF1zCXTda', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieXhiazREZDlacVkwVHZjbzY5VnN4YXZBWFNNMWNTWVVucHpUVnZJNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723135276),
('AQ3yNrgRcAo8UKgQVJy35wRL0IfO2a6toAm8jfr1', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSVA2UWdrWklYc2hyMG95dTkwSE9kRWNtRkZRcm1qc2FvOHQwYk1HWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723141501),
('aSoOsywQOHUG3umSa1oq9gzr1EmZAldh51VVzuAd', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiODBTcFk0SmEwMzk2M1dGZ2h4am5DWWNmeHp0V0lsMkFJY0lVSk9xUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723139587),
('AWvV9TtJnJM6WaQT7ftWpAiD23lgABR6gAeq1orH', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic3ZnTWdxZ0w1VjQxMVZBUjV6eHRsanlLdWpMRVZLYUM3RVZONG5zNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723139162),
('AZiG4QCY8v0041ih1X0PL52U22iSj6qNJVogOWkX', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVnBTQ3FTaUdnSVhwMksyRzA3b3cwV2JzdUJraEZiWmVQTFpickYwMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723141143),
('BInWu2eDCBCSliSzigD6buupEbKBl1T5OE518uaE', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaVllZXNDWFd6aWw0YlhTeDlyaUplbFNSa21aQjVaNURBY0o5d0ZMOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723141250),
('BLEpX9WxakmiTcgv9h02rhHageiAxl7PQ4E8xyj9', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTkp6d0dMeEFWUHJiNDRndGZESDlONjZjejlUWDlOeDE1UjZYeDFHbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723135741),
('BtCRPpuqdPpjubgIH4mbJsPSBzrm3sSS3wRAI7eQ', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidzVSUW5rM0l6R2VrVThHVTRuNWhmOUFCY2F4TDFDYWtTOVprUjVYNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723139044),
('BUn3i62FYoSXmywYpp4yWlnVfJ4MMSWLZ85jOYrK', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQmtrcktrajJBdzFOdnBpQUpPbVhNQ1pEZHFJY1dNN1ZwckZkOW1vMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723141489),
('CpeQt99SL4t89TThjCdFaU355SPAg0kyJ2hK7HrY', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWk5xa0JlQVRWa0Ftd2psNUdPeTFiT09RRnh2cExLaXVhSk5yZ0V1ciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723139219),
('DHchUij8D8tCdEgN9SdkMtE3bfObwJrzwF84e0aK', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZkt0bEM5RzNybW5Rb1JacjRxRzZsMHN6RXVTWGN1RUNvNVZNTFU2UCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723138895),
('DKxjN5EMcsCkpUPXqMhEnHLzgrIpE5yILQC7AnQM', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMVJqaGpLV0RlYzdLVnhEb1pHS1FHUnFrM0V3R2doRlUzN2VmcjROcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723138690),
('DrEZjoG9aW1ssq3n5N8CfXXdQ9yYQFP4tUBYmez9', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWZuZVZZRXdtQ1FoODFqaHhnQ04xNzVGOVdCUUhOUzdibUJLVkUyTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1728053536),
('dsYN6ylaOU5aBh374XKiRtOFy6f2zK3pUeqE7uBX', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSjBQcWFVRU0wQTQ4MkRKNml3NFNBUUZ4SVNWY1lKNWgxN0FNekl5cCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723139024),
('e7dwIDISkma0UpTXyPTaLYm7AkAYt8GAqE0LVgOe', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQUo1MGYyOVJ0RmxFdFJvamdWNnE3bnc1MWFpMnFGYVlFR3RuTFFxciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723137957),
('eEa8eftfcoGoPtznAZ1WnsI3uhcEnRbsBlniZqZQ', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMGxIMXNRTWtRYXhQZkY5bjczeVRaZWhFclcwU0JNenozaUNESzRqTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723139420),
('EFA4CgNoOBmkN1AMPrmWmDQfHIml62Ruhhu7brrR', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVDV5RXY5TkxwRlpHdXhYT0tCSGU3V2ZNdHFWbG9BTTJqZU5ib2hybyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723136859),
('EqNlld1ZNMt4kFadsA3dXNtpS10g8mQ5Z2OHMKgu', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYzdaeXVmVHdiWTNNVGsxUHdTV1RDdjlzYXZYYnIwaW13d0hSS2hkSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723141476),
('fdkZhaKBd5bHI7ooLMfaUrdknU7w3Ggm4zXnS7NQ', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTlJWbUo3WDZjM1U0emRZMzZVNGVrdXA5eW9YMWNsbXlUOGhvckxuNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723138966),
('FhtYyvuZo6tSUbtUqruNFHRrFDv2o27T8FTHBwrY', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRDIwNTBwdXdLT0xtTDk0Yjh0ajJuT3YwT0VNTzVDWUVWeE5uMW1LaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723139184),
('GCvEIUoWt3xXuLJmAKPidgcLQRco15vsuFkVJx8c', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia2o2dXlXWWhIT0xBSEk5eXJpSmdweEM4bW84cHgyS3ZDSkNPUVJwcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723141104),
('GIFxJRqzub4bE8a7PeYmDrtWMMIjdItH2k1DWIqN', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0dQTE1PQ2dNczlITnA0d2VyNU1Hc21rTWJIa2dWMmZMTEhCWlVMeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723140395),
('GlrKz3umZaKLuOhuRGSgXMV5fI4yy2lSV76xgoJz', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMkF6ZzJlOHc4VEJScWR5elg1M1VPSVJMYVlXMTBPMGdKdVRrSXhMeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723141185),
('GR4XtWj080hzobkObQw2oKsisI7yhNeIPrz5jAcJ', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWVlHWkFxVURROUNmYTdRcTJMbVlucHpQd2RYQXFZdzdoQ3dhdkdjdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723141006),
('h1ASMcEyMrU19WBKHNCh1t4MG3xU6b1sJEUgs8Ng', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibjlNUVQ2V0V1Q3BFWHNWTXRxUVZyTFUwRFBOQVRrUEpvaE94WlhIbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723141361),
('HeTRZf2Etrd2jbyfdjHybQY4M9YbP7hzxYjG3xGn', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZlN2cDFJWlFraUxGcEFEa1FiNzNDZHhjZlFRYldpcGNmcHVFYVdIVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723138738),
('Ib99KRIzD5uRSOH5TbBTqMeljVFsSkkZz4QL0TMW', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYzg2T2o0RkdqaDFnQ1NnWktzUnRieE9uNkJjWk44emRCTTcwUVloTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723140969),
('IJz9VsTj7ZoBCCTnOUalZoPKLlo90hT55piAp2zf', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNEJJRmVKdHV2N1ByOVg3UVVCTFp0bnk0NkFERnFldW1RZ1M2SGRwRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723141342),
('iLMxzdNca7G3V2E3qfBPmM2nqpNQpxfqcFKHJrB3', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia0NyejRNVGtsNnBMbnZ3ZmtZbXdrRGJBU20wUkQ5NWpwOVZEWWF4bCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723136232),
('J1J2iDOVqwsCGVKo08aWb9IOetnLUTaptOo7eWch', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS0R1eUVGSk9qN21rMXpkZndqdTlmb1FHdHlUcWt3bVpJbVpsUFJyeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723138814),
('J7HTZqfCJoAdmgz06mL65LnvXtcw4C7j3sBPtrA0', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSE5IR2VxSGlLdEYxVWdWREI0dlIxeFN4QkQ0U2N0TENRNjN3dVl6YyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723138268),
('j8bLULQaGRrBNs3eUUZijB8gEhqJ7xM6rCW6B5zk', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVURrVWt4aU1zSTZFWnhhZ2FZV3YxYUdIeVh6WnlaQ2pSQ0VRTk1peiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723138199),
('JTYJ4Q3M83XbkX4GI3UYKxeIh8dRdXnlX1spG2fj', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSTdRN2RUb1l0RnBoOTdvZzRpbXZPaU1JVEdWeG9FeXhQWUtOemJGYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723139226),
('JvSLPMip7zZPliXTuVudwMyFCpILWULtAf6RAYcE', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiblFwY0xOb1VQZDlNMEVBclNIUXpHR1luVm45Zk5nUjlxTURrRFVxZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723139213),
('k2gXU0cOSGtNyV4P2aTCwQnycvZw9ulldMUEw8d3', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTmJLbFVZOXN3WHJ3a3gxcktrNjZmT0RnN2hkNXNpNlpLMXpMVlB4SSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723138797),
('KipUBJNRuQOKPJOEW8mpX6sUULSbmg9bXgrzFY8S', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNnNVUTRyOTMwQlhqQ2hDS1VHZEJ2TFRUalZwcE9HMllyTDJxTGVHYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723138999),
('kYRJW5YThVb0UZJuXvyDW5ExLxHwZd2eYmdlQZTd', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib1ZldDlSVGZhcWtUeE9wUENxcUI5VkpqY3RJdHo1RWhiRGpRWmJaQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723138983),
('l30nq8NEjZQZxnZo2QxAkBOn72U03gtZI7W5jxmq', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibEkxQUZnVTFDNWFRQTZZUUxmeXp2bHVQQzR5WDMydnA5NWpoQ1F3NiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723143293),
('l9Fi2BMy0SwNDxdjmmxZLagep6rLMFKaklz96kqb', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic09sVEdUa0hQdFgzZktaZGpUbEFTUXoxNjZVNkhjaVlsVTlKaVp3eCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723134528),
('LXtI2qOwhV7aiUSdUy3sFGkxqUiqVKzSuSIEleXP', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNlVOTzhSRjFaRkg3UFNLNmJXTzBTV3pLQTNwUXVSZWpVbXhoaXhBcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723138052),
('mHqNLbEQQQC08GHThe8b67DSjVZnR02tGTBn63y8', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaVBtdW9MOXNLUDM3MTlDR29NczczcWxmYzBpMFF6VXZGRGRwNTJJayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723140003),
('MkQVi60i7fAvX7rEBD99cGj1FI8wXAuCflmGVR65', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiejFCTjFqdjNaclplaFc4MXJKZncyNnRpOVFjdTN0Zmg4Zm5PZUY5WSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723139154),
('mRdtg6iZC91xswplgwLJc6tKlAuWMFLv2Ngxoqfe', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU0g5elF5WTdyRW5XeFk4UW9ZN00xRjBYSHd0aTZ3am9mSUZtRWFTaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723138287),
('N0jZiVv6KmkN8NOyMNgN0DQK8poH5CCQ30V28sR7', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia2p3dDgwMTNTbTg1ZDNpbnBaU3gyRHN1SEZHdE5BTU5kRVNGalBMbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723139208),
('nYJMY7hm286eEIpjXgHFjTicDuEgHNCCO0OuFJkc', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMTc1UlNVTEJpUlBpRG5abFJicTJURTNkMmRWV000eDFmQ085ak51aiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723136225),
('O0SdAmpUPkPZTHuFncmHlVaStIbqQThL8PfNhXJ9', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiczZ6SVg4VWxnQ1VFSEM0am05dG5HdmtOaUtRMnl0MDg2OHBzeWl1WiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723138234),
('O1ivvdIHE97DrNrJsCInIsCLZyIYbsHEYvubWGYR', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiak55SXVyVjVQbmJjNm1pTEFiaUhqS2EwUEJTRFRKN29iMmlGbXhjOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723136748),
('pq7HHXL7Dt9w1RajBdeRoU39qKCNUaxjrwJyyqFH', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidklkdkJvMlZvdDdiSlRvSFFIdXRvSEZqcWNGZTRkTThxTVA4Vk80byI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723140681),
('QaJQduULF7FndHRbLsgHjF3zW86KpEW2higbDM2u', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMmZIS1o1a3N0NzF4N1hHTmVTWGpweWhSQlhQUUoxTUhhQVpmYU1NaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723138885),
('QjLToTokHYcSYTofAuF6Zsdzaw6K3NkTmySuP0RV', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMEhnZDd4WldjN1FuUnh1RThYbjRXOGxycTBLaUJPanRjaWFYYlNEMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723138866),
('QmJHsJm9PqrT91JX8e1xlp6Ok6mUyL4HT83KtiDZ', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOVN1Q0xFTm45Rnc1VjZOUktlVEhEcnZzS2ZWRXVmZk1mU21ibTR4QSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723139352),
('QSTQDI7lflgYkkIjasaUpX5y7l8tjhySndjATnWH', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaTdtTEdqU2VjaktOZWdId2NtTlZJRGZmc1hkR1BoZnBNUWZiODQxVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723135713),
('qyNgFIpRiv7Sk812YBpyC96wgRKpeXWuCGiSYQoQ', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNHpEZHc1U2ZFUWwwcnFVQVo2c2dTdWQ3Wm05WHE4WlZyUXJzVTVWMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723140952),
('R0YbOE1QujBSrPgHG4YzW3fZiwnnvmcUPbk7fP0w', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaGZ2MnpVUHdxR1loVnl0d2hDMG1yQURFMk5xY3V0b0tjaktOaExacSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723135943),
('RFQUaAAZo2zstKcZsP11U5PpaccBW4HyrYK2DiRQ', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieTFSdU1RZmtnREJySWkwWk1SNG1UVzFWWUdmeWFuRzZJREdZZlJqNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723138771),
('Sf4dTy9MPkzEqksqYFcOtw1wd2HJA0tnAcbhcbi1', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVnQ0NE5HVmhQVGVXYW5CWWRWSEJ6eWhQODNzdlJ3RTg1UGk3SUMxVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723138710),
('SZ6RbFZ2roIZYj3ggGCiC2GAWBu7yXcd7yx2x9JT', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZHhkYk11YlpvQnlTRXhTdWhrVFlVSlROZVU2d3pTakNoSDQ3RWZJdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723139146),
('tDcBPIHou8NnriFLqOi1lCeIflPMl55zH0wL5uNF', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTndJYlhuZE1uSGJEdGJCQXZtVk5KMThYd0RLSWFFZ2Q0ZG1pUlNxQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723138946),
('tLifN19wZuwlSJ914FlGXYUxmIs5KRQBPPtbMYtK', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ1k4dmtXeHhaMG1WanlXOE5yRGhqejZVak40d3NRRHA4bUlMZXdJOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723139171),
('TNHo9F3n7JmwHcqCRwYFGyfNI10hBgVqXPl8ycAj', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibmZYWUx5cU1pWFV5bE1MQkRvQjM0c2o1dU1PRmlCdU1DWW9EODJPSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723138923),
('TXFKMI3DLFBa3DzYHm2wJnxurahfXTwFprpCiR71', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibnRjc0g1S254NWZHOUJ5d3hzdUFneVgxeEV2SjhuV2xhazZUdW1lciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723141117),
('UrIyaQNrYQ5gF0YtxhYsGDWydJDYGSknTN0fB56C', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaVc3NUh6enptcU9rd2ZEbkdHNTFlZGpzQ1lSOGl3VGc5Wlg0c0RlNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723139131),
('Uuzq3ui7ZmuOkWQdTFltMZdwG00r24kOo5zfEKlg', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOUFpRFlpZ3RnRGdYVEJjdElNNFlZdUVVcVlReDVpeWlNcWVEVkYwbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723140821),
('uvH9omsm45t8mJayqbRwlVYUcrkon7qJhOXt06Wk', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTGtOU3hWb3NZTVBCMnJSMEx2bDQwaGRwdGhMNnV3WHZ0bXlGRjl4NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723139138),
('vk7GqFt6XaI0rPOiUTHWHIJIFoHQKut2EXzOl231', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibFk0SkQzQjh2a1d5QXlLTk9RRExqOUs3Tm5MZUZlNnhnWDB4bEZGSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723139201),
('VpLuP7c8kKYKCH7G8H3oHWhd1vL052lhvtfce9pn', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVHd2bDY5Q3gwbHZBek0zRkowNHZVS0tKMEJUZEw2ZjllVGdseDBXaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723138754),
('w3aobGBBevjxdmnoADANoOD1Zkhp2R49hbE6twVl', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieWV5QjdXaFZQMFI0RnY0ODMxeFVGNWJ4SDJLTXYzY1I3eWxMV1pSTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723141127),
('WC4caSPXm6WSKGwLYnweGDz9KMErBKVe6yFXjFOT', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibnRuSkNFdnFuaFlUb1pTdW1iZ3ZxUUtvWE9qTkc4cW9TdTNRRERQdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723136584),
('wk98n6bzyunBk1uGBacXYdDl1Rn7gMKpT6rjteY9', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWk1VWkJTVFJPbWxkY00xbTd2aHpmQ3NYbHBjeHJhdWJDa1BnZmR0SiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723141160),
('wMjUJyEqr49kBDCSeHi4yiPLlY6CiWJQnpSLnlfQ', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiREk4Y01FcnFtM3VHeVVybmhzVmJuUW1OZkJYcWE3NmtGRnFBeDFybyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723139179),
('wMqc7zaEl9AmTHxaYdj0Yhll8LGjaAnumYZKyc2H', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidVJzWE5kZWVqMlhJR1dNSjRNWnVYOUhYRlRGQ1o5WmtoekdOMGQ2cyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723138088),
('WXbF5uTb7TTU4uIlrfBqN62yoe3GmpmeDyBc6wD2', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTzZlR2VRYnlBaHhQaW9ST1RMa2NJR2VzazhjZ2ozV3NLVDdIWWRuWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723140581),
('X4gXmqKOLiLJzlFGHnpgvShPBOS6xm8GZvC0gS9O', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibVhHa2pEbXp5V0R3eXc2T0xYR053MkhvTWx0TDJMN1VLd0xKNVM3WCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723140787),
('X7LEa3qrfLDdNhfGThVZY3V2APORFqRHBccOyX7h', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibXlUYUlhY3U4eEtCdUhDbW8wYTVpQ2VscjZabXJnQ3FqOTlPcUp6SSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723136844),
('xCBajIhN7Bh80kQzyPVNwWOa2JL493S6A4WRWgU0', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid2hJVXhtZzNJODh2M3U1WUN0bGluNWdOeEduVmVoZDNaWHJsRDdGZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723141327),
('xEivZVoYPbstn5ReJ717RMvcDLqz5lJ37HFu6Xta', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS3ZoOHBabDZ0SzhNRjFCMVYwaDhqSmJ3VUZiWWxkaVpYRzBUTDN1WSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723139191),
('Xieou8VPD9H426FGL8nC6ko3Yb803HGpclgfDK3b', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS242NHp6ZjNoeU5oalA3UkI5ZEZscFlveDVKcktEVUVPY1Y2aFBBNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723139012),
('xrm6luQtSp4Wy90JbptV0mZ7maPyFg0V8rlVL7pX', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ01pekd6dWNIZkwzZENPdUNFZ01USDU4MmFtZ0UxSnBnMkdtdnJRWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723139544),
('Xs59wFB6j6W4RT3U9qxGYfwOLqDvXXk7v5oeYP1g', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib3ZZWnhWeW9HT1FFMElaZVdQWk93Z0tPN1NuVldoR1AwNmphc0FCMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723488145),
('XZUQfnmzfZ0EnJB8JiKOgJyI1IXBgUKdrLcLhD6h', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicGtlS05pNWhXS29RWGlPVEtxNXFpTVRjbUwxcFpjYTZhRjdzMmV4eCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723137895),
('y1Gxx1crz6cpYOWnRm6DwgwqBEbLgClvA4CXFTpi', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV2diR01YY3BuU3FrN3V2UXNlUDh2Slg3MlRpWDZ0djBlNkNtUEFYQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723140983),
('yi9NTBCusmllPURlWqQwZ3YaaeI7l29nOtzM20XQ', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoienlkd3lWTVY1UGZmTms2MnhjU2xxTW94cU1ZOUNQdm5RMXc2d3FxRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723135483),
('YLRA9w7wMPibHxWM1ifDZi7w9Xys4WVrzixxzGGG', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWpyZzc5c204SVJXOVY2T1dieHk3aEdWSTNXWW1lZnpmUEVVNGtDVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723140856),
('YMHaHSjJPjfrDjOr6LRkwK9fB0SbeuH9RQPMh5QH', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid0trMjhpZG9XaUtldkhweDJsenBoSkg4a0xxRlBpNHFITURhdXRMZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723141314),
('YMlXS3T4bbQNIrrgxA0NWp3swiv5Qdg42oFC7Akd', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieUxJdHhkV2QyZGpTZG00UThIRUhMZnZXTHViaWJvSG5XYkFuWEFGQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723140732),
('ZDuWjDWL11HqnQBu5MQwbUlEwRDEmiDVLgQ9EfmH', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMmlTM2h4OGFmRzJhRlBJS3ZHZlBGVUpveUc2UXpXdUhLRzVLYXpJUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723138598),
('zeInE76aUBkYir87Zpxg7JVl0nNtbFUTLnYac69l', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRVM1ampSdUJsa2RkM1hMZG45emVCUU9xaVFFZWtEd05VcFBqdTNmNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723136412),
('zkgnGPNIVvYZB9wcn5AF0hXpXq5KPuFovP1yrlVY', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVVY2VDc4Vkg1eGREN0dHRmdjR1hUVGpqT28wZVFyQkNMb1pJcTlKQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723139941),
('zY1LSiqLYsHBDVt8L6MpE8ZjgBYJg1YpR7ZnaqW2', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZkdQYk1lYjhIUzZJVk1KaTJMUTdUck5DU0p5UTExVWk4MXZiTUFpOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1723138059);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Saad Naseer', 'saadnaseeroffice@gmail.com', NULL, '$2y$12$Y7R.wnMUpCIoddWlicuQveWt2QIdCWzSS6.Lyi4C0qgs6gAWUmjVq', 'admin', '1', '2|gPJYmMpgiBbccPGDhn6ZcHIxvTfLZRLNmhVEVIOt0b019063', '2024-08-06 13:04:21', '2024-08-07 12:38:35'),
(2, 'john doe', 'johndoe@gmail.com', NULL, '$2y$12$zVj0FxtRmB7Ix95xmP5XMe3WYT4swMfdjgFDRHoCYi1ZACCcIjdZy', 'admin', '1', '3|Lbi4wfS81QxSpTCzHvPL2POczyAGYNjvfr0JWflOc55318e8', '2024-10-07 13:28:52', '2024-10-07 13:29:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address_details`
--
ALTER TABLE `address_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `address_details_user_id_foreign` (`user_id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookmarks_user_id_foreign` (`user_id`),
  ADD KEY `bookmarks_product_id_foreign` (`product_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_items_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `category_values`
--
ALTER TABLE `category_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_values_product_id_foreign` (`product_id`),
  ADD KEY `category_values_product_category_id_foreign` (`product_category_id`);

--
-- Indexes for table `descriptive_images`
--
ALTER TABLE `descriptive_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `descriptive_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `forget_passwords`
--
ALTER TABLE `forget_passwords`
  ADD PRIMARY KEY (`id`),
  ADD KEY `forget_passwords_user_id_foreign` (`user_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_cart_id_foreign` (`cart_id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_attributes_product_id_foreign` (`product_id`),
  ADD KEY `product_attributes_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_categories_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_colors`
--
ALTER TABLE `product_colors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_colors_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT for table `address_details`
--
ALTER TABLE `address_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bookmarks`
--
ALTER TABLE `bookmarks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `category_values`
--
ALTER TABLE `category_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `descriptive_images`
--
ALTER TABLE `descriptive_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `forget_passwords`
--
ALTER TABLE `forget_passwords`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_colors`
--
ALTER TABLE `product_colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address_details`
--
ALTER TABLE `address_details`
  ADD CONSTRAINT `address_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD CONSTRAINT `bookmarks_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookmarks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_values`
--
ALTER TABLE `category_values`
  ADD CONSTRAINT `category_values_product_category_id_foreign` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `descriptive_images`
--
ALTER TABLE `descriptive_images`
  ADD CONSTRAINT `descriptive_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `forget_passwords`
--
ALTER TABLE `forget_passwords`
  ADD CONSTRAINT `forget_passwords_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD CONSTRAINT `product_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_colors`
--
ALTER TABLE `product_colors`
  ADD CONSTRAINT `product_colors_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
