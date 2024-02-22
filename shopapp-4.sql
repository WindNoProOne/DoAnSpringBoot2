-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th2 19, 2024 lúc 12:40 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shopapp`
--
CREATE DATABASE IF NOT EXISTS `shopapp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `shopapp`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT 'Tên danh mục, vd: đồ điện tử'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Apple'),
(3, 'Đồ Điện Tử'),
(4, 'Đồ Gia Dụng'),
(5, 'Chú Bé Đần'),
(7, 'Laptop Gaming');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `evaluate`
--

CREATE TABLE `evaluate` (
  `id` int(11) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `evaluate`
--

INSERT INTO `evaluate` (`id`, `comment`, `rate`, `product_id`, `user_id`) VALUES
(4, 'Sản phẩm rất tuyệt vời', 5, 9, 9),
(5, 'Sản phẩm rất tuyệt vời', 5, 5784, 9),
(6, 'Sản phẩm rất tuyệt vời', 5, 5784, 12),
(7, 'Sản phẩm ổn', 3.5, 1, 12);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `fullname` varchar(100) DEFAULT '',
  `email` varchar(100) DEFAULT '',
  `phone_number` varchar(20) NOT NULL,
  `address` varchar(200) NOT NULL,
  `note` varchar(100) DEFAULT '',
  `order_date` datetime DEFAULT current_timestamp(),
  `status` enum('pending','processing','shipped','delivered','cancelled') DEFAULT NULL COMMENT 'Trạng thái đơn hàng',
  `total_money` float DEFAULT NULL CHECK (`total_money` >= 0),
  `shipping_method` varchar(100) DEFAULT NULL,
  `shipping_address` varchar(200) DEFAULT NULL,
  `shipping_date` date DEFAULT NULL,
  `tracking_number` varchar(100) DEFAULT NULL,
  `payment_method` varchar(100) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `fullname`, `email`, `phone_number`, `address`, `note`, `order_date`, `status`, `total_money`, `shipping_method`, `shipping_address`, `shipping_date`, `tracking_number`, `payment_method`, `active`) VALUES
(25, 9, 'Trịnh Quang Duy 1702', 'abc@gmail.com', '112233', 'Vinhomes Grand Park', 'hasagi', '2024-02-05 23:44:53', NULL, 200.12, 'express', NULL, NULL, NULL, 'cod', 1),
(26, 9, 'Messi', 'trinhquangduy3442@gmail.com', '0763383442', '133/26 đường số 8 phường 11 quận Gò Vấp', 'No', '2024-02-14 07:07:31', 'pending', 6999.95, 'express', NULL, '2024-02-14', NULL, 'cod', 1),
(27, 9, 'Si Thuế', 'abc@gmail.com', '112233', 'Miami', 'hàng dễ vỡ', '2024-02-14 07:14:24', 'pending', 200.12, 'express', NULL, '2024-02-14', NULL, 'cod', 1),
(28, 12, 'Yasuo', 'yasuo@gmail.com', '0123456789', 'Ionia', 'No', '2024-02-18 15:22:29', 'pending', 7599.98, 'express', NULL, '2024-02-18', NULL, 'cod', 1),
(29, 12, 'Trinh Duy', 'trinhquangduy3442@gmail.com', '0763383442', '133/26 đường số 8 phường 11 quận Gò Vấp', 'No', '2024-02-18 15:26:17', 'pending', 1599.99, 'express', NULL, '2024-02-18', NULL, 'cod', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL CHECK (`price` >= 0),
  `number_of_products` int(11) DEFAULT NULL CHECK (`number_of_products` > 0),
  `total_money` float DEFAULT NULL CHECK (`total_money` >= 0),
  `color` varchar(20) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `price`, `number_of_products`, `total_money`, `color`) VALUES
(21, 25, 1, 1600, 2, NULL, NULL),
(22, 25, 5786, 1299.95, 4, NULL, NULL),
(23, 26, 9, 1399.99, 5, NULL, NULL),
(24, 27, 1, 1600, 7, NULL, NULL),
(25, 27, 9, 1399.99, 2, NULL, NULL),
(26, 27, 5784, 1599.99, 3, NULL, NULL),
(27, 28, 1, 1600, 3, NULL, NULL),
(28, 28, 9, 1399.99, 2, NULL, NULL),
(29, 29, 5784, 1599.99, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(350) DEFAULT NULL COMMENT 'Tên sản phẩm',
  `price` float NOT NULL CHECK (`price` >= 0),
  `thumbnail` varchar(300) DEFAULT '',
  `description` longtext DEFAULT '',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `thumbnail`, `description`, `created_at`, `updated_at`, `category_id`) VALUES
(1, 'Asus ROG Zenphyrus M16 123', 1600, '2196ed3f-3964-48eb-8d04-dd3fccd3ffcd_zen4.png', 'Zenphyrus ROG Gaming Laptop', '2023-12-25 03:52:07', '2024-02-17 02:18:06', 7),
(9, 'Lenovo Legion 5 2022', 1399.99, '0897df2f-e550-457f-9b98-3ef35ac04ec9_lenovotest1.jpg', 'Gaming Laptop Legion', '2023-12-25 03:52:08', '2024-01-25 08:50:46', 7),
(5784, 'Macbook Pro 14 inch M3', 1599.99, '2c0fd7d3-1c1d-4fe7-b6cb-49e31b6f7ba7_macbooktest1.jpg', 'The new generation of Macbook Pro', '2024-01-20 11:03:32', '2024-01-25 08:49:57', 1),
(5785, 'Iphone 15 Pro', 899.95, 'df2a9642-6f79-4da0-8200-5603c83f1774_15pro.jpg', 'Apple Iphone', '2024-01-25 11:54:27', '2024-01-25 11:54:27', 1),
(5786, 'Iphone 15 Pro Max', 1299.95, '55262e85-5412-4227-a3c9-f2d5b2bb7938_15promax.jpeg', 'Apple Iphone', '2024-01-25 11:54:36', '2024-01-25 11:54:36', 1),
(5787, 'Iphone 15', 699.95, 'a7584f02-6482-4bce-86b8-b6d56f21b6ea_ip15.jpg', 'Apple Iphone', '2024-01-25 11:54:49', '2024-01-25 11:54:49', 1),
(5788, 'Iphone 15 Plus', 819.95, 'c7af2703-318f-45d5-bda7-07f415f8bbaa_15plus.jpg', 'Apple Iphone', '2024-01-25 11:55:00', '2024-01-25 11:55:00', 1),
(5789, 'Macbook air m1', 1099.95, 'c0e45e7e-71e3-4542-a345-ccc64acfd4e4_airm1.jpg', 'Apple Macbook', '2024-01-25 11:55:24', '2024-01-25 11:55:24', 1),
(5790, 'Macbook air m2', 1299.95, '9f39a00d-01f9-4f6e-8c58-a01a319facb6_airm2.jpeg', 'Apple Macbook', '2024-01-25 11:55:41', '2024-01-25 11:55:41', 1),
(5791, 'Macbook Pro 14 inch M1 Pro Base', 2099.95, 'b2324b1c-67fc-471c-af2d-1daecc47ac51_m3pro.jpg', 'Apple Macbook', '2024-01-25 11:56:23', '2024-01-25 11:56:23', 1),
(5792, 'Macbook Pro 16 inch M1 Pro Base', 2299.95, 'c651945e-c2dc-4cbd-8d83-39876bfc05d3_m316inch.jpg', 'Apple Macbook', '2024-01-25 11:59:52', '2024-01-25 11:59:52', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `image_url` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_url`) VALUES
(23, 9, '0897df2f-e550-457f-9b98-3ef35ac04ec9_lenovotest1.jpg'),
(24, 5784, '2c0fd7d3-1c1d-4fe7-b6cb-49e31b6f7ba7_macbooktest1.jpg'),
(25, 5785, 'df2a9642-6f79-4da0-8200-5603c83f1774_15pro.jpg'),
(26, 5786, '55262e85-5412-4227-a3c9-f2d5b2bb7938_15promax.jpeg'),
(27, 5787, 'a7584f02-6482-4bce-86b8-b6d56f21b6ea_ip15.jpg'),
(29, 5788, 'c7af2703-318f-45d5-bda7-07f415f8bbaa_15plus.jpg'),
(30, 5789, 'c0e45e7e-71e3-4542-a345-ccc64acfd4e4_airm1.jpg'),
(31, 5790, '9f39a00d-01f9-4f6e-8c58-a01a319facb6_airm2.jpeg'),
(32, 5791, 'b2324b1c-67fc-471c-af2d-1daecc47ac51_m3pro.jpg'),
(33, 5792, 'c651945e-c2dc-4cbd-8d83-39876bfc05d3_m316inch.jpg'),
(39, 1, '2196ed3f-3964-48eb-8d04-dd3fccd3ffcd_zen4.png'),
(40, 1, '7afa0895-3e69-4b97-a95e-4e59bdea6ebe_zen5.png'),
(41, 1, '092e54b5-a736-42e8-851d-e5e4cca17ef9_zenphyrus2.png'),
(42, 1, '4ed12b55-3508-44a8-903e-b67bd6125e50_zenphyrustest1.png'),
(43, 1, 'c2cfc949-15e1-4a6f-ad40-a463b4f595f1_zephyrus3.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'User'),
(2, 'Admin');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `social_accounts`
--

CREATE TABLE `social_accounts` (
  `id` int(11) NOT NULL,
  `provider` varchar(20) NOT NULL COMMENT 'Tên nhà social network',
  `provider_id` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL COMMENT 'Email tài khoản',
  `name` varchar(100) NOT NULL COMMENT 'Tên người dùng',
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `token_type` varchar(50) NOT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) DEFAULT '',
  `phone_number` varchar(10) NOT NULL,
  `address` varchar(200) DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `date_of_birth` date DEFAULT NULL,
  `facebook_account_id` int(11) DEFAULT 0,
  `google_account_id` int(11) DEFAULT 0,
  `role_id` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `fullname`, `phone_number`, `address`, `password`, `created_at`, `updated_at`, `is_active`, `date_of_birth`, `facebook_account_id`, `google_account_id`, `role_id`, `email`) VALUES
(2, 'Test User1', '0908123456', '133/26 GV', '$2a$10$BmhfWDYmsH3MEMjFMp760.v1p8/oUCMG1vQwh7az2U6wmSlsJq6PS', '2024-01-06 03:09:36', '2024-01-06 03:09:36', 0, '2001-02-17', 0, 0, 1, 'mrbeast1@gmail.com'),
(3, 'Admin1', '0903777888', 'Nhà a, Ngõ b, Ngách c, Quận d', '$2a$10$wnvWCmkMLJwY94o8S75wyOafQIOPGOpNLuqqbZlhYM2KnEbciUzEC', '2024-01-11 12:40:46', '2024-01-11 12:40:46', 0, '1999-01-01', 0, 0, 2, 'admin1@gmail.com'),
(6, 'Trịnh Quang Duy', '0763383442', 'Ha Noi', '$2a$10$T5gE/2B8w5VqasXh5i1SZutK7NYNR8U16EN.izGLwZAKW1S5zIaVi', '2024-01-16 17:31:39', '2024-01-16 17:31:39', 0, '2001-02-17', 0, 0, 1, 'nguyenvantest@gmail.com'),
(7, 'Admin Test', '0903777889', 'Nhà a, Ngõ b, Ngách c, Quận d', '$2a$10$N81a6vkxBQTEDWCbzuxoU.sRfrorhtAkrenjV5wmlRCUQZQahzpUW', '2024-01-27 05:30:06', '2024-01-27 05:30:06', 0, '1999-01-01', 0, 0, 1, 'admintest@gmail.com'),
(9, 'Lionel Andrés Leo Messi', '0912121214', 'Miami, USA', '$2a$10$WcsOpT/5HAXTDWX8m.Bey.q2hKDrY2JR48OdbPLfR1eKD1qOFjl7i', '2024-02-02 10:01:48', '2024-02-17 14:43:16', 1, '1987-06-24', 0, 0, 1, 'sithuearg@gmail.com'),
(10, 'admin', '0903777889', 'Nhà a, Ngõ b, Ngách c, Quận d', '$2a$10$Qecz/c3WKhlL8z5oEhw/5uGvSNo8qaF2/SlmqXSbTCOAFBw5uTKXG', '2024-02-03 01:03:12', '2024-02-03 01:03:12', 1, '1999-01-01', 0, 0, 2, 'admin@gmail.com'),
(12, 'Lê Văn Yasuo', '0901090901', '133/26 đường số 8 phường 11 quận Gò Vấp', '$2a$10$PBvg/ULLowC0utQe4AHiIekaqFjvF2aUyoFo6wBhiH6vqs5nIREBS', '2024-02-17 16:57:44', '2024-02-17 16:57:44', 1, '2003-02-17', 0, 0, 1, 'yasuo@gmail.com');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `evaluate`
--
ALTER TABLE `evaluate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_category` (`category_id`);

--
-- Chỉ mục cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_images_product_id` (`product_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `social_accounts`
--
ALTER TABLE `social_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `evaluate`
--
ALTER TABLE `evaluate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5814;

--
-- AUTO_INCREMENT cho bảng `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `evaluate`
--
ALTER TABLE `evaluate`
  ADD CONSTRAINT `evaluate_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `evaluate_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
