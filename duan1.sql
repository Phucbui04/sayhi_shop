-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2023 at 07:05 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `duan1`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `position`) VALUES
(1, 'NAM', 'từ từ sẽ có', 1),
(2, 'NỮ', 'chuẩn bị có', 2),
(3, 'TRẺ EM', 'chuẩn bị có', 3),
(4, 'SẢN PHẨM MỚI', 'chỉ là sp', 4),
(9, 'Nam', 'no', 1),
(10, 'Ná»®', 'khá»“n', 2),
(11, 'TRáºº EM', '', 0),
(12, 'Sáº¢N PHáº¨M Má»šI', '11', 4);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `product_id`, `comment`) VALUES
(25, 3, 0, 'Hahahah');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT 0,
  `payment_method` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `creation_date` timestamp NULL DEFAULT NULL,
  `updation_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `is_paid`, `payment_method`, `user_id`, `creation_date`, `updation_date`) VALUES
(203, 4, 'Tiá»n máº·t', 7, NULL, '2023-12-10 17:45:17'),
(204, 4, 'Tiá»n máº·t', 7, NULL, '2023-12-10 18:00:57');

-- --------------------------------------------------------

--
-- Table structure for table `orders_detail`
--

CREATE TABLE `orders_detail` (
  `id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `id_user` int(5) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `creation_date` timestamp NULL DEFAULT current_timestamp(),
  `updation_date` timestamp NULL DEFAULT current_timestamp(),
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders_detail`
--

INSERT INTO `orders_detail` (`id`, `amount`, `id_user`, `order_id`, `product_id`, `creation_date`, `updation_date`, `quantity`) VALUES
(172, 240000, 7, 203, 6, '2023-12-10 17:45:17', '2023-12-10 17:45:17', 1),
(173, 960000, 7, 204, 6, '2023-12-10 18:00:57', '2023-12-10 18:00:57', 4);

-- --------------------------------------------------------

--
-- Table structure for table `price`
--

CREATE TABLE `price` (
  `id` int(11) NOT NULL,
  `range_price` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `price`
--

INSERT INTO `price` (`id`, `range_price`, `status`) VALUES
(1, 'dưới 100', 1),
(2, 'dưới 100 ', 1),
(3, 'từ 150 - 200 ', 1),
(4, 'từ 250 - 400', 1),
(5, 'trên 450 ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `description` text NOT NULL,
  `price` double NOT NULL,
  `quantity` int(3) NOT NULL,
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `status`, `description`, `price`, `quantity`, `image`) VALUES
(1, 1, 'ï¿½o polo', 0, 'chu?n b? cï¿½', 211111, 10, 'ao-khoac-1.jpg'),
(2, 4, 'áo polo 1', 0, 'chuẩn bị có', 200000, 10, 'ao-polo-1.jpg'),
(3, 4, 'áo polo 2', 0, 'chuẩn bị có', 210000, 10, 'ao-polo-2.jpg'),
(4, 1, 'áo polo 3', 0, 'chuẩn bị có', 220000, 10, 'ao-polo-3.jpg'),
(5, 1, 'áo polo 4', 1, 'chuẩn bị có', 230000, 10, 'ao-polo-4.jpg'),
(6, 1, 'áo polo 5', 0, 'chuẩn bị có', 240000, 10, 'ao-polo-5.jpg'),
(7, 1, 'áo polo 6', 1, 'chuẩn bị có', 250000, 10, 'ao-polo-6.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `shipping_address` varchar(255) DEFAULT NULL,
  `shipping_city` varchar(255) DEFAULT NULL,
  `billing_address` varchar(255) NOT NULL,
  `billing_city` varchar(50) NOT NULL,
  `is_admin` int(1) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password`, `full_name`, `phone`, `shipping_address`, `shipping_city`, `billing_address`, `billing_city`, `is_admin`, `status`) VALUES
(1, 'bvphuc2005@gmail.com', 'admin', '123', 'Admin', '0326748579', NULL, NULL, 'KDC 7', 'QN', 1, 0),
(2, 'bvphuc2005@gmail.com', 'Phuc', '123', 'Bui Van Phuc', '998765987', NULL, NULL, 'GV', 'HCM', 0, 0),
(3, 'laithanhhoa16092004@gmail.com', 'thanhhoa', '123', 'Lai Thanh Hoa', '0354951127', 'Nguyen Cong Hoan, P7, Phu Nhuan', 'Nguyen Cong Hoan', 'Tp Ho Chi Minh', 'Nguyen Cong Hoan', 0, 0),
(4, 'anhdtps33577@fpt.edu.vn', 'name', '123', 'Äáº¶NG THáº¾ ANH', '0378966102', '122', 'xÃ£ iadom', 'saa', 'ss', 0, 0),
(5, 'anhdtps33577@fpt.edu.vn', 'kuku', '123', 'Äáº¶NG THáº¾ ANH', '0378966102', '1', 'xÃ£ iadom', 'saa', 'xÃ£ iadom', 0, 0),
(6, 'anhdtps33577@fpt.edu.vn', 'kuku1', '123', 'Äáº¶NG THáº¾ ANH', '0378966102', '1', 'xÃ£ iadom', 'saa', 'xÃ£ iadom', 0, 0),
(7, 'anhdtps33577@fpt.edu.vn', '123', '123', 'Äáº¶NG THáº¾ ANH', '0378966102', 'gialai', 'xÃ£ iadom', 'sÃ i gÃ²n', 'xÃ£ iadom', 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comments_user` (`user_id`),
  ADD KEY `fk_comments_products` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_order_id_foreign` (`order_id`),
  ADD KEY `transactions_product_id_foreign` (`product_id`);

--
-- Indexes for table `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT for table `orders_detail`
--
ALTER TABLE `orders_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT for table `price`
--
ALTER TABLE `price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `products_product_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD CONSTRAINT `orders_detail_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_products_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
