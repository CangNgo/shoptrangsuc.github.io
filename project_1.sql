-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th10 05, 2023 lúc 01:44 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `project_1`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `total_value` double NOT NULL,
  `completed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `quantity` int(10) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `bill_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blogs`
--

CREATE TABLE `blogs` (
  `id` int(10) NOT NULL,
  `title` int(50) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `quantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `img`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Chưa phân loại', 'Updating...', 'For unknow products categories', NULL, '2023-11-02 17:00:00', NULL),
(2, 'Vòng cổ', NULL, 'Các loại vòng cổ dành cho nam, nữ', 'Đang hoạt động', '2023-11-05 11:22:36', NULL),
(3, 'Nhẫn', NULL, NULL, 'Đang hoạt động', '2023-11-05 11:22:36', NULL),
(4, 'Vòng tay', NULL, NULL, 'Đang hoạt động', '2023-11-05 11:24:59', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(10) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_sale` double DEFAULT NULL,
  `id_category` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `img`, `price`, `description`, `price_sale`, `id_category`, `created_at`, `updated_at`) VALUES
(1, 'Vòng cổ mặt dây chuyền hoa hồng vàng 18K', 'https://salt.tikicdn.com/cache/w1200/ts/product/49/21/2b/0c7a7ae4f520b44275f781711350efb0.jpg', 500000, 'Vòng cổ mặt dây chuyền hoa hồng vàng 18K', 400000, 2, '2023-07-20 05:00:00', '0000-00-00'),
(2, 'Nhẫn cưới vàng 18K đính kim cương 2 carat', 'https://cdn.pnj.io/images/detailed/184/sp-gndd00y002111-nhan-cuoi-kim-cuong-vang-18k-pnj-1.png', 10000000, 'Nhẫn cưới vàng 18K đính kim cương 2 carat', 8000000, 3, '2023-07-20 05:00:00', '0000-00-00'),
(3, 'Bông tai vàng 18K đính đá sapphire', 'https://cdn.pnj.io/images/detailed/95/gbxmxmy003678-bong-tai-vang-18k-dinh-da-cz-pnj.png', 300000, 'Bông tai vàng 18K đính đá sapphire', 250000, 1, '2023-11-05 11:17:37', '0000-00-00'),
(4, 'Vòng tay vàng 18K đính đá ruby', 'https://cdn.pnj.io/images/detailed/93/gvrbxmy000201-vong-tay-vang-18k-dinh-da-ruby-pnj-001.png', 150000, '1', 240000, 4, '2023-11-05 11:17:37', NULL),
(5, 'Nhẫn vàng 18K đính đá citrine', 'https://cdn.pnj.io/images/detailed/113/gnctxmc000020-nhan-vang-18k-dinh-da-citrine-pnj-1.png', 700000, 'Nhẫn vàng 18K đính đá citrine', 500000, 3, '2023-07-20 05:00:00', '0000-00-00'),
(6, 'Dây chuyền bạc 925 đính đá CZ', 'https://cdn.vuahanghieu.com/unsafe/0x500/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2022/11/day-chuyen-lili-jewelry-bac-nu-dinh-da-cz-co-4-la-trai-tim-tinh-yeu-lili_732378-mau-bac-636f09f7c2c7b-12112022095031.jpg', 150000, '1', 200000, 1, '2023-11-05 11:17:37', NULL),
(7, 'Nhẫn bạc 925 đính đá CZ', 'https://apj.vn/wp-content/uploads/2020/07/N2.0122.jpg', 50000, 'Nhẫn bạc 925 đính đá CZ', 400000, 3, '2023-11-05 11:17:37', '2023-07-20'),
(8, 'Bông tai bạc 925 đính đá', 'https://cdn.pnj.io/images/detailed/84/sbxmxmk000155-bong-tai-bac-dinh-da-pnjsilver-4002.png', 150000, 'Bông tai bạc 925 đính đá', 120000, 1, '2023-07-20 05:00:00', '0000-00-00'),
(9, 'Vòng tay bạc 925 trơn', 'https://giabachomnay.com/wp-content/uploads/2022/07/vong-tay-kieng-bac-tron.jpg', 100000, 'Vòng tay bạc 925 trơn', 80000, 4, '2023-07-20 05:00:00', '0000-00-00'),
(10, 'Nhẫn cưới bạc 925 đính đá CZ', 'https://lzd-img-global.slatic.net/g/p/f6bebabb907794b249192a629fe86084.jpg_720x720q80.jpg', 30000, 'Nhẫn cưới bạc 925 đính đá CZ', 250000, 3, '0000-00-00 00:00:00', '2023-07-20'),
(11, 'Vòng cổ mặt dây chuyền hoa hồng vàng 18K', 'https://apj.vn/wp-content/uploads/2019/06/M%E1%BA%B7t-D%C3%A2y-N%E1%BB%AF-V%C3%A0ng-18k-M292.jpg', 500000, 'Vòng cổ mặt dây chuyền hoa hồng vàng 18K', 400000, 2, '2023-07-20 05:00:00', '0000-00-00'),
(12, 'Nhẫn cưới vàng 18K đính kim cương 2 carat', 'https://chatve.vn/wp-content/uploads/2018/12/gndrya01539.504-nhan-cuoi-kim-cuong-pnj-chung-doi-vang-18k.png', 10000000, 'Nhẫn cưới vàng 18K đính kim cương 2 carat', 8000000, 3, '2023-07-20 05:00:00', '0000-00-00'),
(13, 'Bông tai vàng 18K đính đá sapphire', 'https://trangdoan.vn/wp-content/uploads/2022/02/GBSPMXY000003-1.png', 300000, 'Bông tai vàng 18K đính đá sapphire', 250000, 1, '2023-07-20 05:00:00', '0000-00-00'),
(14, 'Vòng tay vàng 18K đính đá ruby', 'https://cdn.pnj.io/images/detailed/91/glrbmxy000009-lac-tay-vang-18k-dinh-da-ruby-pnj-001.png', 200000, 'Vòng tay vàng 18K đính đá ruby', 150000, 4, '2023-07-20 05:00:00', '0000-00-00'),
(15, 'Nhẫn vàng 18K đính đá citrine', 'https://cdn.pnj.io/images/detailed/128/gnctxmy000460-nhan-vang-18k-dinh-da-citrine-pnj-1.png', 700000, 'Nhẫn vàng 18K đính đá citrine', 500000, 3, '2023-07-20 05:00:00', '0000-00-00'),
(16, 'Dây chuyền bạc 925 đính đá CZ', 'https://salt.tikicdn.com/cache/w1200/ts/product/0b/ff/a5/59ce4042bd91a798b727d98e1ede8320.jpg', 200000, 'Dây chuyền bạc 925 đính đá CZ', 150000, 1, '2023-07-20 05:00:00', '0000-00-00'),
(17, 'Nhẫn bạc 925 đính đá CZ', 'https://cdn.pnj.io/images/detailed/46/snxmxmk000221-nhan-bac-dinh-da-pnjsilver-01.png', 50000, 'Nhẫn bạc 925 đính đá CZ', 40000, 3, '2023-07-20 05:00:00', '0000-00-00'),
(18, 'Bông tai bạc 925 đính đá', 'https://1.bp.blogspot.com/-lq9HVRMib0I/YDYCOAkgbmI/AAAAAAAAAsk/kHllddyukesZ6bhi98kgu6HHQkeswEIEACLcBGAsYHQ/s0/gbxmxmw000455-bong-tai-pnj-vang-trang-y-18k-1.png', 150000, 'Bông tai bạc 925 đính đá', 120000, 1, '2023-07-20 05:00:00', '0000-00-00'),
(19, 'Vòng tay bạc 925 trơn', 'https://cdn3.dhht.vn/wp-content/uploads/2023/09/DW00400004.jpg', 100000, 'Vòng tay bạc 925 trơn', 80000, 4, '2023-07-20 05:00:00', '0000-00-00'),
(20, 'Nhẫn cưới bạc 925 đính đá CZ', 'https://cdn.pnj.io/images/detailed/46/snxmxmk000221-nhan-bac-dinh-da-pnjsilver-01.png', 30000, 'Nhẫn cưới bạc 925 đính đá CZ', 25000, 3, '2023-07-20 05:00:00', '0000-00-00'),
(21, 'Dây chuyền vàng 18K đính kim cương 5 carat', 'https://cdn.pnj.io/images/detailed/109/gmxmxmy000283-mat-day-chuyen-vang-18k-dinh-da-cz-pnj-03-001.png', 20000000, 'Dây chuyền vàng 18K đính kim cương 5 carat', 15000000, 1, '2023-07-20 05:00:00', '0000-00-00'),
(22, 'Nhẫn Kim Cương Vàng 18K', 'https://locphuc.com.vn/Content/Images/Product/DFH0114R-40483-00851/nhan-nu-trang-suc-kim-cuong-vang-trang-18K-DFH0114R-g1.jpg', 33000000, 'Nhẫn Kim Cương Vàng 18K', 30000000, 3, '2023-07-20 05:00:00', '0000-00-00'),
(23, 'Dây chuyền bạc đính đá hình thiên nga', 'https://cdn.pnj.io/images/detailed/123/smxmxmw060032-mat-day-chuyen-bac-dinh-da-pnjsilver-hinh-thien-nga-01.gif', 2000000, 'Dây chuyền bạc đính đá hình thiên nga', 1900000, 1, '2023-07-20 05:00:00', '0000-00-00'),
(24, 'Lắc tay vàng trắng 14K', 'https://trangsuc.doji.vn/Upload/afbj900060f2cz1_1.jpg', 5000000, 'Lắc tay vàng trắng 14K', 4800000, 1, '2023-07-20 05:00:00', '0000-00-00'),
(25, 'Vòng tay Vàng 18K đính đá CZ ', 'https://cdn.pnj.io/images/detailed/35/gvdrya70603.102-vong-tay-pnj-vang-18k-dinh-da-cz-02.png', 12000000, 'Vòng tay Vàng 18K đính đá CZ', 11000000, 4, '2023-07-20 05:00:00', '0000-00-00'),
(26, 'Nhẫn Kim Tiền Vàng 18K', 'https://cdn.pnj.io/images/detailed/109/gmxmxmy000283-mat-day-chuyen-vang-18k-dinh-da-cz-pnj-03-001.png', 20000000, 'Dây chuyền vàng 18K', 15000000, 3, '2023-07-20 05:00:00', '0000-00-00'),
(27, 'Dây chuyền vàng 18K đính kim cương 5 carat', 'https://cdn.pnj.io/images/detailed/109/gmxmxmy000283-mat-day-chuyen-vang-18k-dinh-da-cz-pnj-03-001.png', 1500000, 'Nhẫn Kim Tiền Vàng 18K', 1450000, 1, '2023-07-20 05:00:00', '0000-00-00'),
(28, 'Nhẫn Cưới Vàng Trắng Kim Cương', 'https://cartino.vn/upload/product/543-4639.jpg', 27000000, 'Nhẫn Cưới Vàng Trắng Kim Cương', 25000000, 3, '2023-07-20 05:00:00', '0000-00-00'),
(29, 'Nhẫn cầu hôn bạch kim Be Yours', 'https://meezjewelry.vn/wp-content/uploads/2023/02/mau-nhan-cau-hon.jpeg', 7000000, 'Nhẫn cầu hôn bạch kim Be Yours', 6000000, 3, '2023-07-20 05:00:00', '0000-00-00'),
(30, 'Lắc Tay Swarovski Thiên Nga', 'https://fado.vn/blog/wp-content/uploads/2021/05/Thiet-ke-ti-mi-sang-trong-cua-vong-tay-Swarovski-thien-nga.jpg', 2100000, 'Lắc Tay Swarovski Thiên Nga', 2000000, 1, '2023-07-20 05:00:00', '0000-00-00'),
(31, 'Vòng tay Kim cương Vàng trắng 18K', 'https://cdn.pnj.io/images/detailed/72/gv00ddw000227-vo-vong-tay-kim-cuong-vang-trang-18k-pnj-01.png', 190000000, 'Vòng tay Kim cương Vàng trắng 18K', 18000000, 4, '2023-07-20 05:00:00', '0000-00-00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slide`
--

CREATE TABLE `slide` (
  `id` int(10) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `position` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `slide`
--

INSERT INTO `slide` (`id`, `img`, `position`, `created_at`, `updated_at`) VALUES
(1, 'https://locphuc.com.vn/Content/Images/Event/SlideBanner2_PC.jpg', 'main', '2023-11-05 11:31:07', NULL),
(2, 'https://trangsuclucky.vn/wp-content/uploads/2023/08/Banner-Slide-Web-1972x640-Mois-1024x332.png', 'main', '2023-11-05 11:31:31', NULL),
(3, 'https://vn-test-11.slatic.net/shop/32acf61f91a3539df37288aa8796acc3.jpeg', 'main', '2023-11-05 11:31:48', NULL),
(4, 'https://beachhut.weba.vn/shop/images/beachhut/hinhanh/slide1.jpg', NULL, '2023-11-05 11:31:54', NULL),
(5, 'https://cdn.pnj.io/images/promo/185/Saphire-mobile.png', NULL, '2023-11-05 11:32:17', NULL),
(6, 'https://cdn.pnj.io/images/promo/141/Banner_Bong_Tai_1200x450.jpg ', NULL, '2023-11-05 11:32:20', NULL),
(7, 'https://cdn.pnj.io/images/promo/185/Ruby-mobile.png', NULL, '2023-11-05 11:32:45', NULL),
(8, 'https://bacruby.com/thumb/1366x520/1/upload/hinhanh/088492502043339.jpg', NULL, '2023-11-05 11:33:13', NULL),
(9, 'https://locphuc.com.vn/Content/Images/Event/SlideBanner2_PC.jpg', NULL, '2023-11-05 11:33:18', NULL),
(10, 'https://giatinjewelry.vn/wp-content/uploads/2021/10/trang-suc-kim-cuong-copy.jpg', NULL, '2023-11-05 11:33:41', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `is_admin` int(1) NOT NULL,
  `verify_code` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `bill_id` (`bill_id`);

--
-- Chỉ mục cho bảng `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_category` (`id_category`);

--
-- Chỉ mục cho bảng `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD CONSTRAINT `bill_detail_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `bill_detail_ibfk_2` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`id`);

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
