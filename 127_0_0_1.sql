-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 06, 2020 lúc 04:43 AM
-- Phiên bản máy phục vụ: 10.4.8-MariaDB
-- Phiên bản PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `bkacad`
--
CREATE DATABASE IF NOT EXISTS `bkacad` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `bkacad`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bai_thi`
--

CREATE TABLE `bai_thi` (
  `ma_bai_thi` int(11) NOT NULL,
  `ma_loai_thi` int(11) NOT NULL,
  `ma_mon` int(11) NOT NULL,
  `ngay_thi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `diem_danh`
--

CREATE TABLE `diem_danh` (
  `ma_diem_danh` int(11) NOT NULL,
  `ma_giao_vien` int(11) NOT NULL,
  `ma_mon` int(11) NOT NULL,
  `ma_lop_hoc` int(11) NOT NULL,
  `ngay` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `diem_danh_chi_tiet`
--

CREATE TABLE `diem_danh_chi_tiet` (
  `ma_sinh_vien` int(11) NOT NULL,
  `ma_diem_danh` int(11) NOT NULL,
  `tinh_trang_di_hoc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giao_vien`
--

CREATE TABLE `giao_vien` (
  `ma_giao_vien` int(11) NOT NULL,
  `ten_giao_vien` varchar(50) NOT NULL,
  `gioi_tinh` bit(1) NOT NULL,
  `mat_khau` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `so_dien_thoai` varchar(20) NOT NULL,
  `ngay_sinh` date NOT NULL,
  `trang_thai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `giao_vien`
--

INSERT INTO `giao_vien` (`ma_giao_vien`, `ten_giao_vien`, `gioi_tinh`, `mat_khau`, `email`, `so_dien_thoai`, `ngay_sinh`, `trang_thai`) VALUES
(1, 'adsd', b'0', '', '', '', '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giao_vu`
--

CREATE TABLE `giao_vu` (
  `ma_giao_vu` int(11) NOT NULL,
  `ten_giao_vu` int(11) NOT NULL,
  `gioi_tinh` int(11) NOT NULL,
  `ngay_sinh` int(11) NOT NULL,
  `mat_khau` int(11) NOT NULL,
  `so_dien_thoai` int(11) NOT NULL,
  `email` int(11) NOT NULL,
  `trang_thai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ket_qua_thi`
--

CREATE TABLE `ket_qua_thi` (
  `ma_bai_thi` int(11) NOT NULL,
  `ma_sinh_vien` int(11) NOT NULL,
  `diem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khoa_hoc`
--

CREATE TABLE `khoa_hoc` (
  `ma_khoa_hoc` int(11) NOT NULL,
  `ten_khoa_hoc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loai_bai_thi`
--

CREATE TABLE `loai_bai_thi` (
  `ma_loai_thi` int(11) NOT NULL,
  `ten_loai_thi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lop_hoc`
--

CREATE TABLE `lop_hoc` (
  `ma_lop_hoc` int(11) NOT NULL,
  `ten_lop_hoc` varchar(50) NOT NULL,
  `ma_khoa_hoc` int(11) NOT NULL,
  `ma_nganh_hoc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `lop_hoc`
--

INSERT INTO `lop_hoc` (`ma_lop_hoc`, `ten_lop_hoc`, `ma_khoa_hoc`, `ma_nganh_hoc`) VALUES
(1, 'â', 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mon_hoc`
--

CREATE TABLE `mon_hoc` (
  `ma_mon_hoc` int(11) NOT NULL,
  `ten_mon_hoc` int(11) NOT NULL,
  `nganh_hoc` int(11) NOT NULL,
  `so_gio_hoc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mon_hoc`
--

INSERT INTO `mon_hoc` (`ma_mon_hoc`, `ten_mon_hoc`, `nganh_hoc`, `so_gio_hoc`) VALUES
(1, 22, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nganh_hoc`
--

CREATE TABLE `nganh_hoc` (
  `ma_nganh_hoc` int(11) NOT NULL,
  `ten_nganh_hoc` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phan_cong`
--

CREATE TABLE `phan_cong` (
  `ma_lop_hoc` int(11) NOT NULL,
  `ma_mon_hoc` int(11) NOT NULL,
  `ma_giao_vien` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `phan_cong`
--

INSERT INTO `phan_cong` (`ma_lop_hoc`, `ma_mon_hoc`, `ma_giao_vien`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sinh_vien`
--

CREATE TABLE `sinh_vien` (
  `ma_sinh_vien` int(11) NOT NULL,
  `ten_sinh_vien` varchar(100) NOT NULL,
  `gioi_tinh` bit(1) NOT NULL,
  `ngay_sinh` date NOT NULL,
  `mat_khau` varchar(50) NOT NULL,
  `so_dien_thoai` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `trang_thai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `diem_danh`
--
ALTER TABLE `diem_danh`
  ADD PRIMARY KEY (`ma_diem_danh`);

--
-- Chỉ mục cho bảng `diem_danh_chi_tiet`
--
ALTER TABLE `diem_danh_chi_tiet`
  ADD PRIMARY KEY (`ma_sinh_vien`);

--
-- Chỉ mục cho bảng `giao_vien`
--
ALTER TABLE `giao_vien`
  ADD PRIMARY KEY (`ma_giao_vien`);

--
-- Chỉ mục cho bảng `khoa_hoc`
--
ALTER TABLE `khoa_hoc`
  ADD PRIMARY KEY (`ma_khoa_hoc`);

--
-- Chỉ mục cho bảng `loai_bai_thi`
--
ALTER TABLE `loai_bai_thi`
  ADD PRIMARY KEY (`ma_loai_thi`);

--
-- Chỉ mục cho bảng `lop_hoc`
--
ALTER TABLE `lop_hoc`
  ADD PRIMARY KEY (`ma_lop_hoc`);

--
-- Chỉ mục cho bảng `mon_hoc`
--
ALTER TABLE `mon_hoc`
  ADD PRIMARY KEY (`ma_mon_hoc`);

--
-- Chỉ mục cho bảng `nganh_hoc`
--
ALTER TABLE `nganh_hoc`
  ADD PRIMARY KEY (`ma_nganh_hoc`);

--
-- Chỉ mục cho bảng `phan_cong`
--
ALTER TABLE `phan_cong`
  ADD PRIMARY KEY (`ma_lop_hoc`,`ma_mon_hoc`),
  ADD KEY `ma_giao_vien` (`ma_giao_vien`),
  ADD KEY `ma_mon_hoc` (`ma_mon_hoc`);

--
-- Chỉ mục cho bảng `sinh_vien`
--
ALTER TABLE `sinh_vien`
  ADD PRIMARY KEY (`ma_sinh_vien`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `diem_danh_chi_tiet`
--
ALTER TABLE `diem_danh_chi_tiet`
  MODIFY `ma_sinh_vien` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `giao_vien`
--
ALTER TABLE `giao_vien`
  MODIFY `ma_giao_vien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `khoa_hoc`
--
ALTER TABLE `khoa_hoc`
  MODIFY `ma_khoa_hoc` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `loai_bai_thi`
--
ALTER TABLE `loai_bai_thi`
  MODIFY `ma_loai_thi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `lop_hoc`
--
ALTER TABLE `lop_hoc`
  MODIFY `ma_lop_hoc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `mon_hoc`
--
ALTER TABLE `mon_hoc`
  MODIFY `ma_mon_hoc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `nganh_hoc`
--
ALTER TABLE `nganh_hoc`
  MODIFY `ma_nganh_hoc` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `phan_cong`
--
ALTER TABLE `phan_cong`
  ADD CONSTRAINT `phan_cong_ibfk_1` FOREIGN KEY (`ma_giao_vien`) REFERENCES `giao_vien` (`ma_giao_vien`),
  ADD CONSTRAINT `phan_cong_ibfk_3` FOREIGN KEY (`ma_mon_hoc`) REFERENCES `mon_hoc` (`ma_mon_hoc`),
  ADD CONSTRAINT `phan_cong_ibfk_4` FOREIGN KEY (`ma_lop_hoc`) REFERENCES `lop_hoc` (`ma_lop_hoc`);
--
-- Cơ sở dữ liệu: `bkd04`
--
CREATE DATABASE IF NOT EXISTS `bkd04` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bkd04`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `image`) VALUES
(2, 'Gà rán', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMSEhUTExMVFhUXGBgYGRgYGRoYFxYeGBgYGBgXGhYYHSggGholHRYVITEhJSkrLi4uFx8zODMtNygtLisBCgoKDg0OGxAQGy0mICYvLS8vKy0tLSstMC8tLS0tLS0tLS0tLS0tLS0tL'),
(3, 'gà rán', 'https://thucthan.com/media/2018/06/ga-ran/cach-lam-ga-ran.jpg'),
(4, 'khoai tây', 'https://ihs.org.vn/wp-content/uploads/2020/05/tri-nam-da-tu-khoai-tay-1.jpg'),
(6, 'nam', ''),
(7, '', ''),
(8, '', ''),
(9, 'Thế Huy', '');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Cơ sở dữ liệu: `db_banhang`
--
CREATE DATABASE IF NOT EXISTS `db_banhang` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `db_banhang`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bills`
--
-- Error reading structure for table db_banhang.bills: #1932 - Table 'db_banhang.bills' doesn't exist in engine
-- Error reading data for table db_banhang.bills: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `db_banhang`.`bills`' at line 1

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_detail`
--
-- Error reading structure for table db_banhang.bill_detail: #1932 - Table 'db_banhang.bill_detail' doesn't exist in engine
-- Error reading data for table db_banhang.bill_detail: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `db_banhang`.`bill_detail`' at line 1

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--
-- Error reading structure for table db_banhang.customers: #1932 - Table 'db_banhang.customers' doesn't exist in engine
-- Error reading data for table db_banhang.customers: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `db_banhang`.`customers`' at line 1

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--
-- Error reading structure for table db_banhang.news: #1932 - Table 'db_banhang.news' doesn't exist in engine
-- Error reading data for table db_banhang.news: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `db_banhang`.`news`' at line 1

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--
-- Error reading structure for table db_banhang.products: #1932 - Table 'db_banhang.products' doesn't exist in engine
-- Error reading data for table db_banhang.products: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `db_banhang`.`products`' at line 1

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sellers`
--
-- Error reading structure for table db_banhang.sellers: #1932 - Table 'db_banhang.sellers' doesn't exist in engine
-- Error reading data for table db_banhang.sellers: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `db_banhang`.`sellers`' at line 1

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slides`
--
-- Error reading structure for table db_banhang.slides: #1932 - Table 'db_banhang.slides' doesn't exist in engine
-- Error reading data for table db_banhang.slides: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `db_banhang`.`slides`' at line 1

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type_products`
--
-- Error reading structure for table db_banhang.type_products: #1932 - Table 'db_banhang.type_products' doesn't exist in engine
-- Error reading data for table db_banhang.type_products: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `db_banhang`.`type_products`' at line 1
--
-- Cơ sở dữ liệu: `db_banhang1`
--
CREATE DATABASE IF NOT EXISTS `db_banhang1` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `db_banhang1`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `total` float DEFAULT NULL COMMENT 'tổng tiền',
  `payment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình thức thanh toán',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `bills`
--

INSERT INTO `bills` (`id`, `id_customer`, `date_order`, `total`, `payment`, `note`, `created_at`, `updated_at`) VALUES
(14, 14, '2017-03-23', 160000, 'COD', 'k', '2017-03-23 04:46:05', '2017-03-23 04:46:05'),
(13, 13, '2017-03-21', 400000, 'ATM', 'Vui lòng giao hàng trước 5h', '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(12, 12, '2017-03-21', 520000, 'COD', 'Vui lòng chuyển đúng hạn', '2017-03-21 07:20:07', '2017-03-21 07:20:07'),
(11, 11, '2017-03-21', 420000, 'COD', 'không chú', '2017-03-21 07:16:09', '2017-03-21 07:16:09'),
(15, 15, '2017-03-24', 220000, 'COD', 'e', '2017-03-24 07:14:32', '2017-03-24 07:14:32');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_bill` int(10) NOT NULL,
  `id_product` int(10) NOT NULL,
  `quantity` int(11) NOT NULL COMMENT 'số lượng',
  `unit_price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `bill_detail`
--

INSERT INTO `bill_detail` (`id`, `id_bill`, `id_product`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(18, 15, 62, 5, 220000, '2017-03-24 07:14:32', '2017-03-24 07:14:32'),
(17, 14, 2, 1, 160000, '2017-03-23 04:46:05', '2017-03-23 04:46:05'),
(16, 13, 60, 1, 200000, '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(15, 13, 59, 1, 200000, '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(14, 12, 60, 2, 200000, '2017-03-21 07:20:07', '2017-03-21 07:20:07'),
(13, 12, 61, 1, 120000, '2017-03-21 07:20:07', '2017-03-21 07:20:07'),
(12, 11, 61, 1, 120000, '2017-03-21 07:16:09', '2017-03-21 07:16:09'),
(11, 11, 57, 2, 150000, '2017-03-21 07:16:09', '2017-03-21 07:16:09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`id`, `name`, `gender`, `email`, `address`, `phone_number`, `note`, `created_at`, `updated_at`) VALUES
(15, 'ê', 'Nữ', 'huongnguyen@gmail.com', 'e', 'e', 'e', '2017-03-24 07:14:32', '2017-03-24 07:14:32'),
(14, 'hhh', 'nam', 'huongnguyen@gmail.com', 'Lê thị riêng', '99999999999999999', 'k', '2017-03-23 04:46:05', '2017-03-23 04:46:05'),
(13, 'Hương Hương', 'Nữ', 'huongnguyenak96@gmail.com', 'Lê Thị Riêng, Quận 1', '23456789', 'Vui lòng giao hàng trước 5h', '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(12, 'Khoa phạm', 'Nam', 'khoapham@gmail.com', 'Lê thị riêng', '1234567890', 'Vui lòng chuyển đúng hạn', '2017-03-21 07:20:07', '2017-03-21 07:20:07'),
(11, 'Hương Hương', 'Nữ', 'huongnguyenak96@gmail.com', 'Lê Thị Riêng, Quận 1', '234567890-', 'không chú', '2017-03-21 07:16:09', '2017-03-21 07:16:09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` int(10) NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'tiêu đề',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'nội dung',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'hình',
  `create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `image`, `create_at`, `update_at`) VALUES
(1, 'Mùa trung thu năm nay, Hỷ Lâm Môn muốn gửi đến quý khách hàng sản phẩm mới xuất hiện lần đầu tiên tại Việt nam \"Bánh trung thu Bơ Sữa HongKong\".', 'Những ý tưởng dưới đây sẽ giúp bạn sắp xếp tủ quần áo trong phòng ngủ chật hẹp của mình một cách dễ dàng và hiệu quả nhất. ', 'sample1.jpg', '2017-03-11 06:20:23', '0000-00-00 00:00:00'),
(2, 'Tư vấn cải tạo phòng ngủ nhỏ sao cho thoải mái và thoáng mát', 'Chúng tôi sẽ tư vấn cải tạo và bố trí nội thất để giúp phòng ngủ của chàng trai độc thân thật thoải mái, thoáng mát và sáng sủa nhất. ', 'sample2.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(3, 'Đồ gỗ nội thất và nhu cầu, xu hướng sử dụng của người dùng', 'Đồ gỗ nội thất ngày càng được sử dụng phổ biến nhờ vào hiệu quả mà nó mang lại cho không gian kiến trúc. Xu thế của các gia đình hiện nay là muốn đem thiên nhiên vào nhà ', 'sample3.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(4, 'Hướng dẫn sử dụng bảo quản đồ gỗ, nội thất.', 'Ngày nay, xu hướng chọn vật dụng làm bằng gỗ để trang trí, sử dụng trong văn phòng, gia đình được nhiều người ưa chuộng và quan tâm. Trên thị trường có nhiều sản phẩm mẫu ', 'sample4.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(5, 'Phong cách mới trong sử dụng đồ gỗ nội thất gia đình', 'Đồ gỗ nội thất gia đình ngày càng được sử dụng phổ biến nhờ vào hiệu quả mà nó mang lại cho không gian kiến trúc. Phong cách sử dụng đồ gỗ hiện nay của các gia đình hầu h ', 'sample5.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_type` int(10) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` float DEFAULT NULL,
  `promotion_price` float DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `id_type`, `description`, `unit_price`, `promotion_price`, `image`, `unit`, `new`, `created_at`, `updated_at`) VALUES
(1, 'Bánh Crepe Sầu riêng', 5, 'Bánh crepe sầu riêng nhà làm', 150000, 120000, '1430967449-pancake-sau-rieng-6.jpg', 'hộp', 1, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(2, 'Bánh Crepe Chocolate', 6, '', 180000, 160000, 'crepe-chocolate.jpg', 'hộp', 1, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(3, 'Bánh Crepe Sầu riêng - Chuối', 5, '', 150000, 120000, 'crepe-chuoi.jpg', 'hộp', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(4, 'Bánh Crepe Đào', 5, '', 160000, 0, 'crepe-dao.jpg', 'hộp', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(5, 'Bánh Crepe Dâu', 5, '', 160000, 0, 'crepedau.jpg', 'hộp', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(6, 'Bánh Crepe Pháp', 5, '', 200000, 180000, 'crepe-phap.jpg', 'hộp', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(7, 'Bánh Crepe Táo', 5, '', 160000, 0, 'crepe-tao.jpg', 'hộp', 1, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(8, 'Bánh Crepe Trà xanh', 5, '', 160000, 150000, 'crepe-traxanh.jpg', 'hộp', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(9, 'Bánh Crepe Sầu riêng và Dứa', 5, '', 160000, 150000, 'saurieng-dua.jpg', 'hộp', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(11, 'Bánh Gato Trái cây Việt Quất', 3, '', 250000, 0, '544bc48782741.png', 'cái', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(12, 'Bánh sinh nhật rau câu trái cây', 3, '', 200000, 180000, '210215-banh-sinh-nhat-rau-cau-body- (6).jpg', 'cái', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(13, 'Bánh kem Chocolate Dâu', 3, '', 300000, 280000, 'banh kem sinh nhat.jpg', 'cái', 1, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(14, 'Bánh kem Dâu III', 3, '', 300000, 280000, 'Banh-kem (6).jpg', 'cái', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(15, 'Bánh kem Dâu I', 3, '', 350000, 320000, 'banhkem-dau.jpg', 'cái', 1, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(16, 'Bánh trái cây II', 3, '', 150000, 120000, 'banhtraicay.jpg', 'hộp', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(17, 'Apple Cake', 3, '', 250000, 240000, 'Fruit-Cake_7979.jpg', 'cai', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(18, 'Bánh ngọt nhân cream táo', 2, '', 180000, 0, '20131108144733.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(19, 'Bánh Chocolate Trái cây', 2, '', 150000, 0, 'Fruit-Cake_7976.jpg', 'hộp', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(20, 'Bánh Chocolate Trái cây II', 2, '', 150000, 0, 'Fruit-Cake_7981.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(21, 'Peach Cake', 2, '', 160000, 150000, 'Peach-Cake_3294.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(22, 'Bánh bông lan trứng muối I', 1, '', 160000, 150000, 'banhbonglantrung.jpg', 'hộp', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(23, 'Bánh bông lan trứng muối II', 1, '', 180000, 0, 'banhbonglantrungmuoi.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(24, 'Bánh French', 1, '', 180000, 0, 'banh-man-thu-vi-nhat-1.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(25, 'Bánh mì Australia', 1, '', 80000, 70000, 'dung-khoai-tay-lam-banh-gato-man-cuc-ngon.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(26, 'Bánh mặn thập cẩm', 1, '', 50000, 0, 'Fruit-Cake.png', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(27, 'Bánh Muffins trứng', 1, '', 100000, 80000, 'maxresdefault.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(28, 'Bánh Scone Peach Cake', 1, '', 120000, 0, 'Peach-Cake_3300.jpg', 'hộp', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(29, 'Bánh mì Loaf I', 1, '', 100000, 0, 'sli12.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(30, 'Bánh kem Chocolate Dâu I', 4, '', 380000, 350000, 'sli12.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(31, 'Bánh kem Trái cây I', 4, '', 380000, 350000, 'Fruit-Cake.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(32, 'Bánh kem Trái cây II', 4, '', 380000, 350000, 'Fruit-Cake_7971.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(33, 'Bánh kem Doraemon', 4, '', 280000, 250000, 'p1392962167_banh74.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(34, 'Bánh kem Caramen Pudding', 4, '', 280000, 0, 'Caramen-pudding636099031482099583.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(35, 'Bánh kem Chocolate Fruit', 4, '', 320000, 300000, 'chocolate-fruit636098975917921990.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(36, 'Bánh kem Coffee Chocolate GH6', 4, '', 320000, 300000, 'COFFE-CHOCOLATE636098977566220885.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(37, 'Bánh kem Mango Mouse', 4, '', 320000, 300000, 'mango-mousse-cake.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(38, 'Bánh kem Matcha Mouse', 4, '', 350000, 330000, 'MATCHA-MOUSSE.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(39, 'Bánh kem Flower Fruit', 4, '', 350000, 330000, 'flower-fruits636102461981788938.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(40, 'Bánh kem Strawberry Delight', 4, '', 350000, 330000, 'strawberry-delight636102445035635173.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(41, 'Bánh kem Raspberry Delight', 4, '', 350000, 330000, 'raspberry.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(42, 'Beefy Pizza', 6, 'Thịt bò xay, ngô, sốt BBQ, phô mai mozzarella', 150000, 130000, '40819_food_pizza.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(43, 'Hawaii Pizza', 6, 'Sốt cà chua, ham , dứa, pho mai mozzarella', 120000, 0, 'hawaiian paradise_large-900x900.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(44, 'Smoke Chicken Pizza', 6, 'Gà hun khói,nấm, sốt cà chua, pho mai mozzarella.', 120000, 0, 'chicken black pepper_large-900x900.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(45, 'Sausage Pizza', 6, 'Xúc xích klobasa, Nấm, Ngô, sốtcà chua, pho mai Mozzarella.', 120000, 0, 'pizza-miami.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(46, 'Ocean Pizza', 6, 'Tôm , mực, xào cay,ớt xanh, hành tây, cà chua, phomai mozzarella.', 120000, 0, 'seafood curry_large-900x900.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(47, 'All Meaty Pizza', 6, 'Ham, bacon, chorizo, pho mai mozzarella.', 140000, 0, 'all1).jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(48, 'Tuna Pizza', 6, 'Cá Ngừ, sốt Mayonnaise,sốt càchua, hành tây, pho mai Mozzarella', 140000, 0, '54eaf93713081_-_07-germany-tuna.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(49, 'Bánh su kem nhân dừa', 7, '', 120000, 100000, 'maxresdefault.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(50, 'Bánh su kem sữa tươi', 7, '', 120000, 100000, 'sukem.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(51, 'Bánh su kem sữa tươi chiên giòn', 7, '', 150000, 0, '1434429117-banh-su-kem-chien-20.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(52, 'Bánh su kem dâu sữa tươi', 7, '', 150000, 0, 'sukemdau.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(53, 'Bánh su kem bơ sữa tươi', 7, '', 150000, 0, 'He-Thong-Banh-Su-Singapore-Chewy-Junior.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(54, 'Bánh su kem nhân trái cây sữa tươi', 7, '', 150000, 0, 'foody-banh-su-que-635930347896369908.jpg', 'hộp', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(55, 'Bánh su kem cà phê', 7, '', 150000, 0, 'banh-su-kem-ca-phe-1.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(56, 'Bánh su kem phô mai', 7, '', 150000, 0, '50020041-combo-20-banh-su-que-pho-mai-9.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(57, 'Bánh su kem sữa tươi chocolate', 7, '', 150000, 0, 'combo-20-banh-su-que-kem-sua-tuoi-phu-socola.jpg', 'hộp', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(58, 'Bánh Macaron Pháp', 2, 'Thưởng thức macaron, người ta có thể tìm thấy từ những hương vị truyền thống như mâm xôi, chocolate, cho đến những hương vị mới như nấm và trà xanh. Macaron với vị giòn tan của vỏ bánh, béo ngậy ngọt ngào của phần nhân, với vẻ ngoài đáng yêu và nhiều màu sắc đẹp mắt, đây là món bạn không nên bỏ qua khi khám phá nền ẩm thực Pháp.', 200000, 180000, 'Macaron9.jpg', '', 0, '2016-10-26 17:00:00', '2016-10-11 17:00:00'),
(59, 'Bánh Tiramisu - Italia', 2, 'Chỉ cần cắn một miếng, bạn sẽ cảm nhận được tất cả các hương vị đó hòa quyện cùng một chính vì thế người ta còn ví món bánh này là Thiên đường trong miệng của bạn', 200000, 0, '234.jpg', '', 0, '2016-10-26 17:00:00', '2016-10-11 17:00:00'),
(60, 'Bánh Táo - Mỹ', 2, 'Bánh táo Mỹ với phần vỏ bánh mỏng, giòn mềm, ẩn chứa phần nhân táo thơm ngọt, điểm chút vị chua dịu của trái cây quả sẽ là một lựa chọn hoàn hảo cho những tín đồ bánh ngọt trên toàn thế giới.', 200000, 0, '1234.jpg', '', 0, '2016-10-26 17:00:00', '2016-10-11 17:00:00'),
(61, 'Bánh Cupcake - Anh Quốc', 6, 'Những chiếc cupcake có cấu tạo gồm phần vỏ bánh xốp mịn và phần kem trang trí bên trên rất bắt mắt với nhiều hình dạng và màu sắc khác nhau. Cupcake còn được cho là chiếc bánh mang lại niềm vui và tiếng cười như chính hình dáng đáng yêu của chúng.', 150000, 120000, 'cupcake.jpg', 'cái', 1, NULL, NULL),
(62, 'Bánh Sachertorte', 6, 'Sachertorte là một loại bánh xốp được tạo ra bởi loại&nbsp;chocholate&nbsp;tuyệt hảo nhất của nước Áo. Sachertorte có vị ngọt nhẹ, gồm nhiều lớp bánh được làm từ ruột bánh mì và bánh sữa chocholate, xen lẫn giữa các lớp bánh là mứt mơ. Món bánh chocholate này nổi tiếng tới mức thành phố Vienna của Áo đã ấn định&nbsp;tổ chức một ngày Sachertorte quốc gia, vào 5/12 hằng năm', 250000, 220000, '111.jpg', 'cái', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `link` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `slide`
--

INSERT INTO `slide` (`id`, `link`, `image`) VALUES
(1, '', 'banner1.jpg'),
(2, '', 'banner2.jpg'),
(3, '', 'banner3.jpg'),
(4, '', 'banner4.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type_products`
--

CREATE TABLE `type_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `type_products`
--

INSERT INTO `type_products` (`id`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Bánh mặn', 'Nếu từng bị mê hoặc bởi các loại tarlet ngọt thì chắn chắn bạn không thể bỏ qua những loại tarlet mặn. Ngoài hình dáng bắt mắt, lớp vở bánh giòn giòn cùng với nhân mặn như thịt gà, nấm, thị heo ,… của bánh sẽ chinh phục bất cứ ai dùng thử.', 'banh-man-thu-vi-nhat-1.jpg', NULL, NULL),
(2, 'Bánh ngọt', 'Bánh ngọt là một loại thức ăn thường dưới hình thức món bánh dạng bánh mì từ bột nhào, được nướng lên dùng để tráng miệng. Bánh ngọt có nhiều loại, có thể phân loại dựa theo nguyên liệu và kỹ thuật chế biến như bánh ngọt làm từ lúa mì, bơ, bánh ngọt dạng bọt biển. Bánh ngọt có thể phục vụ những mục đính đặc biệt như bánh cưới, bánh sinh nhật, bánh Giáng sinh, bánh Halloween..', '20131108144733.jpg', '2016-10-12 02:16:15', '2016-10-13 01:38:35'),
(3, 'Bánh trái cây', 'Bánh trái cây, hay còn gọi là bánh hoa quả, là một món ăn chơi, không riêng gì của Huế nhưng khi \"lạc\" vào mảnh đất Cố đô, món bánh này dường như cũng mang chút tinh tế, cầu kỳ và đặc biệt. Lấy cảm hứng từ những loại trái cây trong vườn, qua bàn tay khéo léo của người phụ nữ Huế, món bánh trái cây ra đời - ngọt thơm, dịu nhẹ làm đẹp lòng biết bao người thưởng thức.', 'banhtraicay.jpg', '2016-10-18 00:33:33', '2016-10-15 07:25:27'),
(4, 'Bánh kem', 'Với người Việt Nam thì bánh ngọt nói chung đều hay được quy về bánh bông lan – một loại tráng miệng bông xốp, ăn không hoặc được phủ kem lên thành bánh kem. Tuy nhiên, cốt bánh kem thực ra có rất nhiều loại với hương vị, kết cấu và phương thức làm khác nhau chứ không chỉ đơn giản là “bánh bông lan” chung chung đâu nhé!', 'banhkem.jpg', '2016-10-26 03:29:19', '2016-10-26 02:22:22'),
(5, 'Bánh crepe', 'Crepe là một món bánh nổi tiếng của Pháp, nhưng từ khi du nhập vào Việt Nam món bánh đẹp mắt, ngon miệng này đã làm cho biết bao bạn trẻ phải “xiêu lòng”', 'crepe.jpg', '2016-10-28 04:00:00', '2016-10-27 04:00:23'),
(6, 'Bánh Pizza', 'Pizza đã không chỉ còn là một món ăn được ưa chuộng khắp thế giới mà còn được những nhà cầm quyền EU chứng nhận là một phần di sản văn hóa ẩm thực châu Âu. Và để được chứng nhận là một nhà sản xuất pizza không hề đơn giản. Người ta phải qua đủ mọi các bước xét duyệt của chính phủ Ý và liên minh châu Âu nữa… tất cả là để đảm bảo danh tiếng cho món ăn này.', 'pizza.jpg', '2016-10-25 17:19:00', NULL),
(7, 'Bánh su kem', 'Bánh su kem là món bánh ngọt ở dạng kem được làm từ các nguyên liệu như bột mì, trứng, sữa, bơ.... đánh đều tạo thành một hỗn hợp và sau đó bằng thao tác ép và phun qua một cái túi để định hình thành những bánh nhỏ và cuối cùng được nướng chín. Bánh su kem có thể thêm thành phần Sô cô la để tăng vị hấp dẫn. Bánh có xuất xứ từ nước Pháp.', 'sukemdau.jpg', '2016-10-25 17:19:00', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `phone`, `address`, `remember_token`, `created_at`, `updated_at`) VALUES
(6, 'Hương Hương', 'huonghuong08.php@gmail.com', '$2y$10$rGY4KT6ZSMmLnxIbmTXrsu2xdgRxm8x0UTwCyYCAzrJ320kYheSRq', '23456789', 'Hoàng Diệu 2', NULL, '2017-03-23 07:17:33', '2017-03-23 07:17:33');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_ibfk_1` (`id_customer`);

--
-- Chỉ mục cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_detail_ibfk_2` (`id_product`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id_type_foreign` (`id_type`);

--
-- Chỉ mục cho bảng `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `type_products`
--
ALTER TABLE `type_products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT cho bảng `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `type_products`
--
ALTER TABLE `type_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_id_type_foreign` FOREIGN KEY (`id_type`) REFERENCES `type_products` (`id`);
--
-- Cơ sở dữ liệu: `english`
--
CREATE DATABASE IF NOT EXISTS `english` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `english`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `word`
--
-- Error reading structure for table english.word: #1932 - Table 'english.word' doesn't exist in engine
-- Error reading data for table english.word: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `english`.`word`' at line 1
--
-- Cơ sở dữ liệu: `english1`
--
CREATE DATABASE IF NOT EXISTS `english1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `english1`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `word`
--

CREATE TABLE `word` (
  `id` int(11) NOT NULL,
  `word` varchar(50) NOT NULL,
  `mean` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `word`
--

INSERT INTO `word` (`id`, `word`, `mean`) VALUES
(4, 'accuracy', 'ghi nhận thêm 7 ca dương tính với Covid-19'),
(5, 'cat', 'con chó');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `word2`
--

CREATE TABLE `word2` (
  `id` int(11) NOT NULL,
  `word` varchar(200) NOT NULL,
  `mean` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `word`
--
ALTER TABLE `word`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `word2`
--
ALTER TABLE `word2`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `word`
--
ALTER TABLE `word`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `word2`
--
ALTER TABLE `word2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Cơ sở dữ liệu: `hoclaravel`
--
CREATE DATABASE IF NOT EXISTS `hoclaravel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hoclaravel`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaisanpham`
--
-- Error reading structure for table hoclaravel.loaisanpham: #1932 - Table 'hoclaravel.loaisanpham' doesn't exist in engine
-- Error reading data for table hoclaravel.loaisanpham: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `hoclaravel`.`loaisanpham`' at line 1

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--
-- Error reading structure for table hoclaravel.migrations: #1932 - Table 'hoclaravel.migrations' doesn't exist in engine
-- Error reading data for table hoclaravel.migrations: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `hoclaravel`.`migrations`' at line 1

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--
-- Error reading structure for table hoclaravel.password_resets: #1932 - Table 'hoclaravel.password_resets' doesn't exist in engine
-- Error reading data for table hoclaravel.password_resets: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `hoclaravel`.`password_resets`' at line 1

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--
-- Error reading structure for table hoclaravel.users: #1932 - Table 'hoclaravel.users' doesn't exist in engine
-- Error reading data for table hoclaravel.users: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `hoclaravel`.`users`' at line 1
--
-- Cơ sở dữ liệu: `img`
--
CREATE DATABASE IF NOT EXISTS `img` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `img`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `img`
--
-- Error reading structure for table img.img: #1932 - Table 'img.img' doesn't exist in engine
-- Error reading data for table img.img: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `img`.`img`' at line 1
--
-- Cơ sở dữ liệu: `laravel`
--
CREATE DATABASE IF NOT EXISTS `laravel` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `laravel`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_08_08_100000_create_telescope_entries_table', 1),
(4, '2020_07_08_090331_create_profiles_table', 1),
(5, '2020_07_08_095214_create_posts_table', 1),
(6, '2020_07_16_085214_creates_profile_user_pivot_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `caption` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `title`, `description`, `url`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'huykuy99', NULL, NULL, NULL, '2020-07-27 20:00:36', '2020-07-27 20:00:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `profile_user`
--

CREATE TABLE `profile_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `profile_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `telescope_entries`
--

CREATE TABLE `telescope_entries` (
  `sequence` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `telescope_entries`
--

INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(1, '91259003-2c33-405a-bb96-075ab0da03bb', '91259003-3fc0-4d29-9e33-16f726f3c2f6', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = \'1\' limit 1\",\"time\":\"8.80\",\"slow\":false,\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\public\\\\index.php\",\"line\":55,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 02:59:19'),
(2, '91259003-3a70-422e-aada-31f7a173f43b', '91259003-3fc0-4d29-9e33-16f726f3c2f6', NULL, 1, 'view', '{\"name\":\"errors::404\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Exceptions\\/views\\/404.blade.php\",\"data\":[\"exception\"],\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 02:59:19'),
(3, '91259003-3d5d-460f-b783-dc36d4c7460e', '91259003-3fc0-4d29-9e33-16f726f3c2f6', NULL, 1, 'view', '{\"name\":\"errors::minimal\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Exceptions\\/views\\/minimal.blade.php\",\"data\":[\"exception\"],\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 02:59:19'),
(4, '91259003-3f3f-4cce-bf9d-d734fedd38cf', '91259003-3fc0-4d29-9e33-16f726f3c2f6', NULL, 1, 'request', '{\"uri\":\"\\/profile\\/1\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\ProfilesController@index\",\"middleware\":[\"web\"],\"headers\":{\"host\":\"127.0.0.1:8000\",\"connection\":\"keep-alive\",\"cache-control\":\"max-age=0\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/84.0.4147.89 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"sec-fetch-site\":\"none\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"vi-VN,vi;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-US;q=0.6,en;q=0.5\",\"cookie\":\"csm-hit=tb:RCS1K49Y5H98KZHM7MFJ+b-RCS1K49Y5H98KZHM7MFJ|1574696636223&t:1574696636223&adb:adblk_no; XSRF-TOKEN=eyJpdiI6Iko5bDZmblU2V3R5TFlIeWlDYWFtY0E9PSIsInZhbHVlIjoiZ21FUlhCSFRMSk5BNUtrWTJwSjByaGYwY2JCazNORWh6UWVHdVNWa01oZGpPTVU5NEFHbVZvTU5NXC8ydnl1UXkiLCJtYWMiOiI1MmQwYjlhOTI3NTU3YzljN2M1MmQ3N2Y3YWY4ZDE5MzAxOGU4OWYwNTc1ODAxMzQ4ODRmNjlhYzVjZGI4ODJiIn0%3D; laravel_session=eyJpdiI6IkVtcjhXa2RwNXVmaE03OUdMNzFzaEE9PSIsInZhbHVlIjoiOUtrRzFEQVNvTk5lQ0pWa1J6Ukh2NDVNYmM1ZjdhUEVzaUdDNXNCUVlKdlVIUVUwNG82NGJRSDR5UjJkU2lCNCIsIm1hYyI6IjQ0MjhjN2Q4ZjUyYWU3ODY0NDFkZTUxYWYyOWE1MjFkNDdkNDhkMjdiNjcwOGNkZjZiOTUyMTYzYjE5ZWM3ZDQifQ%3D%3D\"},\"payload\":[],\"session\":{\"_token\":\"1W5zs8TODOiwQFEcve4b1dXhYRAfjJeDD03pOCyV\",\"url\":{\"intended\":\"http:\\/\\/127.0.0.1:8000\"},\"_previous\":{\"url\":\"http:\\/\\/127.0.0.1:8000\\/profile\\/1\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_status\":404,\"response\":\"HTML Response\",\"duration\":386,\"memory\":12,\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 02:59:19'),
(5, '91259008-73b1-44df-93d9-8d2d44ca3e92', '91259008-8102-4898-9956-e7f2b71a125b', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = \'2\' limit 1\",\"time\":\"0.76\",\"slow\":false,\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\public\\\\index.php\",\"line\":55,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 02:59:22'),
(6, '91259008-7dd9-43f7-9173-8038a35ff751', '91259008-8102-4898-9956-e7f2b71a125b', NULL, 1, 'view', '{\"name\":\"errors::404\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Exceptions\\/views\\/404.blade.php\",\"data\":[\"exception\"],\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 02:59:22'),
(7, '91259008-7f09-46da-8d6a-b9ff26f90d58', '91259008-8102-4898-9956-e7f2b71a125b', NULL, 1, 'view', '{\"name\":\"errors::minimal\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Exceptions\\/views\\/minimal.blade.php\",\"data\":[\"exception\"],\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 02:59:22'),
(8, '91259008-80b7-4deb-93d4-56be476cdbcc', '91259008-8102-4898-9956-e7f2b71a125b', NULL, 1, 'request', '{\"uri\":\"\\/profile\\/2\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\ProfilesController@index\",\"middleware\":[\"web\"],\"headers\":{\"host\":\"127.0.0.1:8000\",\"connection\":\"keep-alive\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/84.0.4147.89 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"purpose\":\"prefetch\",\"sec-fetch-site\":\"none\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"vi-VN,vi;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-US;q=0.6,en;q=0.5\",\"cookie\":\"csm-hit=tb:RCS1K49Y5H98KZHM7MFJ+b-RCS1K49Y5H98KZHM7MFJ|1574696636223&t:1574696636223&adb:adblk_no; XSRF-TOKEN=eyJpdiI6Ikw5XC9xZ1RwbHY4bGRoUm13elhiRjRBPT0iLCJ2YWx1ZSI6ImRTM0dRSG1hQUQ5N3U0SkVPcHpQdkFlMG9WT1pObU1veUpuM1RqS0RLQ2tnaTZqaFVhME9UT0psZk9cL01oRU5ZIiwibWFjIjoiMjQyNjRjNDBmYWZlYWUzYjk1MDU0NTIwNDhiZWQwNmUyNzE2MDRiNzg1ZTE4YjA2NGZlOWNkMDU0ZTJhMjNjZiJ9; laravel_session=eyJpdiI6IlRUYmZIdEZCK2xWXC9nR0ZuT2R2TDVnPT0iLCJ2YWx1ZSI6IkJKNUVkVXdnZGZQeVJkNGtzcUI0d2xCRElhK0NxZjVCdE52M1VTSm1WYkZrdGt3RmZrajhkejY2UFJYVFdhRmIiLCJtYWMiOiI4MzkwY2IwYmM1NDU4MjBkMTViYTM4ZWIwY2U0NDYzYjZkMGQzNmFmOTk3MzM0NTZhMjQ3M2QxZGY0ODZhNTU0In0%3D\"},\"payload\":[],\"session\":{\"_token\":\"1W5zs8TODOiwQFEcve4b1dXhYRAfjJeDD03pOCyV\",\"url\":{\"intended\":\"http:\\/\\/127.0.0.1:8000\"},\"_previous\":{\"url\":\"http:\\/\\/127.0.0.1:8000\\/profile\\/1\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_status\":404,\"response\":\"HTML Response\",\"duration\":321,\"memory\":12,\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 02:59:22'),
(9, '9125903c-cd0f-4b89-852f-3f3e5b75297a', '9125903c-da22-41bb-b98d-4e1dbc433c55', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"0.94\",\"slow\":false,\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\public\\\\index.php\",\"line\":55,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 02:59:57'),
(10, '9125903c-d966-483a-aeb7-241bb8a6d02b', '9125903c-da22-41bb-b98d-4e1dbc433c55', NULL, 1, 'request', '{\"uri\":\"\\/\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\PostsController@index\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"127.0.0.1:8000\",\"connection\":\"keep-alive\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/84.0.4147.89 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"sec-fetch-site\":\"none\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"vi-VN,vi;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-US;q=0.6,en;q=0.5\",\"cookie\":\"csm-hit=tb:RCS1K49Y5H98KZHM7MFJ+b-RCS1K49Y5H98KZHM7MFJ|1574696636223&t:1574696636223&adb:adblk_no; XSRF-TOKEN=eyJpdiI6Imk4Q2JwZ25aUW4xK3hyOHc0azIyWmc9PSIsInZhbHVlIjoiZERGNWMzT1ZWOVc3NnExMU9aZ3RYS1ZFblwvcmw3Z2ZIUSt6dkFwYmxHN0gyYmc5cXIxUXkwdmZLY0RIcHhcL2tRIiwibWFjIjoiNWUzYWJjYzFjN2Q3M2QyZmRkZTNiMTZkMDVmOTZjZTc1MTU5OWI2MGZlMDM0ZGYwNjk2NjNhMDE0OTZlNjUyMCJ9; laravel_session=eyJpdiI6IjRtWk11Qm1DcG9CWWhhdHRDYkpBU0E9PSIsInZhbHVlIjoiM2EzR1NwZWtFcmpGNnlubHJBMEFoVHNLcmg5cWZicGxic2ZIVGFBMFdoNU5WTUZPd3NnN25CeStHYWx5MWlhYSIsIm1hYyI6IjkyZDA4NTBmNzhhNGY5NGY2ZTY5ZjcwM2U5YWZjMjYxZGEyYmNiNWE1NGYwYjE2ODhmODUzZWRlNDYwNmNmYjEifQ%3D%3D\"},\"payload\":[],\"session\":{\"_token\":\"1W5zs8TODOiwQFEcve4b1dXhYRAfjJeDD03pOCyV\",\"url\":{\"intended\":\"http:\\/\\/127.0.0.1:8000\"},\"_previous\":{\"url\":\"http:\\/\\/127.0.0.1:8000\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_status\":302,\"response\":\"Redirected to http:\\/\\/127.0.0.1:8000\\/login\",\"duration\":388,\"memory\":12,\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 02:59:57'),
(11, '9125903d-4d08-4aab-b54c-2110bd4bcb7c', '9125903d-5b7c-4e2a-b115-36e8f2fad723', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"0.57\",\"slow\":false,\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\app\\\\Http\\\\Middleware\\\\RedirectIfAuthenticated.php\",\"line\":20,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 02:59:57'),
(12, '9125903d-52ad-4899-8599-c7af237e954b', '9125903d-5b7c-4e2a-b115-36e8f2fad723', NULL, 1, 'view', '{\"name\":\"auth.login\",\"path\":\"\\\\resources\\\\views\\/auth\\/login.blade.php\",\"data\":[],\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 02:59:57'),
(13, '9125903d-5573-45de-a4f6-7eadca0f76fb', '9125903d-5b7c-4e2a-b115-36e8f2fad723', NULL, 1, 'view', '{\"name\":\"layouts.app\",\"path\":\"\\\\resources\\\\views\\/layouts\\/app.blade.php\",\"data\":[],\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 02:59:57'),
(14, '9125903d-565d-4235-bd2b-fb795c93d4f6', '9125903d-5b7c-4e2a-b115-36e8f2fad723', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"0.61\",\"slow\":false,\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\storage\\\\framework\\\\views\\\\3d9b826fbf818fbbc8c7a92a2cbcef1b274b87cb.php\",\"line\":43,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 02:59:57'),
(15, '9125903d-5b02-4ebf-9c5e-81a66fad2eb7', '9125903d-5b7c-4e2a-b115-36e8f2fad723', NULL, 1, 'request', '{\"uri\":\"\\/login\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Auth\\\\LoginController@showLoginForm\",\"middleware\":[\"web\",\"guest\"],\"headers\":{\"host\":\"127.0.0.1:8000\",\"connection\":\"keep-alive\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/84.0.4147.89 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"sec-fetch-site\":\"none\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"vi-VN,vi;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-US;q=0.6,en;q=0.5\",\"cookie\":\"csm-hit=tb:RCS1K49Y5H98KZHM7MFJ+b-RCS1K49Y5H98KZHM7MFJ|1574696636223&t:1574696636223&adb:adblk_no; XSRF-TOKEN=eyJpdiI6Ink1TjFrK3pEdWxlZUtJczljbHNkV1E9PSIsInZhbHVlIjoiaFVOa1NsWnE2S2N4amlSS0JtZ2QwbHZ6TEdoVTZPN2VyVGJTZXpweU84WG5OOTBGV1lnV0NYeFg5RXhCMWppeiIsIm1hYyI6ImI2ZTMwYjZlYzBmMjQxYTdlY2Q4YjgwZWRlZGQ5NjQ2MTA0NTRmMTVhNjljYWEzNmU1YTc5ODQ4ZGNjZjhlMWIifQ%3D%3D; laravel_session=eyJpdiI6Inl0b1g1RWtJQUlmTW1XQzl6YURlSFE9PSIsInZhbHVlIjoiWWZydzQwWFQ4QXRJSXVLSDhHS2xzOXN3MnliV2FzeVNDZjF4SXhoNHQ1ekoxK0d5Tkw1YVJTb0EwQmNOZE85NSIsIm1hYyI6IjlmMjE2YWM4YTM5MTI3ZWQwMGEyZTBmNGMxZDcwZjAwYzliOGRmMGIwODRhMWFiMzFlYTk0YWViM2I4ODVmMjQifQ%3D%3D\"},\"payload\":[],\"session\":{\"_token\":\"1W5zs8TODOiwQFEcve4b1dXhYRAfjJeDD03pOCyV\",\"url\":{\"intended\":\"http:\\/\\/127.0.0.1:8000\"},\"_previous\":{\"url\":\"http:\\/\\/127.0.0.1:8000\\/login\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_status\":200,\"response\":{\"view\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\resources\\\\views\\/auth\\/login.blade.php\",\"data\":[]},\"duration\":313,\"memory\":8,\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 02:59:57'),
(16, '91259046-d620-494a-bbb9-08d33ab27077', '91259046-f5c9-4418-9f37-13ecdb86033b', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"0.83\",\"slow\":false,\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\app\\\\Http\\\\Middleware\\\\RedirectIfAuthenticated.php\",\"line\":20,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:03'),
(17, '91259046-dfa2-449f-9c45-fc578270e033', '91259046-f5c9-4418-9f37-13ecdb86033b', NULL, 1, 'cache', '{\"type\":\"missed\",\"key\":\"huykuy99@gmail.com|127.0.0.1\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:03'),
(18, '91259046-e1dc-4034-ae80-c236af079044', '91259046-f5c9-4418-9f37-13ecdb86033b', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `email` = \'huykuy99@gmail.com\' limit 1\",\"time\":\"3.73\",\"slow\":false,\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\app\\\\Http\\\\Middleware\\\\RedirectIfAuthenticated.php\",\"line\":24,\"hash\":\"747ef04de752900539e8a3a1aee036ac\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:03'),
(19, '91259046-e2cf-41bf-b927-1e2b540fffb0', '91259046-f5c9-4418-9f37-13ecdb86033b', NULL, 1, 'cache', '{\"type\":\"missed\",\"key\":\"huykuy99@gmail.com|127.0.0.1:timer\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:03'),
(20, '91259046-e611-4928-a3c5-10933ef8eb22', '91259046-f5c9-4418-9f37-13ecdb86033b', NULL, 1, 'cache', '{\"type\":\"set\",\"key\":\"huykuy99@gmail.com|127.0.0.1:timer\",\"value\":1595905263,\"expiration\":60,\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:03'),
(21, '91259046-e684-47fb-b4b1-56cb319ce1bb', '91259046-f5c9-4418-9f37-13ecdb86033b', NULL, 1, 'cache', '{\"type\":\"missed\",\"key\":\"huykuy99@gmail.com|127.0.0.1\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:03'),
(22, '91259046-ea34-4a46-b979-f247a543a570', '91259046-f5c9-4418-9f37-13ecdb86033b', NULL, 1, 'cache', '{\"type\":\"set\",\"key\":\"huykuy99@gmail.com|127.0.0.1\",\"value\":0,\"expiration\":60,\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:03'),
(23, '91259046-f519-4ebd-8a02-0bc287cffe6a', '91259046-f5c9-4418-9f37-13ecdb86033b', NULL, 1, 'request', '{\"uri\":\"\\/login\",\"method\":\"POST\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Auth\\\\LoginController@login\",\"middleware\":[\"web\",\"guest\"],\"headers\":{\"host\":\"127.0.0.1:8000\",\"connection\":\"keep-alive\",\"content-length\":\"92\",\"cache-control\":\"max-age=0\",\"upgrade-insecure-requests\":\"1\",\"origin\":\"http:\\/\\/127.0.0.1:8000\",\"content-type\":\"application\\/x-www-form-urlencoded\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/84.0.4147.89 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"referer\":\"http:\\/\\/127.0.0.1:8000\\/login\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"vi-VN,vi;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-US;q=0.6,en;q=0.5\",\"cookie\":\"csm-hit=tb:RCS1K49Y5H98KZHM7MFJ+b-RCS1K49Y5H98KZHM7MFJ|1574696636223&t:1574696636223&adb:adblk_no; XSRF-TOKEN=eyJpdiI6IlozOXltcjhLbnNPMDE2dXc5a2EyTGc9PSIsInZhbHVlIjoic0QwNjhORUxSd1VpelNZZ1ZCZEJkSGNPUDdZdmtnRzJxbStWVzRIVGo1SUE3Y3liV0xHbGpnZFZVTVV6VFBzdiIsIm1hYyI6IjI2NDJlOGIzYWY5ZTk4ZWU5YmU2MzZlMDk2YWViMmM4ODg2NjkxYTYxZTVjMDdhOGQ0MDUwYmU2Y2ZiMjNjZjYifQ%3D%3D; laravel_session=eyJpdiI6Ikl4blpcL3FTM2RhbEhSM1R0SENSOTBnPT0iLCJ2YWx1ZSI6Imp4R1lBeEwwc2hoekQ1NERwWUI2YzRidFhKWWM0eDdzK2tIbllSNGVCczkwR3JZelphTEk0UFdTTVwvMVVrQ1VoIiwibWFjIjoiNDM3NDM5MmJjYTllNDZjYzNkOGVkNjI3YzgzMzA1ODA5YjMzMzk5Njk4OGY4ZDdlNDUzNGQ0NjA4ZWI3NzFmNiJ9\"},\"payload\":{\"_token\":\"1W5zs8TODOiwQFEcve4b1dXhYRAfjJeDD03pOCyV\",\"email\":\"huykuy99@gmail.com\",\"password\":\"********\"},\"session\":{\"_token\":\"1W5zs8TODOiwQFEcve4b1dXhYRAfjJeDD03pOCyV\",\"url\":{\"intended\":\"http:\\/\\/127.0.0.1:8000\"},\"_previous\":{\"url\":\"http:\\/\\/127.0.0.1:8000\\/login\"},\"_flash\":{\"old\":[\"_old_input\",\"errors\"],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1,\"_old_input\":{\"_token\":\"1W5zs8TODOiwQFEcve4b1dXhYRAfjJeDD03pOCyV\",\"email\":\"huykuy99@gmail.com\"},\"errors\":{}},\"response_status\":302,\"response\":\"Redirected to http:\\/\\/127.0.0.1:8000\\/login\",\"duration\":359,\"memory\":16,\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:03'),
(24, '91259047-7514-4b1b-8516-6db3d6758d31', '91259047-8342-4566-b7f7-df5c51a03f5a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"0.82\",\"slow\":false,\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\app\\\\Http\\\\Middleware\\\\RedirectIfAuthenticated.php\",\"line\":20,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:04'),
(25, '91259047-7d2a-4ed7-833c-f76599fc2b67', '91259047-8342-4566-b7f7-df5c51a03f5a', NULL, 1, 'view', '{\"name\":\"auth.login\",\"path\":\"\\\\resources\\\\views\\/auth\\/login.blade.php\",\"data\":[],\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:04'),
(26, '91259047-7fc9-4817-8a1b-a68286bf0de4', '91259047-8342-4566-b7f7-df5c51a03f5a', NULL, 1, 'view', '{\"name\":\"layouts.app\",\"path\":\"\\\\resources\\\\views\\/layouts\\/app.blade.php\",\"data\":[],\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:04'),
(27, '91259047-80b6-40da-8365-0769b500c2e6', '91259047-8342-4566-b7f7-df5c51a03f5a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"0.57\",\"slow\":false,\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\storage\\\\framework\\\\views\\\\3d9b826fbf818fbbc8c7a92a2cbcef1b274b87cb.php\",\"line\":43,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:04'),
(28, '91259047-82f5-4f38-9be5-c61b699b2ba5', '91259047-8342-4566-b7f7-df5c51a03f5a', NULL, 1, 'request', '{\"uri\":\"\\/login\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Auth\\\\LoginController@showLoginForm\",\"middleware\":[\"web\",\"guest\"],\"headers\":{\"host\":\"127.0.0.1:8000\",\"connection\":\"keep-alive\",\"cache-control\":\"max-age=0\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/84.0.4147.89 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"referer\":\"http:\\/\\/127.0.0.1:8000\\/login\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"vi-VN,vi;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-US;q=0.6,en;q=0.5\",\"cookie\":\"csm-hit=tb:RCS1K49Y5H98KZHM7MFJ+b-RCS1K49Y5H98KZHM7MFJ|1574696636223&t:1574696636223&adb:adblk_no; XSRF-TOKEN=eyJpdiI6ImZjVmwrVVNrSDdUeWwyT0MwRXBHbFE9PSIsInZhbHVlIjoibnhuWHZDWVhTWmU5dFpyM3Zkc2Z5K3lTK2tsTHFnNWZnWWFWM251U3RTU1UybTZPZlAwa25EMUZGMUtzRmdicCIsIm1hYyI6IjY5YWM1MGUyZGU0MTg4NjQ5NmE1MzE4NWZhOGY5Y2I3NDY4ODUyZjU2ZWY0YjA3NTI1MGU4NDJhNjI5MmM4ODEifQ%3D%3D; laravel_session=eyJpdiI6InBwVmdmb1hZYmtvYWNRamRFN0loTnc9PSIsInZhbHVlIjoiRWlNb05rQkduYUpqU2FkdGg1WVwvT2Ixb3pjUjVlUTdIYXNpWVFmVGxQVzlMN0NHaEc2dnVzTjF3WndublpYM3AiLCJtYWMiOiIxZTE4MjRjMjBmYTMyOTYxZWQ1MTRkZTg3MzFjODBjMjlmODJmNTNmYmNkYTZmYjRjOTMzOGFmYTVkZWNjNmYwIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"1W5zs8TODOiwQFEcve4b1dXhYRAfjJeDD03pOCyV\",\"url\":{\"intended\":\"http:\\/\\/127.0.0.1:8000\"},\"_previous\":{\"url\":\"http:\\/\\/127.0.0.1:8000\\/login\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_status\":200,\"response\":{\"view\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\resources\\\\views\\/auth\\/login.blade.php\",\"data\":[]},\"duration\":342,\"memory\":10,\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:04'),
(29, '91259051-49c0-4f27-ba7a-d5fb3f9f2337', '91259051-68b4-4e19-9099-9391489ec653', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"0.75\",\"slow\":false,\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\app\\\\Http\\\\Middleware\\\\RedirectIfAuthenticated.php\",\"line\":20,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:10'),
(30, '91259051-50fc-427f-b125-fe49ebb0d4d4', '91259051-68b4-4e19-9099-9391489ec653', NULL, 1, 'cache', '{\"type\":\"missed\",\"key\":\"fbsavanna@gmail.com|127.0.0.1\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:10'),
(31, '91259051-5218-4975-b24a-cdbf9664c44b', '91259051-68b4-4e19-9099-9391489ec653', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `email` = \'fbsavanna@gmail.com\' limit 1\",\"time\":\"0.61\",\"slow\":false,\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\app\\\\Http\\\\Middleware\\\\RedirectIfAuthenticated.php\",\"line\":24,\"hash\":\"747ef04de752900539e8a3a1aee036ac\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:10'),
(32, '91259051-52fa-4451-86b3-1ef9a1045f58', '91259051-68b4-4e19-9099-9391489ec653', NULL, 1, 'cache', '{\"type\":\"missed\",\"key\":\"fbsavanna@gmail.com|127.0.0.1:timer\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:10'),
(33, '91259051-55fe-4689-a079-914f566a3022', '91259051-68b4-4e19-9099-9391489ec653', NULL, 1, 'cache', '{\"type\":\"set\",\"key\":\"fbsavanna@gmail.com|127.0.0.1:timer\",\"value\":1595905270,\"expiration\":60,\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:10'),
(34, '91259051-565b-4ac7-9269-977af3a04960', '91259051-68b4-4e19-9099-9391489ec653', NULL, 1, 'cache', '{\"type\":\"missed\",\"key\":\"fbsavanna@gmail.com|127.0.0.1\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:10'),
(35, '91259051-5a35-4db6-8616-92e13cb05502', '91259051-68b4-4e19-9099-9391489ec653', NULL, 1, 'cache', '{\"type\":\"set\",\"key\":\"fbsavanna@gmail.com|127.0.0.1\",\"value\":0,\"expiration\":60,\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:10'),
(36, '91259051-683d-4cd8-9a3a-28eb615e498f', '91259051-68b4-4e19-9099-9391489ec653', NULL, 1, 'request', '{\"uri\":\"\\/login\",\"method\":\"POST\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Auth\\\\LoginController@login\",\"middleware\":[\"web\",\"guest\"],\"headers\":{\"host\":\"127.0.0.1:8000\",\"connection\":\"keep-alive\",\"content-length\":\"93\",\"cache-control\":\"max-age=0\",\"upgrade-insecure-requests\":\"1\",\"origin\":\"http:\\/\\/127.0.0.1:8000\",\"content-type\":\"application\\/x-www-form-urlencoded\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/84.0.4147.89 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"referer\":\"http:\\/\\/127.0.0.1:8000\\/login\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"vi-VN,vi;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-US;q=0.6,en;q=0.5\",\"cookie\":\"csm-hit=tb:RCS1K49Y5H98KZHM7MFJ+b-RCS1K49Y5H98KZHM7MFJ|1574696636223&t:1574696636223&adb:adblk_no; XSRF-TOKEN=eyJpdiI6IlQ4QVNZNGtDS0ZIcGFlaTVMSWptS3c9PSIsInZhbHVlIjoiNHhpQk1TV2NJc2hqTGczbFNnVUNDalo0MGZEdytreUdcL2JlRGVUbmpodFFtazVDQ2FVSWppcGpaNEc2K00zeGMiLCJtYWMiOiJlYmZkMTM1NDk0NjI5ZmQ5MGY3Y2I1MzIzZWJlMjMwZDc3NmY2YzhkZjUwNzQwZDZkZTZkZGNkNWFmZTM0NjI0In0%3D; laravel_session=eyJpdiI6IjNOWnFXZlBkYnFWNHN5UTBBcXBHNnc9PSIsInZhbHVlIjoiNkNoNzE1M3FlT2Q0elRDdk1FbXpYU2FBRmlEUGYzV1FndHZMNEh3T1VXbm94OGJSZytxRXJDZ1RscmlwaHk2VCIsIm1hYyI6IjNiNjhlMGViODczYjc2OTdhN2E2MWExOWQ4ZmVlNmIzNGIyZGZiZDBmMTI2NmJiOWE3YmZhOWE5MGZjNzk5ZjIifQ%3D%3D\"},\"payload\":{\"_token\":\"1W5zs8TODOiwQFEcve4b1dXhYRAfjJeDD03pOCyV\",\"email\":\"fbsavanna@gmail.com\",\"password\":\"********\"},\"session\":{\"_token\":\"1W5zs8TODOiwQFEcve4b1dXhYRAfjJeDD03pOCyV\",\"url\":{\"intended\":\"http:\\/\\/127.0.0.1:8000\"},\"_previous\":{\"url\":\"http:\\/\\/127.0.0.1:8000\\/login\"},\"_flash\":{\"old\":[\"_old_input\",\"errors\"],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1,\"_old_input\":{\"_token\":\"1W5zs8TODOiwQFEcve4b1dXhYRAfjJeDD03pOCyV\",\"email\":\"fbsavanna@gmail.com\"},\"errors\":{}},\"response_status\":302,\"response\":\"Redirected to http:\\/\\/127.0.0.1:8000\\/login\",\"duration\":328,\"memory\":16,\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:10'),
(37, '91259051-e9fa-4681-aee4-58a5a049ec59', '91259051-f625-4d54-ab7c-95ed50b91082', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"1.22\",\"slow\":false,\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\app\\\\Http\\\\Middleware\\\\RedirectIfAuthenticated.php\",\"line\":20,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:11'),
(38, '91259051-f007-47a0-b69f-859b33605a98', '91259051-f625-4d54-ab7c-95ed50b91082', NULL, 1, 'view', '{\"name\":\"auth.login\",\"path\":\"\\\\resources\\\\views\\/auth\\/login.blade.php\",\"data\":[],\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:11'),
(39, '91259051-f2a1-407a-9093-f974dbc4487c', '91259051-f625-4d54-ab7c-95ed50b91082', NULL, 1, 'view', '{\"name\":\"layouts.app\",\"path\":\"\\\\resources\\\\views\\/layouts\\/app.blade.php\",\"data\":[],\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:11'),
(40, '91259051-f3fb-4cdc-b0cc-3f18e694c692', '91259051-f625-4d54-ab7c-95ed50b91082', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"0.70\",\"slow\":false,\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\storage\\\\framework\\\\views\\\\3d9b826fbf818fbbc8c7a92a2cbcef1b274b87cb.php\",\"line\":43,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:11'),
(41, '91259051-f5d8-431f-94aa-3c64490c392f', '91259051-f625-4d54-ab7c-95ed50b91082', NULL, 1, 'request', '{\"uri\":\"\\/login\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Auth\\\\LoginController@showLoginForm\",\"middleware\":[\"web\",\"guest\"],\"headers\":{\"host\":\"127.0.0.1:8000\",\"connection\":\"keep-alive\",\"cache-control\":\"max-age=0\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/84.0.4147.89 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"referer\":\"http:\\/\\/127.0.0.1:8000\\/login\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"vi-VN,vi;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-US;q=0.6,en;q=0.5\",\"cookie\":\"csm-hit=tb:RCS1K49Y5H98KZHM7MFJ+b-RCS1K49Y5H98KZHM7MFJ|1574696636223&t:1574696636223&adb:adblk_no; XSRF-TOKEN=eyJpdiI6ImZzMXhlMXUzdjl0K1wvTHVFUUZZQzRBPT0iLCJ2YWx1ZSI6IkRYZHVhQkdYVkcwT25hK3B3N2hsWTVnRms3TkNna1NKUkZLemR3bWd5OHVcL3Z3MHpKU3FpZERESU1FNlFMTjBSIiwibWFjIjoiNTc0ZDlmYmJiYmU0OTc5NmFhNzlmZWJhNTAyNWU5NTNjMzllYzQzMDA3NWEyNjIyOGJkNjA1NTg4MmJiODgwNSJ9; laravel_session=eyJpdiI6IncxRWpPR1M1XC9DQWxKejU0Ym5FOHF3PT0iLCJ2YWx1ZSI6IkU0a1dkendzSlwvSjBSOE81TVFqT0J3MHVHaWRmWExyVjRJWHlWOXJSWmxqYmJlY0c3OG1aeWZvcFh1UEw2MEpjIiwibWFjIjoiZDZlNTBkNGEzNmIzM2ZkYmJkZDNiZWM5MTRmNTEyODBiNGE3Y2FmZTgzYmMxNzhhZWZhOGMxYzM3NjdhNTU0MCJ9\"},\"payload\":[],\"session\":{\"_token\":\"1W5zs8TODOiwQFEcve4b1dXhYRAfjJeDD03pOCyV\",\"url\":{\"intended\":\"http:\\/\\/127.0.0.1:8000\"},\"_previous\":{\"url\":\"http:\\/\\/127.0.0.1:8000\\/login\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_status\":200,\"response\":{\"view\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\resources\\\\views\\/auth\\/login.blade.php\",\"data\":[]},\"duration\":342,\"memory\":10,\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:11'),
(42, '9125906a-6649-4756-af9c-41d6b622e749', '9125906a-7208-48e3-a0d6-0e89ca3aadc9', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"1.00\",\"slow\":false,\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\app\\\\Http\\\\Middleware\\\\RedirectIfAuthenticated.php\",\"line\":20,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:27'),
(43, '9125906a-6c11-4d7a-983a-faac90847e33', '9125906a-7208-48e3-a0d6-0e89ca3aadc9', NULL, 1, 'view', '{\"name\":\"auth.register\",\"path\":\"\\\\resources\\\\views\\/auth\\/register.blade.php\",\"data\":[],\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:27'),
(44, '9125906a-6e3e-4630-9f83-7975b423adda', '9125906a-7208-48e3-a0d6-0e89ca3aadc9', NULL, 1, 'view', '{\"name\":\"layouts.app\",\"path\":\"\\\\resources\\\\views\\/layouts\\/app.blade.php\",\"data\":[],\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:27'),
(45, '9125906a-6f23-4f89-91e8-50461bec1f9d', '9125906a-7208-48e3-a0d6-0e89ca3aadc9', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"0.88\",\"slow\":false,\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\storage\\\\framework\\\\views\\\\3d9b826fbf818fbbc8c7a92a2cbcef1b274b87cb.php\",\"line\":43,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:27'),
(46, '9125906a-7130-411e-bdc6-cb02b406d375', '9125906a-7208-48e3-a0d6-0e89ca3aadc9', NULL, 1, 'request', '{\"uri\":\"\\/register\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Auth\\\\RegisterController@showRegistrationForm\",\"middleware\":[\"web\",\"guest\"],\"headers\":{\"host\":\"127.0.0.1:8000\",\"connection\":\"keep-alive\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/84.0.4147.89 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"referer\":\"http:\\/\\/127.0.0.1:8000\\/login\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"vi-VN,vi;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-US;q=0.6,en;q=0.5\",\"cookie\":\"csm-hit=tb:RCS1K49Y5H98KZHM7MFJ+b-RCS1K49Y5H98KZHM7MFJ|1574696636223&t:1574696636223&adb:adblk_no; XSRF-TOKEN=eyJpdiI6IkxKVXFuYSsrcXZyTVRvd05qekhCa0E9PSIsInZhbHVlIjoiS0llNTFBT2trXC96b2J5MHM0cTdHNHhiZmhuV0lmZTZ4dE04cDdxUzQ1ejB5V2F5XC9MWTNzR0hJMjE1cU04TEJ4IiwibWFjIjoiZDVkNzQ4MzBkYThjMmRlMTQ2NGEzOGMyMDcxYWFjMGYzYmEzNTE5MDYyOGNhMTUzODA0ZjlmMzA1MGMyMGI3ZSJ9; laravel_session=eyJpdiI6IlpMcjNielJsVFZqOFpMQ1ZCb0R0UEE9PSIsInZhbHVlIjoiZzBoMXhGaGtvaVZXQlRsNjNGd2ZcL05ENllramNcL1RiOUtTa1wvTDJGUE5rQzZSRDZ4Z0dPcUFWVURLT3p1MFgydiIsIm1hYyI6IjRmNTRmMWVjZjRlMmFlYjAxMmNiYzJjOTYxMWQ0ZjJmZjYwZDUxNWFjMzdmZDQ4ZWQzYzY0YmNmNDgyNmZmODkifQ%3D%3D\"},\"payload\":[],\"session\":{\"_token\":\"1W5zs8TODOiwQFEcve4b1dXhYRAfjJeDD03pOCyV\",\"url\":{\"intended\":\"http:\\/\\/127.0.0.1:8000\"},\"_previous\":{\"url\":\"http:\\/\\/127.0.0.1:8000\\/register\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_status\":200,\"response\":{\"view\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\resources\\\\views\\/auth\\/register.blade.php\",\"data\":[]},\"duration\":271,\"memory\":16,\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:27'),
(47, '91259078-b4a1-42cd-9ebb-13b93aebf72e', '91259078-fe5b-4ef0-be2e-9f96a6f5a91e', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"0.85\",\"slow\":false,\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\app\\\\Http\\\\Middleware\\\\RedirectIfAuthenticated.php\",\"line\":20,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:36'),
(48, '91259078-bc86-4817-97bc-49b130288626', '91259078-fe5b-4ef0-be2e-9f96a6f5a91e', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select count(*) as aggregate from `users` where `email` = \'huykuy99@gmail.com\'\",\"time\":\"0.80\",\"slow\":false,\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\app\\\\Http\\\\Middleware\\\\RedirectIfAuthenticated.php\",\"line\":24,\"hash\":\"1895cb63909c7eb8e2529c4143a4c0bf\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:36'),
(49, '91259078-be50-411e-8f8a-981493567ac2', '91259078-fe5b-4ef0-be2e-9f96a6f5a91e', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select count(*) as aggregate from `users` where `username` = \'huykuy99\'\",\"time\":\"3.35\",\"slow\":false,\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\app\\\\Http\\\\Middleware\\\\RedirectIfAuthenticated.php\",\"line\":24,\"hash\":\"3d1204a8e9d6204dbfb8018c59c12666\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:36'),
(50, '91259078-ed5a-494f-8225-c1745f1a9886', '91259078-fe5b-4ef0-be2e-9f96a6f5a91e', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `users` (`name`, `email`, `username`, `password`, `updated_at`, `created_at`) values (\'John\', \'huykuy99@gmail.com\', \'huykuy99\', \'y$KC7z7SR1i\\/xK6DJ8nkla0uRyJqoGJMxDsJfzyL.Ts382X6UXoCHM6\', \'2020-07-28 03:00:36\', \'2020-07-28 03:00:36\')\",\"time\":\"6.58\",\"slow\":false,\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\app\\\\Http\\\\Controllers\\\\Auth\\\\RegisterController.php\",\"line\":72,\"hash\":\"6667e6dcbfdada6ed64f75c9968e577a\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:36'),
(51, '91259078-f74a-4da3-bb61-f1c9c88ad66d', '91259078-fe5b-4ef0-be2e-9f96a6f5a91e', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `profiles` (`title`, `user_id`, `updated_at`, `created_at`) values (\'huykuy99\', 1, \'2020-07-28 03:00:36\', \'2020-07-28 03:00:36\')\",\"time\":\"9.36\",\"slow\":false,\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\app\\\\User.php\",\"line\":46,\"hash\":\"4d2b34860d14ca735824ec5c670d1794\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:36'),
(52, '91259078-f804-4373-9cf1-7df6fbb87e7b', '91259078-fe5b-4ef0-be2e-9f96a6f5a91e', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\Profile:1\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:36'),
(53, '91259078-f85d-49c2-a432-874d0a16f9e0', '91259078-fe5b-4ef0-be2e-9f96a6f5a91e', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\User:1\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:36'),
(54, '91259078-fdf7-4bc6-b870-000fa9655c7d', '91259078-fe5b-4ef0-be2e-9f96a6f5a91e', NULL, 1, 'request', '{\"uri\":\"\\/register\",\"method\":\"POST\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Auth\\\\RegisterController@register\",\"middleware\":[\"web\",\"guest\"],\"headers\":{\"host\":\"127.0.0.1:8000\",\"connection\":\"keep-alive\",\"content-length\":\"151\",\"cache-control\":\"max-age=0\",\"upgrade-insecure-requests\":\"1\",\"origin\":\"http:\\/\\/127.0.0.1:8000\",\"content-type\":\"application\\/x-www-form-urlencoded\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/84.0.4147.89 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"referer\":\"http:\\/\\/127.0.0.1:8000\\/register\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"vi-VN,vi;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-US;q=0.6,en;q=0.5\",\"cookie\":\"csm-hit=tb:RCS1K49Y5H98KZHM7MFJ+b-RCS1K49Y5H98KZHM7MFJ|1574696636223&t:1574696636223&adb:adblk_no; XSRF-TOKEN=eyJpdiI6ImJCRFhDMHRJK0V3TmpiT2dDck9KOVE9PSIsInZhbHVlIjoiSEdRYlBXZkhISTArbWpWcGMzMXprRm45TSs3YmtiMnl1alhjOHVDMFNVZmd0YTV0VVwvNzBqZVlhdk9ZeDJpdGgiLCJtYWMiOiIzZTdjOGQ1MDk5YWE0OTlhNDMyM2E2YzU2MGZkODc5ZjFkMWRiYTY4MDU5MTM1ZmM1NmViODJiZThlYTZlNDk0In0%3D; laravel_session=eyJpdiI6Im5iaDFBVW9OWHdCMUE5Y1VmaitTYkE9PSIsInZhbHVlIjoiQjZnTHpPWXExSEVmV21aOHhXWWM4eEhvUFJReE5zOGxsN3Q2ZkFiUUlxS0ZZQUljbFBCMlR2UCtWQTB6OGtTcCIsIm1hYyI6ImY1OWZiM2QwMDcxYTA4YzU0NTk1NjNhMzA4ZDI5MGViYTQ4YjI4NDdiOTBjNjdhYzhkMDBlMWVkMGE3MmE1MzAifQ%3D%3D\"},\"payload\":{\"_token\":\"1W5zs8TODOiwQFEcve4b1dXhYRAfjJeDD03pOCyV\",\"name\":\"John\",\"email\":\"huykuy99@gmail.com\",\"username\":\"huykuy99\",\"password\":\"********\",\"password_confirmation\":\"********\"},\"session\":{\"_token\":\"1W5zs8TODOiwQFEcve4b1dXhYRAfjJeDD03pOCyV\",\"url\":{\"intended\":\"http:\\/\\/127.0.0.1:8000\"},\"_previous\":{\"url\":\"http:\\/\\/127.0.0.1:8000\\/register\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_status\":302,\"response\":\"Redirected to http:\\/\\/127.0.0.1:8000\\/home\",\"duration\":432,\"memory\":16,\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:36'),
(55, '91259079-7e7d-4fed-a742-e99bc2cca1ee', '91259079-92bb-4a08-b552-06022db0afa6', NULL, 1, 'view', '{\"name\":\"errors::404\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Exceptions\\/views\\/404.blade.php\",\"data\":[\"exception\"],\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:37'),
(56, '91259079-913d-4cd0-826d-fe55828d2ad1', '91259079-92bb-4a08-b552-06022db0afa6', NULL, 1, 'view', '{\"name\":\"errors::minimal\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Exceptions\\/views\\/minimal.blade.php\",\"data\":[\"exception\"],\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:37'),
(57, '91259079-925a-4eee-bbcf-bf286446cea9', '91259079-92bb-4a08-b552-06022db0afa6', NULL, 1, 'request', '{\"uri\":\"\\/home\",\"method\":\"GET\",\"controller_action\":null,\"middleware\":[],\"headers\":{\"host\":\"127.0.0.1:8000\",\"connection\":\"keep-alive\",\"cache-control\":\"max-age=0\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/84.0.4147.89 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"referer\":\"http:\\/\\/127.0.0.1:8000\\/register\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"vi-VN,vi;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-US;q=0.6,en;q=0.5\",\"cookie\":\"csm-hit=tb:RCS1K49Y5H98KZHM7MFJ+b-RCS1K49Y5H98KZHM7MFJ|1574696636223&t:1574696636223&adb:adblk_no; XSRF-TOKEN=eyJpdiI6InIrVjhrUnRFNzJFN0ptV3dzM0hXaGc9PSIsInZhbHVlIjoieWdcLzkwcHErdEs5dkRRQTMxNXF6Mld4TGZFalFqakc3UU1ZcUZISW1xUnQ5NDRuaFNZWVBSeHZxdGNaaWRPcmoiLCJtYWMiOiIzYzhhODkzMzc4YzczMDM0NTMxY2YzNzJhMGZiYTM2ZmVmZWM2NWRmMzBmZGE3ZTQ5Y2U4OTNmMWRmNmU3NjVmIn0%3D; laravel_session=eyJpdiI6IkZEUnJ0WVNsRTRcL28rUGlzZnlGN3h3PT0iLCJ2YWx1ZSI6InBiNExDRFlRQytkdCtqMWJKMUgrcE9UUkFLNGdmM0U0TzNMNSt4bnB0VGgrZm9GZ0lWVEJLYUVzVkl0QlN4eVAiLCJtYWMiOiI4NTViZmVkNWEzMGEzNDY1NGZmZGQ3NWQwOWU3MWRlN2E4ODBkMWM3ZjZkNDZiMTU1NTc0Mjk2ZGI2Y2EyYjBjIn0%3D\"},\"payload\":[],\"session\":[],\"response_status\":404,\"response\":\"HTML Response\",\"duration\":340,\"memory\":8,\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:37'),
(58, '91259081-ca2e-47e6-9b83-4a3df9bae3b6', '91259081-db7d-4737-b8f9-1d217d1dbe34', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"0.75\",\"slow\":false,\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\public\\\\index.php\",\"line\":55,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:42'),
(59, '91259081-cf70-4266-af23-15d305fc3ef9', '91259081-db7d-4737-b8f9-1d217d1dbe34', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `profiles`.`user_id` from `profiles` inner join `profile_user` on `profiles`.`id` = `profile_user`.`profile_id` where `profile_user`.`user_id` = 1\",\"time\":\"2.17\",\"slow\":false,\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\app\\\\Http\\\\Controllers\\\\PostsController.php\",\"line\":18,\"hash\":\"be105319759513028c2fc90edf83bb43\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:42'),
(60, '91259081-d044-4a16-a129-26c3aed24613', '91259081-db7d-4737-b8f9-1d217d1dbe34', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select count(*) as aggregate from `posts` where 0 = 1\",\"time\":\"0.48\",\"slow\":false,\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\app\\\\Http\\\\Controllers\\\\PostsController.php\",\"line\":21,\"hash\":\"78acbd62f27f49e0a289616a8a0cfa0d\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:42'),
(61, '91259081-d558-4ec3-9f0c-a8e7361340f0', '91259081-db7d-4737-b8f9-1d217d1dbe34', NULL, 1, 'view', '{\"name\":\"posts.index\",\"path\":\"\\\\resources\\\\views\\/posts\\/index.blade.php\",\"data\":[\"posts\"],\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:42'),
(62, '91259081-d66e-45b5-9a60-f4af9770b3a4', '91259081-db7d-4737-b8f9-1d217d1dbe34', NULL, 1, 'view', '{\"name\":\"pagination::bootstrap-4\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pagination\\/resources\\/views\\/bootstrap-4.blade.php\",\"data\":[\"paginator\",\"elements\"],\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:42'),
(63, '91259081-d710-495e-8829-3616ec98ab54', '91259081-db7d-4737-b8f9-1d217d1dbe34', NULL, 1, 'view', '{\"name\":\"layouts.app\",\"path\":\"\\\\resources\\\\views\\/layouts\\/app.blade.php\",\"data\":[\"posts\",\"__currentLoopData\",\"loop\"],\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:42'),
(64, '91259081-db2d-493b-bef5-00dfad5c786e', '91259081-db7d-4737-b8f9-1d217d1dbe34', NULL, 1, 'request', '{\"uri\":\"\\/\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\PostsController@index\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"127.0.0.1:8000\",\"connection\":\"keep-alive\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/84.0.4147.89 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"sec-fetch-site\":\"none\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"vi-VN,vi;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-US;q=0.6,en;q=0.5\",\"cookie\":\"csm-hit=tb:RCS1K49Y5H98KZHM7MFJ+b-RCS1K49Y5H98KZHM7MFJ|1574696636223&t:1574696636223&adb:adblk_no; XSRF-TOKEN=eyJpdiI6InIrVjhrUnRFNzJFN0ptV3dzM0hXaGc9PSIsInZhbHVlIjoieWdcLzkwcHErdEs5dkRRQTMxNXF6Mld4TGZFalFqakc3UU1ZcUZISW1xUnQ5NDRuaFNZWVBSeHZxdGNaaWRPcmoiLCJtYWMiOiIzYzhhODkzMzc4YzczMDM0NTMxY2YzNzJhMGZiYTM2ZmVmZWM2NWRmMzBmZGE3ZTQ5Y2U4OTNmMWRmNmU3NjVmIn0%3D; laravel_session=eyJpdiI6IkZEUnJ0WVNsRTRcL28rUGlzZnlGN3h3PT0iLCJ2YWx1ZSI6InBiNExDRFlRQytkdCtqMWJKMUgrcE9UUkFLNGdmM0U0TzNMNSt4bnB0VGgrZm9GZ0lWVEJLYUVzVkl0QlN4eVAiLCJtYWMiOiI4NTViZmVkNWEzMGEzNDY1NGZmZGQ3NWQwOWU3MWRlN2E4ODBkMWM3ZjZkNDZiMTU1NTc0Mjk2ZGI2Y2EyYjBjIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"1W5zs8TODOiwQFEcve4b1dXhYRAfjJeDD03pOCyV\",\"url\":{\"intended\":\"http:\\/\\/127.0.0.1:8000\"},\"_previous\":{\"url\":\"http:\\/\\/127.0.0.1:8000\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_status\":200,\"response\":{\"view\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\resources\\\\views\\/posts\\/index.blade.php\",\"data\":{\"posts\":{\"class\":\"Illuminate\\\\Pagination\\\\LengthAwarePaginator\",\"properties\":{\"current_page\":1,\"data\":[],\"first_page_url\":\"http:\\/\\/127.0.0.1:8000?page=1\",\"from\":null,\"last_page\":1,\"last_page_url\":\"http:\\/\\/127.0.0.1:8000?page=1\",\"next_page_url\":null,\"path\":\"http:\\/\\/127.0.0.1:8000\",\"per_page\":2,\"prev_page_url\":null,\"to\":null,\"total\":0}}}},\"duration\":309,\"memory\":12,\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:42'),
(65, '91259099-3038-4b7b-9602-d40e3fc78999', '91259099-4ba0-44c2-aa5c-438004d8e0fb', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = \'1\' limit 1\",\"time\":\"0.89\",\"slow\":false,\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\public\\\\index.php\",\"line\":55,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:57'),
(66, '91259099-3463-43d9-b283-5588241ad5aa', '91259099-4ba0-44c2-aa5c-438004d8e0fb', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"0.68\",\"slow\":false,\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\app\\\\Http\\\\Controllers\\\\ProfilesController.php\",\"line\":19,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:57'),
(67, '91259099-36d4-400f-aea4-abd95fdc56cc', '91259099-4ba0-44c2-aa5c-438004d8e0fb', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `profiles`.*, `profile_user`.`user_id` as `pivot_user_id`, `profile_user`.`profile_id` as `pivot_profile_id` from `profiles` inner join `profile_user` on `profiles`.`id` = `profile_user`.`profile_id` where `profile_user`.`user_id` = 1\",\"time\":\"0.96\",\"slow\":false,\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\app\\\\Http\\\\Controllers\\\\ProfilesController.php\",\"line\":19,\"hash\":\"8fc69f1d306320757d647dcbc102a27f\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:57'),
(68, '91259099-3d54-494e-96a3-385c95efc03e', '91259099-4ba0-44c2-aa5c-438004d8e0fb', NULL, 1, 'view', '{\"name\":\"profiles.index\",\"path\":\"\\\\resources\\\\views\\/profiles\\/index.blade.php\",\"data\":[\"user\",\"follows\"],\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:57'),
(69, '91259099-408d-4d91-964a-a7c475a3cf92', '91259099-4ba0-44c2-aa5c-438004d8e0fb', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `profiles` where `profiles`.`user_id` = 1 and `profiles`.`user_id` is not null limit 1\",\"time\":\"3.65\",\"slow\":false,\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\storage\\\\framework\\\\views\\\\7f7b598d9780e1a7be0ea7514d881f8db1d9bc75.php\",\"line\":5,\"hash\":\"a55491248d183f8723c7022c10017979\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:57'),
(70, '91259099-4142-4088-adea-c7feb404c988', '91259099-4ba0-44c2-aa5c-438004d8e0fb', NULL, 1, 'gate', '{\"ability\":\"update\",\"result\":\"allowed\",\"arguments\":[\"App\\\\Profile:1\"],\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\storage\\\\framework\\\\views\\\\7f7b598d9780e1a7be0ea7514d881f8db1d9bc75.php\",\"line\":16,\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:57'),
(71, '91259099-417d-46ce-a148-af85997f33e6', '91259099-4ba0-44c2-aa5c-438004d8e0fb', NULL, 1, 'gate', '{\"ability\":\"update\",\"result\":\"allowed\",\"arguments\":[\"App\\\\Profile:1\"],\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\storage\\\\framework\\\\views\\\\7f7b598d9780e1a7be0ea7514d881f8db1d9bc75.php\",\"line\":22,\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:57'),
(72, '91259099-4298-471c-b474-a50ffb3d5226', '91259099-4ba0-44c2-aa5c-438004d8e0fb', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `posts` where `posts`.`user_id` = 1 and `posts`.`user_id` is not null order by `created_at` desc\",\"time\":\"1.08\",\"slow\":false,\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\storage\\\\framework\\\\views\\\\7f7b598d9780e1a7be0ea7514d881f8db1d9bc75.php\",\"line\":29,\"hash\":\"46d4eedc1bfa7081ada782a84292443c\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:57'),
(73, '91259099-43d0-4000-9b58-bdb8315b2568', '91259099-4ba0-44c2-aa5c-438004d8e0fb', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `users`.*, `profile_user`.`profile_id` as `pivot_profile_id`, `profile_user`.`user_id` as `pivot_user_id` from `users` inner join `profile_user` on `users`.`id` = `profile_user`.`user_id` where `profile_user`.`profile_id` = 1\",\"time\":\"0.79\",\"slow\":false,\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\storage\\\\framework\\\\views\\\\7f7b598d9780e1a7be0ea7514d881f8db1d9bc75.php\",\"line\":30,\"hash\":\"85c7b79bee403db82c74684ca296df56\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:57');
INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(74, '91259099-44e0-41b5-b609-0703ffad26db', '91259099-4ba0-44c2-aa5c-438004d8e0fb', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `profiles`.*, `profile_user`.`user_id` as `pivot_user_id`, `profile_user`.`profile_id` as `pivot_profile_id` from `profiles` inner join `profile_user` on `profiles`.`id` = `profile_user`.`profile_id` where `profile_user`.`user_id` = 1\",\"time\":\"0.73\",\"slow\":false,\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\storage\\\\framework\\\\views\\\\7f7b598d9780e1a7be0ea7514d881f8db1d9bc75.php\",\"line\":31,\"hash\":\"8fc69f1d306320757d647dcbc102a27f\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:57'),
(75, '91259099-45cf-45c1-98b5-06a672e1efe1', '91259099-4ba0-44c2-aa5c-438004d8e0fb', NULL, 1, 'view', '{\"name\":\"layouts.app\",\"path\":\"\\\\resources\\\\views\\/layouts\\/app.blade.php\",\"data\":[\"user\",\"follows\",\"__currentLoopData\",\"loop\"],\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:57'),
(76, '91259099-4aec-4f46-adc5-c9c0aa90ac73', '91259099-4ba0-44c2-aa5c-438004d8e0fb', NULL, 1, 'request', '{\"uri\":\"\\/profile\\/1\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\ProfilesController@index\",\"middleware\":[\"web\"],\"headers\":{\"host\":\"127.0.0.1:8000\",\"connection\":\"keep-alive\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/84.0.4147.89 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"sec-fetch-site\":\"none\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"vi-VN,vi;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-US;q=0.6,en;q=0.5\",\"cookie\":\"csm-hit=tb:RCS1K49Y5H98KZHM7MFJ+b-RCS1K49Y5H98KZHM7MFJ|1574696636223&t:1574696636223&adb:adblk_no; XSRF-TOKEN=eyJpdiI6ImVWNTFtTTdwM2lnYnlLZUY2YVZ6NVE9PSIsInZhbHVlIjoiYUJOY1A0UXgza21DdExRXC85ejB1Y0Mzd0xESHEySmVpd3cxTEFXWGk5UWpCbVJUcU5mYTRUNWpJWGJzMklIdXgiLCJtYWMiOiJlYzczNzc1MWI2YzE0ZDY0ODlhOTBhZTQxOGNmY2YyZmQyNTZiYmU1NjYxNTdlZDRhZTA1OTIyZTU4NDdkM2UzIn0%3D; laravel_session=eyJpdiI6InpmQitWM1d3aHZiVStaRVJ5ZU9OT1E9PSIsInZhbHVlIjoiOGJCSWJZVGpIeWNIc3FOYVFnWFBEVG9uRk4yYVUrdnhHNitnVVk1OHdqUnQwUEtaWTBFcmNiNkljTFhWdjVDNiIsIm1hYyI6ImY1MzAzNTBkMGNhYjI0ZDU1MjI5NDI2ZThmZDAwNzVlY2MzNTlhNWJjYTljMTJhNmI1ZTc1ZTViMTdlMjU5NWEifQ%3D%3D\"},\"payload\":[],\"session\":{\"_token\":\"1W5zs8TODOiwQFEcve4b1dXhYRAfjJeDD03pOCyV\",\"url\":{\"intended\":\"http:\\/\\/127.0.0.1:8000\"},\"_previous\":{\"url\":\"http:\\/\\/127.0.0.1:8000\\/profile\\/1\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_status\":200,\"response\":{\"view\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\resources\\\\views\\/profiles\\/index.blade.php\",\"data\":{\"user\":\"App\\\\User:1\",\"follows\":false}},\"duration\":299,\"memory\":16,\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:57'),
(77, '9125909a-0bff-46c7-97f5-e2d88e667be4', '9125909a-11de-4e6e-9f27-29043bf3ed73', NULL, 1, 'view', '{\"name\":\"errors::404\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Exceptions\\/views\\/404.blade.php\",\"data\":[\"exception\"],\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:58'),
(78, '9125909a-10ba-4b10-aa4c-54da178552ff', '9125909a-11de-4e6e-9f27-29043bf3ed73', NULL, 1, 'view', '{\"name\":\"errors::minimal\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Exceptions\\/views\\/minimal.blade.php\",\"data\":[\"exception\"],\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:58'),
(79, '9125909a-118b-4d1c-a16d-ce69f505bf99', '9125909a-11de-4e6e-9f27-29043bf3ed73', NULL, 1, 'request', '{\"uri\":\"\\/profile\\/svg\\/freeCodeCampLogo.svg\",\"method\":\"GET\",\"controller_action\":null,\"middleware\":[],\"headers\":{\"host\":\"127.0.0.1:8000\",\"connection\":\"keep-alive\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/84.0.4147.89 Safari\\/537.36\",\"accept\":\"image\\/webp,image\\/apng,image\\/*,*\\/*;q=0.8\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"no-cors\",\"sec-fetch-dest\":\"image\",\"referer\":\"http:\\/\\/127.0.0.1:8000\\/profile\\/1\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"vi-VN,vi;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-US;q=0.6,en;q=0.5\",\"cookie\":\"csm-hit=tb:RCS1K49Y5H98KZHM7MFJ+b-RCS1K49Y5H98KZHM7MFJ|1574696636223&t:1574696636223&adb:adblk_no; XSRF-TOKEN=eyJpdiI6IlN3R2czbFNRSlNXQUU0VVZmVkFMVFE9PSIsInZhbHVlIjoiRE5nOFVkOVE5RVhPalh6QXBoVUhVUDczclN1bFAxQjh1UmNTXC93c1BPMnd4dFhPcThRTzhcL2phMzd0cXhPN2M2IiwibWFjIjoiNjJkYzhlOGJlNTE2MjMwODljMzU1OWI4NjcxN2NiYzE3OWZjMzM1MjkzODhhZTAzZTIxZmZmOGZmZTIyNDdjMyJ9; laravel_session=eyJpdiI6IjJ6ZlRPMkl3MHVPdTY0cXJDdk5mMHc9PSIsInZhbHVlIjoieEZ6NjlcL1ZHRTQ3NFJcL3g0VCtCOFwvbEVWelBtZFh6MGxMQkVPRldPRHJsZTdUOXdSWVwvaTFodzV5XC9vZk1KeTVtIiwibWFjIjoiN2I5Y2E4Y2FiMzM1ZDNjMWZjNzNkMGI4YmE4NDg1Zjc5YzA2NGNiMGJlMGUwOWFkNmNlMjRhNmM0ZDM1MGQ4OSJ9\"},\"payload\":[],\"session\":[],\"response_status\":404,\"response\":\"HTML Response\",\"duration\":344,\"memory\":12,\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:00:58'),
(80, '912590a8-0fd9-4c3c-b856-486c90c35dfe', '912590a8-2565-4b17-a68c-eaa168336684', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = \'2\' limit 1\",\"time\":\"1.00\",\"slow\":false,\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\public\\\\index.php\",\"line\":55,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:01:07'),
(81, '912590a8-1bf5-4106-af1e-59fd6fabff51', '912590a8-2565-4b17-a68c-eaa168336684', NULL, 1, 'view', '{\"name\":\"errors::404\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Exceptions\\/views\\/404.blade.php\",\"data\":[\"exception\"],\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:01:07'),
(82, '912590a8-1e20-438e-974c-d7e7a82b9e74', '912590a8-2565-4b17-a68c-eaa168336684', NULL, 1, 'view', '{\"name\":\"errors::minimal\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Exceptions\\/views\\/minimal.blade.php\",\"data\":[\"exception\"],\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:01:07'),
(83, '912590a8-2517-40a5-9d63-06ec1292f3a6', '912590a8-2565-4b17-a68c-eaa168336684', NULL, 1, 'request', '{\"uri\":\"\\/profile\\/2\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\ProfilesController@index\",\"middleware\":[\"web\"],\"headers\":{\"host\":\"127.0.0.1:8000\",\"connection\":\"keep-alive\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/84.0.4147.89 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"sec-fetch-site\":\"none\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"vi-VN,vi;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-US;q=0.6,en;q=0.5\",\"cookie\":\"csm-hit=tb:RCS1K49Y5H98KZHM7MFJ+b-RCS1K49Y5H98KZHM7MFJ|1574696636223&t:1574696636223&adb:adblk_no; XSRF-TOKEN=eyJpdiI6IlN3R2czbFNRSlNXQUU0VVZmVkFMVFE9PSIsInZhbHVlIjoiRE5nOFVkOVE5RVhPalh6QXBoVUhVUDczclN1bFAxQjh1UmNTXC93c1BPMnd4dFhPcThRTzhcL2phMzd0cXhPN2M2IiwibWFjIjoiNjJkYzhlOGJlNTE2MjMwODljMzU1OWI4NjcxN2NiYzE3OWZjMzM1MjkzODhhZTAzZTIxZmZmOGZmZTIyNDdjMyJ9; laravel_session=eyJpdiI6IjJ6ZlRPMkl3MHVPdTY0cXJDdk5mMHc9PSIsInZhbHVlIjoieEZ6NjlcL1ZHRTQ3NFJcL3g0VCtCOFwvbEVWelBtZFh6MGxMQkVPRldPRHJsZTdUOXdSWVwvaTFodzV5XC9vZk1KeTVtIiwibWFjIjoiN2I5Y2E4Y2FiMzM1ZDNjMWZjNzNkMGI4YmE4NDg1Zjc5YzA2NGNiMGJlMGUwOWFkNmNlMjRhNmM0ZDM1MGQ4OSJ9\"},\"payload\":[],\"session\":{\"_token\":\"1W5zs8TODOiwQFEcve4b1dXhYRAfjJeDD03pOCyV\",\"url\":{\"intended\":\"http:\\/\\/127.0.0.1:8000\"},\"_previous\":{\"url\":\"http:\\/\\/127.0.0.1:8000\\/profile\\/2\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_status\":404,\"response\":\"HTML Response\",\"duration\":315,\"memory\":16,\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:01:07'),
(84, '912590b1-132d-4eb7-ba63-69a506fd4324', '912590b1-26e3-48ee-81b5-22cbebee1b17', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"0.95\",\"slow\":false,\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\public\\\\index.php\",\"line\":55,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:01:13'),
(85, '912590b1-17de-4782-b124-7be2e5546247', '912590b1-26e3-48ee-81b5-22cbebee1b17', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `profiles`.`user_id` from `profiles` inner join `profile_user` on `profiles`.`id` = `profile_user`.`profile_id` where `profile_user`.`user_id` = 1\",\"time\":\"0.99\",\"slow\":false,\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\app\\\\Http\\\\Controllers\\\\PostsController.php\",\"line\":18,\"hash\":\"be105319759513028c2fc90edf83bb43\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:01:13'),
(86, '912590b1-1922-44eb-9df3-e4d59c0cd7ad', '912590b1-26e3-48ee-81b5-22cbebee1b17', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select count(*) as aggregate from `posts` where 0 = 1\",\"time\":\"0.59\",\"slow\":false,\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\app\\\\Http\\\\Controllers\\\\PostsController.php\",\"line\":21,\"hash\":\"78acbd62f27f49e0a289616a8a0cfa0d\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:01:13'),
(87, '912590b1-210f-4610-a5a6-ab51f0c166a1', '912590b1-26e3-48ee-81b5-22cbebee1b17', NULL, 1, 'view', '{\"name\":\"posts.index\",\"path\":\"\\\\resources\\\\views\\/posts\\/index.blade.php\",\"data\":[\"posts\"],\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:01:13'),
(88, '912590b1-22be-496f-8a79-e9669fbfcd11', '912590b1-26e3-48ee-81b5-22cbebee1b17', NULL, 1, 'view', '{\"name\":\"pagination::bootstrap-4\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pagination\\/resources\\/views\\/bootstrap-4.blade.php\",\"data\":[\"paginator\",\"elements\"],\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:01:13'),
(89, '912590b1-2362-41e9-a6e7-4ff91226574c', '912590b1-26e3-48ee-81b5-22cbebee1b17', NULL, 1, 'view', '{\"name\":\"layouts.app\",\"path\":\"\\\\resources\\\\views\\/layouts\\/app.blade.php\",\"data\":[\"posts\",\"__currentLoopData\",\"loop\"],\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:01:13'),
(90, '912590b1-268e-44ae-9664-cbae53ec926b', '912590b1-26e3-48ee-81b5-22cbebee1b17', NULL, 1, 'request', '{\"uri\":\"\\/\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\PostsController@index\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"127.0.0.1:8000\",\"connection\":\"keep-alive\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/84.0.4147.89 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"sec-fetch-site\":\"none\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"vi-VN,vi;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-US;q=0.6,en;q=0.5\",\"cookie\":\"csm-hit=tb:RCS1K49Y5H98KZHM7MFJ+b-RCS1K49Y5H98KZHM7MFJ|1574696636223&t:1574696636223&adb:adblk_no; XSRF-TOKEN=eyJpdiI6Ikc3MDJ5RVpUNmdrMVZHT1JZenpMSEE9PSIsInZhbHVlIjoiY1RSVnZaTGpyVWwyOGh3NDdoZFh1NjJXcTZSRHF0eURpcDAyTkppTnlja01kOHpBV2xBRVN2akNySm9VZXg3RSIsIm1hYyI6IjNhNWMxZmJhYjdmZmVmNTQ4NzBiM2Y1N2FmN2M2YmZlYzZmMzBjZjFmMDBlNDJmZTIyMjRlZTJiOTVjNzBhMjAifQ%3D%3D; laravel_session=eyJpdiI6ImE1RmUrNnpteDZNdkdwbVRrODZOM2c9PSIsInZhbHVlIjoiQThWdjdWTDdGN3prdk9Tc2xIRmhXU1BDczQrRUZFck4xbFVMK1kzbXFmQXgwSkM2c3JEemdFcFFIREVvaVRZVCIsIm1hYyI6IjQ0ZTNkNzc4ZjYwNjZkYjJlZGExZTI2MmMwZDA1YzkzN2M3MmY0NjRhYTdmNzhhOWFiZGUyNTljMzk4N2Y5NjEifQ%3D%3D\"},\"payload\":[],\"session\":{\"_token\":\"1W5zs8TODOiwQFEcve4b1dXhYRAfjJeDD03pOCyV\",\"url\":{\"intended\":\"http:\\/\\/127.0.0.1:8000\"},\"_previous\":{\"url\":\"http:\\/\\/127.0.0.1:8000\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_status\":200,\"response\":{\"view\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\resources\\\\views\\/posts\\/index.blade.php\",\"data\":{\"posts\":{\"class\":\"Illuminate\\\\Pagination\\\\LengthAwarePaginator\",\"properties\":{\"current_page\":1,\"data\":[],\"first_page_url\":\"http:\\/\\/127.0.0.1:8000?page=1\",\"from\":null,\"last_page\":1,\"last_page_url\":\"http:\\/\\/127.0.0.1:8000?page=1\",\"next_page_url\":null,\"path\":\"http:\\/\\/127.0.0.1:8000\",\"per_page\":2,\"prev_page_url\":null,\"to\":null,\"total\":0}}}},\"duration\":320,\"memory\":12,\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:01:13'),
(91, '912590b4-65d4-47a9-a3d6-d96c6c86b92f', '912590b4-6e10-4ad6-b6e8-8a2ed60154b6', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"0.93\",\"slow\":false,\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\public\\\\index.php\",\"line\":55,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:01:15'),
(92, '912590b4-6dc3-4407-ac96-e7167403cfa3', '912590b4-6e10-4ad6-b6e8-8a2ed60154b6', NULL, 1, 'request', '{\"uri\":\"\\/logout\",\"method\":\"POST\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Auth\\\\LoginController@logout\",\"middleware\":[\"web\"],\"headers\":{\"host\":\"127.0.0.1:8000\",\"connection\":\"keep-alive\",\"content-length\":\"47\",\"cache-control\":\"max-age=0\",\"upgrade-insecure-requests\":\"1\",\"origin\":\"http:\\/\\/127.0.0.1:8000\",\"content-type\":\"application\\/x-www-form-urlencoded\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/84.0.4147.89 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"referer\":\"http:\\/\\/127.0.0.1:8000\\/\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"vi-VN,vi;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-US;q=0.6,en;q=0.5\",\"cookie\":\"csm-hit=tb:RCS1K49Y5H98KZHM7MFJ+b-RCS1K49Y5H98KZHM7MFJ|1574696636223&t:1574696636223&adb:adblk_no; XSRF-TOKEN=eyJpdiI6ImtGMzl3Mjd2YlFNV0lyMFR0ZHlTNGc9PSIsInZhbHVlIjoicGdSZHZDUmh4OUlCYitrVFkxZFVzZWZyM2twRG5TVlg4MUdRVmxzVVBGXC94NWpPVXBFcHplS1JRUmpoM0tcL3BYIiwibWFjIjoiODhjMTA4MDExNGEzOTcxODhkODZhMjY0YzBkMmMyM2YzM2RhYzI5MDRlYzRjOTUxODkzN2FlMzYxZDUyNzdmMCJ9; laravel_session=eyJpdiI6Ijl4a0RxWTllM3NjNHh0R0JRXC9tdHJBPT0iLCJ2YWx1ZSI6Im9QemQ1RVwvUjRUeWtTekVmU0t2emNoVFZrVUVTNVdkMmFNbVwvaHNHR3Y3czRcL2g1YzJUaG1sVXN5b0hSSUZiVVwvIiwibWFjIjoiNzAyNjY3NDBhYWQ3MjIxMTcyYThiMWQyZjIzZTVmOGUzNDUxMTAxNGZhZjdhNzU5ZDUxNjE0MmRjZTY5NGFhZiJ9\"},\"payload\":{\"_token\":\"1W5zs8TODOiwQFEcve4b1dXhYRAfjJeDD03pOCyV\"},\"session\":{\"_flash\":{\"old\":[],\"new\":[]}},\"response_status\":302,\"response\":\"Redirected to http:\\/\\/127.0.0.1:8000\",\"duration\":296,\"memory\":16,\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:01:15'),
(93, '912590b5-0da7-4acb-8d13-3fcc4ce7bacc', '912590b5-0f8f-4622-881d-e09ffdb4f7ff', NULL, 1, 'request', '{\"uri\":\"\\/\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\PostsController@index\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"127.0.0.1:8000\",\"connection\":\"keep-alive\",\"cache-control\":\"max-age=0\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/84.0.4147.89 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"referer\":\"http:\\/\\/127.0.0.1:8000\\/\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"vi-VN,vi;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-US;q=0.6,en;q=0.5\",\"cookie\":\"csm-hit=tb:RCS1K49Y5H98KZHM7MFJ+b-RCS1K49Y5H98KZHM7MFJ|1574696636223&t:1574696636223&adb:adblk_no; XSRF-TOKEN=eyJpdiI6Ild0ak5nbFY3V0lzcXV4Tys1SDZyK0E9PSIsInZhbHVlIjoibTV0eWJMWXNPS2pSbkRkS3VuU1I3UT09IiwibWFjIjoiYmJkNTBiZTdmMzhmYzhlMzM2OGQ2YTVmZjFmZmFjY2JjODMyMjU5ZTNiOTE4MTE3NDUyYmY4N2Q3NmQ3MDZmMSJ9; laravel_session=eyJpdiI6IlVVclZSdXIwNlQ5ZDhSOVlnNWR1MXc9PSIsInZhbHVlIjoic2kySlV1K2ZjVklKTE81WmpjRkNta2drZ1VHK2haOXhicG4yajZVcUZ3R1pUZkoxQ0lDK3VjTURQR3BUR0Y4YiIsIm1hYyI6IjJjMGYzNjkyZTk3NmQ1ZmEyY2NlNGI3NmU4NmQ4NWY3YWE0OTk1N2ZiNzU4NWM0N2Y3YTgyYzY0MmEzZWMyYWIifQ%3D%3D\"},\"payload\":[],\"session\":{\"_flash\":{\"old\":[],\"new\":[]},\"_token\":\"NQZ2q3Ot4xtOWyhyL4vB25tyutMyeXJAUFQ8tU28\",\"url\":{\"intended\":\"http:\\/\\/127.0.0.1:8000\"},\"_previous\":{\"url\":\"http:\\/\\/127.0.0.1:8000\"}},\"response_status\":302,\"response\":\"Redirected to http:\\/\\/127.0.0.1:8000\\/login\",\"duration\":369,\"memory\":8,\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:01:16'),
(94, '912590b5-6f28-4f99-b1a4-bc3cc8ad087e', '912590b5-767c-47eb-8fce-16af0fa7176b', NULL, 1, 'view', '{\"name\":\"auth.login\",\"path\":\"\\\\resources\\\\views\\/auth\\/login.blade.php\",\"data\":[],\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:01:16'),
(95, '912590b5-7242-40ea-8421-ff57f34688c8', '912590b5-767c-47eb-8fce-16af0fa7176b', NULL, 1, 'view', '{\"name\":\"layouts.app\",\"path\":\"\\\\resources\\\\views\\/layouts\\/app.blade.php\",\"data\":[],\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:01:16'),
(96, '912590b5-7626-4fc8-8b25-915273a6ec35', '912590b5-767c-47eb-8fce-16af0fa7176b', NULL, 1, 'request', '{\"uri\":\"\\/login\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Auth\\\\LoginController@showLoginForm\",\"middleware\":[\"web\",\"guest\"],\"headers\":{\"host\":\"127.0.0.1:8000\",\"connection\":\"keep-alive\",\"cache-control\":\"max-age=0\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/84.0.4147.89 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"referer\":\"http:\\/\\/127.0.0.1:8000\\/\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"vi-VN,vi;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-US;q=0.6,en;q=0.5\",\"cookie\":\"csm-hit=tb:RCS1K49Y5H98KZHM7MFJ+b-RCS1K49Y5H98KZHM7MFJ|1574696636223&t:1574696636223&adb:adblk_no; XSRF-TOKEN=eyJpdiI6IkM5ZlY2dEFTamhtc2pkZUhiVnNwbUE9PSIsInZhbHVlIjoibGVDTnlCMHR6XC9McTlDOUlFZEtQM25hQmw4M3JPdGpOU2xESTlBRW4zMVZVNXF0VnZobDExalwvejhMZlh5blppIiwibWFjIjoiOWQzODA2NzEyNjZkMDBhYmFlMDBhOWQxZmFkNTNmYWEyODRhNmZlZTUwZDgxZDc3MGMyNWFiN2E2ODA3ODFmNiJ9; laravel_session=eyJpdiI6Ik1nSGJBYWZUZENNNEdZWVI1Mmk1V1E9PSIsInZhbHVlIjoiZzY2Yjl0TWFza3NEOFlLSFwvY0hWWGhJdU16QlZYYTlsd2Q1cEpwdll2alVEUlZ5VndmVDltdDBSbEdKS01XTEwiLCJtYWMiOiI0NTU0YmQwNjUyZTkzMTU1NGY5MmY4MTg3ZTFjZGMwOTVlNzIwYTlkZGU3MDg3YTMxYmJiMjViNWNmNTg5OWMyIn0%3D\"},\"payload\":[],\"session\":{\"_flash\":{\"old\":[],\"new\":[]},\"_token\":\"NQZ2q3Ot4xtOWyhyL4vB25tyutMyeXJAUFQ8tU28\",\"url\":{\"intended\":\"http:\\/\\/127.0.0.1:8000\"},\"_previous\":{\"url\":\"http:\\/\\/127.0.0.1:8000\\/login\"}},\"response_status\":200,\"response\":{\"view\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\resources\\\\views\\/auth\\/login.blade.php\",\"data\":[]},\"duration\":244,\"memory\":8,\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:01:16'),
(97, '912590c5-b202-49e2-ae17-d3874d4385f8', '912590c5-ce6d-42a8-a502-6be5006b530f', NULL, 1, 'cache', '{\"type\":\"missed\",\"key\":\"fbsavanna@gmail.com|127.0.0.1\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:01:26'),
(98, '912590c5-b7e0-4e85-aa70-1e9de632093d', '912590c5-ce6d-42a8-a502-6be5006b530f', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `email` = \'fbsavanna@gmail.com\' limit 1\",\"time\":\"0.78\",\"slow\":false,\"file\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\app\\\\Http\\\\Middleware\\\\RedirectIfAuthenticated.php\",\"line\":24,\"hash\":\"747ef04de752900539e8a3a1aee036ac\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:01:26'),
(99, '912590c5-ba69-4862-9497-5ed97da7d519', '912590c5-ce6d-42a8-a502-6be5006b530f', NULL, 1, 'cache', '{\"type\":\"missed\",\"key\":\"fbsavanna@gmail.com|127.0.0.1:timer\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:01:26'),
(100, '912590c5-beef-4070-91cf-564675a7b03d', '912590c5-ce6d-42a8-a502-6be5006b530f', NULL, 1, 'cache', '{\"type\":\"set\",\"key\":\"fbsavanna@gmail.com|127.0.0.1:timer\",\"value\":1595905346,\"expiration\":60,\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:01:26'),
(101, '912590c5-bf94-4fa0-9621-6eae8e8bc0cb', '912590c5-ce6d-42a8-a502-6be5006b530f', NULL, 1, 'cache', '{\"type\":\"missed\",\"key\":\"fbsavanna@gmail.com|127.0.0.1\",\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:01:26'),
(102, '912590c5-c25f-4056-aa22-018f986a3062', '912590c5-ce6d-42a8-a502-6be5006b530f', NULL, 1, 'cache', '{\"type\":\"set\",\"key\":\"fbsavanna@gmail.com|127.0.0.1\",\"value\":0,\"expiration\":60,\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:01:26'),
(103, '912590c5-ce1d-4b81-b3c2-30a8e0e6f966', '912590c5-ce6d-42a8-a502-6be5006b530f', NULL, 1, 'request', '{\"uri\":\"\\/login\",\"method\":\"POST\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Auth\\\\LoginController@login\",\"middleware\":[\"web\",\"guest\"],\"headers\":{\"host\":\"127.0.0.1:8000\",\"connection\":\"keep-alive\",\"content-length\":\"89\",\"cache-control\":\"max-age=0\",\"upgrade-insecure-requests\":\"1\",\"origin\":\"http:\\/\\/127.0.0.1:8000\",\"content-type\":\"application\\/x-www-form-urlencoded\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/84.0.4147.89 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"referer\":\"http:\\/\\/127.0.0.1:8000\\/login\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"vi-VN,vi;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-US;q=0.6,en;q=0.5\",\"cookie\":\"csm-hit=tb:RCS1K49Y5H98KZHM7MFJ+b-RCS1K49Y5H98KZHM7MFJ|1574696636223&t:1574696636223&adb:adblk_no; XSRF-TOKEN=eyJpdiI6Im94UWNMQVVUaHRaZlFKcitucW9wd0E9PSIsInZhbHVlIjoiY0VnVkRuUlk1SThDRTNZcUhvZXUwSkRCQlJVN1NLd0pSbHp5aEltXC80dWNBOWRubkdKbzNvRURPMmhuakFkNXkiLCJtYWMiOiIzYWZlNjM4NjVjMmM5NmFkZWEyMGFhZDM1MmEzODQ4ZGE3MWIxN2YwMjkxMThlNDI3YWI1Y2FiMDM3ZmI2NTBhIn0%3D; laravel_session=eyJpdiI6IkNzc05MSlR0bXk4RHBpZm5kdEpYcXc9PSIsInZhbHVlIjoiTXFZMm9sbzlyN1N6WERRamxrVzBZRG9PMzcwcmNUWEppYmw5b1F0c3JmK3VhRnI0NnNtRlVxZVZiWU5KSzd4eiIsIm1hYyI6ImVjNDQyZDliNjg4MDZkYjlhZDU5Zjc0NWZlNzNmYTY1OWQwMGFkNzQ2NjU4MTJhZGNiZDY2NzkyYzk5OWQxY2UifQ%3D%3D\"},\"payload\":{\"_token\":\"NQZ2q3Ot4xtOWyhyL4vB25tyutMyeXJAUFQ8tU28\",\"email\":\"fbsavanna@gmail.com\",\"password\":\"********\"},\"session\":{\"_flash\":{\"old\":[\"_old_input\",\"errors\"],\"new\":[]},\"_token\":\"NQZ2q3Ot4xtOWyhyL4vB25tyutMyeXJAUFQ8tU28\",\"url\":{\"intended\":\"http:\\/\\/127.0.0.1:8000\"},\"_previous\":{\"url\":\"http:\\/\\/127.0.0.1:8000\\/login\"},\"_old_input\":{\"_token\":\"NQZ2q3Ot4xtOWyhyL4vB25tyutMyeXJAUFQ8tU28\",\"email\":\"fbsavanna@gmail.com\"},\"errors\":{}},\"response_status\":302,\"response\":\"Redirected to http:\\/\\/127.0.0.1:8000\\/login\",\"duration\":369,\"memory\":16,\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:01:26'),
(104, '912590c6-4eff-4bf7-89e4-b0253262b790', '912590c6-54b2-4a53-a2c5-d95beed3170c', NULL, 1, 'view', '{\"name\":\"auth.login\",\"path\":\"\\\\resources\\\\views\\/auth\\/login.blade.php\",\"data\":[],\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:01:27'),
(105, '912590c6-51c6-4a04-a05b-5e9406d0c906', '912590c6-54b2-4a53-a2c5-d95beed3170c', NULL, 1, 'view', '{\"name\":\"layouts.app\",\"path\":\"\\\\resources\\\\views\\/layouts\\/app.blade.php\",\"data\":[],\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:01:27'),
(106, '912590c6-5464-494e-83a3-fd9ae10c6657', '912590c6-54b2-4a53-a2c5-d95beed3170c', NULL, 1, 'request', '{\"uri\":\"\\/login\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Auth\\\\LoginController@showLoginForm\",\"middleware\":[\"web\",\"guest\"],\"headers\":{\"host\":\"127.0.0.1:8000\",\"connection\":\"keep-alive\",\"cache-control\":\"max-age=0\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/84.0.4147.89 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"referer\":\"http:\\/\\/127.0.0.1:8000\\/login\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"vi-VN,vi;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-US;q=0.6,en;q=0.5\",\"cookie\":\"csm-hit=tb:RCS1K49Y5H98KZHM7MFJ+b-RCS1K49Y5H98KZHM7MFJ|1574696636223&t:1574696636223&adb:adblk_no; XSRF-TOKEN=eyJpdiI6Ilg5RjFYR0h0OVB1VjNlYTVqZHN5V1E9PSIsInZhbHVlIjoibmJWQzdiTnBhVTJJTjNSdWFLcmNPcWUzK3JxV2xSSjNSdkFVV05sM25YTnNMdnRyVHorSlFIZDRSWUNvNjJsMCIsIm1hYyI6ImI0ZDE4ZGFiMDRiYzE4Y2Y3ZjM4M2UzOWUyMGVkNGRiNDNiMjVhNDE3YjIwOTUzNDNmMWNhMTJkMmI3YTc1YjMifQ%3D%3D; laravel_session=eyJpdiI6IkRZVEE3QkZvNzI4N2U4c0hyZm5penc9PSIsInZhbHVlIjoib2JJSUJJTkNMZmg1VVdkU295ZU5hMk9xeEM2Y3VYVlBQUThLajVxamhQcTNuTzdsTUNZeXFlaDFCQlJ2dkRrZSIsIm1hYyI6IjlmODA2MDU3NThjZTY5Y2JiNzc2MjQ2MTdkZTFlZjE1NmU0OGQxYTgxMzMzMzJmOTg3ZjAzMDhmMDI0NGNhMjcifQ%3D%3D\"},\"payload\":[],\"session\":{\"_flash\":{\"old\":[],\"new\":[]},\"_token\":\"NQZ2q3Ot4xtOWyhyL4vB25tyutMyeXJAUFQ8tU28\",\"url\":{\"intended\":\"http:\\/\\/127.0.0.1:8000\"},\"_previous\":{\"url\":\"http:\\/\\/127.0.0.1:8000\\/login\"}},\"response_status\":200,\"response\":{\"view\":\"C:\\\\xampp\\\\htdocs\\\\project_2\\\\resources\\\\views\\/auth\\/login.blade.php\",\"data\":[]},\"duration\":325,\"memory\":10,\"hostname\":\"DESKTOP-LVL9F48\"}', '2020-07-28 03:01:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `telescope_entries_tags`
--

CREATE TABLE `telescope_entries_tags` (
  `entry_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `telescope_entries_tags`
--

INSERT INTO `telescope_entries_tags` (`entry_uuid`, `tag`) VALUES
('91259078-f804-4373-9cf1-7df6fbb87e7b', 'App\\Profile:1'),
('91259078-f85d-49c2-a432-874d0a16f9e0', 'App\\User:1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `telescope_monitoring`
--

CREATE TABLE `telescope_monitoring` (
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'John', 'huykuy99@gmail.com', 'huykuy99', NULL, '$2y$10$KC7z7SR1i/xK6DJ8nkla0uRyJqoGJMxDsJfzyL.Ts382X6UXoCHM6', NULL, '2020-07-27 20:00:36', '2020-07-27 20:00:36');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profiles_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `profile_user`
--
ALTER TABLE `profile_user`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `telescope_entries`
--
ALTER TABLE `telescope_entries`
  ADD PRIMARY KEY (`sequence`),
  ADD UNIQUE KEY `telescope_entries_uuid_unique` (`uuid`),
  ADD KEY `telescope_entries_batch_id_index` (`batch_id`),
  ADD KEY `telescope_entries_type_should_display_on_index_index` (`type`,`should_display_on_index`),
  ADD KEY `telescope_entries_family_hash_index` (`family_hash`);

--
-- Chỉ mục cho bảng `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD KEY `telescope_entries_tags_entry_uuid_tag_index` (`entry_uuid`,`tag`),
  ADD KEY `telescope_entries_tags_tag_index` (`tag`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `profile_user`
--
ALTER TABLE `profile_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `telescope_entries`
--
ALTER TABLE `telescope_entries`
  MODIFY `sequence` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE;
--
-- Cơ sở dữ liệu: `laravel1`
--
CREATE DATABASE IF NOT EXISTS `laravel1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `laravel1`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `books`
--

CREATE TABLE `books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `books`
--

INSERT INTO `books` (`id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(1, 'asd', '', NULL, NULL),
(2, 'dasdddddd', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `classes`
--

CREATE TABLE `classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `class_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2020_07_25_043013_aaaas', 1),
(4, '2020_07_25_043300_adsksakdask', 1),
(5, '2020_07_25_142403_create_books_table', 2),
(6, '2020_07_26_072150_create_students_table', 3),
(7, '2020_07_27_150433_create_classes_table', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_rasda`
--

CREATE TABLE `password_rasda` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `students`
--

INSERT INTO `students` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'huykuy99', '2020-07-26 00:35:10', '2020-07-26 00:35:10'),
(2, 'manu', NULL, NULL),
(3, 'zzgoku', NULL, NULL),
(4, 'huykuy99', '2020-07-27 05:37:00', '2020-07-27 05:37:00'),
(5, 'huykuy99tam', '2020-07-27 05:38:07', '2020-07-27 05:38:07'),
(6, 'mancity678sd', '2020-07-27 05:49:00', '2020-07-27 05:49:00'),
(7, 'mancity678cccccccc', '2020-07-27 05:58:13', '2020-07-27 05:58:13'),
(8, 'huykuy99zzzzz', '2020-07-27 05:58:46', '2020-07-27 05:58:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `usedssrs`
--

CREATE TABLE `usedssrs` (
  `ida` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `usedssrs`
--

INSERT INTO `usedssrs` (`ida`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'huyyyyyyyyyyyyuyuyyyyyyyyyy', '', NULL, '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_rasda`
--
ALTER TABLE `password_rasda`
  ADD KEY `password_rasda_email_index` (`email`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `usedssrs`
--
ALTER TABLE `usedssrs`
  ADD PRIMARY KEY (`ida`),
  ADD UNIQUE KEY `usedssrs_email_unique` (`email`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `classes`
--
ALTER TABLE `classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `usedssrs`
--
ALTER TABLE `usedssrs`
  MODIFY `ida` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Cơ sở dữ liệu: `mydata`
--
CREATE DATABASE IF NOT EXISTS `mydata` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mydata`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tablepaginate`
--
-- Error reading structure for table mydata.tablepaginate: #1932 - Table 'mydata.tablepaginate' doesn't exist in engine
-- Error reading data for table mydata.tablepaginate: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `mydata`.`tablepaginate`' at line 1
--
-- Cơ sở dữ liệu: `myshop`
--
CREATE DATABASE IF NOT EXISTS `myshop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `myshop`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--
-- Error reading structure for table myshop.admin: #1932 - Table 'myshop.admin' doesn't exist in engine
-- Error reading data for table myshop.admin: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `myshop`.`admin`' at line 1

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--
-- Error reading structure for table myshop.bill: #1932 - Table 'myshop.bill' doesn't exist in engine
-- Error reading data for table myshop.bill: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `myshop`.`bill`' at line 1

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `billdetailed`
--
-- Error reading structure for table myshop.billdetailed: #1932 - Table 'myshop.billdetailed' doesn't exist in engine
-- Error reading data for table myshop.billdetailed: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `myshop`.`billdetailed`' at line 1

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `image_hightlight`
--
-- Error reading structure for table myshop.image_hightlight: #1932 - Table 'myshop.image_hightlight' doesn't exist in engine
-- Error reading data for table myshop.image_hightlight: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `myshop`.`image_hightlight`' at line 1

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `img`
--
-- Error reading structure for table myshop.img: #1932 - Table 'myshop.img' doesn't exist in engine
-- Error reading data for table myshop.img: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `myshop`.`img`' at line 1

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `level`
--
-- Error reading structure for table myshop.level: #1932 - Table 'myshop.level' doesn't exist in engine
-- Error reading data for table myshop.level: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `myshop`.`level`' at line 1

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product2`
--
-- Error reading structure for table myshop.product2: #1932 - Table 'myshop.product2' doesn't exist in engine
-- Error reading data for table myshop.product2: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `myshop`.`product2`' at line 1

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--
-- Error reading structure for table myshop.products: #1932 - Table 'myshop.products' doesn't exist in engine
-- Error reading data for table myshop.products: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `myshop`.`products`' at line 1

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_type`
--
-- Error reading structure for table myshop.product_type: #1932 - Table 'myshop.product_type' doesn't exist in engine
-- Error reading data for table myshop.product_type: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `myshop`.`product_type`' at line 1

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_account`
--
-- Error reading structure for table myshop.tbl_account: #1932 - Table 'myshop.tbl_account' doesn't exist in engine
-- Error reading data for table myshop.tbl_account: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `myshop`.`tbl_account`' at line 1
--
-- Cơ sở dữ liệu: `myshop1`
--
CREATE DATABASE IF NOT EXISTS `myshop1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `myshop1`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(90) NOT NULL,
  `admin_phone_number` varchar(15) NOT NULL,
  `password` varchar(40) NOT NULL,
  `level` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_phone_number`, `password`, `level`) VALUES
(6, 'SuperAdmin1', '0965582327', 'anhhuy99', 2),
(15, 'admin3', '0985647123', 'anhhuy99', 1),
(16, 'admin2', '0985647124', 'anhhuy99', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `bill_id` varchar(15) NOT NULL,
  `customer_id` varchar(10) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_phone` varchar(29) NOT NULL,
  `customer_address` varchar(300) NOT NULL,
  `customer_message` varchar(500) NOT NULL,
  `total` bigint(20) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `bill`
--

INSERT INTO `bill` (`bill_id`, `customer_id`, `customer_name`, `customer_phone`, `customer_address`, `customer_message`, `total`, `status`) VALUES
('H0kgU3vCslo', '2', 'thehuy', '0965582327', 'ha noi', '\r\n            ', 2022000, 0),
('TVk4Nov6stZ', '2', 'thehuy', '0965582327', 'ha noi', '\r\n ádasdasd           ', 196000, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `billdetailed`
--

CREATE TABLE `billdetailed` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(60) NOT NULL,
  `product_price` bigint(20) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `total` bigint(20) NOT NULL,
  `bill_id` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `billdetailed`
--

INSERT INTO `billdetailed` (`product_id`, `product_name`, `product_price`, `product_quantity`, `total`, `bill_id`) VALUES
(3079, 'Tiền đô âm phủ cao cấp', 1000000, 2, 2022000, 'H0kgU3vCslo'),
(3080, 'Tiền âm phủ 500k ', 11000, 2, 2022000, 'H0kgU3vCslo'),
(3077, 'Tiền đô âm phủ', 30000, 4, 196000, 'TVk4Nov6stZ'),
(3078, 'Tiền đô âm phủ loại 2', 19000, 4, 196000, 'TVk4Nov6stZ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `image_hightlight`
--

CREATE TABLE `image_hightlight` (
  `id_image_hl` int(11) NOT NULL,
  `link_image_hl` varchar(200) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `image_hightlight`
--

INSERT INTO `image_hightlight` (`id_image_hl`, `link_image_hl`, `position`) VALUES
(22, 'https://i.imgur.com/LRAkE6Z.jpg', 8),
(23, 'https://i.imgur.com/WfJRA5M.jpg', 1),
(24, 'https://i.imgur.com/XxLQnYs.jpg', 2),
(25, 'https://i.imgur.com/hulXKX1.jpg', 4),
(26, 'https://i.imgur.com/RLZsUMr.jpg', 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `img`
--

CREATE TABLE `img` (
  `id_image` int(11) NOT NULL,
  `link_image` varchar(500) NOT NULL,
  `id_product` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id_product` int(11) NOT NULL,
  `name_product` varchar(45) NOT NULL,
  `price` bigint(20) NOT NULL,
  `product_image` varchar(180) NOT NULL,
  `quantity` int(11) NOT NULL,
  `description` text NOT NULL,
  `id_type_product` int(11) NOT NULL,
  `sold_out` int(11) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id_product`, `name_product`, `price`, `product_image`, `quantity`, `description`, `id_type_product`, `sold_out`, `status`) VALUES
(3077, 'Tiền đô âm phủ', 30000, 'https://i.imgur.com/wSAXz5O.jpg', 19, 'Hàng bao đẹp', 1, 4, 0),
(3078, 'Tiền đô âm phủ loại 2', 19000, 'https://i.imgur.com/jAFHP5X.jpg', 19, 'Tiền đô loại 2 cao cấp', 1, 4, 0),
(3079, 'Tiền đô âm phủ cao cấp', 1000000, 'https://i.imgur.com/KucoNgx.jpg', 100, 'Hàng cao cấp bao đẹp!', 1, 0, 0),
(3080, 'Tiền âm phủ 500k ', 11000, 'https://i.imgur.com/8YDIb9f.jpg', 100, 'Tiền như thật!', 1, 0, 0),
(3081, 'Thếp tiền truyền thống', 1500, 'https://i.imgur.com/efdiEgM.jpg', 100, '1.500 VNĐ/thếp, hàng bao đẹp!', 1, 0, 0),
(3082, 'Tiền giấy ngày xưa', 15000, 'https://i.imgur.com/fTIfCs3.jpg', 100, 'Bao đẹp!', 1, 0, 0),
(3083, 'Nhà lầu 6 tầng ', 140000, 'https://i.imgur.com/pT1l0vr.jpg', 100, 'Bao đẹp!', 1, 0, 0),
(3084, 'Tiền vàng đẹp', 1000, 'https://i.imgur.com/phyteLD.jpg', 100, 'Bao đẹp!', 1, 0, 0),
(3085, 'Bộ Bikini cao cấp', 100000, 'https://i.imgur.com/wv2Q8di.jpg', 100, 'Bao đẹp!', 1, 0, 0),
(3086, 'Ô tô trắng cao cấp', 100000, 'https://i.imgur.com/7iNW9bp.jpg', 100, 'Bao đẹp!', 1, 0, 0),
(3087, 'Cá chép loại 1', 120000, 'https://i.imgur.com/7VcjoO3.jpg', 100, 'Bao đẹp!', 2, 0, 0),
(3088, 'Cá chép cao cấp', 1200000, 'https://i.imgur.com/vdqtkM6.jpg', 100, 'Bao đẹp!', 1, 0, 0),
(3089, 'Cá chép cao cấp', 1200000, 'https://i.imgur.com/i5ddFZg.jpg', 100, 'Bao đẹp!', 2, 0, 0),
(3091, 'Vest thanh lịch', 120000, 'https://i.imgur.com/ouKlbRh.jpg', 100, 'Bao đẹp!', 1, 0, 0),
(3092, 'Quần áo phụ nữ', 125000, 'https://i.imgur.com/mrfd2Bz.jpg', 100, 'Bao đẹp!', 1, 0, 0),
(3093, 'Quần áo phụ nữ', 125000, 'https://i.imgur.com/fTdYSM7.jpg', 100, 'Bao đẹp!', 2, 0, 0),
(3094, 'Rồng đỏ', 135000, 'https://i.imgur.com/MG6yMN5.jpg', 100, 'Bao đẹp!', 1, 0, 0),
(3095, 'Tiền giấy xanh', 56000, 'https://i.imgur.com/cd6gxc4.jpg', 100, 'Bao đẹp!', 1, 0, 0),
(3096, 'Bộ mũ đẹp', 56000, 'https://i.imgur.com/nLSRFW4.jpg', 100, 'Bao đẹp!', 2, 0, 0),
(3097, 'Gấu đeo kính', 12000, 'https://i.imgur.com/AvSo6Pu.jpg', 100, 'Bao đẹp!', 1, 0, 0),
(3098, 'Biodex', 645000, 'https://robohash.org/iustositillo.png?size=250x250&set=set1', 92, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 7, 0, 0),
(3099, 'Toughjoyfax', 241000, 'https://robohash.org/deseruntdoloresexcepturi.png?size=250x250&set=set1', 97, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 9, 0, 0),
(3100, 'Otcom', 963000, 'https://robohash.org/omnisquasconsectetur.png?size=250x250&set=set1', 86, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 10, 0, 0),
(3101, 'Andalax', 173000, 'https://robohash.org/sitetdolorem.bmp?size=250x250&set=set1', 82, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 10, 0, 0),
(3102, 'Konklab', 392000, 'https://robohash.org/quoconsequaturexcepturi.bmp?size=250x250&set=set1', 82, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 3, 0, 0),
(3103, 'Kanlam', 131000, 'https://robohash.org/quibusdamfacerenon.png?size=250x250&set=set1', 97, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 6, 0, 0),
(3104, 'Keylex', 323000, 'https://robohash.org/rerumnostrumsunt.png?size=250x250&set=set1', 82, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 5, 0, 0),
(3105, 'Lotlux', 292000, 'https://robohash.org/autteneturaut.png?size=250x250&set=set1', 97, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 7, 0, 0),
(3106, 'Bigtax', 475000, 'https://robohash.org/modifugitut.png?size=250x250&set=set1', 89, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 7, 0, 0),
(3107, 'Daltfresh', 27000, 'https://robohash.org/laborerationerepellendus.jpg?size=250x250&set=set1', 85, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 1, 0, 0),
(3108, 'Redhold', 292000, 'https://robohash.org/commodimagnamvel.jpg?size=250x250&set=set1', 88, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.', 8, 0, 0),
(3109, 'Flowdesk', 771000, 'https://robohash.org/eosautarchitecto.bmp?size=250x250&set=set1', 80, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 2, 0, 0),
(3110, 'Sonair', 766000, 'https://robohash.org/autfacilisillo.png?size=250x250&set=set1', 84, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 6, 0, 0),
(3111, 'Tresom', 617000, 'https://robohash.org/asperioresliberoaliquid.jpg?size=250x250&set=set1', 85, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 2, 0, 0),
(3112, 'Home Ing', 650000, 'https://robohash.org/rerumsedconsequuntur.jpg?size=250x250&set=set1', 88, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 4, 0, 0),
(3113, 'Stim', 806000, 'https://robohash.org/officiiserrorvero.bmp?size=250x250&set=set1', 95, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.\n\nNam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 4, 0, 0),
(3114, 'Bamity', 512000, 'https://robohash.org/voluptatemetaut.jpg?size=250x250&set=set1', 90, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.', 2, 0, 0),
(3115, 'Y-Solowarm', 968000, 'https://robohash.org/sedinciduntet.bmp?size=250x250&set=set1', 79, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 9, 0, 0),
(3116, 'Bamity', 504000, 'https://robohash.org/voluptatibusquisquamtempore.bmp?size=250x250&set=set1', 80, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.', 6, 0, 0),
(3117, 'Keylex', 599000, 'https://robohash.org/estveniamodit.bmp?size=250x250&set=set1', 80, 'In congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 6, 0, 0),
(3118, 'Y-Solowarm', 377000, 'https://robohash.org/porrosedet.png?size=250x250&set=set1', 87, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 8, 0, 0),
(3119, 'Bitwolf', 829000, 'https://robohash.org/culpasintut.bmp?size=250x250&set=set1', 100, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 10, 0, 0),
(3120, 'Keylex', 660000, 'https://robohash.org/quamvoluptatumexpedita.jpg?size=250x250&set=set1', 86, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 9, 0, 0),
(3121, 'Zathin', 345000, 'https://robohash.org/totammolestiaeest.jpg?size=250x250&set=set1', 81, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 10, 0, 0),
(3122, 'Asoka', 977000, 'https://robohash.org/aliquidetet.bmp?size=250x250&set=set1', 83, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 10, 0, 0),
(3123, 'Prodder', 428000, 'https://robohash.org/voluptatequiaeos.jpg?size=250x250&set=set1', 83, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 10, 0, 0),
(3124, 'Redhold', 880000, 'https://robohash.org/faceredictadebitis.png?size=250x250&set=set1', 91, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 2, 0, 0),
(3125, 'Zamit', 270000, 'https://robohash.org/inventoreexquasi.bmp?size=250x250&set=set1', 88, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 1, 0, 0),
(3126, 'Cookley', 612000, 'https://robohash.org/assumendaaccusantiumvoluptas.bmp?size=250x250&set=set1', 86, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 3, 0, 0),
(3127, 'Stringtough', 971000, 'https://robohash.org/ipsumdictaad.png?size=250x250&set=set1', 87, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 6, 0, 0),
(3128, 'Subin', 608000, 'https://robohash.org/molestiaemaximesaepe.png?size=250x250&set=set1', 99, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 10, 0, 0),
(3129, 'Kanlam', 805000, 'https://robohash.org/debitisassumendadicta.bmp?size=250x250&set=set1', 92, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 8, 0, 0),
(3130, 'Stronghold', 223000, 'https://robohash.org/animiinrepellat.jpg?size=250x250&set=set1', 79, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 10, 0, 0),
(3131, 'Home Ing', 288000, 'https://robohash.org/cumquepraesentiumqui.jpg?size=250x250&set=set1', 91, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 9, 0, 0),
(3132, 'Wrapsafe', 484000, 'https://robohash.org/sitdolorvel.jpg?size=250x250&set=set1', 94, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 9, 0, 0),
(3133, 'Flowdesk', 283000, 'https://robohash.org/dolornesciuntdolorum.bmp?size=250x250&set=set1', 86, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 9, 0, 0),
(3134, 'Ventosanzap', 72000, 'https://robohash.org/quosedillum.png?size=250x250&set=set1', 79, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 6, 0, 0),
(3135, 'Otcom', 670000, 'https://robohash.org/quaeratevenietneque.jpg?size=250x250&set=set1', 79, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 10, 0, 0),
(3136, 'Aerified', 164000, 'https://robohash.org/atqueestdelectus.png?size=250x250&set=set1', 81, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 10, 0, 0),
(3137, 'Sonair', 357000, 'https://robohash.org/dolorliberobeatae.jpg?size=250x250&set=set1', 96, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 1, 0, 0),
(3138, 'Voltsillam', 287000, 'https://robohash.org/voluptatemmodilabore.png?size=250x250&set=set1', 97, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 4, 0, 0),
(3139, 'Bamity', 405000, 'https://robohash.org/inipsampossimus.jpg?size=250x250&set=set1', 93, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 3, 0, 0),
(3140, 'Aerified', 191000, 'https://robohash.org/iustoquisquamqui.png?size=250x250&set=set1', 91, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 9, 0, 0),
(3141, 'Tres-Zap', 773000, 'https://robohash.org/iureipsanihil.jpg?size=250x250&set=set1', 96, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 4, 0, 0),
(3142, 'Lotstring', 47000, 'https://robohash.org/autemnatusdicta.jpg?size=250x250&set=set1', 94, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 10, 0, 0),
(3143, 'Tresom', 445000, 'https://robohash.org/eaquearchitectoaut.bmp?size=250x250&set=set1', 94, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 3, 0, 0),
(3144, 'Duobam', 748000, 'https://robohash.org/estodiotenetur.bmp?size=250x250&set=set1', 91, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 6, 0, 0),
(3145, 'It', 679000, 'https://robohash.org/autmolestiasillo.bmp?size=250x250&set=set1', 81, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 3, 0, 0),
(3146, 'Matsoft', 209000, 'https://robohash.org/quiasitest.png?size=250x250&set=set1', 82, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 2, 0, 0),
(3147, 'Duobam', 744000, 'https://robohash.org/quamdelenitidoloribus.jpg?size=250x250&set=set1', 97, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 8, 0, 0),
(3148, 'Duobam', 847000, 'https://robohash.org/automnispossimus.png?size=250x250&set=set1', 83, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 5, 0, 0),
(3149, 'Bitchip', 600000, 'https://robohash.org/eiussunteveniet.jpg?size=250x250&set=set1', 85, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 2, 0, 0),
(3150, 'Tin', 946000, 'https://robohash.org/ipsamcorruptinihil.jpg?size=250x250&set=set1', 95, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 10, 0, 0),
(3151, 'Sub-Ex', 601000, 'https://robohash.org/doloresvoluptatemat.bmp?size=250x250&set=set1', 79, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 6, 0, 0),
(3152, 'Zontrax', 819000, 'https://robohash.org/aliquamveritatisquia.bmp?size=250x250&set=set1', 98, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 3, 0, 0),
(3153, 'Cardguard', 633000, 'https://robohash.org/dolorperferendisconsequuntur.png?size=250x250&set=set1', 87, 'In congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 3, 0, 0),
(3154, 'Ronstring', 673000, 'https://robohash.org/suntiustovel.bmp?size=250x250&set=set1', 94, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.\n\nDuis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 9, 0, 0),
(3155, 'Solarbreeze', 190000, 'https://robohash.org/eaexercitationemquasi.png?size=250x250&set=set1', 92, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 1, 0, 0),
(3156, 'Tempsoft', 403000, 'https://robohash.org/facilisexab.jpg?size=250x250&set=set1', 92, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 3, 0, 0),
(3157, 'Y-Solowarm', 392000, 'https://robohash.org/oditeadolores.jpg?size=250x250&set=set1', 86, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 3, 0, 0),
(3158, 'Veribet', 924000, 'https://robohash.org/suscipitdoloresexpedita.png?size=250x250&set=set1', 91, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 10, 0, 0),
(3159, 'Gembucket', 987000, 'https://robohash.org/namrepellatmolestias.bmp?size=250x250&set=set1', 91, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 10, 0, 0),
(3160, 'Lotlux', 257000, 'https://robohash.org/quaeratabdolores.png?size=250x250&set=set1', 91, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.', 10, 0, 0),
(3161, 'Matsoft', 220000, 'https://robohash.org/estlaborepariatur.png?size=250x250&set=set1', 100, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 10, 0, 0),
(3162, 'Home Ing', 115000, 'https://robohash.org/blanditiisaliquidet.jpg?size=250x250&set=set1', 82, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 2, 0, 0),
(3163, 'Zathin', 497000, 'https://robohash.org/etsitconsequuntur.jpg?size=250x250&set=set1', 83, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 4, 0, 0),
(3164, 'Trippledex', 16000, 'https://robohash.org/esseullamodit.png?size=250x250&set=set1', 98, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.', 10, 0, 0),
(3165, 'Lotlux', 681000, 'https://robohash.org/hicvoluptatibusvoluptas.jpg?size=250x250&set=set1', 88, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 1, 0, 0),
(3166, 'Y-find', 387000, 'https://robohash.org/maioresfugiatitaque.jpg?size=250x250&set=set1', 97, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.\n\nVestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 5, 0, 0),
(3167, 'Tresom', 561000, 'https://robohash.org/sedautinventore.bmp?size=250x250&set=set1', 89, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 3, 0, 0),
(3168, 'Zoolab', 356000, 'https://robohash.org/veniamcorporisrecusandae.bmp?size=250x250&set=set1', 80, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 10, 0, 0),
(3169, 'Ventosanzap', 172000, 'https://robohash.org/quoinciduntdoloremque.jpg?size=250x250&set=set1', 95, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 1, 0, 0),
(3170, 'Holdlamis', 384000, 'https://robohash.org/quominimaet.jpg?size=250x250&set=set1', 89, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 10, 0, 0),
(3171, 'Alphazap', 386000, 'https://robohash.org/corporisperferendissimilique.png?size=250x250&set=set1', 84, 'Fusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 10, 0, 0),
(3172, 'Tampflex', 559000, 'https://robohash.org/doloremiustoneque.png?size=250x250&set=set1', 81, 'Fusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 3, 0, 0),
(3173, 'Subin', 183000, 'https://robohash.org/reprehenderitvelvoluptas.bmp?size=250x250&set=set1', 80, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 6, 0, 0),
(3174, 'Namfix', 18000, 'https://robohash.org/perferendissedodit.png?size=250x250&set=set1', 99, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 2, 0, 0),
(3175, 'Lotstring', 790000, 'https://robohash.org/etsitet.png?size=250x250&set=set1', 88, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 8, 0, 0),
(3176, 'Voyatouch', 981000, 'https://robohash.org/voluptasconsequaturplaceat.bmp?size=250x250&set=set1', 82, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 2, 0, 0),
(3177, 'Quo Lux', 419000, 'https://robohash.org/eavitaerepellendus.bmp?size=250x250&set=set1', 79, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 8, 0, 0),
(3178, 'Overhold', 740000, 'https://robohash.org/quiaccusantiumeos.png?size=250x250&set=set1', 86, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 7, 0, 0),
(3179, 'Bytecard', 453000, 'https://robohash.org/etsuntfuga.png?size=250x250&set=set1', 83, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 2, 0, 0),
(3180, 'Stim', 766000, 'https://robohash.org/eiuseosdoloremque.jpg?size=250x250&set=set1', 97, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 2, 0, 0),
(3181, 'Gembucket', 332000, 'https://robohash.org/minusprovidentat.bmp?size=250x250&set=set1', 92, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\n\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 7, 0, 0),
(3182, 'Fixflex', 57000, 'https://robohash.org/molestiasculpasint.bmp?size=250x250&set=set1', 90, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 9, 0, 0),
(3183, 'Daltfresh', 649000, 'https://robohash.org/utinventorevero.jpg?size=250x250&set=set1', 93, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 10, 0, 0),
(3184, 'Subin', 244000, 'https://robohash.org/estquisquamodit.bmp?size=250x250&set=set1', 84, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 4, 0, 0),
(3185, 'Flexidy', 610000, 'https://robohash.org/etanimiqui.bmp?size=250x250&set=set1', 87, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 5, 0, 0),
(3186, 'Cardguard', 805000, 'https://robohash.org/veniamquisnihil.jpg?size=250x250&set=set1', 97, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 4, 0, 0),
(3187, 'Stringtough', 188000, 'https://robohash.org/asperioresipsaiste.jpg?size=250x250&set=set1', 85, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 5, 0, 0),
(3188, 'Bytecard', 636000, 'https://robohash.org/quiaaliasdicta.png?size=250x250&set=set1', 100, 'In congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 1, 0, 0),
(3189, 'Regrant', 932000, 'https://robohash.org/assumendanemoaut.jpg?size=250x250&set=set1', 87, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 2, 0, 0),
(3190, 'Voltsillam', 963000, 'https://robohash.org/aliasenimet.jpg?size=250x250&set=set1', 83, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 4, 0, 0),
(3191, 'Veribet', 915000, 'https://robohash.org/cumquedelectusofficiis.bmp?size=250x250&set=set1', 93, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.\n\nDuis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 1, 0, 0),
(3192, 'Daltfresh', 111000, 'https://robohash.org/voluptatesutquod.bmp?size=250x250&set=set1', 97, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 2, 0, 0),
(3193, 'Fixflex', 433000, 'https://robohash.org/nonaliquamest.png?size=250x250&set=set1', 94, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 5, 0, 0),
(3194, 'Greenlam', 910000, 'https://robohash.org/velitassumendaest.jpg?size=250x250&set=set1', 96, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 8, 0, 0),
(3195, 'Duobam', 438000, 'https://robohash.org/sintdignissimosenim.png?size=250x250&set=set1', 89, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 3, 0, 0),
(3196, 'Zaam-Dox', 254000, 'https://robohash.org/etutet.png?size=250x250&set=set1', 82, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 8, 0, 0),
(3197, 'Flowdesk', 89000, 'https://robohash.org/nesciuntrepellenduspossimus.bmp?size=250x250&set=set1', 95, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 7, 0, 0),
(3198, 'Lotstring', 21000, 'https://robohash.org/debitisquaeratmolestiae.jpg?size=250x250&set=set1', 83, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 8, 0, 0),
(3199, 'Cardguard', 539000, 'https://robohash.org/velutest.png?size=250x250&set=set1', 95, 'Fusce consequat. Nulla nisl. Nunc nisl.', 5, 0, 0),
(3200, 'Fixflex', 176000, 'https://robohash.org/culpadictaquam.bmp?size=250x250&set=set1', 86, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 7, 0, 0),
(3201, 'Stronghold', 259000, 'https://robohash.org/quiquiaut.png?size=250x250&set=set1', 96, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 2, 0, 0),
(3202, 'Duobam', 741000, 'https://robohash.org/doloremqueminimaaspernatur.png?size=250x250&set=set1', 94, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 1, 0, 0),
(3203, 'Bytecard', 373000, 'https://robohash.org/auteummagni.jpg?size=250x250&set=set1', 95, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 7, 0, 0),
(3204, 'Otcom', 923000, 'https://robohash.org/nisiutfacere.jpg?size=250x250&set=set1', 95, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1, 0, 0),
(3205, 'Gembucket', 697000, 'https://robohash.org/laudantiuminventorequidem.png?size=250x250&set=set1', 92, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 10, 0, 0),
(3206, 'Quo Lux', 180000, 'https://robohash.org/odiodelenitiqui.bmp?size=250x250&set=set1', 87, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 5, 0, 0),
(3207, 'Ventosanzap', 648000, 'https://robohash.org/earumoptiofugiat.jpg?size=250x250&set=set1', 83, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 5, 0, 0),
(3208, 'Gembucket', 850000, 'https://robohash.org/repellendusimpeditvoluptatem.png?size=250x250&set=set1', 100, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 9, 0, 0),
(3209, 'Sub-Ex', 987000, 'https://robohash.org/etfacerecum.bmp?size=250x250&set=set1', 92, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.', 10, 0, 0),
(3210, 'Job', 823000, 'https://robohash.org/remenimqui.jpg?size=250x250&set=set1', 94, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\n\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 9, 0, 0),
(3211, 'Temp', 797000, 'https://robohash.org/ipsamfugiataspernatur.jpg?size=250x250&set=set1', 81, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 9, 0, 0),
(3212, 'Zaam-Dox', 252000, 'https://robohash.org/dolorumblanditiistenetur.jpg?size=250x250&set=set1', 89, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 10, 0, 0),
(3213, 'Voyatouch', 713000, 'https://robohash.org/veritatisuteligendi.jpg?size=250x250&set=set1', 92, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 10, 0, 0),
(3214, 'Trippledex', 51000, 'https://robohash.org/animirepellendusvelit.jpg?size=250x250&set=set1', 100, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 5, 0, 0),
(3215, 'Biodex', 47000, 'https://robohash.org/ettemporesed.jpg?size=250x250&set=set1', 91, 'In congue. Etiam justo. Etiam pretium iaculis justo.', 1, 0, 0),
(3216, 'Sonsing', 31000, 'https://robohash.org/voluptasrecusandaeet.bmp?size=250x250&set=set1', 97, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 7, 0, 0),
(3217, 'Tampflex', 769000, 'https://robohash.org/eligendilaudantiumfacere.bmp?size=250x250&set=set1', 100, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 2, 0, 0),
(3218, 'Transcof', 827000, 'https://robohash.org/idconsequaturdolores.jpg?size=250x250&set=set1', 85, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 3, 0, 0),
(3219, 'Zoolab', 464000, 'https://robohash.org/nonconsequaturquia.jpg?size=250x250&set=set1', 85, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 10, 0, 0),
(3220, 'Duobam', 812000, 'https://robohash.org/ipsamvoluptatenon.bmp?size=250x250&set=set1', 100, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 1, 0, 0),
(3221, 'Bitchip', 784000, 'https://robohash.org/consequatureiusconsequuntur.bmp?size=250x250&set=set1', 99, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 6, 0, 0),
(3222, 'Voyatouch', 926000, 'https://robohash.org/corporisdebitisea.jpg?size=250x250&set=set1', 92, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 9, 0, 0),
(3223, 'Fintone', 510000, 'https://robohash.org/estutab.png?size=250x250&set=set1', 83, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 7, 0, 0),
(3224, 'Gembucket', 687000, 'https://robohash.org/modiprovidentvoluptate.png?size=250x250&set=set1', 96, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 2, 0, 0),
(3225, 'Quo Lux', 886000, 'https://robohash.org/quiexsequi.bmp?size=250x250&set=set1', 98, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 2, 0, 0),
(3226, 'Konklab', 527000, 'https://robohash.org/laudantiuminet.bmp?size=250x250&set=set1', 99, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.', 9, 0, 0),
(3227, 'Stringtough', 610000, 'https://robohash.org/exercitationemipsamautem.jpg?size=250x250&set=set1', 87, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.\n\nVestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 7, 0, 0),
(3228, 'Y-find', 177000, 'https://robohash.org/quieosquisquam.png?size=250x250&set=set1', 98, 'Fusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 3, 0, 0),
(3229, 'Home Ing', 23000, 'https://robohash.org/consequaturipsamiure.png?size=250x250&set=set1', 89, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.\n\nNam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 6, 0, 0),
(3230, 'Namfix', 812000, 'https://robohash.org/verosequiquia.jpg?size=250x250&set=set1', 83, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 4, 0, 0),
(3231, 'Voyatouch', 40000, 'https://robohash.org/doloremeaquequidem.jpg?size=250x250&set=set1', 83, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 4, 0, 0),
(3232, 'Kanlam', 232000, 'https://robohash.org/aetquidem.bmp?size=250x250&set=set1', 97, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 6, 0, 0),
(3233, 'Fixflex', 945000, 'https://robohash.org/consequaturrerumrerum.bmp?size=250x250&set=set1', 88, 'In congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 9, 0, 0),
(3234, 'Bytecard', 672000, 'https://robohash.org/minusdeseruntea.bmp?size=250x250&set=set1', 94, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 9, 0, 0),
(3235, 'Span', 627000, 'https://robohash.org/placeatofficiisatque.bmp?size=250x250&set=set1', 92, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 6, 0, 0),
(3236, 'Vagram', 431000, 'https://robohash.org/eosautemrerum.bmp?size=250x250&set=set1', 97, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 4, 0, 0),
(3237, 'Trippledex', 684000, 'https://robohash.org/harumsolutaquae.bmp?size=250x250&set=set1', 81, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 7, 0, 0),
(3238, 'Sonsing', 333000, 'https://robohash.org/velquiet.png?size=250x250&set=set1', 79, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.', 3, 0, 0),
(3239, 'Cardguard', 250000, 'https://robohash.org/rerumtemporibuslabore.bmp?size=250x250&set=set1', 93, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 1, 0, 0),
(3240, 'Voltsillam', 41000, 'https://robohash.org/iddistinctioipsum.png?size=250x250&set=set1', 98, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 8, 0, 0),
(3241, 'Aerified', 287000, 'https://robohash.org/rerumvoluptatemratione.png?size=250x250&set=set1', 95, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 1, 0, 0),
(3242, 'Tin', 876000, 'https://robohash.org/cupiditatevoluptatemperferendis.bmp?size=250x250&set=set1', 96, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 9, 0, 0),
(3243, 'Cookley', 378000, 'https://robohash.org/quasdolorumoptio.jpg?size=250x250&set=set1', 92, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 3, 0, 0),
(3244, 'Tempsoft', 402000, 'https://robohash.org/sednatusvoluptatem.jpg?size=250x250&set=set1', 80, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.', 10, 0, 0),
(3245, 'Y-Solowarm', 717000, 'https://robohash.org/similiqueevenietea.bmp?size=250x250&set=set1', 94, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 9, 0, 0),
(3246, 'Mat Lam Tam', 956000, 'https://robohash.org/atquemollitiaquia.jpg?size=250x250&set=set1', 90, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 9, 0, 0),
(3247, 'Overhold', 133000, 'https://robohash.org/exercitationemdeserunteum.png?size=250x250&set=set1', 84, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 7, 0, 0),
(3248, 'Redhold', 921000, 'https://robohash.org/etdolorsoluta.bmp?size=250x250&set=set1', 83, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 3, 0, 0),
(3249, 'Cardguard', 807000, 'https://robohash.org/voluptatemporroomnis.jpg?size=250x250&set=set1', 88, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 10, 0, 0),
(3250, 'Regrant', 922000, 'https://robohash.org/noncumaspernatur.png?size=250x250&set=set1', 83, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 9, 0, 0),
(3251, 'Fintone', 21000, 'https://robohash.org/praesentiumdolorumconsequatur.png?size=250x250&set=set1', 93, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 10, 0, 0),
(3252, 'Hatity', 75000, 'https://robohash.org/iustooptiodoloribus.bmp?size=250x250&set=set1', 98, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 8, 0, 0),
(3253, 'Vagram', 30000, 'https://robohash.org/architectoeumitaque.jpg?size=250x250&set=set1', 91, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.', 1, 0, 0),
(3254, 'Solarbreeze', 156000, 'https://robohash.org/voluptasundequibusdam.png?size=250x250&set=set1', 94, 'Fusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 7, 0, 0),
(3255, 'Voyatouch', 156000, 'https://robohash.org/nequearchitectoaccusantium.png?size=250x250&set=set1', 97, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.\n\nVestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 1, 0, 0),
(3256, 'Toughjoyfax', 12000, 'https://robohash.org/voluptasnonrepudiandae.png?size=250x250&set=set1', 96, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 5, 0, 0),
(3257, 'Andalax', 610000, 'https://robohash.org/namestest.bmp?size=250x250&set=set1', 90, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 1, 0, 0),
(3258, 'Home Ing', 435000, 'https://robohash.org/reprehenderitanimitempore.png?size=250x250&set=set1', 93, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 3, 0, 0),
(3259, 'Stronghold', 159000, 'https://robohash.org/atqueveromolestiae.bmp?size=250x250&set=set1', 85, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 4, 0, 0),
(3260, 'Tin', 335000, 'https://robohash.org/rerumnemoquia.bmp?size=250x250&set=set1', 86, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 4, 0, 0);
INSERT INTO `products` (`id_product`, `name_product`, `price`, `product_image`, `quantity`, `description`, `id_type_product`, `sold_out`, `status`) VALUES
(3261, 'Konklux', 353000, 'https://robohash.org/earemvitae.bmp?size=250x250&set=set1', 95, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 7, 0, 0),
(3262, 'Rank', 161000, 'https://robohash.org/quidemteneturdolorem.bmp?size=250x250&set=set1', 83, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 5, 0, 0),
(3263, 'Y-find', 491000, 'https://robohash.org/abconsequaturnihil.jpg?size=250x250&set=set1', 100, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 3, 0, 0),
(3264, 'Zamit', 150000, 'https://robohash.org/quiestcum.jpg?size=250x250&set=set1', 86, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\n\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 5, 0, 0),
(3265, 'Bytecard', 782000, 'https://robohash.org/porroaquae.jpg?size=250x250&set=set1', 98, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.\n\nVestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 3, 0, 0),
(3266, 'Veribet', 614000, 'https://robohash.org/quaspraesentiumquam.bmp?size=250x250&set=set1', 90, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 3, 0, 0),
(3267, 'Asoka', 180000, 'https://robohash.org/porroperspiciatiscumque.jpg?size=250x250&set=set1', 84, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.', 4, 0, 0),
(3268, 'Andalax', 633000, 'https://robohash.org/voluptasmaioresdoloribus.bmp?size=250x250&set=set1', 80, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.', 10, 0, 0),
(3269, 'Ventosanzap', 226000, 'https://robohash.org/etfuganon.bmp?size=250x250&set=set1', 90, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 3, 0, 0),
(3270, 'Zontrax', 861000, 'https://robohash.org/eosessesimilique.jpg?size=250x250&set=set1', 81, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 9, 0, 0),
(3271, 'Transcof', 456000, 'https://robohash.org/commodierrorpossimus.bmp?size=250x250&set=set1', 96, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 1, 0, 0),
(3272, 'Fixflex', 705000, 'https://robohash.org/fugitcommodiet.bmp?size=250x250&set=set1', 99, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 2, 0, 0),
(3273, 'Zoolab', 612000, 'https://robohash.org/velitiustorerum.jpg?size=250x250&set=set1', 94, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 1, 0, 0),
(3274, 'Tresom', 608000, 'https://robohash.org/nequeofficiaexercitationem.png?size=250x250&set=set1', 82, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 3, 0, 0),
(3275, 'Bamity', 259000, 'https://robohash.org/minimaetatque.png?size=250x250&set=set1', 87, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 5, 0, 0),
(3276, 'Cardify', 161000, 'https://robohash.org/numquamquaeratvoluptates.bmp?size=250x250&set=set1', 97, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 10, 0, 0),
(3277, 'Subin', 555000, 'https://robohash.org/praesentiumutet.png?size=250x250&set=set1', 92, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 5, 0, 0),
(3278, 'Keylex', 798000, 'https://robohash.org/esseomniset.bmp?size=250x250&set=set1', 88, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 9, 0, 0),
(3279, 'Lotlux', 902000, 'https://robohash.org/magnamdelectusneque.jpg?size=250x250&set=set1', 89, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 7, 0, 0),
(3280, 'Duobam', 815000, 'https://robohash.org/reiciendisetsit.bmp?size=250x250&set=set1', 88, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.\n\nVestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 9, 0, 0),
(3281, 'Transcof', 897000, 'https://robohash.org/nonveroipsam.png?size=250x250&set=set1', 95, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 1, 0, 0),
(3282, 'Alpha', 282000, 'https://robohash.org/fugitremodio.png?size=250x250&set=set1', 97, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 6, 0, 0),
(3283, 'Tin', 931000, 'https://robohash.org/optioatquelaudantium.bmp?size=250x250&set=set1', 80, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 9, 0, 0),
(3284, 'Viva', 976000, 'https://robohash.org/isteitaquereprehenderit.jpg?size=250x250&set=set1', 98, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 5, 0, 0),
(3285, 'Holdlamis', 421000, 'https://robohash.org/doloresdoloremqueet.bmp?size=250x250&set=set1', 96, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 2, 0, 0),
(3286, 'Tres-Zap', 579000, 'https://robohash.org/vitaeoptioalias.jpg?size=250x250&set=set1', 89, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.', 1, 0, 0),
(3287, 'Alpha', 836000, 'https://robohash.org/solutaeiusest.png?size=250x250&set=set1', 83, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 10, 0, 0),
(3288, 'Cardguard', 411000, 'https://robohash.org/quiaaliasanimi.png?size=250x250&set=set1', 99, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 5, 0, 0),
(3289, 'Biodex', 639000, 'https://robohash.org/natusitaqueet.bmp?size=250x250&set=set1', 100, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 2, 0, 0),
(3290, 'Job', 756000, 'https://robohash.org/sapientelaudantiumvitae.bmp?size=250x250&set=set1', 82, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 2, 0, 0),
(3291, 'Cookley', 149000, 'https://robohash.org/exdoloresreiciendis.bmp?size=250x250&set=set1', 97, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 5, 0, 0),
(3292, 'Zathin', 617000, 'https://robohash.org/veniamsuntquia.png?size=250x250&set=set1', 93, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 6, 0, 0),
(3293, 'Bitwolf', 306000, 'https://robohash.org/quidemeumrerum.bmp?size=250x250&set=set1', 81, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 1, 0, 0),
(3294, 'Asoka', 684000, 'https://robohash.org/praesentiumquispariatur.png?size=250x250&set=set1', 84, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 1, 0, 0),
(3295, 'Cardguard', 985000, 'https://robohash.org/corporisplaceatitaque.png?size=250x250&set=set1', 97, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 8, 0, 0),
(3296, 'Voltsillam', 545000, 'https://robohash.org/iureutquasi.jpg?size=250x250&set=set1', 82, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 6, 0, 0),
(3297, 'Konklux', 442000, 'https://robohash.org/eaaliquammaxime.png?size=250x250&set=set1', 80, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 10, 0, 0),
(3298, 'Konklab', 87000, 'https://robohash.org/consequunturexplicaborepellendus.bmp?size=250x250&set=set1', 89, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 7, 0, 0),
(3299, 'Solarbreeze', 393000, 'https://robohash.org/etvoluptatemeos.jpg?size=250x250&set=set1', 81, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 9, 0, 0),
(3300, 'Tres-Zap', 297000, 'https://robohash.org/aliquampariaturet.jpg?size=250x250&set=set1', 98, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 6, 0, 0),
(3301, 'Voyatouch', 586000, 'https://robohash.org/estcorruptialiquam.png?size=250x250&set=set1', 100, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\n\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 7, 0, 0),
(3302, 'Cardguard', 855000, 'https://robohash.org/ducimuscorruptideleniti.bmp?size=250x250&set=set1', 91, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\n\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 6, 0, 0),
(3303, 'Sonair', 487000, 'https://robohash.org/hicoptioexcepturi.jpg?size=250x250&set=set1', 90, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 1, 0, 0),
(3304, 'Latlux', 403000, 'https://robohash.org/quonamalias.bmp?size=250x250&set=set1', 96, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 6, 0, 0),
(3305, 'Span', 160000, 'https://robohash.org/idetearum.png?size=250x250&set=set1', 83, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 5, 0, 0),
(3306, 'Matsoft', 777000, 'https://robohash.org/eligendioptiofacilis.bmp?size=250x250&set=set1', 83, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 3, 0, 0),
(3307, 'Redhold', 758000, 'https://robohash.org/autestvitae.png?size=250x250&set=set1', 92, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 2, 0, 0),
(3308, 'Aerified', 27000, 'https://robohash.org/exvelitquas.jpg?size=250x250&set=set1', 98, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 2, 0, 0),
(3309, 'Biodex', 439000, 'https://robohash.org/molestiaeutquia.png?size=250x250&set=set1', 95, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 5, 0, 0),
(3310, 'Redhold', 887000, 'https://robohash.org/ipsavoluptatecorporis.bmp?size=250x250&set=set1', 95, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 10, 0, 0),
(3311, 'Treeflex', 413000, 'https://robohash.org/ipsaconsequunturnostrum.png?size=250x250&set=set1', 89, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 6, 0, 0),
(3312, 'Regrant', 971000, 'https://robohash.org/temporaconsequaturmollitia.png?size=250x250&set=set1', 80, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 7, 0, 0),
(3313, 'Matsoft', 934000, 'https://robohash.org/reiciendisessedolorum.jpg?size=250x250&set=set1', 90, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 4, 0, 0),
(3314, 'Bitchip', 15000, 'https://robohash.org/pariaturexvoluptas.png?size=250x250&set=set1', 98, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 6, 0, 0),
(3315, 'Ventosanzap', 846000, 'https://robohash.org/quienimfacilis.png?size=250x250&set=set1', 86, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 10, 0, 0),
(3316, 'Veribet', 796000, 'https://robohash.org/etdignissimostenetur.bmp?size=250x250&set=set1', 99, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.\n\nInteger ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 10, 0, 0),
(3317, 'Wrapsafe', 608000, 'https://robohash.org/doloreserrorconsequatur.bmp?size=250x250&set=set1', 83, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 5, 0, 0),
(3318, 'Cardguard', 646000, 'https://robohash.org/quosintrerum.png?size=250x250&set=set1', 97, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 5, 0, 0),
(3319, 'Pannier', 765000, 'https://robohash.org/quiadictasunt.png?size=250x250&set=set1', 82, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.', 1, 0, 0),
(3320, 'Daltfresh', 199000, 'https://robohash.org/reiciendisteneturdolorum.bmp?size=250x250&set=set1', 99, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 7, 0, 0),
(3321, 'Tres-Zap', 286000, 'https://robohash.org/temporibusquaereiciendis.png?size=250x250&set=set1', 100, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 1, 0, 0),
(3322, 'Opela', 830000, 'https://robohash.org/aspernaturillumquis.png?size=250x250&set=set1', 100, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 7, 0, 0),
(3323, 'Bytecard', 190000, 'https://robohash.org/etmolestiaesunt.png?size=250x250&set=set1', 89, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 8, 0, 0),
(3324, 'Quo Lux', 650000, 'https://robohash.org/ullamdelectusneque.bmp?size=250x250&set=set1', 86, 'In congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 5, 0, 0),
(3325, 'Zamit', 231000, 'https://robohash.org/praesentiumaniminesciunt.jpg?size=250x250&set=set1', 98, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 2, 0, 0),
(3326, 'Flexidy', 222000, 'https://robohash.org/hicperspiciatisculpa.bmp?size=250x250&set=set1', 83, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 1, 0, 0),
(3327, 'Holdlamis', 201000, 'https://robohash.org/magnamoccaecatidolorem.jpg?size=250x250&set=set1', 82, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 7, 0, 0),
(3328, 'Sonair', 632000, 'https://robohash.org/abvoluptatesaperiam.bmp?size=250x250&set=set1', 91, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 9, 0, 0),
(3329, 'Y-Solowarm', 655000, 'https://robohash.org/etmagniexpedita.bmp?size=250x250&set=set1', 100, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 6, 0, 0),
(3330, 'Zontrax', 962000, 'https://robohash.org/doloribusmagnihic.jpg?size=250x250&set=set1', 80, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 2, 0, 0),
(3331, 'Kanlam', 810000, 'https://robohash.org/quibusdamquamad.png?size=250x250&set=set1', 81, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 6, 0, 0),
(3332, 'Solarbreeze', 585000, 'https://robohash.org/officiaquissimilique.bmp?size=250x250&set=set1', 100, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 5, 0, 0),
(3333, 'Quo Lux', 637000, 'https://robohash.org/quaeoptionisi.png?size=250x250&set=set1', 87, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 6, 0, 0),
(3334, 'Fix San', 812000, 'https://robohash.org/saepedoloribusreprehenderit.bmp?size=250x250&set=set1', 86, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 6, 0, 0),
(3335, 'Cookley', 716000, 'https://robohash.org/sequiquaenecessitatibus.bmp?size=250x250&set=set1', 90, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 9, 0, 0),
(3336, 'Regrant', 615000, 'https://robohash.org/voluptatibusundepariatur.png?size=250x250&set=set1', 80, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 2, 0, 0),
(3337, 'Wrapsafe', 902000, 'https://robohash.org/repudiandaecorporiset.bmp?size=250x250&set=set1', 83, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\n\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 10, 0, 0),
(3338, 'Fixflex', 477000, 'https://robohash.org/laudantiumsapienteodio.png?size=250x250&set=set1', 82, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 2, 0, 0),
(3339, 'Holdlamis', 464000, 'https://robohash.org/autmagnamqui.jpg?size=250x250&set=set1', 97, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 1, 0, 0),
(3340, 'Sonair', 160000, 'https://robohash.org/architectoestut.bmp?size=250x250&set=set1', 83, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 5, 0, 0),
(3341, 'Sub-Ex', 361000, 'https://robohash.org/remminimafugiat.jpg?size=250x250&set=set1', 90, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 6, 0, 0),
(3342, 'Flexidy', 396000, 'https://robohash.org/laboreetratione.jpg?size=250x250&set=set1', 93, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 3, 0, 0),
(3343, 'Overhold', 520000, 'https://robohash.org/velevenietrecusandae.bmp?size=250x250&set=set1', 88, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 7, 0, 0),
(3344, 'Opela', 982000, 'https://robohash.org/rationeetmaxime.jpg?size=250x250&set=set1', 86, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 3, 0, 0),
(3345, 'Pannier', 972000, 'https://robohash.org/corporisinciduntasperiores.bmp?size=250x250&set=set1', 95, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 6, 0, 0),
(3346, 'Zamit', 727000, 'https://robohash.org/dignissimosdoloresmolestiae.bmp?size=250x250&set=set1', 86, 'In congue. Etiam justo. Etiam pretium iaculis justo.', 3, 0, 0),
(3347, 'Toughjoyfax', 659000, 'https://robohash.org/quidemnonenim.jpg?size=250x250&set=set1', 87, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 5, 0, 0),
(3348, 'Konklux', 495000, 'https://robohash.org/eaipsamexpedita.jpg?size=250x250&set=set1', 96, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 4, 0, 0),
(3349, 'Home Ing', 599000, 'https://robohash.org/reiciendisnihilaut.png?size=250x250&set=set1', 100, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 10, 0, 0),
(3350, 'Toughjoyfax', 145000, 'https://robohash.org/adipiscieumsint.bmp?size=250x250&set=set1', 93, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.\n\nInteger ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 2, 0, 0),
(3351, 'Voyatouch', 44000, 'https://robohash.org/estrationequas.bmp?size=250x250&set=set1', 90, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 6, 0, 0),
(3352, 'Zaam-Dox', 116000, 'https://robohash.org/culpaillocupiditate.bmp?size=250x250&set=set1', 83, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 9, 0, 0),
(3353, 'Trippledex', 67000, 'https://robohash.org/nullarerumquas.png?size=250x250&set=set1', 94, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 3, 0, 0),
(3354, 'Voltsillam', 521000, 'https://robohash.org/atquecupiditateveritatis.jpg?size=250x250&set=set1', 89, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.', 4, 0, 0),
(3355, 'Domainer', 483000, 'https://robohash.org/quiaconsecteturfacilis.bmp?size=250x250&set=set1', 98, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 2, 0, 0),
(3356, 'Greenlam', 760000, 'https://robohash.org/exaliquiddolorem.jpg?size=250x250&set=set1', 98, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 5, 0, 0),
(3357, 'Stronghold', 736000, 'https://robohash.org/modiipsaesse.bmp?size=250x250&set=set1', 94, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 4, 0, 0),
(3358, 'Zamit', 41000, 'https://robohash.org/repudiandaeutesse.png?size=250x250&set=set1', 98, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 6, 0, 0),
(3359, 'Temp', 477000, 'https://robohash.org/totamvelitlaborum.jpg?size=250x250&set=set1', 81, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 10, 0, 0),
(3360, 'Ventosanzap', 124000, 'https://robohash.org/quibusdamquiminima.jpg?size=250x250&set=set1', 90, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 7, 0, 0),
(3361, 'Namfix', 695000, 'https://robohash.org/temporibusdoloratque.png?size=250x250&set=set1', 85, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 3, 0, 0),
(3362, 'Subin', 716000, 'https://robohash.org/velitestrem.bmp?size=250x250&set=set1', 92, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 7, 0, 0),
(3363, 'Wrapsafe', 206000, 'https://robohash.org/quifacilissunt.png?size=250x250&set=set1', 83, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 10, 0, 0),
(3364, 'Ronstring', 265000, 'https://robohash.org/quiofficiisrerum.jpg?size=250x250&set=set1', 87, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 10, 0, 0),
(3365, 'Zoolab', 313000, 'https://robohash.org/quisnumquamconsequatur.png?size=250x250&set=set1', 100, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 5, 0, 0),
(3366, 'Opela', 862000, 'https://robohash.org/repellendussedasperiores.jpg?size=250x250&set=set1', 95, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 9, 0, 0),
(3367, 'Hatity', 403000, 'https://robohash.org/nobisautqui.png?size=250x250&set=set1', 98, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 5, 0, 0),
(3368, 'Sonsing', 133000, 'https://robohash.org/adipiscimagnamin.png?size=250x250&set=set1', 91, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 4, 0, 0),
(3369, 'Otcom', 116000, 'https://robohash.org/nisireiciendisaut.jpg?size=250x250&set=set1', 88, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 7, 0, 0),
(3370, 'Sonsing', 685000, 'https://robohash.org/enimutiusto.jpg?size=250x250&set=set1', 79, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 4, 0, 0),
(3371, 'Y-find', 805000, 'https://robohash.org/delenitimagnamut.bmp?size=250x250&set=set1', 83, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 5, 0, 0),
(3372, 'Stim', 472000, 'https://robohash.org/reprehenderitoditrecusandae.jpg?size=250x250&set=set1', 92, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 6, 0, 0),
(3373, 'Daltfresh', 278000, 'https://robohash.org/voluptasutesse.bmp?size=250x250&set=set1', 95, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 7, 0, 0),
(3374, 'Bitwolf', 803000, 'https://robohash.org/voluptatesquipraesentium.bmp?size=250x250&set=set1', 81, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 4, 0, 0),
(3375, 'Vagram', 707000, 'https://robohash.org/autexplicabodolorem.bmp?size=250x250&set=set1', 99, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 2, 0, 0),
(3376, 'Stim', 650000, 'https://robohash.org/maximeametconsequatur.jpg?size=250x250&set=set1', 92, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\n\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 6, 0, 0),
(3377, 'Latlux', 161000, 'https://robohash.org/etrerumet.png?size=250x250&set=set1', 99, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.\n\nVestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 4, 0, 0),
(3378, 'Hatity', 419000, 'https://robohash.org/debitisquiquo.jpg?size=250x250&set=set1', 92, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 8, 0, 0),
(3379, 'Temp', 533000, 'https://robohash.org/ipsamutquos.jpg?size=250x250&set=set1', 89, 'Fusce consequat. Nulla nisl. Nunc nisl.', 2, 0, 0),
(3380, 'Y-find', 450000, 'https://robohash.org/rerummodised.png?size=250x250&set=set1', 93, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 1, 0, 0),
(3381, 'It', 787000, 'https://robohash.org/blanditiisinventoresunt.jpg?size=250x250&set=set1', 95, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 5, 0, 0),
(3382, 'Prodder', 476000, 'https://robohash.org/placeatrerumex.jpg?size=250x250&set=set1', 95, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.', 4, 0, 0),
(3383, 'Viva', 424000, 'https://robohash.org/sapientedoloremquereprehenderit.jpg?size=250x250&set=set1', 80, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 4, 0, 0),
(3384, 'Trippledex', 620000, 'https://robohash.org/remmaioresassumenda.png?size=250x250&set=set1', 87, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.', 3, 0, 0),
(3385, 'Redhold', 943000, 'https://robohash.org/eaqueipsamdelectus.jpg?size=250x250&set=set1', 86, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 7, 0, 0),
(3386, 'Cardguard', 494000, 'https://robohash.org/sitnihilexplicabo.png?size=250x250&set=set1', 83, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 2, 0, 0),
(3387, 'Matsoft', 629000, 'https://robohash.org/ettemporeexcepturi.png?size=250x250&set=set1', 94, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 7, 0, 0),
(3388, 'Hatity', 646000, 'https://robohash.org/autrepellendusofficiis.bmp?size=250x250&set=set1', 92, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 6, 0, 0),
(3389, 'Zamit', 133000, 'https://robohash.org/numquamearumassumenda.bmp?size=250x250&set=set1', 98, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 10, 0, 0),
(3390, 'Andalax', 37000, 'https://robohash.org/etmolestiaedolor.jpg?size=250x250&set=set1', 90, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 9, 0, 0),
(3391, 'Flowdesk', 617000, 'https://robohash.org/temporatemporibusculpa.bmp?size=250x250&set=set1', 93, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 3, 0, 0),
(3392, 'Wrapsafe', 37000, 'https://robohash.org/commodiipsumconsequatur.jpg?size=250x250&set=set1', 97, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 4, 0, 0),
(3393, 'Rank', 359000, 'https://robohash.org/exdistinctioet.png?size=250x250&set=set1', 79, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 9, 0, 0),
(3394, 'Voyatouch', 276000, 'https://robohash.org/quidemvoluptatemsimilique.jpg?size=250x250&set=set1', 89, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 5, 0, 0),
(3395, 'Rank', 712000, 'https://robohash.org/quialiquidtempora.png?size=250x250&set=set1', 100, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 9, 0, 0),
(3396, 'Zontrax', 645000, 'https://robohash.org/voluptatemquiut.jpg?size=250x250&set=set1', 90, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 4, 0, 0),
(3397, 'Tampflex', 853000, 'https://robohash.org/saepeenimmodi.bmp?size=250x250&set=set1', 99, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 3, 0, 0),
(3398, 'ádsas', 123123, 'https://i.imgur.com/EfhSH2n.jpg', 123, 'qưeqw', 1, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_type`
--

CREATE TABLE `product_type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(20) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `product_type`
--

INSERT INTO `product_type` (`type_id`, `type_name`, `status`) VALUES
(1, 'Sản phẩm hàng ngày', 0),
(2, 'Ông Công, Ông Táo', 0),
(3, 'Vàng mã ngày giỗ', 0),
(4, 'Cúng chúng sinh', 0),
(5, 'Mở phủ', 0),
(6, 'Rằm tháng 8', 0),
(7, 'Cúng cô hồn', 0),
(8, 'Dâng sao giải hạn', 0),
(9, 'Trừ vong', 0),
(10, 'Vàng mã ngày Tết', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_account`
--

CREATE TABLE `tbl_account` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `pass` varchar(30) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_account`
--

INSERT INTO `tbl_account` (`id`, `name`, `phone_number`, `pass`, `address`, `email`, `status`) VALUES
(2, 'thehuy', '0965582327', 'anhhuy99', NULL, '', 0),
(3, 'Thế Huy', '0912345678', 'anhhuy99', NULL, 'huykuy99@gmail.com', 0),
(9, 'thanhngu', '0945678901', 'anhhuy88\'', NULL, '', 4);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_id`);

--
-- Chỉ mục cho bảng `billdetailed`
--
ALTER TABLE `billdetailed`
  ADD KEY `bill_id` (`bill_id`);

--
-- Chỉ mục cho bảng `image_hightlight`
--
ALTER TABLE `image_hightlight`
  ADD PRIMARY KEY (`id_image_hl`);

--
-- Chỉ mục cho bảng `img`
--
ALTER TABLE `img`
  ADD PRIMARY KEY (`id_image`),
  ADD KEY `id_product` (`id_product`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `id_type_product` (`id_type_product`);

--
-- Chỉ mục cho bảng `product_type`
--
ALTER TABLE `product_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Chỉ mục cho bảng `tbl_account`
--
ALTER TABLE `tbl_account`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `image_hightlight`
--
ALTER TABLE `image_hightlight`
  MODIFY `id_image_hl` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `img`
--
ALTER TABLE `img`
  MODIFY `id_image` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1009;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3399;

--
-- AUTO_INCREMENT cho bảng `product_type`
--
ALTER TABLE `product_type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `tbl_account`
--
ALTER TABLE `tbl_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `billdetailed`
--
ALTER TABLE `billdetailed`
  ADD CONSTRAINT `billdetailed_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`bill_id`);

--
-- Các ràng buộc cho bảng `img`
--
ALTER TABLE `img`
  ADD CONSTRAINT `img_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_type_product`) REFERENCES `product_type` (`type_id`);
--
-- Cơ sở dữ liệu: `newdb`
--
CREATE DATABASE IF NOT EXISTS `newdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `newdb`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `productdb`
--
-- Error reading structure for table newdb.productdb: #1932 - Table 'newdb.productdb' doesn't exist in engine
-- Error reading data for table newdb.productdb: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `newdb`.`productdb`' at line 1
--
-- Cơ sở dữ liệu: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Đang đổ dữ liệu cho bảng `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"snap_to_grid\":\"off\",\"angular_direct\":\"direct\",\"relation_lines\":\"true\"}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Đang đổ dữ liệu cho bảng `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'database', 'project2', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"bai_thi\",\"diem_danh\",\"diem_danh_chi_tiet\",\"giao_vien\",\"giao_vu\",\"ket_qua_thi\",\"khoa_hoc\",\"loai_bai_thi\",\"lop_hoc\",\"mon_hoc\",\"nganh_hoc\",\"phan_cong\",\"sinh_vien\"],\"table_structure[]\":[\"bai_thi\",\"diem_danh\",\"diem_danh_chi_tiet\",\"giao_vien\",\"giao_vu\",\"ket_qua_thi\",\"khoa_hoc\",\"loai_bai_thi\",\"lop_hoc\",\"mon_hoc\",\"nganh_hoc\",\"phan_cong\",\"sinh_vien\"],\"table_data[]\":[\"bai_thi\",\"diem_danh\",\"diem_danh_chi_tiet\",\"giao_vien\",\"giao_vu\",\"ket_qua_thi\",\"khoa_hoc\",\"loai_bai_thi\",\"lop_hoc\",\"mon_hoc\",\"nganh_hoc\",\"phan_cong\",\"sinh_vien\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Cấu trúc của bảng @TABLE@\",\"latex_structure_continued_caption\":\"Cấu trúc của bảng @TABLE@ (còn nữa)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Nội dung của bảng @TABLE@\",\"latex_data_continued_caption\":\"Nội dung của bảng @TABLE@ (còn nữa)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Đang đổ dữ liệu cho bảng `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"word\",\"table\":\"word\"},{\"db\":\"bkacad\",\"table\":\"ket_qua_thi\"},{\"db\":\"bkacad\",\"table\":\"bai_thi\"},{\"db\":\"bkacad\",\"table\":\"loai_bai_thi\"},{\"db\":\"bkacad\",\"table\":\"diem_danh\"},{\"db\":\"bkacad\",\"table\":\"diem_danh_chi_tiet\"},{\"db\":\"bkacad\",\"table\":\"lop_hoc\"},{\"db\":\"bkacad\",\"table\":\"phan_cong\"},{\"db\":\"bkacad\",\"table\":\"giao_vien\"},{\"db\":\"bkacad\",\"table\":\"mon_hoc\"}]');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

--
-- Đang đổ dữ liệu cho bảng `pma__table_info`
--

INSERT INTO `pma__table_info` (`db_name`, `table_name`, `display_field`) VALUES
('project1', 'bill', 'bill_id'),
('project1', 'billdetailed', 'product_id');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Đang đổ dữ liệu cho bảng `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'myshop1', 'billdetailed', '{\"CREATE_TIME\":\"2020-06-25 10:28:59\"}', '2020-06-25 11:22:33');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Đang đổ dữ liệu cho bảng `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('', '2020-07-07 04:06:08', '{\"lang\":\"vi\"}'),
('root', '2020-08-06 02:41:21', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"vi\",\"NavigationWidth\":199}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Chỉ mục cho bảng `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Chỉ mục cho bảng `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Chỉ mục cho bảng `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Chỉ mục cho bảng `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Chỉ mục cho bảng `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Chỉ mục cho bảng `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Chỉ mục cho bảng `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Chỉ mục cho bảng `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Chỉ mục cho bảng `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Chỉ mục cho bảng `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Chỉ mục cho bảng `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Chỉ mục cho bảng `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Chỉ mục cho bảng `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Chỉ mục cho bảng `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Chỉ mục cho bảng `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Chỉ mục cho bảng `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Chỉ mục cho bảng `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Cơ sở dữ liệu: `posts2`
--
CREATE DATABASE IF NOT EXISTS `posts2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `posts2`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `authors`
--

CREATE TABLE `authors` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `authors`
--

INSERT INTO `authors` (`id`, `name`) VALUES
(1, 'John Doe');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts2`
--

CREATE TABLE `posts2` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `author` varchar(50) NOT NULL,
  `content` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `posts2`
--

INSERT INTO `posts2` (`id`, `title`, `author`, `content`) VALUES
(2, 'doremon', 'fuji', ''),
(3, 'shin', 'gumako', ''),
(4, 'shamurai', 'degu', ''),
(5, 'mototo', 'shie', ''),
(6, 'valu', 'fare', ''),
(7, 'sister run away', 'John Doe', ''),
(8, 'chimney', 'John Doe', ''),
(9, 'New Title', 'Matthew Loberg', 'post content');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `posts2`
--
ALTER TABLE `posts2`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `posts2`
--
ALTER TABLE `posts2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Cơ sở dữ liệu: `project1`
--
CREATE DATABASE IF NOT EXISTS `project1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `project1`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(90) NOT NULL,
  `admin_phone_number` varchar(15) NOT NULL,
  `password` varchar(40) NOT NULL,
  `level` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_phone_number`, `password`, `level`) VALUES
(6, 'SuperAdmin1', '0965582327', 'anhhuy99', 2),
(9, 'thanh', '0987456125', 'anhhuy99', 0),
(10, 'thanha', '0987456121', 'anhhuy99', 0),
(11, 'thanhaa', '0987456199', 'anhhuy99', 0),
(13, 'tungcon', '0965412375', 'anhhuy99\'', 0),
(14, 'thachsanh', '0965412323', 'anhhuy19\'', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `bill_id` varchar(15) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_phone_number` varchar(29) NOT NULL,
  `customer_address` varchar(300) NOT NULL,
  `customer_message` varchar(500) NOT NULL,
  `bill_total` bigint(20) NOT NULL,
  `bill_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `billdetailed`
--

CREATE TABLE `billdetailed` (
  `product_id` int(11) NOT NULL,
  `bill_id` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_phone_number` varchar(50) NOT NULL,
  `customer_address` varchar(100) NOT NULL,
  `customer_email` varchar(50) NOT NULL,
  `customer_password` varchar(50) NOT NULL,
  `customer_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `image_hightlight`
--

CREATE TABLE `image_hightlight` (
  `image_hightlight_id` int(11) NOT NULL,
  `image_hightlight_link` varchar(200) NOT NULL,
  `image_position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `image_hightlight`
--

INSERT INTO `image_hightlight` (`image_hightlight_id`, `image_hightlight_link`, `image_position`) VALUES
(2, 'https://robohash.org/aperiamerrorid.png?size=279x356&set=set1', 2),
(3, 'https://robohash.org/quoquidemullam.bmp?size=279x356&set=set1', 3),
(4, 'https://robohash.org/architectoautemnulla.jpg?size=279x356&set=set1', 4),
(5, 'https://robohash.org/consequunturestdolor.jpg?size=279x356&set=set1', 5),
(6, 'https://robohash.org/etminimaea.jpg?size=279x356&set=set1', 6),
(7, 'https://robohash.org/autiustoeos.png?size=279x356&set=set1', 7),
(8, 'https://robohash.org/excepturirationemagni.bmp?size=279x356&set=set1', 8),
(9, 'https://robohash.org/veroimpeditadipisci.png?size=279x356&set=set1', 9),
(10, 'https://robohash.org/atquedebitisinventore.png?size=279x356&set=set1', 10),
(11, 'https://robohash.org/quosedlaboriosam.png?size=279x356&set=set1', 11),
(12, 'https://robohash.org/dignissimosquinesciunt.bmp?size=279x356&set=set1', 12),
(13, 'https://robohash.org/estatnihil.bmp?size=279x356&set=set1', 0),
(14, 'https://robohash.org/autdolorescommodi.bmp?size=279x356&set=set1', 0),
(15, 'https://robohash.org/adipisciestsed.jpg?size=279x356&set=set1', 0),
(16, 'https://robohash.org/sequiassumendamodi.png?size=279x356&set=set1', 0),
(17, 'https://robohash.org/consequunturquoab.png?size=279x356&set=set1', 0),
(18, 'https://robohash.org/velitexpeditaquia.jpg?size=279x356&set=set1', 0),
(19, 'https://robohash.org/ipsamanesciunt.png?size=279x356&set=set1', 0),
(20, 'https://robohash.org/eosquamdolores.jpg?size=279x356&set=set1', 0),
(21, 'https://robohash.org/nequesedsit.png?size=279x356&set=set1', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `img`
--

CREATE TABLE `img` (
  `image_id` int(11) NOT NULL,
  `image_link` varchar(500) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(45) NOT NULL,
  `product_price` bigint(20) NOT NULL,
  `product_image` varchar(180) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `description` text NOT NULL,
  `product_type_id` int(11) NOT NULL,
  `sold_out` int(11) NOT NULL,
  `product_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_price`, `product_image`, `product_quantity`, `description`, `product_type_id`, `sold_out`, `product_status`) VALUES
(2774, 'Tiền đô âm phủ', 30000, 'https://robohash.org/sintdelenitiquis.jpg?size=200x200&set=set1', 123, 'Tiền như thật!', 1, 1, 0),
(2775, 'Mercury', 467000, 'https://robohash.org/dictafugitsequi.png?size=250x250&set=set1', 98, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 3, 29, 0),
(2776, 'Hyundai', 683000, 'https://robohash.org/quodeoset.png?size=250x250&set=set1', 87, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 8, 85, 0),
(2777, 'Subaru', 669000, 'https://robohash.org/dolordoloremet.png?size=250x250&set=set1', 93, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 8, 49, 0),
(2778, 'Porsche', 706000, 'https://robohash.org/idvelnihil.png?size=250x250&set=set1', 96, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 3, 82, 0),
(2779, 'Mazda', 428000, 'https://robohash.org/pariaturtemporeesse.png?size=250x250&set=set1', 86, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 10, 88, 0),
(2780, 'GMC', 120000, 'https://robohash.org/verodoloremipsa.png?size=250x250&set=set1', 81, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.\n\nInteger ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.\n\nNam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.\n\nCurabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 4, 79, 0),
(2781, 'Chevrolet', 73000, 'https://robohash.org/etfacilisaspernatur.png?size=250x250&set=set1', 100, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 6, 84, 0),
(2782, 'Geo', 124000, 'https://robohash.org/estsuntdolores.png?size=250x250&set=set1', 82, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 4, 51, 0),
(2783, 'Chevrolet', 103000, 'https://robohash.org/estevenietet.png?size=250x250&set=set1', 96, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\n\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\n\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 3, 36, 0),
(2784, 'GMC', 593000, 'https://robohash.org/etabesse.png?size=250x250&set=set1', 85, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 8, 51, 0),
(2785, 'GMC', 325000, 'https://robohash.org/totamvoluptaslaudantium.png?size=250x250&set=set1', 96, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 9, 4, 0),
(2786, 'Chevrolet', 266000, 'https://robohash.org/omniscorporisvoluptatem.png?size=250x250&set=set1', 88, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.\n\nDuis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\n\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\n\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 3, 28, 0),
(2787, 'Toyota', 329000, 'https://robohash.org/dignissimoslaudantiumvelit.png?size=250x250&set=set1', 99, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.\n\nInteger ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.\n\nNam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.\n\nCurabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 5, 18, 0),
(2788, 'GMC', 413000, 'https://robohash.org/istequamvoluptas.png?size=250x250&set=set1', 93, 'Fusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.', 4, 2, 0),
(2789, 'Saab', 19000, 'https://robohash.org/doloratexplicabo.png?size=250x250&set=set1', 85, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 8, 63, 0),
(2790, 'Toyota', 979000, 'https://robohash.org/corporisdoloresnulla.png?size=250x250&set=set1', 95, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 4, 1, 0),
(2791, 'Chevrolet', 31000, 'https://robohash.org/voluptatibusutnihil.png?size=250x250&set=set1', 81, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 10, 86, 0),
(2792, 'GMC', 143000, 'https://robohash.org/dictaomnisnatus.png?size=250x250&set=set1', 87, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 8, 87, 0),
(2793, 'Lincoln', 710000, 'https://robohash.org/estcommodiofficiis.png?size=250x250&set=set1', 82, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 1, 75, 0),
(2794, 'Mazda', 486000, 'https://robohash.org/delectusmaximedolorem.png?size=250x250&set=set1', 93, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 7, 83, 0),
(2795, 'Ford', 496000, 'https://robohash.org/quiavoluptatemollitia.png?size=250x250&set=set1', 85, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 2, 1, 0),
(2796, 'Ford', 845000, 'https://robohash.org/fugiatetperferendis.png?size=250x250&set=set1', 87, 'In congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.', 8, 56, 0),
(2797, 'Nissan', 799000, 'https://robohash.org/animiquamomnis.png?size=250x250&set=set1', 80, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 1, 40, 0),
(2798, 'Acura', 516000, 'https://robohash.org/doloreslaborumconsequatur.png?size=250x250&set=set1', 91, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 9, 86, 0),
(2799, 'Chevrolet', 121000, 'https://robohash.org/remaliquidsint.png?size=250x250&set=set1', 85, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 7, 15, 0),
(2800, 'Pontiac', 167000, 'https://robohash.org/quiaquovoluptas.png?size=250x250&set=set1', 83, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 3, 15, 0),
(2801, 'Cadillac', 858000, 'https://robohash.org/aliasutquod.png?size=250x250&set=set1', 79, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 8, 40, 0),
(2802, 'Mercury', 410000, 'https://robohash.org/magnamevenietincidunt.png?size=250x250&set=set1', 84, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\n\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 2, 33, 0),
(2803, 'Chevrolet', 241000, 'https://robohash.org/sequiautut.png?size=250x250&set=set1', 86, 'In congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.\n\nInteger ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 5, 73, 0),
(2804, 'Subaru', 577000, 'https://robohash.org/undeprovidentaut.png?size=250x250&set=set1', 84, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 6, 55, 0),
(2805, 'Mazda', 411000, 'https://robohash.org/eaiurenostrum.png?size=250x250&set=set1', 89, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 10, 31, 0),
(2806, 'Suzuki', 489000, 'https://robohash.org/voluptatesquaeratomnis.png?size=250x250&set=set1', 82, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 2, 69, 0),
(2807, 'Mazda', 97000, 'https://robohash.org/illumrepellatut.png?size=250x250&set=set1', 97, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 1, 12, 0),
(2808, 'Lexus', 506000, 'https://robohash.org/utsimiliqueexcepturi.png?size=250x250&set=set1', 82, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 2, 41, 0),
(2809, 'GMC', 863000, 'https://robohash.org/doloreosdelectus.png?size=250x250&set=set1', 80, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 7, 93, 0),
(2810, 'Cadillac', 360000, 'https://robohash.org/exercitationemsedveritatis.png?size=250x250&set=set1', 85, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 2, 8, 0),
(2811, 'Nissan', 983000, 'https://robohash.org/quivelquia.png?size=250x250&set=set1', 87, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 7, 73, 0),
(2812, 'MINI', 353000, 'https://robohash.org/quidoloresqui.png?size=250x250&set=set1', 89, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 1, 61, 0),
(2813, 'Mercedes-Benz', 831000, 'https://robohash.org/consecteturdistinctioipsa.png?size=250x250&set=set1', 98, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 7, 82, 0),
(2814, 'Toyota', 154000, 'https://robohash.org/solutauteum.png?size=250x250&set=set1', 80, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 4, 32, 0),
(2815, 'Lincoln', 998000, 'https://robohash.org/sedomnissunt.png?size=250x250&set=set1', 93, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 10, 98, 0),
(2816, 'Isuzu', 322000, 'https://robohash.org/velitrepellendusrerum.png?size=250x250&set=set1', 98, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 7, 72, 0),
(2817, 'Dodge', 607000, 'https://robohash.org/nobisinasperiores.png?size=250x250&set=set1', 85, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 5, 27, 0),
(2818, 'Oldsmobile', 593000, 'https://robohash.org/corporisporropraesentium.png?size=250x250&set=set1', 92, 'In congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.', 6, 7, 0),
(2819, 'Mitsubishi', 648000, 'https://robohash.org/illumreprehenderitet.png?size=250x250&set=set1', 79, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 3, 100, 0),
(2820, 'GMC', 28000, 'https://robohash.org/utoptioearum.png?size=250x250&set=set1', 81, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 5, 56, 0);
INSERT INTO `products` (`product_id`, `product_name`, `product_price`, `product_image`, `product_quantity`, `description`, `product_type_id`, `sold_out`, `product_status`) VALUES
(2821, 'Volkswagen', 394000, 'https://robohash.org/remetad.png?size=250x250&set=set1', 89, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 10, 29, 0),
(2822, 'Chevrolet', 484000, 'https://robohash.org/minusetut.png?size=250x250&set=set1', 99, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 5, 36, 0),
(2823, 'Mazda', 94000, 'https://robohash.org/omnisvoluptateet.png?size=250x250&set=set1', 86, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 2, 23, 0),
(2824, 'Chevrolet', 258000, 'https://robohash.org/velitetnulla.png?size=250x250&set=set1', 84, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 5, 40, 0),
(2825, 'GMC', 101000, 'https://robohash.org/estvoluptatibusprovident.png?size=250x250&set=set1', 83, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.', 3, 56, 0),
(2826, 'Dodge', 13000, 'https://robohash.org/reprehenderittemporeullam.png?size=250x250&set=set1', 84, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 7, 67, 0),
(2827, 'Ford', 222000, 'https://robohash.org/doloreslaboreet.png?size=250x250&set=set1', 95, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.', 8, 91, 0),
(2828, 'Chevrolet', 248000, 'https://robohash.org/quiafugitut.png?size=250x250&set=set1', 92, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 7, 52, 0),
(2829, 'GMC', 542000, 'https://robohash.org/essemaioresaut.png?size=250x250&set=set1', 99, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 5, 45, 0),
(2830, 'Eagle', 116000, 'https://robohash.org/asperioresadeos.png?size=250x250&set=set1', 87, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 8, 26, 0),
(2831, 'Ford', 984000, 'https://robohash.org/veniamillocum.png?size=250x250&set=set1', 89, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\n\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\n\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 8, 24, 0),
(2832, 'Toyota', 160000, 'https://robohash.org/voluptatescorruptirecusandae.png?size=250x250&set=set1', 93, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 9, 10, 0),
(2833, 'Ford', 735000, 'https://robohash.org/suntplaceatnisi.png?size=250x250&set=set1', 97, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 6, 82, 0),
(2834, 'Infiniti', 667000, 'https://robohash.org/suntharumautem.png?size=250x250&set=set1', 84, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 6, 15, 0),
(2835, 'Volvo', 268000, 'https://robohash.org/velvoluptatibuscupiditate.png?size=250x250&set=set1', 97, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 9, 51, 0),
(2836, 'Honda', 383000, 'https://robohash.org/nisinumquamfacere.png?size=250x250&set=set1', 98, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\n\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 6, 83, 0),
(2837, 'BMW', 977000, 'https://robohash.org/ettotamquia.png?size=250x250&set=set1', 88, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.\n\nDuis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\n\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\n\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 10, 2, 0),
(2838, 'Ford', 332000, 'https://robohash.org/quimaximepariatur.png?size=250x250&set=set1', 96, 'Fusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 10, 80, 0),
(2839, 'Ford', 504000, 'https://robohash.org/corruptirerumet.png?size=250x250&set=set1', 87, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 5, 39, 0),
(2840, 'Ford', 674000, 'https://robohash.org/expeditanumquamconsectetur.png?size=250x250&set=set1', 97, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 8, 89, 0),
(2841, 'Suzuki', 64000, 'https://robohash.org/omnisofficiisdolor.png?size=250x250&set=set1', 89, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 1, 22, 0),
(2842, 'Mercedes-Benz', 932000, 'https://robohash.org/providentmodiest.png?size=250x250&set=set1', 94, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.', 7, 68, 0),
(2843, 'Volkswagen', 167000, 'https://robohash.org/facereutporro.png?size=250x250&set=set1', 82, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 7, 75, 0),
(2844, 'Buick', 801000, 'https://robohash.org/eligendicumnihil.png?size=250x250&set=set1', 95, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 10, 38, 0),
(2845, 'Pontiac', 564000, 'https://robohash.org/sitexplicaboconsequatur.png?size=250x250&set=set1', 93, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 7, 21, 0),
(2846, 'Nissan', 568000, 'https://robohash.org/assumendatotamnihil.png?size=250x250&set=set1', 88, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 6, 32, 0),
(2847, 'Honda', 695000, 'https://robohash.org/inventoreeumquo.png?size=250x250&set=set1', 94, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 1, 52, 0),
(2848, 'Chevrolet', 314000, 'https://robohash.org/autetvoluptatum.png?size=250x250&set=set1', 81, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 5, 70, 0),
(2849, 'Ford', 561000, 'https://robohash.org/ipsumvoluptasut.png?size=250x250&set=set1', 94, 'Fusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.', 10, 38, 0),
(2850, 'Ford', 994000, 'https://robohash.org/enimprovidentab.png?size=250x250&set=set1', 99, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 3, 82, 0),
(2851, 'Dodge', 261000, 'https://robohash.org/quiaveroex.png?size=250x250&set=set1', 85, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 9, 14, 0),
(2852, 'Subaru', 413000, 'https://robohash.org/autfugiatnecessitatibus.png?size=250x250&set=set1', 81, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 5, 7, 0),
(2853, 'Chevrolet', 249000, 'https://robohash.org/debitisautaccusamus.png?size=250x250&set=set1', 81, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 3, 38, 0),
(2854, 'Pontiac', 503000, 'https://robohash.org/estdoloresea.png?size=250x250&set=set1', 91, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 5, 99, 0),
(2855, 'Nissan', 251000, 'https://robohash.org/autsuscipitrecusandae.png?size=250x250&set=set1', 79, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 7, 43, 0),
(2856, 'Lexus', 734000, 'https://robohash.org/cupiditatemolestiasnesciunt.png?size=250x250&set=set1', 98, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 3, 1, 0),
(2857, 'Toyota', 627000, 'https://robohash.org/evenietodiovoluptas.png?size=250x250&set=set1', 100, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 2, 99, 0),
(2858, 'Jeep', 12000, 'https://robohash.org/commodisolutaeos.png?size=250x250&set=set1', 88, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 5, 60, 0),
(2859, 'Mazda', 666000, 'https://robohash.org/eosoccaecatiperspiciatis.png?size=250x250&set=set1', 98, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 9, 62, 0),
(2860, 'Audi', 757000, 'https://robohash.org/perspiciatisutet.png?size=250x250&set=set1', 86, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.\n\nInteger ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 5, 93, 0),
(2861, 'Kia', 444000, 'https://robohash.org/inautofficia.png?size=250x250&set=set1', 82, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 1, 75, 0),
(2862, 'Ford', 490000, 'https://robohash.org/repellendusetnon.png?size=250x250&set=set1', 94, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.', 1, 85, 0),
(2863, 'GMC', 143000, 'https://robohash.org/voluptatemestsint.png?size=250x250&set=set1', 91, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 7, 18, 0),
(2864, 'Mercedes-Benz', 283000, 'https://robohash.org/doloremnisimaiores.png?size=250x250&set=set1', 99, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 9, 92, 0),
(2865, 'Chevrolet', 144000, 'https://robohash.org/etnesciuntmollitia.png?size=250x250&set=set1', 86, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\n\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\n\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 2, 57, 0),
(2866, 'Oldsmobile', 982000, 'https://robohash.org/reiciendisquaeeos.png?size=250x250&set=set1', 79, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 8, 67, 0),
(2867, 'Chevrolet', 488000, 'https://robohash.org/inventoreanimiillo.png?size=250x250&set=set1', 98, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.\n\nDuis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\n\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\n\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 7, 4, 0);
INSERT INTO `products` (`product_id`, `product_name`, `product_price`, `product_image`, `product_quantity`, `description`, `product_type_id`, `sold_out`, `product_status`) VALUES
(2868, 'Mazda', 872000, 'https://robohash.org/eligendiquiadignissimos.png?size=250x250&set=set1', 93, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 3, 35, 0),
(2869, 'Pontiac', 283000, 'https://robohash.org/aliquamharumet.png?size=250x250&set=set1', 80, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 1, 89, 0),
(2870, 'Chevrolet', 39000, 'https://robohash.org/veritatisipsumnostrum.png?size=250x250&set=set1', 100, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 5, 13, 0),
(2871, 'Suzuki', 806000, 'https://robohash.org/adsimiliquevel.png?size=250x250&set=set1', 90, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 1, 23, 0),
(2872, 'GMC', 457000, 'https://robohash.org/cupiditateetsit.png?size=250x250&set=set1', 93, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 3, 10, 0),
(2873, 'Dodge', 434000, 'https://robohash.org/etmolestiaesequi.png?size=250x250&set=set1', 94, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 1, 63, 0),
(2874, 'Ford', 368000, 'https://robohash.org/autemdelenitisint.png?size=250x250&set=set1', 86, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.\n\nDuis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\n\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\n\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 3, 14, 0),
(2875, 'Hyundai', 696000, 'https://robohash.org/indistinctioimpedit.png?size=250x250&set=set1', 99, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 2, 1, 0),
(2876, 'Volvo', 548000, 'https://robohash.org/velitaccusantiumut.png?size=250x250&set=set1', 94, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 5, 19, 0),
(2877, 'Ford', 440000, 'https://robohash.org/reiciendisutaccusantium.png?size=250x250&set=set1', 93, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 6, 10, 0),
(2878, 'Chevrolet', 121000, 'https://robohash.org/numquamnecessitatibusdignissimos.png?size=250x250&set=set1', 89, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 5, 44, 0),
(2879, 'Hyundai', 772000, 'https://robohash.org/repellendusreprehenderitquis.png?size=250x250&set=set1', 82, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.\n\nInteger ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.\n\nNam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 9, 26, 0),
(2880, 'Buick', 874000, 'https://robohash.org/voluptatumnullapariatur.png?size=250x250&set=set1', 79, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 7, 39, 0),
(2881, 'GMC', 257000, 'https://robohash.org/rerumexcepturiarchitecto.png?size=250x250&set=set1', 90, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 2, 32, 0),
(2882, 'Suzuki', 619000, 'https://robohash.org/suntoptiocupiditate.png?size=250x250&set=set1', 96, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 6, 90, 0),
(2883, 'Ford', 846000, 'https://robohash.org/occaecatiexpeditaquis.png?size=250x250&set=set1', 89, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 3, 82, 0),
(2884, 'Citroën', 836000, 'https://robohash.org/sedrationequia.png?size=250x250&set=set1', 98, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.\n\nVestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.\n\nDuis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\n\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\n\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 8, 33, 0),
(2885, 'Volvo', 153000, 'https://robohash.org/autemquiquisquam.png?size=250x250&set=set1', 99, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 1, 67, 0),
(2886, 'Subaru', 13000, 'https://robohash.org/eaquedistinctiotenetur.png?size=250x250&set=set1', 87, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 9, 13, 0),
(2887, 'Chrysler', 363000, 'https://robohash.org/velminusasperiores.png?size=250x250&set=set1', 100, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 3, 75, 0),
(2888, 'Infiniti', 49000, 'https://robohash.org/suscipitminimaconsequuntur.png?size=250x250&set=set1', 91, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.', 7, 52, 0),
(2889, 'Chrysler', 919000, 'https://robohash.org/liberoeumlaudantium.png?size=250x250&set=set1', 92, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 6, 87, 0),
(2890, 'GMC', 679000, 'https://robohash.org/magnivoluptasvoluptate.png?size=250x250&set=set1', 85, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 5, 7, 0),
(2891, 'Aston Martin', 153000, 'https://robohash.org/saepeautest.png?size=250x250&set=set1', 93, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 8, 32, 0),
(2892, 'Acura', 236000, 'https://robohash.org/totamestmagnam.png?size=250x250&set=set1', 95, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 10, 73, 0),
(2893, 'Dodge', 993000, 'https://robohash.org/illumdistinctioquia.png?size=250x250&set=set1', 100, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 4, 14, 0),
(2894, 'Mitsubishi', 956000, 'https://robohash.org/etullamnostrum.png?size=250x250&set=set1', 100, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 2, 14, 0),
(2895, 'Chevrolet', 843000, 'https://robohash.org/utsequirerum.png?size=250x250&set=set1', 100, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.', 7, 58, 0),
(2896, 'Volvo', 971000, 'https://robohash.org/quaeeumeius.png?size=250x250&set=set1', 95, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 10, 22, 0),
(2897, 'Chrysler', 579000, 'https://robohash.org/delenitisequimagnam.png?size=250x250&set=set1', 90, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 7, 41, 0),
(2898, 'Mazda', 33000, 'https://robohash.org/essecommodiquod.png?size=250x250&set=set1', 85, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 7, 72, 0),
(2899, 'Scion', 214000, 'https://robohash.org/earumomnisnumquam.png?size=250x250&set=set1', 90, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 7, 90, 0),
(2900, 'Toyota', 498000, 'https://robohash.org/laudantiumpariatursuscipit.png?size=250x250&set=set1', 100, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 10, 58, 0),
(2901, 'Lincoln', 271000, 'https://robohash.org/dolorumdolorestenetur.png?size=250x250&set=set1', 84, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 7, 1, 0),
(2902, 'Maybach', 574000, 'https://robohash.org/itaquesitesse.png?size=250x250&set=set1', 86, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.', 7, 92, 0),
(2903, 'Audi', 86000, 'https://robohash.org/harumquasmagnam.png?size=250x250&set=set1', 99, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 2, 41, 0),
(2904, 'Honda', 401000, 'https://robohash.org/veroutquod.png?size=250x250&set=set1', 92, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 6, 25, 0),
(2905, 'Nissan', 67000, 'https://robohash.org/reprehenderitculpalibero.png?size=250x250&set=set1', 85, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 4, 86, 0),
(2906, 'Hyundai', 709000, 'https://robohash.org/etquaeratid.png?size=250x250&set=set1', 99, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 5, 44, 0),
(2907, 'Porsche', 694000, 'https://robohash.org/nullaquianon.png?size=250x250&set=set1', 89, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.', 5, 61, 0),
(2908, 'BMW', 978000, 'https://robohash.org/abassumendaet.png?size=250x250&set=set1', 94, 'In congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.\n\nInteger ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.\n\nNam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.\n\nCurabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 8, 83, 0),
(2909, 'Ford', 753000, 'https://robohash.org/doloremqueomniset.png?size=250x250&set=set1', 81, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 8, 46, 0),
(2910, 'Maserati', 650000, 'https://robohash.org/ametreprehenderitiure.png?size=250x250&set=set1', 100, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.\n\nVestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.\n\nDuis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\n\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\n\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 3, 72, 0),
(2911, 'Mitsubishi', 363000, 'https://robohash.org/autlaborealiquid.png?size=250x250&set=set1', 100, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 3, 12, 0),
(2912, 'Mercedes-Benz', 514000, 'https://robohash.org/etutsed.png?size=250x250&set=set1', 85, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 10, 91, 0);
INSERT INTO `products` (`product_id`, `product_name`, `product_price`, `product_image`, `product_quantity`, `description`, `product_type_id`, `sold_out`, `product_status`) VALUES
(2913, 'Audi', 424000, 'https://robohash.org/dignissimoscommodiunde.png?size=250x250&set=set1', 88, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.', 10, 83, 0),
(2914, 'BMW', 506000, 'https://robohash.org/ducimuseligendinon.png?size=250x250&set=set1', 100, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 5, 48, 0),
(2915, 'Cadillac', 592000, 'https://robohash.org/reiciendisveroipsa.png?size=250x250&set=set1', 82, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 4, 47, 0),
(2916, 'Toyota', 304000, 'https://robohash.org/consequaturquiatempore.png?size=250x250&set=set1', 95, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 1, 66, 0),
(2917, 'Ford', 170000, 'https://robohash.org/repellatminimaet.png?size=250x250&set=set1', 94, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.\n\nInteger ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.\n\nNam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.\n\nCurabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 5, 89, 0),
(2918, 'BMW', 208000, 'https://robohash.org/suscipitillumnon.png?size=250x250&set=set1', 94, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 9, 38, 0),
(2919, 'Subaru', 85000, 'https://robohash.org/remerroreum.png?size=250x250&set=set1', 86, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 5, 39, 0),
(2920, 'Ford', 993000, 'https://robohash.org/nostrumnequequisquam.png?size=250x250&set=set1', 85, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 4, 47, 0),
(2921, 'BMW', 637000, 'https://robohash.org/nihilaperiamvelit.png?size=250x250&set=set1', 79, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\n\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 5, 20, 0),
(2922, 'Audi', 732000, 'https://robohash.org/repudiandaeliberoillum.png?size=250x250&set=set1', 96, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.', 4, 47, 0),
(2923, 'Suzuki', 251000, 'https://robohash.org/sitconsequunturofficiis.png?size=250x250&set=set1', 81, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 2, 74, 0),
(2924, 'Ford', 618000, 'https://robohash.org/eaquibusdamvoluptatibus.png?size=250x250&set=set1', 89, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 1, 97, 0),
(2925, 'Chevrolet', 46000, 'https://robohash.org/eaexvoluptas.png?size=250x250&set=set1', 95, 'In congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.\n\nInteger ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 4, 5, 0),
(2926, 'Chevrolet', 352000, 'https://robohash.org/quidemveldolorem.png?size=250x250&set=set1', 80, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 2, 96, 0),
(2927, 'Nissan', 592000, 'https://robohash.org/rerummolestiaeillo.png?size=250x250&set=set1', 81, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 10, 8, 0),
(2928, 'BMW', 567000, 'https://robohash.org/extemporecorporis.png?size=250x250&set=set1', 84, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 9, 10, 0),
(2929, 'Pontiac', 613000, 'https://robohash.org/nonquisquamfugiat.png?size=250x250&set=set1', 91, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 4, 65, 0),
(2930, 'Ford', 266000, 'https://robohash.org/aspernatursuntquisquam.png?size=250x250&set=set1', 81, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 7, 67, 0),
(2931, 'Chevrolet', 953000, 'https://robohash.org/quietvoluptas.png?size=250x250&set=set1', 95, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.\n\nInteger ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 8, 7, 0),
(2932, 'Mazda', 450000, 'https://robohash.org/quiomnisquo.png?size=250x250&set=set1', 79, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 9, 30, 0),
(2933, 'Toyota', 506000, 'https://robohash.org/cumquedoloreincidunt.png?size=250x250&set=set1', 85, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 8, 92, 0),
(2934, 'Mercedes-Benz', 748000, 'https://robohash.org/sapienteaccusantiumquis.png?size=250x250&set=set1', 85, 'Fusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 9, 72, 0),
(2935, 'Land Rover', 76000, 'https://robohash.org/atquesitplaceat.png?size=250x250&set=set1', 99, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 5, 26, 0),
(2936, 'Mazda', 45000, 'https://robohash.org/quiainad.png?size=250x250&set=set1', 93, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 5, 35, 0),
(2937, 'Volkswagen', 848000, 'https://robohash.org/laboremaioresaspernatur.png?size=250x250&set=set1', 98, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 7, 25, 0),
(2938, 'Pontiac', 763000, 'https://robohash.org/molestiaefugiatquia.png?size=250x250&set=set1', 99, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 10, 90, 0),
(2939, 'Chevrolet', 463000, 'https://robohash.org/estnonesse.png?size=250x250&set=set1', 89, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 6, 5, 0),
(2940, 'Lexus', 390000, 'https://robohash.org/sitquaevelit.png?size=250x250&set=set1', 83, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 2, 2, 0),
(2941, 'Pontiac', 287000, 'https://robohash.org/reiciendisprovidentnemo.png?size=250x250&set=set1', 84, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 6, 98, 0),
(2942, 'Jaguar', 916000, 'https://robohash.org/estnatusautem.png?size=250x250&set=set1', 89, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 5, 87, 0),
(2943, 'Mercedes-Benz', 630000, 'https://robohash.org/maximeoptioconsequatur.png?size=250x250&set=set1', 82, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 9, 96, 0),
(2944, 'Dodge', 513000, 'https://robohash.org/placeatutasperiores.png?size=250x250&set=set1', 80, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 1, 25, 0),
(2945, 'Eagle', 770000, 'https://robohash.org/etsedest.png?size=250x250&set=set1', 82, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.\n\nInteger ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.\n\nNam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 4, 54, 0),
(2946, 'GMC', 881000, 'https://robohash.org/sedetvoluptatem.png?size=250x250&set=set1', 96, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 4, 62, 0),
(2947, 'Mazda', 626000, 'https://robohash.org/estvelitnon.png?size=250x250&set=set1', 82, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.', 5, 65, 0),
(2948, 'Nissan', 408000, 'https://robohash.org/etaspernaturpariatur.png?size=250x250&set=set1', 97, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 10, 42, 0),
(2949, 'Dodge', 436000, 'https://robohash.org/nihilexplicabodeleniti.png?size=250x250&set=set1', 85, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 3, 20, 0),
(2950, 'Mitsubishi', 316000, 'https://robohash.org/velexercitationemdignissimos.png?size=250x250&set=set1', 97, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 8, 89, 0),
(2951, 'Volkswagen', 877000, 'https://robohash.org/sequialiquamest.png?size=250x250&set=set1', 82, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 7, 65, 0),
(2952, 'Lexus', 434000, 'https://robohash.org/nonnatusenim.png?size=250x250&set=set1', 100, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.', 5, 13, 0),
(2953, 'Ford', 510000, 'https://robohash.org/accusantiummolestiaeeligendi.png?size=250x250&set=set1', 85, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 8, 33, 0),
(2954, 'Jeep', 236000, 'https://robohash.org/numquamquaeratet.png?size=250x250&set=set1', 95, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 5, 71, 0),
(2955, 'Mercedes-Benz', 260000, 'https://robohash.org/quaereiciendistempora.png?size=250x250&set=set1', 82, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 10, 74, 0),
(2956, 'Cadillac', 167000, 'https://robohash.org/officiainciduntminima.png?size=250x250&set=set1', 79, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 2, 24, 0),
(2957, 'Lexus', 383000, 'https://robohash.org/laudantiumdoloribusnecessitatibus.png?size=250x250&set=set1', 82, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 2, 15, 0),
(2958, 'Nissan', 318000, 'https://robohash.org/eaquesedblanditiis.png?size=250x250&set=set1', 95, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 6, 4, 0),
(2959, 'Saturn', 135000, 'https://robohash.org/nequequisquamdolorem.png?size=250x250&set=set1', 89, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.', 4, 6, 0);
INSERT INTO `products` (`product_id`, `product_name`, `product_price`, `product_image`, `product_quantity`, `description`, `product_type_id`, `sold_out`, `product_status`) VALUES
(2960, 'Ford', 47000, 'https://robohash.org/etdelenitinon.png?size=250x250&set=set1', 87, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 4, 91, 0),
(2961, 'Mercury', 521000, 'https://robohash.org/nullanatusenim.png?size=250x250&set=set1', 79, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 7, 71, 0),
(2962, 'Subaru', 225000, 'https://robohash.org/minusnisienim.png?size=250x250&set=set1', 100, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 8, 31, 0),
(2963, 'Mazda', 422000, 'https://robohash.org/autemdoloremquedolorum.png?size=250x250&set=set1', 89, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.', 10, 45, 0),
(2964, 'Hyundai', 72000, 'https://robohash.org/animiquiillo.png?size=250x250&set=set1', 79, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.', 2, 90, 0),
(2965, 'Pontiac', 610000, 'https://robohash.org/optioconsectetureum.png?size=250x250&set=set1', 80, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 6, 13, 0),
(2966, 'Dodge', 681000, 'https://robohash.org/harummaximeasperiores.png?size=250x250&set=set1', 98, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.', 9, 13, 0),
(2967, 'Ford', 40000, 'https://robohash.org/aliasodioomnis.png?size=250x250&set=set1', 90, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 3, 70, 0),
(2968, 'Dodge', 507000, 'https://robohash.org/fugitvoluptatesqui.png?size=250x250&set=set1', 100, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 8, 98, 0),
(2969, 'Acura', 642000, 'https://robohash.org/etfugitipsum.png?size=250x250&set=set1', 94, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 9, 79, 0),
(2970, 'Mercury', 913000, 'https://robohash.org/omnisaliquidautem.png?size=250x250&set=set1', 87, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.', 6, 63, 0),
(2971, 'Infiniti', 75000, 'https://robohash.org/autetesse.png?size=250x250&set=set1', 95, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 5, 45, 0),
(2972, 'Volvo', 744000, 'https://robohash.org/eiusaccusamuserror.png?size=250x250&set=set1', 79, 'Fusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.', 10, 36, 0),
(2973, 'Lotus', 144000, 'https://robohash.org/autsitsed.png?size=250x250&set=set1', 94, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 3, 34, 0),
(2974, 'BMW', 850000, 'https://robohash.org/isteautemat.png?size=250x250&set=set1', 86, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.\n\nVestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.\n\nDuis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\n\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\n\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 1, 46, 0),
(2975, 'Audi', 119000, 'https://robohash.org/asperioresmolestiasexplicabo.png?size=250x250&set=set1', 88, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\n\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 10, 52, 0),
(2976, 'Chevrolet', 806000, 'https://robohash.org/culpavoluptatemin.png?size=250x250&set=set1', 81, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 3, 96, 0),
(2977, 'Nissan', 235000, 'https://robohash.org/consecteturaspernaturmolestiae.png?size=250x250&set=set1', 92, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 2, 42, 0),
(2978, 'GMC', 834000, 'https://robohash.org/quisquamliberototam.png?size=250x250&set=set1', 91, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 5, 53, 0),
(2979, 'BMW', 513000, 'https://robohash.org/quidelectusid.png?size=250x250&set=set1', 96, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 10, 67, 0),
(2980, 'BMW', 405000, 'https://robohash.org/cupiditateducimusrepudiandae.png?size=250x250&set=set1', 93, 'In congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.', 4, 78, 0),
(2981, 'Mercedes-Benz', 966000, 'https://robohash.org/velitutnostrum.png?size=250x250&set=set1', 82, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 5, 51, 0),
(2982, 'Nissan', 428000, 'https://robohash.org/veritatisconsecteturquis.png?size=250x250&set=set1', 81, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 1, 70, 0),
(2983, 'Mazda', 171000, 'https://robohash.org/necessitatibussedet.png?size=250x250&set=set1', 89, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 7, 56, 0),
(2984, 'Volkswagen', 901000, 'https://robohash.org/atquefacilismodi.png?size=250x250&set=set1', 99, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 9, 16, 0),
(2985, 'Pontiac', 157000, 'https://robohash.org/quoimpeditillum.png?size=250x250&set=set1', 80, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.', 3, 99, 0),
(2986, 'Chevrolet', 532000, 'https://robohash.org/faceresedqui.png?size=250x250&set=set1', 100, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 4, 85, 0),
(2987, 'Dodge', 199000, 'https://robohash.org/doloresexpeditaet.png?size=250x250&set=set1', 79, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 2, 89, 0),
(2988, 'Chevrolet', 656000, 'https://robohash.org/quasmaximeeaque.png?size=250x250&set=set1', 83, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 3, 20, 0),
(2989, 'Audi', 496000, 'https://robohash.org/doloremidquasi.png?size=250x250&set=set1', 91, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 4, 85, 0),
(2990, 'Mercury', 107000, 'https://robohash.org/nonquisquamiste.png?size=250x250&set=set1', 93, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 7, 76, 0),
(2991, 'Chevrolet', 383000, 'https://robohash.org/officiisipsamquo.png?size=250x250&set=set1', 91, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.', 1, 90, 0),
(2992, 'Volkswagen', 548000, 'https://robohash.org/voluptatemaccusamusreprehenderit.png?size=250x250&set=set1', 91, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 7, 63, 0),
(2993, 'Ford', 727000, 'https://robohash.org/ametomnissoluta.png?size=250x250&set=set1', 98, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 3, 45, 0),
(2994, 'Cadillac', 867000, 'https://robohash.org/veritatisetperspiciatis.png?size=250x250&set=set1', 90, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 4, 11, 0),
(2995, 'Jeep', 995000, 'https://robohash.org/inciduntetdolorem.png?size=250x250&set=set1', 89, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 8, 96, 0),
(2996, 'Audi', 161000, 'https://robohash.org/consequaturaccusamusaperiam.png?size=250x250&set=set1', 88, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 6, 54, 0),
(2997, 'Ford', 299000, 'https://robohash.org/earumsaepeomnis.png?size=250x250&set=set1', 87, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 1, 52, 0),
(2998, 'Toyota', 166000, 'https://robohash.org/voluptatemtemporibusexpedita.png?size=250x250&set=set1', 99, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 10, 96, 0),
(2999, 'Mercury', 831000, 'https://robohash.org/laborecumest.png?size=250x250&set=set1', 94, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 8, 45, 0),
(3000, 'Lincoln', 863000, 'https://robohash.org/laborequoserror.png?size=250x250&set=set1', 88, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 2, 91, 0),
(3001, 'Geo', 833000, 'https://robohash.org/idquosfuga.png?size=250x250&set=set1', 100, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 7, 57, 0),
(3002, 'Lotus', 40000, 'https://robohash.org/natusnisiomnis.png?size=250x250&set=set1', 83, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 8, 68, 0),
(3003, 'Nissan', 168000, 'https://robohash.org/repellendusquiadoloremque.png?size=250x250&set=set1', 93, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 1, 99, 0),
(3004, 'Toyota', 343000, 'https://robohash.org/aspernatureiusofficia.png?size=250x250&set=set1', 96, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.', 3, 32, 0),
(3005, 'Toyota', 661000, 'https://robohash.org/laborenatusat.png?size=250x250&set=set1', 81, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 4, 20, 0);
INSERT INTO `products` (`product_id`, `product_name`, `product_price`, `product_image`, `product_quantity`, `description`, `product_type_id`, `sold_out`, `product_status`) VALUES
(3006, 'Chevrolet', 23000, 'https://robohash.org/omnisdignissimosautem.png?size=250x250&set=set1', 99, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 6, 66, 0),
(3007, 'Hyundai', 602000, 'https://robohash.org/quietquis.png?size=250x250&set=set1', 80, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 6, 85, 0),
(3008, 'Mazda', 714000, 'https://robohash.org/voluptatemrerumsint.png?size=250x250&set=set1', 95, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 9, 40, 0),
(3009, 'Dodge', 845000, 'https://robohash.org/sitaspernaturet.png?size=250x250&set=set1', 96, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\n\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\n\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 5, 100, 0),
(3010, 'Honda', 968000, 'https://robohash.org/doloremquelaborenumquam.png?size=250x250&set=set1', 98, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 6, 70, 0),
(3011, 'BMW', 670000, 'https://robohash.org/quoseligendiexplicabo.png?size=250x250&set=set1', 82, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 5, 51, 0),
(3012, 'Kia', 43000, 'https://robohash.org/quidemerrorodit.png?size=250x250&set=set1', 89, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 4, 95, 0),
(3013, 'Chevrolet', 976000, 'https://robohash.org/quiutet.png?size=250x250&set=set1', 91, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 10, 44, 0),
(3014, 'Suzuki', 908000, 'https://robohash.org/voluptatumdoloribuseos.png?size=250x250&set=set1', 88, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 4, 45, 0),
(3015, 'Volkswagen', 478000, 'https://robohash.org/doloremsedqui.png?size=250x250&set=set1', 94, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 3, 72, 0),
(3016, 'Mazda', 749000, 'https://robohash.org/dictaeadolore.png?size=250x250&set=set1', 87, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 7, 89, 0),
(3017, 'Nissan', 407000, 'https://robohash.org/quisquamnequeoptio.png?size=250x250&set=set1', 89, 'Fusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 5, 19, 0),
(3018, 'Oldsmobile', 964000, 'https://robohash.org/etomnisipsam.png?size=250x250&set=set1', 90, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 8, 91, 0),
(3019, 'Chevrolet', 669000, 'https://robohash.org/autquidemex.png?size=250x250&set=set1', 86, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 2, 15, 0),
(3020, 'Buick', 789000, 'https://robohash.org/molestiaesuntminus.png?size=250x250&set=set1', 91, 'In congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 6, 13, 0),
(3021, 'BMW', 714000, 'https://robohash.org/optiodebitisatque.png?size=250x250&set=set1', 88, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 7, 98, 0),
(3022, 'Saturn', 360000, 'https://robohash.org/delectusametatque.png?size=250x250&set=set1', 96, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 7, 73, 0),
(3023, 'Saturn', 357000, 'https://robohash.org/maioresanimiquibusdam.png?size=250x250&set=set1', 80, 'Fusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.', 5, 45, 0),
(3024, 'Mazda', 201000, 'https://robohash.org/numquamnullamollitia.png?size=250x250&set=set1', 85, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 3, 96, 0),
(3025, 'Chevrolet', 676000, 'https://robohash.org/aperiameiusquo.png?size=250x250&set=set1', 91, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 10, 23, 0),
(3026, 'Lexus', 171000, 'https://robohash.org/eteligendiearum.png?size=250x250&set=set1', 85, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 8, 31, 0),
(3027, 'Pontiac', 496000, 'https://robohash.org/doloremoccaecatimolestias.png?size=250x250&set=set1', 87, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 2, 94, 0),
(3028, 'GMC', 630000, 'https://robohash.org/etquout.png?size=250x250&set=set1', 93, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 8, 74, 0),
(3029, 'Mazda', 503000, 'https://robohash.org/autreprehenderitqui.png?size=250x250&set=set1', 92, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 10, 39, 0),
(3030, 'Mazda', 740000, 'https://robohash.org/consecteturipsamtemporibus.png?size=250x250&set=set1', 86, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 7, 48, 0),
(3031, 'Chevrolet', 789000, 'https://robohash.org/ipsaoccaecaticumque.png?size=250x250&set=set1', 81, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 6, 92, 0),
(3032, 'Honda', 48000, 'https://robohash.org/laborenonvoluptatem.png?size=250x250&set=set1', 91, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 8, 46, 0),
(3033, 'Volvo', 394000, 'https://robohash.org/omnisexpeditabeatae.png?size=250x250&set=set1', 84, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 4, 100, 0),
(3034, 'Nissan', 264000, 'https://robohash.org/utdebitisvoluptas.png?size=250x250&set=set1', 87, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\n\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\n\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 8, 90, 0),
(3035, 'Chevrolet', 202000, 'https://robohash.org/insequirepudiandae.png?size=250x250&set=set1', 93, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 10, 32, 0),
(3036, 'Pontiac', 691000, 'https://robohash.org/exautnemo.png?size=250x250&set=set1', 93, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\n\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 9, 83, 0),
(3037, 'GMC', 291000, 'https://robohash.org/omnisaliasveniam.png?size=250x250&set=set1', 87, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 8, 53, 0),
(3038, 'Ford', 727000, 'https://robohash.org/debitisestconsequatur.png?size=250x250&set=set1', 99, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 10, 72, 0),
(3039, 'Chevrolet', 602000, 'https://robohash.org/assumendainciduntneque.png?size=250x250&set=set1', 97, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 10, 59, 0),
(3040, 'Saab', 815000, 'https://robohash.org/voluptastemporaeligendi.png?size=250x250&set=set1', 97, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 4, 32, 0),
(3041, 'Mitsubishi', 995000, 'https://robohash.org/sedodiomolestiae.png?size=250x250&set=set1', 100, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 10, 89, 0),
(3042, 'Lamborghini', 510000, 'https://robohash.org/architectoimpeditdicta.png?size=250x250&set=set1', 91, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\n\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 3, 72, 0),
(3043, 'Ford', 86000, 'https://robohash.org/assumendaquireprehenderit.png?size=250x250&set=set1', 82, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 7, 36, 0),
(3044, 'Infiniti', 717000, 'https://robohash.org/exercitationemquoesse.png?size=250x250&set=set1', 99, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.', 6, 63, 0),
(3045, 'Bentley', 385000, 'https://robohash.org/animiutofficia.png?size=250x250&set=set1', 85, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 8, 81, 0),
(3046, 'Lexus', 58000, 'https://robohash.org/autnonomnis.png?size=250x250&set=set1', 89, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 3, 14, 0),
(3047, 'BMW', 411000, 'https://robohash.org/temporaquiin.png?size=250x250&set=set1', 85, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 2, 31, 0),
(3048, 'Bentley', 782000, 'https://robohash.org/necessitatibusdeseruntducimus.png?size=250x250&set=set1', 82, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.\n\nVestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.\n\nDuis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\n\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\n\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 6, 3, 0),
(3049, 'GMC', 262000, 'https://robohash.org/doloremqueperspiciatisest.png?size=250x250&set=set1', 98, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 3, 30, 0),
(3050, 'Mercury', 51000, 'https://robohash.org/sitestvelit.png?size=250x250&set=set1', 99, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.', 3, 28, 0),
(3051, 'Volkswagen', 264000, 'https://robohash.org/sintetmollitia.png?size=250x250&set=set1', 99, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 8, 67, 0),
(3052, 'Chrysler', 661000, 'https://robohash.org/praesentiumautfuga.png?size=250x250&set=set1', 83, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 8, 13, 0),
(3053, 'Ford', 828000, 'https://robohash.org/maximeabvoluptatem.png?size=250x250&set=set1', 79, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 10, 6, 0);
INSERT INTO `products` (`product_id`, `product_name`, `product_price`, `product_image`, `product_quantity`, `description`, `product_type_id`, `sold_out`, `product_status`) VALUES
(3054, 'Isuzu', 965000, 'https://robohash.org/inciduntautratione.png?size=250x250&set=set1', 85, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 10, 72, 0),
(3055, 'Ford', 469000, 'https://robohash.org/cupiditatenostrumautem.png?size=250x250&set=set1', 91, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 5, 70, 0),
(3056, 'Pontiac', 989000, 'https://robohash.org/inventoreenimaut.png?size=250x250&set=set1', 99, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 7, 34, 0),
(3057, 'BMW', 967000, 'https://robohash.org/esseconsequatursit.png?size=250x250&set=set1', 90, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.\n\nInteger ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.\n\nNam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 7, 72, 0),
(3058, 'Suzuki', 862000, 'https://robohash.org/sedatad.png?size=250x250&set=set1', 84, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 6, 100, 0),
(3059, 'Hummer', 562000, 'https://robohash.org/expeditadebitisquo.png?size=250x250&set=set1', 98, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 9, 77, 0),
(3060, 'Isuzu', 524000, 'https://robohash.org/teneturdoloresnatus.png?size=250x250&set=set1', 90, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 5, 56, 0),
(3061, 'Chevrolet', 529000, 'https://robohash.org/saepevelitex.png?size=250x250&set=set1', 92, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 7, 49, 0),
(3062, 'Chevrolet', 493000, 'https://robohash.org/quianequedolorem.png?size=250x250&set=set1', 90, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 10, 6, 0),
(3063, 'Smart', 408000, 'https://robohash.org/quialaboreet.png?size=250x250&set=set1', 85, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 5, 63, 0),
(3064, 'Smart', 806000, 'https://robohash.org/doloremlaboriosamqui.png?size=250x250&set=set1', 89, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 7, 4, 0),
(3065, 'Kia', 128000, 'https://robohash.org/cumdoloresdeleniti.png?size=250x250&set=set1', 85, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 5, 79, 0),
(3066, 'Maybach', 584000, 'https://robohash.org/etquibusdamnam.png?size=250x250&set=set1', 82, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 10, 77, 0),
(3067, 'Mercedes-Benz', 874000, 'https://robohash.org/perspiciatisdoloremaccusamus.png?size=250x250&set=set1', 85, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 5, 16, 0),
(3068, 'Volvo', 963000, 'https://robohash.org/hicesseaut.png?size=250x250&set=set1', 91, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 3, 42, 0),
(3069, 'Ford', 873000, 'https://robohash.org/autdignissimoset.png?size=250x250&set=set1', 93, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 9, 72, 0),
(3070, 'Subaru', 720000, 'https://robohash.org/quaeratquianecessitatibus.png?size=250x250&set=set1', 96, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 5, 9, 0),
(3071, 'Chevrolet', 755000, 'https://robohash.org/omnislaboriosamrepudiandae.png?size=250x250&set=set1', 87, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 9, 51, 0),
(3072, 'Mitsubishi', 602000, 'https://robohash.org/aliquamadlaboriosam.png?size=250x250&set=set1', 88, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 10, 99, 0),
(3073, 'Saab', 707000, 'https://robohash.org/eumetofficia.png?size=250x250&set=set1', 95, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 8, 30, 0),
(3074, 'Buick', 562000, 'https://robohash.org/atquenecessitatibusvoluptatem.png?size=250x250&set=set1', 83, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 3, 84, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_type`
--

CREATE TABLE `product_type` (
  `product_type_id` int(11) NOT NULL,
  `product_type_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `product_type`
--

INSERT INTO `product_type` (`product_type_id`, `product_type_name`) VALUES
(1, 'Sản phẩm hàng ngày'),
(2, 'Ông Công, Ông Táo'),
(3, 'Vàng mã ngày giỗ'),
(4, 'Cúng chúng sinh'),
(5, 'Mở phủ'),
(6, 'Rằm tháng 8'),
(7, 'Cúng cô hồn'),
(8, 'Dâng sao giải hạn'),
(9, 'Trừ vong'),
(10, 'Vàng mã ngày Tết');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Chỉ mục cho bảng `billdetailed`
--
ALTER TABLE `billdetailed`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `bill_id` (`bill_id`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Chỉ mục cho bảng `image_hightlight`
--
ALTER TABLE `image_hightlight`
  ADD PRIMARY KEY (`image_hightlight_id`);

--
-- Chỉ mục cho bảng `img`
--
ALTER TABLE `img`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `id_product` (`product_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `id_type_product` (`product_type_id`);

--
-- Chỉ mục cho bảng `product_type`
--
ALTER TABLE `product_type`
  ADD PRIMARY KEY (`product_type_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `image_hightlight`
--
ALTER TABLE `image_hightlight`
  MODIFY `image_hightlight_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `img`
--
ALTER TABLE `img`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3075;

--
-- AUTO_INCREMENT cho bảng `product_type`
--
ALTER TABLE `product_type`
  MODIFY `product_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Các ràng buộc cho bảng `billdetailed`
--
ALTER TABLE `billdetailed`
  ADD CONSTRAINT `billdetailed_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `billdetailed_ibfk_2` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`bill_id`);

--
-- Các ràng buộc cho bảng `img`
--
ALTER TABLE `img`
  ADD CONSTRAINT `img_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`product_type_id`);
--
-- Cơ sở dữ liệu: `shop2`
--
CREATE DATABASE IF NOT EXISTS `shop2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `shop2`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(90) NOT NULL,
  `admin_phone_number` varchar(15) NOT NULL,
  `password` varchar(40) NOT NULL,
  `level` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_phone_number`, `password`, `level`) VALUES
(6, 'SuperAdmin1', '0965582327', 'anhhuy99', 2),
(10, 'thanha', '0987456121', 'anhhuy99', 0),
(11, 'thanhaa', '0987456199', 'anhhuy99', 0),
(13, 'tungcon', '0965412375', 'anhhuy99\'', 0),
(14, 'thachsanh', '0965412323', 'anhhuy19\'', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `bill_id` varchar(15) NOT NULL,
  `customer_id` varchar(10) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_phone` varchar(29) NOT NULL,
  `customer_address` varchar(300) NOT NULL,
  `customer_message` varchar(500) NOT NULL,
  `total` bigint(20) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `billdetailed`
--

CREATE TABLE `billdetailed` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(60) NOT NULL,
  `product_price` bigint(20) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `total` bigint(20) NOT NULL,
  `bill_id` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `image_hightlight`
--

CREATE TABLE `image_hightlight` (
  `id_image_hl` int(11) NOT NULL,
  `link_image_hl` varchar(200) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `image_hightlight`
--

INSERT INTO `image_hightlight` (`id_image_hl`, `link_image_hl`, `position`) VALUES
(22, 'https://i.imgur.com/LRAkE6Z.jpg', 8),
(23, 'https://i.imgur.com/WfJRA5M.jpg', 1),
(24, 'https://i.imgur.com/XxLQnYs.jpg', 2),
(25, 'https://i.imgur.com/hulXKX1.jpg', 4),
(26, 'https://i.imgur.com/RLZsUMr.jpg', 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `img`
--

CREATE TABLE `img` (
  `id_image` int(11) NOT NULL,
  `link_image` varchar(500) NOT NULL,
  `id_product` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id_product` int(11) NOT NULL,
  `name_product` varchar(45) NOT NULL,
  `price` bigint(20) NOT NULL,
  `product_image` varchar(180) NOT NULL,
  `quantity` int(11) NOT NULL,
  `description` text NOT NULL,
  `id_type_product` int(11) NOT NULL,
  `sold_out` int(11) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id_product`, `name_product`, `price`, `product_image`, `quantity`, `description`, `id_type_product`, `sold_out`, `status`) VALUES
(3076, 'John', 1234, 'https://i.imgur.com/1pCw0Wt.jpg', 23, 'ad', 1, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_type`
--

CREATE TABLE `product_type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(20) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `product_type`
--

INSERT INTO `product_type` (`type_id`, `type_name`, `status`) VALUES
(1, 'Sản phẩm hàng ngày', 0),
(2, 'Ông Công, Ông Táo', 0),
(3, 'Vàng mã ngày giỗ', 0),
(4, 'Cúng chúng sinh', 0),
(5, 'Mở phủ', 0),
(6, 'Rằm tháng 8', 0),
(7, 'Cúng cô hồn', 0),
(8, 'Dâng sao giải hạn', 0),
(9, 'Trừ vong', 0),
(10, 'Vàng mã ngày Tết', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_account`
--

CREATE TABLE `tbl_account` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `pass` varchar(30) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_account`
--

INSERT INTO `tbl_account` (`id`, `name`, `phone_number`, `pass`, `address`, `email`, `status`) VALUES
(2, 'thehuy', '0965582327', 'anhhuy99', NULL, '', 0),
(3, 'Thế Huy', '0912345678', 'anhhuy99', NULL, 'huykuy99@gmail.com', 0),
(9, 'thanhngu', '0945678901', 'anhhuy88\'', NULL, '', 4);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_id`);

--
-- Chỉ mục cho bảng `billdetailed`
--
ALTER TABLE `billdetailed`
  ADD KEY `bill_id` (`bill_id`);

--
-- Chỉ mục cho bảng `image_hightlight`
--
ALTER TABLE `image_hightlight`
  ADD PRIMARY KEY (`id_image_hl`);

--
-- Chỉ mục cho bảng `img`
--
ALTER TABLE `img`
  ADD PRIMARY KEY (`id_image`),
  ADD KEY `id_product` (`id_product`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `id_type_product` (`id_type_product`);

--
-- Chỉ mục cho bảng `product_type`
--
ALTER TABLE `product_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Chỉ mục cho bảng `tbl_account`
--
ALTER TABLE `tbl_account`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `image_hightlight`
--
ALTER TABLE `image_hightlight`
  MODIFY `id_image_hl` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `img`
--
ALTER TABLE `img`
  MODIFY `id_image` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1009;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3077;

--
-- AUTO_INCREMENT cho bảng `product_type`
--
ALTER TABLE `product_type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `tbl_account`
--
ALTER TABLE `tbl_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `billdetailed`
--
ALTER TABLE `billdetailed`
  ADD CONSTRAINT `billdetailed_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`bill_id`);

--
-- Các ràng buộc cho bảng `img`
--
ALTER TABLE `img`
  ADD CONSTRAINT `img_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_type_product`) REFERENCES `product_type` (`type_id`);
--
-- Cơ sở dữ liệu: `sinhvien`
--
CREATE DATABASE IF NOT EXISTS `sinhvien` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sinhvien`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblsinhvien`
--
-- Error reading structure for table sinhvien.tblsinhvien: #1932 - Table 'sinhvien.tblsinhvien' doesn't exist in engine
-- Error reading data for table sinhvien.tblsinhvien: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `sinhvien`.`tblsinhvien`' at line 1

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_product`
--

CREATE TABLE `tbl_product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` double(10,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `tbl_product`
--

INSERT INTO `tbl_product` (`id`, `name`, `image`, `price`) VALUES
(1, 'Samsung J2 Pro', '1.jpg', 100.00),
(2, 'HP Notebook', '2.jpg', 299.00),
(3, 'Panasonic T44 Lite', '3.jpg', 125.00);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Cơ sở dữ liệu: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Cơ sở dữ liệu: `testing`
--
CREATE DATABASE IF NOT EXISTS `testing` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `testing`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_images`
--

CREATE TABLE `tbl_images` (
  `id` int(11) NOT NULL,
  `name` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `tbl_images`
--

INSERT INTO `tbl_images` (`id`, `name`) VALUES
(1, 0xffd8ffe11bdf4578696600004d4d002a00000008000c01000003000000010189000001010003000000010189000001020003000000030000009e010600030000000100020000011200030000000100010000011500030000000100030000011a000500000001000000a4011b000500000001000000ac0128000300000001000200000131000200000022000000b40132000200000014000000d68769000400000001000000ec00000124000800080008000afc8000002710000afc800000271041646f62652050686f746f73686f702043432032303139202857696e646f77732900323032303a30343a31362031383a31343a34330000000004900000070000000430323231a001000300000001ffff0000a002000400000001000003e8a003000400000001000003e80000000000000006010300030000000100060000011a00050000000100000172011b0005000000010000017a012800030000000100020000020100040000000100000182020200040000000100001a550000000000000048000000010000004800000001ffd8ffed000c41646f62655f434d0002ffee000e41646f626500648000000001ffdb0084000c08080809080c09090c110b0a0b11150f0c0c0f1518131315131318110c0c0c0c0c0c110c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c010d0b0b0d0e0d100e0e10140e0e0e14140e0e0e0e14110c0c0c0c0c11110c0c0c0c0c0c110c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0cffc000110800a000a003012200021101031101ffdd0004000affc4013f0000010501010101010100000000000000030001020405060708090a0b0100010501010101010100000000000000010002030405060708090a0b1000010401030204020507060805030c33010002110304211231054151611322718132061491a1b14223241552c16233347282d14307259253f0e1f163733516a2b283264493546445c2a3743617d255e265f2b384c3d375e3f3462794a485b495c4d4e4f4a5b5c5d5e5f55666768696a6b6c6d6e6f637475767778797a7b7c7d7e7f711000202010204040304050607070605350100021103213112044151617122130532819114a1b14223c152d1f0332462e1728292435315637334f1250616a2b283072635c2d2449354a317644555367465e2f2b384c3d375e3f34694a485b495c4d4e4f4a5b5c5d5e5f55666768696a6b6c6d6e6f62737475767778797a7b7c7ffda000c03010002110311003f00f554924925292492494a4924925292492494a4924925292492494a4924925292492494a4924925292492494fffd0f554924925292492494a4924925292492494a4924925292492494a492492529312072839b9d89818d665e6dccc7c7a46eb2db086b409da3dc7f79dec62f26fae1fe36f2b2bd4c0faba5d8d8fee63b3dc22d78fa138cdff00b4acfa7fa577eb5fcdff0045b1253de7d6afaf9d0fead31d5e43fed19f135e154417cc6e67aeefa38d5bb733dd67bf67f3555ab63a4755c3eb1d371fa9613b763e5337d73a11f9afade0177e92a78f4ecfe5af98df63ec797bdc5ce712e73899249325ce77e72f54ff001216751737a9d7ea0fd9cc35bbd320eef5df237d6676edf46afd3ffd61253ea8924924a7ffd1f554924925292492494a4924925292492494a49243bafa68acdb7d8daab1cbde4340fed3a12530cdcec3c0c776566df5e363b3e95b6b831a27e88dcefde5cd1ff1a7f5183f61ea263bb851796ffe79dcbc8bebafd6bcafacbd62dc8f51df60a9c598341d1acac1fe7367fa7bff009cb5df4ffc16ff004ea62e79253f4ff4eea9d3faa630cbe9f915e550ed3d4a9c1c0180ed8ffdcb1ad77bab7fbd65fd6afae5d23eace31765bfd5cb7b7763e1567f4966bb5ae3fe868ddf4afb3feb7ead9fa35e11f57feb2f56fabd96ecae9b6fa6f7b0b2c6386e63810763acafe8bdf4b9dea55fcbfe42ee7ea97f8bacff00ac577fce1fad56d8eab24b6d652e77e9af69036d975a0eea31bd3db5d55b3f4be9ff00dc7afd2f5129c7b8fd75ff001939e5d556460d4f86b64b3128881ee7bbf9ec8db66fb3f9ec9fd27e8ebf47d8ba5e9dfe24718301ea7d4ec7bc81b998f586007f3836dbbd5759fd6f46b5e978d8b8f894331f16a65145636d7556d0d63478318d86b515253e41f58ffc4de56263bf27a1e4bb33d31b8e25ad0db4b47d2f46daff00476d9ff03e9d4abff89febade9fd6b23a364fb1bd440f48bb48be9dffa3d7e8fad53acff00aed7556bd9d7907f8d5fab76f48eab47d69e963d16df6b4deeac01e9e534fa956488ff00b93b37bff47fd22bdf67bf21253ebe92ccfab7d66aebbd130faad636fda6b9b18261b634fa7915fbbfd1dcc7b569a4a7ffd2f554924925292492494a49249252cb1baa7d65ab1724f4de9f8efea9d5e013854103d305a6c6599d9367e8306a7ffc2fe99fea57e953620758ea59b9bd47fe6f745b05592d6b6cea59c0077d92a7ff0034c683edfb7e57fda7adff00cdd7fac2d3e93d1f07a4620c5c261634b8d96bdc4bacb6c77f3b91936bbdf75f67e758ff00fa8494e50e89f58ba912eeb3d59f8951208c2e9334b46d7388f53a8dad7675dea57b7d5f4bec68d47d48faa94d8fb3f66539165a65f66507653c9f1f5335d90f5ba924a737fe6d7d5c0ddbfb2b0b6f87d9ea8ffa85e71fe316efab755ecfab9d0ba362dbd5ee21b659452d6baa2efa14d5f670cf5329f3f9deca7ff3d755fe313eb98fab5d345588f6fed5cc918c08dde9b069665bd9f47d9f4686d9fce5dfe96ba6e54ffc5a7d4f1d3f11bf583a9075dd5fa834dad7da773aaaecf7fd23b9ff0069ca6bbd5c8b5ffa4ff01ecfd37aa94e1e0ff89536f4863b3b39d8dd55e77398c636da58d23f9877d0b2dbbfd25ecbbd2ff475d9fced9d674dead99f56ba7e2f4dfac38669c5c3a6ac76756c626fc622b6b6b6bf2dbb199583fe0d9bada7ecfea7f865d5a62252530a2fa722965f458db69b40757631c1cd734ead7b1edf6b9ae445c8759faa7d4f08bb37ea765bfa6593bade9ac2dfb35bfbeea31f21b662e2e5bd9ecfe6feceff00d1ff0033fa4b5374afadbd5fec832b330fedf82d79aaecac1639b918f630d75d94755e896bacc8a2ea7758fc9fb1dd95ecf7d757a4f624a7b059ff00583a4d5d6ba2e674bb6232aa731ae74c35ff004a8b74ff0043736bb51f03a8e1752c4af3306f664e3da2596d665a7cbf92f6fe7d6ff7b1582929f2ff00f12bd59db3a8f43b8c3aa70caa587e96bfa0cbfeaec7b71fdbff0008bd4578e7d4bb4e2ff8d8ea18f48db55b7e7d240e3635f65cd1fe750c5ec6929fffd3f554924925292492494a597f58fac1e91d31f915345b996b9b8f838e481eae4dc7d2c5a7dcfabdbea7e92ef7ff00315dab2beb6ff8c2e8bf564fd9ec9cbea0448c4a8896c8dcc7645a7db435dff5cbbfe0563fd51facb93f5e7aeb72eec518983d118eb594b6c2fdd93913463d96ee656d7fa38ccccf4fd9ec7d8929ebfa07466748e9cdc62ff5f26c73afccc920075d9169df9190eda1bf49fedaff00729f4eb5a49249294ab750ea187d370edceceb5b462d0ddf6daee00e3face7bddecaeb67becb3f475aa3f58beb4747fab98832ba95db37cfa3433dd6d847d26d354b7fedc77e899fe12c5e1df5b7ebb756fad178fb41146156e2ea30ab24b1a7e8fa963bdbebdfb3dbeabbf97e95757a8929967f571f5b3ebad1959e4b3132f2a9a1b5b8ff00378c6c6d6d67d276cfd19f52dd9ecf5ecb6c5f42af95c48d57b3e37f8c57e47f8becaeaf543bac6032ba321840205b639b8f5669686edf4acddebecd9e9faccfb3a4a7d0925f2ff50ea7d43a9e41c9ea1916655c49f7dae2e227f35b3ed633f90c57ba2fd6dfac3d12c69e9f9d6d7533fed3b897d24692d763d9baaedf4dbfa4494fd23cae6fafd0fe8b9fff003ab0db35b5adafade3b019b719bed666fb1afdf95d3377a9effe730bd5a7d5ad43ea3fd78c4fad3865ae0da3a9e3b47dab184c11f47ed38dbbdcfc77bbfeb98d67e8adff000575dd358c658c731ed0f63810e6912083a39ae69494f3dd43a1dccb5dd77eab59563f50b9bbeeab9c5cd69fd233ed2d610d6e46e3be8cfa7f4bfa4f4edf52ab143a5fd7ce9197d3b3327283b072fa5b1ceea181711ead659a3857bb67da1aeb3f435bbfd27a7fcdfa8a7f54eefb074ccde9998ff4ebe83916e30b6e78918ad6b7330aeb9e76b6baebc1bebaff00eb2bc9febff5ac0fac9d6edcbe8988e35635519598c6bb75cc6b98d6e4e456dfe6e8a9de9d555b6fe97f9bf57fc0575a53d07f8a1c0c9ea3d7fa97d64c968801cc0e8201bf21debda6b3f47f45537f48dffbb15af5b5ccff008ba1d27fe69609e9422b2d26fdd1bfed13fad7adb7f3fd4fa1bbfed3fa3fe0d74c929fffd4f5549249252953eb1d4074ce9599d44b778c3a2cbf64c6e35b5d6064ff002f6ed57167f5fe9eeea7d133fa7b2059978f6d35976803dec736a73bfeb9b5253f35e66664e7655b979761b72321e6cb6c3cb9ce3b9ced3dabd97fc4ce1fa1f562fca73007e5653c87f77575b6ba983fb16faebc5edaada6d755731d5db5b8b5f5bc16b9ae69daf63d8ef735cd72edbeab74afae5f5aba4d3d1716e383f57f18b85d741632c2f7bedb376ddb667dcddffcceff00b357e955eafa4f494f7ff58bfc697d5be8dba9c779ea798dff00058e47a6d3a1db765fbaaffb67ed0f67e7b1703d53fc70fd6acb2e6e10a7a75732d35b05b647eebecc9f52b77f599454bd1fa07f8b8faafd198d77d95b9b942376465816191eefd1d447a14ed77d0f4ebf57fe1574b663d36d271ec635f4b86d35b9a0b4b7f77611b76a4a7e60cdcfcdcfc876566df664deff00a56dae2f718fa2373bf75775fe2b7ea460f5c17757ea8d176262d9e8d38d261f686b6d7baf8f77a5536cabf47fe1bfc27e8ff9cd0ff18ffe2e31f171edeb9d0aa35d3592fccc3ac4b5ad3abf2319bfe0ebaffc353fcd555fe919e9d752c7ff00169d4fa9db7ddf55f172bec5575370b5d90d316d6dadaefb5b703da5adcbcba432bf5ffed3574faf5fe91253d5fd6afabff55fac9b3a3fd5fe92cb7ab5121f91822bc6a315d2d67f94b21adf42d77d277d8ebaefcbfd0ddfd1ff009c5e75d7beabfd63faad63ebcd63998f90df48e4d04bb1ed6922cf48d90dfcfabd4f46f632cfd0fadb3e83d7d05d3ba760f4cc3ab070296e3e352ddb5d4c1a0f327e93deeff0963ff4967f8453ca6e2bf1ec6e5ec38ee69168b60d65a7e90b3d4f66dfeb24a7e5b497b9758ff14ff557aa4df81bfa75b602e6bb1c87524bbdc1ff0067b373767ee331aca18b92ccff00127d7abb0fd8b3b1722aeceb7d4a5e7feb6c664b3ff05494e6ff008a4a33acfae38f6e3871a29aed398e6e8d15bab7b2b6d9fd6c9f476b3ff20bd3baff00f8c8faafd158e67da466e589031b148b083ab7f4b703e853b5c3f49bacf57fe0979eb7fc5a7d60c3bb13a4f53ea75e1e0754b5cd69a5d65957da18ddf4d77d0ffb257eb5f536dfb33bdffcdfa4bb8e85fe2abeabf4bdb6e4d6eea7903f3b260d60c6d3b315bfa2daeffbb1f68494f0d898ff00593fc62759ea2682de99d3b21f45d9cc2e25a1a1be8e19d9ecb332df46873d9fcd636faffc0fe8d7a6f47fa95d0fa4746c8e918d59356756eaf32f719b6d0f6baa3ea59fc963dde956cfd1d7fdbb1607d50eb95667f8c2facd8b5362b78acb3c07d8b6f4e7ec8fccb1d66e5dea4a7c8bfc51758bba775bccfab396768bcbdd5335d3228f6dec6003fc2e3b1ce7b9dff7158bd797cedd53a95bd2bebee7752a357e2754bed0d0637065ef73ab247e658cfd1b97d0d5595db5b6dadc1f5bc0731c382d23735c1253ffd5f55492517d8cad8e7bdc18c602e739c600035739c4a4a5d703f5e7fc6762f47f5ba674773723aa36596da7dd563bbf3f77fa7c967d1f4bf9baadfe7ff9bfb3ac2faf7fe342eca7bba57d5ab5cca3e8df9cc90fb1c74f4b0ff3eba7feec7f3b73ff0099fd17f48d9ff17ffe2d69e96ca7abf5aac59d474b31f1dc25b8e7e931ee1f9f96dffd97ff0007fa4fd224a799e99fe2bbeb1fd60c7c8eadd5727ec79979df4d792d2eb2d73bdceb32b690ec467ee7b2cb7fe06bf67a9deff8b6a3230ba05bd23280f5fa4e65f8961699693232b7d53b5de9bdb93b99ed5d5ae7fa797e17d72ea786f738d5d4f1e9ea140db0c0fa80e9d9ad0efdfdacc1b3fb6929e85667d64eb55742e8997d56d6ef18ac96b3f79ee22aa2befb5b65cf635cff00cc5a6b88ff001be2d3f53ddb3e88c9a4dbfd5f77fe8cf4d253e4d99f5cfeb465f503d41fd4b2197eedcd6d763995b3fe0eaa5aef4d95ff0023f3ff00c2a0fd59ea4ee9bf58ba767efd8da726b7585ba7e8cbb65edfedd2eb18b2d2494fd31f583ad63741e8f93d572417578cd915b797b9c4575543477f396bd8ddff0098be7efac5f5a3ac7d62cafb4751bcbda093563b74a6b07f369abff463ff004aff00f0962fa0fa974ac1ebdd21d83d4185f8f92c6970692d70236db5bd8e6fd1731eddcb88ccff00127d15edfd47a86550ff001b857737fcd63715dff4d253adfe29ebb5bf52b15cf71736cb2f75609d1adf51ccdadfdd6fa8cb1ebb159df57fa2e3742e918dd2715ce7d38cd203dff49c5ce75b63cff5ecb1eb45253cff00d7b63ffe6b66e452433230857994584025b66358cc9639b3ff0017b14feb9fd6267d5dfabf93d427f5823d1c3691337bc1f4b43f9b543af7ff00c1d481f5f6c63fa13ba69b7d17753b6bc6f57486553f69cec8b7710d6538f81464db6d8bc8bfc60fd6f77d67eafba931d371375784d820b813fa4c97eef76fbf6b7fa957a7fe13d4494eaff899b23eb65f3a97e15a24ff00c663bffefabd9f2b269c4c6b72af76ca6863adb5e780c602f7bbfb2d6af13ff139ff008ae77fe14b7feaaa5db7f8dbfac6de9bd03f65d2f8cbea84d640305b4360e43b4ff4becc7f77d365977fa3494f8ae5645995956e55bad990f75af23f79e4bddff54be87fa8999f6dfa9fd26efddc66d27e34ce29ff00cf2be735efff00e2b4ff00d8274df2f5ff00f6e2f494ff00ffd6f51befa71e97df7bdb555534becb1e435ad6b46e73def77b5ad6af12ff00181fe312febd6bfa6f4c7ba9e8ec30e7416bf248ff000968fa4cc6ff00418fff005ec8fd27a7563f5bfe3870bafddd26bbf0edddd269d73b158087ee9fd16458ff00f0d8ecff0045fe06dfd3fe9bfed378cc1494fa07f89ffabb5751eb37756c9687d3d2c34d2c70906fb377a767b86dfd598c759fbecbbecf6af6a5e61fe24ba8e39c3ea3d30903219637240246e731cd14bb68fa5b697d6cdfff001ebd3d252973ff005ba9b71e8c5fac18acf5327a258721ec1ab9f8af6fa5d4e866e7d6cddf66fd659ff0b8b5ae8131e34e52530c7c8a7268af22878b29b98db2ab1bc398e1bd8f6ff59a550facbd1abebbd0b33a53cecfb5570c79986d8d22da1ee8fcc65ecadcf5938961faa99e3a75e40e8199613d3ef70da316eb1c5f674db9c3d9f65b5cef53a7dbfe0ffa2d9fe0d751a24a7e5eea18197d3b32ec2cda8d193438b2da9dc823fe8b9aefa4c7b3d96310e8a2dc8bebc7a5bbedb5cdaeb60e4b9c7631a3fb457d11f5a3a1fd54ccc57f50fac38d53eac466e7e4bb735ed6365db3d5a0b2f7b773ff004747fa4fa15af34faa5d0eefadbf5872bac6233f63e074e20f4e34d6d2caee61dd8357a4fdd5dfe9ff004bcfff004967fa2fb46f494fb354c15d6dac6a180347c8429ae6e8fadcdc12cc3fad14fec9cc2430649938373bdffa4c5cef73296bdb5fabe866fa17d5ea6cfd22d56f5fe84fafd56751c4757cef17d65b1fd6dfb52537d0b27228c5a2cc8c8b1b553534becb1e406b5a04b9ef71fcd5cd759ff197f54ba5566331b9f744b69c322d99ff008669fb3336ff002ae5e4df5bbebf757faceff4ac8c5e9edd59855b896920eef5322cf6bb22cffc099fe0ea494cfebefd73bbeb1f572fc673abe9f8cd7538acd41731c41baeb7f9592e633d9fe8ababf96b954b949253d8ff008afea983d23ace7753cf7ecc7c5c0b1c63e939c6dc7632aac69badb376dad61fd66fac197f58bac5dd4f2bd86c3b69a771736aa9bfcd50c718fa3f49fed67a96fa96fe7aca4925297bff00f8adff00c4274cff00afff00edc5ebc017bfff008adffc4274cffaff00fedc6424a7ffd7f52b2baed63abb1a1ec782d7b1c25a5a74735cd3f49ae5cadffe2b3ea45b43e96601a1ce0436eaeeb77b491f4d9ead96b3dbff0008c7d6bad49253e13d5fa0fd61ff00173d6b1fa9e1d82dc6dc4519704d76023df879954fb1cfaff337fe93f9dc6b3d5a7f43eb7f553eb5f4efacfd3865e21f4eeae1b9588e32fa5e7f35df47d4a6c8fd05fb7f4bfc8b996d55ea66e16267e2d98799532fc7b86db2ab06e691cffd177b9abcabaefd44fac1f54fa83bae7d50b6db31dbf4a967befadae237d4faa1cdcec4de1aefa3eab3fc2b3f43f69494fae24bce3eafff008e4e9590c6d5d7a9760ddf9d914875b41d39f4c6fc9a7fe2f6e47fc6aeba8fae3f55722a6db5f57c3dae1203ef631c07f2abb5ccb19fdb624a74f2b171f2e87e3e4d6dba9b5a5b654f1b9ae07f35cd2bca8ff8c1cdfa9dd7f33a15b51cee8f8769af1ab7b8faf4d461f5d75643f7faf552c7edaaac9f7ecf4abfb4aec3acff008ccfaa5d2984372c67dfa6da70e2d99ff87046337f95fa6f53fe0d78b7d66ea77f5bead7f5c7e29c5af3dd35b04b99fa36b297065ce6b3d57376b7d5fe5a4a7aafad1f5d5df5dba8e3f46c5bdbd27a2970759765b9ac2e701bdd6e56c7399b2afa18d8ccb3f4b77e96db3f9bfb3fa2744ea9f51ba0f4ba7a760f56c16d148e4e4d4e7bdc75b2eb61feeb6c77f27f915fe8d7cf72424929f79ea5fe34bea562b1c1b94fce77d17538f539d20f3efbfd1c6737febab05ce6754b2bb4fd5daba1f4fbdb5e4539f4f4c6752badade7d5dfea63d3663e0efa7fd363e5dbfa45e558789959b955626256ebb22f7065553752e71ecbe96e85d3dfd33a360f4eb1c1f66263d54bded982e631ac7b9bbbf3770494f8d7d7f77d5aaf0b071ba0fa96d9ea58fcfc9c9aae6e458fdb5b2975b91974d3bbfc37e829fd0d7fe85710be92fad5f56f13eb2f47b3a6e4b8d649165173449aed6c8aedd87f9c6fb9ccb2bfcfa9effe6dff00a45e09f583eaa75cfabd79afa9e33995eedb5e4b01753673b7d2be36fbb6eff4acf4effdfa925390925054aaaacb6d655535cfb2c706b18d05ce7389dad63183e939ce494cfec993f65fb67a4ffb36ff0048df0760b23d4f48d9f47d4d9efd884bdf7ea2fd4f6749faabfb37ab535df6e6bce46663d8d6d8c04ecf4a876f6ed7fa2daabdff00f763d4f492c8ff00159f526f7178c17524993e9db681fe63ac731bfd8494f82d34db7daca6963adb6c706575b01739ce71dac6318df73def72fa4beab7483d17eaf6074c740b31e902e8323d577e972369d3dbebd962add17ea47d58e8578c9e9b84d6648040bdee75af120b5de9bae73fd1dcc76c77a5b16f24a7ffd0f554924925293729d2494f37f583fc5ffd59ebef75d958c68cb7fd2cac622bb0eb27d4f6be9b9dfcbbaab1eb957ff88fc23712ceab6b699fa0ea5a5d1ff182c637ff00025e9c924a78ae93fe297ea974fb05b7b2dea0f1040c978d81c3fe0686d2d7ff0052ff0059741d63eabf43eb1d3dbd3b37158ec7a8463867e8cd3036b7ecceaf6fa5b7f73f9afdf62d549253e6197fe23f09f69387d5ada6aecdba96daeffb72bb315bff0081a9e1ff00890e98c7139dd4efbc761456ca4fdf61cb5e98924a71ba0fd52e81d0013d3311b55cf1b6cc871365ae1eddcd3759b9ed63b635de957b2afe42d9492494a517b18f6963c0735c08734ea083c8735492494e0e5fd43fa9f9866ee938ed3ff04df47ff6d8d4acf4bfaaff0057ba43fd4e9bd3e9c7b40205cd6cd907e937d77eeb7fe9ad549252dc27492494a49249253fffd9ffed237250686f746f73686f7020332e30003842494d040400000000000f1c015a00031b25471c020000020000003842494d0425000000000010cdcffa7da8c7be09057076aeaf05c34e3842494d043a0000000000e5000000100000000100000000000b7072696e744f7574707574000000050000000050737453626f6f6c0100000000496e7465656e756d00000000496e746500000000436c726d0000000f7072696e745369787465656e426974626f6f6c000000000b7072696e7465724e616d65544558540000000100000000000f7072696e7450726f6f6653657475704f626a630000000c00500072006f006f006600200053006500740075007000000000000a70726f6f6653657475700000000100000000426c746e656e756d0000000c6275696c74696e50726f6f660000000970726f6f66434d594b003842494d043b00000000022d00000010000000010000000000127072696e744f75747075744f7074696f6e7300000017000000004370746e626f6f6c0000000000436c6272626f6f6c00000000005267734d626f6f6c000000000043726e43626f6f6c0000000000436e7443626f6f6c00000000004c626c73626f6f6c00000000004e677476626f6f6c0000000000456d6c44626f6f6c0000000000496e7472626f6f6c000000000042636b674f626a630000000100000000000052474243000000030000000052642020646f7562406fe000000000000000000047726e20646f7562406fe0000000000000000000426c2020646f7562406fe000000000000000000042726454556e744623526c74000000000000000000000000426c6420556e744623526c7400000000000000000000000052736c74556e74462350786c40520000000000000000000a766563746f7244617461626f6f6c010000000050675073656e756d00000000506750730000000050675043000000004c656674556e744623526c74000000000000000000000000546f7020556e744623526c7400000000000000000000000053636c20556e74462350726340590000000000000000001063726f705768656e5072696e74696e67626f6f6c000000000e63726f7052656374426f74746f6d6c6f6e67000000000000000c63726f70526563744c6566746c6f6e67000000000000000d63726f705265637452696768746c6f6e67000000000000000b63726f7052656374546f706c6f6e6700000000003842494d03ed000000000010004800000001000100480000000100013842494d042600000000000e000000000000000000003f8000003842494d040d0000000000040000001e3842494d04190000000000040000001e3842494d03f3000000000009000000000000000001003842494d271000000000000a000100000000000000013842494d03f5000000000048002f66660001006c66660006000000000001002f6666000100a1999a0006000000000001003200000001005a00000006000000000001003500000001002d000000060000000000013842494d03f80000000000700000ffffffffffffffffffffffffffffffffffffffffffff03e800000000ffffffffffffffffffffffffffffffffffffffffffff03e800000000ffffffffffffffffffffffffffffffffffffffffffff03e800000000ffffffffffffffffffffffffffffffffffffffffffff03e800003842494d0408000000000010000000010000024000000240000000003842494d041e000000000004000000003842494d041a000000000341000000060000000000000000000003e8000003e80000000600700061006e0064006100360000000100000000000000000000000000000000000000010000000000000000000003e8000003e800000000000000000000000000000000010000000000000000000000000000000000000010000000010000000000006e756c6c0000000200000006626f756e64734f626a6300000001000000000000526374310000000400000000546f70206c6f6e6700000000000000004c6566746c6f6e67000000000000000042746f6d6c6f6e67000003e800000000526768746c6f6e67000003e800000006736c69636573566c4c73000000014f626a6300000001000000000005736c6963650000001200000007736c69636549446c6f6e67000000000000000767726f757049446c6f6e6700000000000000066f726967696e656e756d0000000c45536c6963654f726967696e0000000d6175746f47656e6572617465640000000054797065656e756d0000000a45536c6963655479706500000000496d672000000006626f756e64734f626a6300000001000000000000526374310000000400000000546f70206c6f6e6700000000000000004c6566746c6f6e67000000000000000042746f6d6c6f6e67000003e800000000526768746c6f6e67000003e80000000375726c54455854000000010000000000006e756c6c54455854000000010000000000004d7367655445585400000001000000000006616c74546167544558540000000100000000000e63656c6c54657874497348544d4c626f6f6c010000000863656c6c546578745445585400000001000000000009686f727a416c69676e656e756d0000000f45536c696365486f727a416c69676e0000000764656661756c740000000976657274416c69676e656e756d0000000f45536c69636556657274416c69676e0000000764656661756c740000000b6267436f6c6f7254797065656e756d0000001145536c6963654247436f6c6f7254797065000000004e6f6e6500000009746f704f75747365746c6f6e67000000000000000a6c6566744f75747365746c6f6e67000000000000000c626f74746f6d4f75747365746c6f6e67000000000000000b72696768744f75747365746c6f6e6700000000003842494d042800000000000c000000023ff00000000000003842494d041100000000000101003842494d0414000000000004000000013842494d040c000000001a7100000001000000a0000000a0000001e000012c0000001a5500180001ffd8ffed000c41646f62655f434d0002ffee000e41646f626500648000000001ffdb0084000c08080809080c09090c110b0a0b11150f0c0c0f1518131315131318110c0c0c0c0c0c110c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c010d0b0b0d0e0d100e0e10140e0e0e14140e0e0e0e14110c0c0c0c0c11110c0c0c0c0c0c110c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0cffc000110800a000a003012200021101031101ffdd0004000affc4013f0000010501010101010100000000000000030001020405060708090a0b0100010501010101010100000000000000010002030405060708090a0b1000010401030204020507060805030c33010002110304211231054151611322718132061491a1b14223241552c16233347282d14307259253f0e1f163733516a2b283264493546445c2a3743617d255e265f2b384c3d375e3f3462794a485b495c4d4e4f4a5b5c5d5e5f55666768696a6b6c6d6e6f637475767778797a7b7c7d7e7f711000202010204040304050607070605350100021103213112044151617122130532819114a1b14223c152d1f0332462e1728292435315637334f1250616a2b283072635c2d2449354a317644555367465e2f2b384c3d375e3f34694a485b495c4d4e4f4a5b5c5d5e5f55666768696a6b6c6d6e6f62737475767778797a7b7c7ffda000c03010002110311003f00f554924925292492494a4924925292492494a4924925292492494a4924925292492494a4924925292492494fffd0f554924925292492494a4924925292492494a4924925292492494a492492529312072839b9d89818d665e6dccc7c7a46eb2db086b409da3dc7f79dec62f26fae1fe36f2b2bd4c0faba5d8d8fee63b3dc22d78fa138cdff00b4acfa7fa577eb5fcdff0045b1253de7d6afaf9d0fead31d5e43fed19f135e154417cc6e67aeefa38d5bb733dd67bf67f3555ab63a4755c3eb1d371fa9613b763e5337d73a11f9afade0177e92a78f4ecfe5af98df63ec797bdc5ce712e73899249325ce77e72f54ff001216751737a9d7ea0fd9cc35bbd320eef5df237d6676edf46afd3ffd61253ea8924924a7ffd1f554924925292492494a4924925292492494a49243bafa68acdb7d8daab1cbde4340fed3a12530cdcec3c0c776566df5e363b3e95b6b831a27e88dcefde5cd1ff1a7f5183f61ea263bb851796ffe79dcbc8bebafd6bcafacbd62dc8f51df60a9c598341d1acac1fe7367fa7bff009cb5df4ffc16ff004ea62e79253f4ff4eea9d3faa630cbe9f915e550ed3d4a9c1c0180ed8ffdcb1ad77bab7fbd65fd6afae5d23eace31765bfd5cb7b7763e1567f4966bb5ae3fe868ddf4afb3feb7ead9fa35e11f57feb2f56fabd96ecae9b6fa6f7b0b2c6386e63810763acafe8bdf4b9dea55fcbfe42ee7ea97f8bacff00ac577fce1fad56d8eab24b6d652e77e9af69036d975a0eea31bd3db5d55b3f4be9ff00dc7afd2f5129c7b8fd75ff001939e5d556460d4f86b64b3128881ee7bbf9ec8db66fb3f9ec9fd27e8ebf47d8ba5e9dfe24718301ea7d4ec7bc81b998f586007f3836dbbd5759fd6f46b5e978d8b8f894331f16a65145636d7556d0d63478318d86b515253e41f58ffc4de56263bf27a1e4bb33d31b8e25ad0db4b47d2f46daff00476d9ff03e9d4abff89febade9fd6b23a364fb1bd440f48bb48be9dffa3d7e8fad53acff00aed7556bd9d7907f8d5fab76f48eab47d69e963d16df6b4deeac01e9e534fa956488ff00b93b37bff47fd22bdf67bf21253ebe92ccfab7d66aebbd130faad636fda6b9b18261b634fa7915fbbfd1dcc7b569a4a7ffd2f554924925292492494a49249252cb1baa7d65ab1724f4de9f8efea9d5e013854103d305a6c6599d9367e8306a7ffc2fe99fea57e953620758ea59b9bd47fe6f745b05592d6b6cea59c0077d92a7ff0034c683edfb7e57fda7adff00cdd7fac2d3e93d1f07a4620c5c261634b8d96bdc4bacb6c77f3b91936bbdf75f67e758ff00fa8494e50e89f58ba912eeb3d59f8951208c2e9334b46d7388f53a8dad7675dea57b7d5f4bec68d47d48faa94d8fb3f66539165a65f66507653c9f1f5335d90f5ba924a737fe6d7d5c0ddbfb2b0b6f87d9ea8ffa85e71fe316efab755ecfab9d0ba362dbd5ee21b659452d6baa2efa14d5f670cf5329f3f9deca7ff3d755fe313eb98fab5d345588f6fed5cc918c08dde9b069665bd9f47d9f4686d9fce5dfe96ba6e54ffc5a7d4f1d3f11bf583a9075dd5fa834dad7da773aaaecf7fd23b9ff0069ca6bbd5c8b5ffa4ff01ecfd37aa94e1e0ff89536f4863b3b39d8dd55e77398c636da58d23f9877d0b2dbbfd25ecbbd2ff475d9fced9d674dead99f56ba7e2f4dfac38669c5c3a6ac76756c626fc622b6b6b6bf2dbb199583fe0d9bada7ecfea7f865d5a62252530a2fa722965f458db69b40757631c1cd734ead7b1edf6b9ae445c8759faa7d4f08bb37ea765bfa6593bade9ac2dfb35bfbeea31f21b662e2e5bd9ecfe6feceff00d1ff0033fa4b5374afadbd5fec832b330fedf82d79aaecac1639b918f630d75d94755e896bacc8a2ea7758fc9fb1dd95ecf7d757a4f624a7b059ff00583a4d5d6ba2e674bb6232aa731ae74c35ff004a8b74ff0043736bb51f03a8e1752c4af3306f664e3da2596d665a7cbf92f6fe7d6ff7b1582929f2ff00f12bd59db3a8f43b8c3aa70caa587e96bfa0cbfeaec7b71fdbff0008bd4578e7d4bb4e2ff8d8ea18f48db55b7e7d240e3635f65cd1fe750c5ec6929fffd3f554924925292492494a597f58fac1e91d31f915345b996b9b8f838e481eae4dc7d2c5a7dcfabdbea7e92ef7ff00315dab2beb6ff8c2e8bf564fd9ec9cbea0448c4a8896c8dcc7645a7db435dff5cbbfe0563fd51facb93f5e7aeb72eec518983d118eb594b6c2fdd93913463d96ee656d7fa38ccccf4fd9ec7d8929ebfa07466748e9cdc62ff5f26c73afccc920075d9169df9190eda1bf49fedaff00729f4eb5a49249294ab750ea187d370edceceb5b462d0ddf6daee00e3face7bddecaeb67becb3f475aa3f58beb4747fab98832ba95db37cfa3433dd6d847d26d354b7fedc77e899fe12c5e1df5b7ebb756fad178fb41146156e2ea30ab24b1a7e8fa963bdbebdfb3dbeabbf97e95757a8929967f571f5b3ebad1959e4b3132f2a9a1b5b8ff00378c6c6d6d67d276cfd19f52dd9ecf5ecb6c5f42af95c48d57b3e37f8c57e47f8becaeaf543bac6032ba321840205b639b8f5669686edf4acddebecd9e9faccfb3a4a7d0925f2ff50ea7d43a9e41c9ea1916655c49f7dae2e227f35b3ed633f90c57ba2fd6dfac3d12c69e9f9d6d7533fed3b897d24692d763d9baaedf4dbfa4494fd23cae6fafd0fe8b9fff003ab0db35b5adafade3b019b719bed666fb1afdf95d3377a9effe730bd5a7d5ad43ea3fd78c4fad3865ae0da3a9e3b47dab184c11f47ed38dbbdcfc77bbfeb98d67e8adff000575dd358c658c731ed0f63810e6912083a39ae69494f3dd43a1dccb5dd77eab59563f50b9bbeeab9c5cd69fd233ed2d610d6e46e3be8cfa7f4bfa4f4edf52ab143a5fd7ce9197d3b3327283b072fa5b1ceea181711ead659a3857bb67da1aeb3f435bbfd27a7fcdfa8a7f54eefb074ccde9998ff4ebe83916e30b6e78918ad6b7330aeb9e76b6baebc1bebaff00eb2bc9febff5ac0fac9d6edcbe8988e35635519598c6bb75cc6b98d6e4e456dfe6e8a9de9d555b6fe97f9bf57fc0575a53d07f8a1c0c9ea3d7fa97d64c968801cc0e8201bf21debda6b3f47f45537f48dffbb15af5b5ccff008ba1d27fe69609e9422b2d26fdd1bfed13fad7adb7f3fd4fa1bbfed3fa3fe0d74c929fffd4f5549249252953eb1d4074ce9599d44b778c3a2cbf64c6e35b5d6064ff002f6ed57167f5fe9eeea7d133fa7b2059978f6d35976803dec736a73bfeb9b5253f35e66664e7655b979761b72321e6cb6c3cb9ce3b9ced3dabd97fc4ce1fa1f562fca73007e5653c87f77575b6ba983fb16faebc5edaada6d755731d5db5b8b5f5bc16b9ae69daf63d8ef735cd72edbeab74afae5f5aba4d3d1716e383f57f18b85d741632c2f7bedb376ddb667dcddffcceff00b357e955eafa4f494f7ff58bfc697d5be8dba9c779ea798dff00058e47a6d3a1db765fbaaffb67ed0f67e7b1703d53fc70fd6acb2e6e10a7a75732d35b05b647eebecc9f52b77f599454bd1fa07f8b8faafd198d77d95b9b942376465816191eefd1d447a14ed77d0f4ebf57fe1574b663d36d271ec635f4b86d35b9a0b4b7f77611b76a4a7e60cdcfcdcfc876566df664deff00a56dae2f718fa2373bf75775fe2b7ea460f5c17757ea8d176262d9e8d38d261f686b6d7baf8f77a5536cabf47fe1bfc27e8ff9cd0ff18ffe2e31f171edeb9d0aa35d3592fccc3ac4b5ad3abf2319bfe0ebaffc353fcd555fe919e9d752c7ff00169d4fa9db7ddf55f172bec5575370b5d90d316d6dadaefb5b703da5adcbcba432bf5ffed3574faf5fe91253d5fd6afabff55fac9b3a3fd5fe92cb7ab5121f91822bc6a315d2d67f94b21adf42d77d277d8ebaefcbfd0ddfd1ff009c5e75d7beabfd63faad63ebcd63998f90df48e4d04bb1ed6922cf48d90dfcfabd4f46f632cfd0fadb3e83d7d05d3ba760f4cc3ab070296e3e352ddb5d4c1a0f327e93deeff0963ff4967f8453ca6e2bf1ec6e5ec38ee69168b60d65a7e90b3d4f66dfeb24a7e5b497b9758ff14ff557aa4df81bfa75b602e6bb1c87524bbdc1ff0067b373767ee331aca18b92ccff00127d7abb0fd8b3b1722aeceb7d4a5e7feb6c664b3ff05494e6ff008a4a33acfae38f6e3871a29aed398e6e8d15bab7b2b6d9fd6c9f476b3ff20bd3baff00f8c8faafd158e67da466e589031b148b083ab7f4b703e853b5c3f49bacf57fe0979eb7fc5a7d60c3bb13a4f53ea75e1e0754b5cd69a5d65957da18ddf4d77d0ffb257eb5f536dfb33bdffcdfa4bb8e85fe2abeabf4bdb6e4d6eea7903f3b260d60c6d3b315bfa2daeffbb1f68494f0d898ff00593fc62759ea2682de99d3b21f45d9cc2e25a1a1be8e19d9ecb332df46873d9fcd636faffc0fe8d7a6f47fa95d0fa4746c8e918d59356756eaf32f719b6d0f6baa3ea59fc963dde956cfd1d7fdbb1607d50eb95667f8c2facd8b5362b78acb3c07d8b6f4e7ec8fccb1d66e5dea4a7c8bfc51758bba775bccfab396768bcbdd5335d3228f6dec6003fc2e3b1ce7b9dff7158bd797cedd53a95bd2bebee7752a357e2754bed0d0637065ef73ab247e658cfd1b97d0d5595db5b6dadc1f5bc0731c382d23735c1253ffd5f55492517d8cad8e7bdc18c602e739c600035739c4a4a5d703f5e7fc6762f47f5ba674773723aa36596da7dd563bbf3f77fa7c967d1f4bf9baadfe7ff9bfb3ac2faf7fe342eca7bba57d5ab5cca3e8df9cc90fb1c74f4b0ff3eba7feec7f3b73ff0099fd17f48d9ff17ffe2d69e96ca7abf5aac59d474b31f1dc25b8e7e931ee1f9f96dffd97ff0007fa4fd224a799e99fe2bbeb1fd60c7c8eadd5727ec79979df4d792d2eb2d73bdceb32b690ec467ee7b2cb7fe06bf67a9deff8b6a3230ba05bd23280f5fa4e65f8961699693232b7d53b5de9bdb93b99ed5d5ae7fa797e17d72ea786f738d5d4f1e9ea140db0c0fa80e9d9ad0efdfdacc1b3fb6929e85667d64eb55742e8997d56d6ef18ac96b3f79ee22aa2befb5b65cf635cff00cc5a6b88ff001be2d3f53ddb3e88c9a4dbfd5f77fe8cf4d253e4d99f5cfeb465f503d41fd4b2197eedcd6d763995b3fe0eaa5aef4d95ff0023f3ff00c2a0fd59ea4ee9bf58ba767efd8da726b7585ba7e8cbb65edfedd2eb18b2d2494fd31f583ad63741e8f93d572417578cd915b797b9c4575543477f396bd8ddff0098be7efac5f5a3ac7d62cafb4751bcbda093563b74a6b07f369abff463ff004aff00f0962fa0fa974ac1ebdd21d83d4185f8f92c6970692d70236db5bd8e6fd1731eddcb88ccff00127d15edfd47a86550ff001b857737fcd63715dff4d253adfe29ebb5bf52b15cf71736cb2f75609d1adf51ccdadfdd6fa8cb1ebb159df57fa2e3742e918dd2715ce7d38cd203dff49c5ce75b63cff5ecb1eb45253cff00d7b63ffe6b66e452433230857994584025b66358cc9639b3ff0017b14feb9fd6267d5dfabf93d427f5823d1c3691337bc1f4b43f9b543af7ff00c1d481f5f6c63fa13ba69b7d17753b6bc6f57486553f69cec8b7710d6538f81464db6d8bc8bfc60fd6f77d67eafba931d371375784d820b813fa4c97eef76fbf6b7fa957a7fe13d4494eaff899b23eb65f3a97e15a24ff00c663bffefabd9f2b269c4c6b72af76ca6863adb5e780c602f7bbfb2d6af13ff139ff008ae77fe14b7feaaa5db7f8dbfac6de9bd03f65d2f8cbea84d640305b4360e43b4ff4becc7f77d365977fa3494f8ae5645995956e55bad990f75af23f79e4bddff54be87fa8999f6dfa9fd26efddc66d27e34ce29ff00cf2be735efff00e2b4ff00d8274df2f5ff00f6e2f494ff00ffd6f51befa71e97df7bdb555534becb1e435ad6b46e73def77b5ad6af12ff00181fe312febd6bfa6f4c7ba9e8ec30e7416bf248ff000968fa4cc6ff00418fff005ec8fd27a7563f5bfe3870bafddd26bbf0edddd269d73b158087ee9fd16458ff00f0d8ecff0045fe06dfd3fe9bfed378cc1494fa07f89ffabb5751eb37756c9687d3d2c34d2c70906fb377a767b86dfd598c759fbecbbecf6af6a5e61fe24ba8e39c3ea3d30903219637240246e731cd14bb68fa5b697d6cdfff001ebd3d252973ff005ba9b71e8c5fac18acf5327a258721ec1ab9f8af6fa5d4e866e7d6cddf66fd659ff0b8b5ae8131e34e52530c7c8a7268af22878b29b98db2ab1bc398e1bd8f6ff59a550facbd1abebbd0b33a53cecfb5570c79986d8d22da1ee8fcc65ecadcf5938961faa99e3a75e40e8199613d3ef70da316eb1c5f674db9c3d9f65b5cef53a7dbfe0ffa2d9fe0d751a24a7e5eea18197d3b32ec2cda8d193438b2da9dc823fe8b9aefa4c7b3d96310e8a2dc8bebc7a5bbedb5cdaeb60e4b9c7631a3fb457d11f5a3a1fd54ccc57f50fac38d53eac466e7e4bb735ed6365db3d5a0b2f7b773ff004747fa4fa15af34faa5d0eefadbf5872bac6233f63e074e20f4e34d6d2caee61dd8357a4fdd5dfe9ff004bcfff004967fa2fb46f494fb354c15d6dac6a180347c8429ae6e8fadcdc12cc3fad14fec9cc2430649938373bdffa4c5cef73296bdb5fabe866fa17d5ea6cfd22d56f5fe84fafd56751c4757cef17d65b1fd6dfb52537d0b27228c5a2cc8c8b1b553534becb1e406b5a04b9ef71fcd5cd759ff197f54ba5566331b9f744b69c322d99ff008669fb3336ff002ae5e4df5bbebf757faceff4ac8c5e9edd59855b896920eef5322cf6bb22cffc099fe0ea494cfebefd73bbeb1f572fc673abe9f8cd7538acd41731c41baeb7f9592e633d9fe8ababf96b954b949253d8ff008afea983d23ace7753cf7ecc7c5c0b1c63e939c6dc7632aac69badb376dad61fd66fac197f58bac5dd4f2bd86c3b69a771736aa9bfcd50c718fa3f49fed67a96fa96fe7aca4925297bff00f8adff00c4274cff00afff00edc5ebc017bfff008adffc4274cffaff00fedc6424a7ffd7f52b2baed63abb1a1ec782d7b1c25a5a74735cd3f49ae5cadffe2b3ea45b43e96601a1ce0436eaeeb77b491f4d9ead96b3dbff0008c7d6bad49253e13d5fa0fd61ff00173d6b1fa9e1d82dc6dc4519704d76023df879954fb1cfaff337fe93f9dc6b3d5a7f43eb7f553eb5f4efacfd3865e21f4eeae1b9588e32fa5e7f35df47d4a6c8fd05fb7f4bfc8b996d55ea66e16267e2d98799532fc7b86db2ab06e691cffd177b9abcabaefd44fac1f54fa83bae7d50b6db31dbf4a967befadae237d4faa1cdcec4de1aefa3eab3fc2b3f43f69494fae24bce3eafff008e4e9590c6d5d7a9760ddf9d914875b41d39f4c6fc9a7fe2f6e47fc6aeba8fae3f55722a6db5f57c3dae1203ef631c07f2abb5ccb19fdb624a74f2b171f2e87e3e4d6dba9b5a5b654f1b9ae07f35cd2bca8ff8c1cdfa9dd7f33a15b51cee8f8769af1ab7b8faf4d461f5d75643f7faf552c7edaaac9f7ecf4abfb4aec3acff008ccfaa5d2984372c67dfa6da70e2d99ff87046337f95fa6f53fe0d78b7d66ea77f5bead7f5c7e29c5af3dd35b04b99fa36b297065ce6b3d57376b7d5fe5a4a7aafad1f5d5df5dba8e3f46c5bdbd27a2970759765b9ac2e701bdd6e56c7399b2afa18d8ccb3f4b77e96db3f9bfb3fa2744ea9f51ba0f4ba7a760f56c16d148e4e4d4e7bdc75b2eb61feeb6c77f27f915fe8d7cf72424929f79ea5fe34bea562b1c1b94fce77d17538f539d20f3efbfd1c6737febab05ce6754b2bb4fd5daba1f4fbdb5e4539f4f4c6752badade7d5dfea63d3663e0efa7fd363e5dbfa45e558789959b955626256ebb22f7065553752e71ecbe96e85d3dfd33a360f4eb1c1f66263d54bded982e631ac7b9bbbf3770494f8d7d7f77d5aaf0b071ba0fa96d9ea58fcfc9c9aae6e458fdb5b2975b91974d3bbfc37e829fd0d7fe85710be92fad5f56f13eb2f47b3a6e4b8d649165173449aed6c8aedd87f9c6fb9ccb2bfcfa9effe6dff00a45e09f583eaa75cfabd79afa9e33995eedb5e4b01753673b7d2be36fbb6eff4acf4effdfa925390925054aaaacb6d655535cfb2c706b18d05ce7389dad63183e939ce494cfec993f65fb67a4ffb36ff0048df0760b23d4f48d9f47d4d9efd884bdf7ea2fd4f6749faabfb37ab535df6e6bce46663d8d6d8c04ecf4a876f6ed7fa2daabdff00f763d4f492c8ff00159f526f7178c17524993e9db681fe63ac731bfd8494f82d34db7daca6963adb6c706575b01739ce71dac6318df73def72fa4beab7483d17eaf6074c740b31e902e8323d577e972369d3dbebd962add17ea47d58e8578c9e9b84d6648040bdee75af120b5de9bae73fd1dcc76c77a5b16f24a7ffd0f554924925293729d2494f37f583fc5ffd59ebef75d958c68cb7fd2cac622bb0eb27d4f6be9b9dfcbbaab1eb957ff88fc23712ceab6b699fa0ea5a5d1ff182c637ff00025e9c924a78ae93fe297ea974fb05b7b2dea0f1040c978d81c3fe0686d2d7ff0052ff0059741d63eabf43eb1d3dbd3b37158ec7a8463867e8cd3036b7ecceaf6fa5b7f73f9afdf62d549253e6197fe23f09f69387d5ada6aecdba96daeffb72bb315bff0081a9e1ff00890e98c7139dd4efbc761456ca4fdf61cb5e98924a71ba0fd52e81d0013d3311b55cf1b6cc871365ae1eddcd3759b9ed63b635de957b2afe42d9492494a517b18f6963c0735c08734ea083c8735492494e0e5fd43fa9f9866ee938ed3ff04df47ff6d8d4acf4bfaaff0057ba43fd4e9bd3e9c7b40205cd6cd907e937d77eeb7fe9ad549252dc27492494a49249253fffd9003842494d042100000000005d00000001010000000f00410064006f00620065002000500068006f0074006f00730068006f00700000001700410064006f00620065002000500068006f0074006f00730068006f00700020004300430020003200300031003900000001003842494d04060000000000070008010100010100ffe10dc3687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f003c3f787061636b657420626567696e3d22efbbbf222069643d2257354d304d7043656869487a7265537a4e54637a6b633964223f3e203c783a786d706d65746120786d6c6e733a783d2261646f62653a6e733a6d6574612f2220783a786d70746b3d2241646f626520584d5020436f726520352e362d633134352037392e3136333439392c20323031382f30382f31332d31363a34303a32322020202020202020223e203c7264663a52444620786d6c6e733a7264663d22687474703a2f2f7777772e77332e6f72672f313939392f30322f32322d7264662d73796e7461782d6e7323223e203c7264663a4465736372697074696f6e207264663a61626f75743d222220786d6c6e733a786d704d4d3d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f6d6d2f2220786d6c6e733a73744576743d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f73547970652f5265736f757263654576656e74232220786d6c6e733a64633d22687474703a2f2f7075726c2e6f72672f64632f656c656d656e74732f312e312f2220786d6c6e733a70686f746f73686f703d22687474703a2f2f6e732e61646f62652e636f6d2f70686f746f73686f702f312e302f2220786d6c6e733a786d703d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f2220786d704d4d3a446f63756d656e7449443d2261646f62653a646f6369643a70686f746f73686f703a36353365656330632d366461642d633534352d623439362d6532393338333465376631632220786d704d4d3a496e7374616e636549443d22786d702e6969643a33643166333733642d393961342d613334302d386266352d3033343262626130363264342220786d704d4d3a4f726967696e616c446f63756d656e7449443d223445454234374543454637433137354143353837354235303341413732363339222064633a666f726d61743d22696d6167652f6a706567222070686f746f73686f703a436f6c6f724d6f64653d2233222070686f746f73686f703a49434350726f66696c653d222220786d703a437265617465446174653d22323031392d31312d31315431353a30373a30392b30373a30302220786d703a4d6f64696679446174653d22323032302d30342d31365431383a31343a34332b30373a30302220786d703a4d65746164617461446174653d22323032302d30342d31365431383a31343a34332b30373a3030223e203c786d704d4d3a486973746f72793e203c7264663a5365713e203c7264663a6c692073744576743a616374696f6e3d227361766564222073744576743a696e7374616e636549443d22786d702e6969643a36623333646532612d363865392d326534622d623439372d383138393865326166623032222073744576743a7768656e3d22323032302d30342d31365431383a31343a32362b30373a3030222073744576743a736f6674776172654167656e743d2241646f62652050686f746f73686f702043432032303139202857696e646f777329222073744576743a6368616e6765643d222f222f3e203c7264663a6c692073744576743a616374696f6e3d227361766564222073744576743a696e7374616e636549443d22786d702e6969643a33643166333733642d393961342d613334302d386266352d303334326262613036326434222073744576743a7768656e3d22323032302d30342d31365431383a31343a34332b30373a3030222073744576743a736f6674776172654167656e743d2241646f62652050686f746f73686f702043432032303139202857696e646f777329222073744576743a6368616e6765643d222f222f3e203c2f7264663a5365713e203c2f786d704d4d3a486973746f72793e203c2f7264663a4465736372697074696f6e3e203c2f7264663a5244463e203c2f783a786d706d6574613e2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c3f787061636b657420656e643d2277223f3effee002141646f62650064400000000103001003020306000000000000000000000000ffdb008400010101010101010101010101010101010101010101010101010101010101010101010101010101010101010202020202020202020202030303030303030303030101010101010101010101020201020203030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303ffc200110803e803e803011100021101031101ffc400db000100000603010100000000000000000000020304050a0b010609080701010000000000000000000000000000000010000005040103020601040102040505000102030405060708090a00111231131020302132144050602215334223d041241790a0431618281929391a110001030205020305030904080304001701020304110500211206073141511308617181221491b132102030f0a1c142231540d1520950e1f16272332416608243b2c253342517921873b3262790a0a263a3c3546435656696a628191201000000000000000000000000000000d0ffda000c03010102110311000000cfe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000383900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000965114e50124fc4cee47703b2171230000000000000000000000000000000000000000000000000000000000000000000000000000000000000090519642a0c50cd7ca646e6c7e3b117a2ac00000000000000000000000000000000000000000000000000000000000000000000000000000000002021298a62683cc235bb9e07119526cfb32a52bcaa39220000000000000000000000000000000000000000000000000000000000000000000000000000000002494c539d00b3182898431f9914842551f471b938fb24ee256130000000000000000000000000000000000000000000000000000000000000000000000000000000000905a8b41e021ad3cf884b596829488af2a8c884db125fcaa230000000000000000000000000000000000000000000000000000000000000000000000000000002125962280a93f1535dc18811424b24924e0e4e4a82b4d8e8667e5fcad00000000000000000000000000000000000000000000000000000000000000000000000000000025920e965498e59ade4f8a4b014c528000222b0fdd8dde87ed05e000000000000000000000000000000000000000000000000000000000000000000000000000012c984249251f821ae30c4a0bc94e75329c8000013c9865fa6cbd3b39580000000000000000000000000000000000000000000000000000000000000000000000000000b616d294b898f69ad3cf894e9a51800000130bc96f370e1ee513400000000000000000000000000000000000000000000000000000000000000000000000000002de7553f3f35f418689096029ca0380000002e8726f1f3ebc2a000000000000000000000000000000000000000000000000000000000000000000000000002496e2de724f3ca935829e4683825134a323212023222029c84e4af2b4de387d5c46570000000000000000000000000000000000000000000000000000000000000000000000001c14a5b0b7944620c6ba53f3d2cc52134ad2a4e0ae2c05dcbc96b284b614e4e2bce0dade64a05d0b81c800000000000000000000000000000000000000000000000000000000000e0e48088e4109c118383900038298a13f00359198d41527572988498559f479ebf1f709f541f8b9f021e191f88119444c2bc9e64fc6d4a222e6720000000000000000000000000000000000000000000000000000000000a421280b39545f4a139392909c55111720096519d7488f14cd60a7c020a026924faa8cbb0ca14f668ece4e39241c1f901895181a1f2994275f290bb1b98cf524bf1567272000000000000000000000000000000000000000000000000000000002da59084f284f130f89ca23ead3d7f3d983bf920bc171009452164307830153ac946404a3ede339732e83f542c85d0ec05511120905a0e9c7ce26afd3c182c24c2acca7cda3e5c0ab392200000000000000000000000000000000000000000000000000000e080a705a4eb861b2612479dc444f2de444b3e953316338b3e9c2a49c42519f351ac60c71080a8383f443381339c3f5d232223202a49c09649203ac83a19aa54c7e8849a5e0dcbc7aa0559309c00000000000000000000000000000000000000000000000000001094c519d68f39cd5d679107259400088ad2e07d626cdf3216202acf158d5d879fa5597d3ae1ed81b3ccf490b8958000000002d6427cac69dc3e0925920caa4da0e5f0b813c00000000000000000000000000000000000000000000000000002029cb41e3d1a9b8f9f4b416c2d6000445617a3b59566cd6328b309f35fa1622d4444d33c933a82f65e0ec454800000000a62de4a3c22351c9d68e4eea6e563d2e3b4918000000000000000000000000000000000000000000000000000059ca73e7634d01f1a9d74e084e00001c938e4ba1fb39ede18fa9602a8b91f641b3fcf7bc1524d2200000000004272580d62e626c5416a32bf36839c95a549c80000000000000000000000000000000000000000000000000016c20358f989a16b2c648000000261349a76229c984449320c366a1f69134aa2b8e400000000000705a8f934d2f47cde5417c375c9f7713caa3900000000000000000000000000000000000000000000004240404b2a088a7290f34cd3305a0eb65394a0e0840001c934889e4c2f44f33a733d23b2130ba938a80000000000002596b061306baa29cbb99ab9b134ba9389a720000000000000000000000000000000000000000000004a290b395c4d2b080906be8303b2a4e096444b29884e000002327134fde4d9fe64925ecad251380000000000000042531d44d366798e5a0fdd4dd947efe4d2e0720000000000000000000000000000000000000000000004a203a21e781e159e5f9e551f1f9e719f9f9505c89c75d2d44a26124800001c9c9703f70377a1fb21702b4964d000000000000001094c5018d31aa9c9249365699861752a0e4000000000000000000000000000000000000000028ca4259425f4fc10c6ecc604f080e967aa87aee7a707a887d7a7eba7e907622d47533f323f153e283cca3cdc3c803c8f3a3938ec65a0a104a37719f6b9772a89a0000000000000000e0b6109a6b0f258987ad86e432e0571c8000000000000000000000000000000000000000059cb594e78cc614263667a0c652464687aa077d269094a5cc8cae39053146492dc4a2e661d86b923a19d94aa2b8fce4ec4539b93cf500ed854934000000000000000028cb598901ac64e0ab374c1e9697539000000000000000000000000000000000000042425093ce480f000c05cf22ccc04cbc4f550e0ba130a52691911c158002494e5b0e09261f66b70294a13ec236a59e9698d898851e09191119c919021c9389c72088e400000000000014a5a8fc88d1d27532c067ba67d25d4110000000000000000000000000000000000001405116d079946ba63c58337a333f3e842e65cc000000000128ebc5618ab1ac2cb41487b1e6d4c3ed12e05c4b59e7b186a98709e9c99fa190f146427642b09800000000000008496726a8631a8259ec69b8c8a43b0826000000000000000000000000000000000000b1148594c264c09ccc20cf60fdbcaa2b0a82e60000000000a2280c724d554590927bea6d453f572f44f290b695e4b3e5f311c308b3d4b361a9eb71d88ab260000000000000382592cc304d6da5dcb19bc08fb28ac269c80000000000000000000000000000000014c492d6519f1a9ac38f904d9c47b7409872424f220000000016c29cb41e559a8f4f9e8af320036af1fa7156727042724c249424e3e74307a30a532c936129fb115c549c15a541c8000000001c124a63c9534ca90101b438cb0cba919c800000000000000000000000000000000124b114e78966ac7320c363d1faf1782e454800000000000eb24a3e2d35079f1e1653d9f36ce9fb297b2a49a00001d709a75f3e1635b19e7a19bb992b1f631545dcb91c93c00000000092529f869a2f0b0128cdb4d8e24e2680000000000000000000000000000000080e0a62ce639c6af733ce33552f05b4bc975278000000001092088e987e666a383c8b2a4f43cdc147eca5fcae2a88c0001c16805b4985718759aeacfcf4f590ca28cb7cfbb4a6222b092464d3900000124a22d4692b3e0d2b4f7b8dbd44c26800000000000000000000000000000000a42028cc6c8d59e6cc432b526979000000000000259662dc4b358a98a59733b81b844f58cae2ac00000000094483a31e609ab18f8a0f6f0f100c814ccf8c898801c17d2e80000024946569a5ccf27cac3d0937659584d0000000000000000000000000000000016d2d678446a70366899389da8ab2f60000000000005296e2418719ada0eca7503656197e9782e05700000000012890755241f891abacf9fcd89063f661d67d60676664f05d09c5e4000004a288a834c81e46934fd78debe7612613000000000000000000000000000000084a0280f3b0d4006794668a5715e4b2a800000000000482d0590f328d3a0746249ef81b7349c4f2b49a000000000704b392da4a2c86b433c4236db1f4c988198351f519b234f68c9c521772b00070705b8a834c89e4615877e37b81da8984c0000000000000000000000000000002596c3f2e34f31ef29b1e0b59dcc9a0000000000000a5298eba6a123c3e2129cdbfc7b967622200000000000000a02c0594d71663e86e093e893f3930c0303c32f133f93f522fa5f49a440967251952695a3cbe269f431bcf0ec0444600000000000000000000000000001c1c120906b613ca536db17b2a4ecc540000000000001014c4930f035a7969203d8137241505dc88000000000000028cb516f294d680798a6d9e3f63261f041ad3cf3b8d9fe7b8a55158560259289875d347d1f1d9567ae66e6926130880000000000000000000000000000294b59603c2635499b990f414bc80000000000000705014c7e7469373e3e269566c1433bb2691800000000000000005b4fcccd4727de06cd63f532de5a0c22cc084d88c66265a8ed44d2b484a63e7e34611622599741b3ec9c4d00000000000000000000000000000e0a53ab1d2cd33866a4667476d2e40000000000000024166308d35e71602988cdc327b825591800000000000000005bce947ca469c433ca335129cb79d58f100d58a64886c403e932ec5e0e4a431a83540934b69b4a4caf4a826800000000000000000000000000005bca438307d312137219d90ab2a80000000000008490492de7c5669b83e612d25415a6f193eb32a88c0000000000000000298b316631f735669b9b0fba89c4f28cf808d48c74a365d9915134a7279ad00c438e0eea6eee3e9b2b898720000000000000000000000000000b716f3f11349e9b37cc984ab2611000000000000120a63ae9f9e1aa24f0c8eae5a8aa2a8de447d645511800000000000000004248294b11ad5cf8e4dafe4d2f05196e3e2e35159f1699f919b91613e7a34a61f9e96932d5367b1195a4644000000000000000000000000000707562acc0dcf040db4a7632a498720000000000109114e5216e356618c01703af16f2f4509b760c81c9e4670084134000e0e4e0e41c1c909100010928a02d67ce26974368799059d98a52414c7c106a0a3e4b336a36181ae40c2ece4a137141eca9742b88ce4000000000000000000000000004b298b79d6cd2406ca232593b0134000000000000b51672acfc9cd61663024a25909c1782a8cde8d8605d4b8940531d38ec47c6a633278c47cd40fd68f5a4f6ecf73cee45a8e09a5fc88000109096d306131b036f19752790148519e1f1a924fcb8cb24c5f8e9c4e325636aa9017e2300000000000000000000000000004b294a4317835eb9ba74bb97123000000000001c1425a4f8b0d58a78e8753241288015c5ccfdccddc87ee05414c590fc18d7f461f24a28cb694e57144447d88652866f87da0561d9098000080e0b61f829a508da8464005492ca329cb598781ad9cbb146509fae1b934f46c965e8000000000000000000000000109014c75a2f65d484fcf0d4bc64d066ca4d2ec720000000004a2de7040493c3635601f25128a025901c02b4b914a6c0133bb2ac94501a98cc7fc905a814e725512492579c1fa419bd99e61dd49e5713813010101484c35b79f959b398848ca4290a33a09a630f81c84986c4c335b2b4bb13c8800000000000000000000000094521d34b298d398cb9e301f839f821bb20fb48af268000000001c148483a517730aa35eb9663af9444b0000561527ee26e5c3efe2dc62a46b06249602580000725697b393dd4369f1fbf97a2f609e72404a0529e299a948de0a7e9e541116a2ca6b4b3118298e0fd70dd867d305e8ac260000000000000000000000001c12c80c5f8d7b279aa705f0ae3d933702930af26800000000e01485a8fc18d6cc62f2509445a4a5259c8380725515055190a9b638be9ab48c5e8ebe492500000725615a4e3b51e871b79cfa54be9c13ce480940a22cc690e36809904938e0eae6b4631473a694c4c2b8cb38d9d25515a4c00000000000000000000000e0a72c6598d7aa61145b4904d2a488d87267225715a0e4000000a62d45202fa78506b203cf83a9901c934aa259732e25b0e0a429c9046762337036271a788f118a5259c000000e40233b19ede1b7609e7602e84401c16c2335739ea119dc909f821abacc7a0ac233d7f3cd03f3029cdc187b247652ac000000000000000000000038298ea86baa30ba288b59288cab06e483d862acad0720000005b4905a4fcccc0e8c2b4e865b4b3804e2ac1301c17d2c65194e467682fe6c073c9b312228480000000000bd9486c80333c2f856130005bca1308531ec36c19e571ab18f3f8eba519ec49b634c068c380ad323636b21712e8460000000000000000000000b59118ad1ab90a2294a52593cad3ebf37639fa21712a00249114c4f2120261c124f8e4c3e4c26cf93cbd144405b48c985712cf434cc4cf590e986378623675425924b9177383dfe31df290800000000072579507dde6ec32f85c0881c1289075d3c0735d019ac1aef8fc809052193c9b35cfd64f2ccd3544d2b8dc807ac05f89a4400000000000000000000202d074034a99f18166294e01505619161b6a89e4f0014c53124a32a0fc1cf0d8f044c7b0f260e0eba521280392b0b997232dd36411fa19742ce7078d46afb3e022c85a4904e261c124960000000004656130dd7c7a404d22040531602d663c26a962a8e0b5978360219a91dc4a82e469813cbb3b1995f1b338bf1504d000000000000000000001c16b3148357516e049008c8ccf20d8225715600298a23f34319a314331e33f322b8af20392d05112c0392b0a832b136681de09c5410911c98dc1aab8e985182ac905494a482100000000111524a371c9ed815072084927e0660d8611c74b39284f4c4d9987b42509792a4ab35c9184a1792ee6eb23ef52a09a000000000000000000012cb5963354c98e116c2989408c13cd9d065ee51930eb05f09a7c8e619861a87c944251909110930841c1c0072561fa39bb58fabc9c5aca72b0f3c4d78e63d265b87d8c60967522ca4651144400000000005d8ed0406eee3eab2027930fca4c2f4c204f9608cb997a334e33df3f692bc1090120c62cd53646559b000cf2415054800000000000000000020280b69a430f8b884a525822271c1b934f6548cb71623e66305731033f212594e5214a72704200000392acc8fcdaf67652de5b8a030c835fd996819dd9f65928f858d73c633c492de511000000000017a2e4649c6d5a2ce5e8f3f8c37cc470f94caf2d45597c36f81ec91722e45582038294f888d1fe4f223ed1375c9db8ece46000000000000000000084a63f0934681d0884a73804d2ea5a0de587d68483f0b305f30b33f1e261484d290fa20f578fd88fc64f270f9e8130e4944a2105599669b444ea27623f0a359c1e2e9b344c804ad29098482598ed1aff000f198e0964b2a89042096000724c2f47a666dac2acc6c8c504f0b48ca420279f66997298501bcd8ba1d80ac278382594c74f34781f33956426d5132662fa540000000000000000000251467cfa68cf3a914e002b4b8174379d9df8c2e0c1a0f954ec25b0ad3d7332ca323a3eec3f442514e74d3c50305231ec2acebe5a8a327911e959ba7c1f3d9a9c0fd6cda187d685e88c00588a52c463ae60d27868549662696a259200009c559fa799289e5a9e7b9f9713484bb124fb0ccdc4cca4f0a8d6da6ebc392f455000925113cd2a0799e724e32cf367d95e55800000000000000000025146584d1fc7c8252800ab2fe7d5c6c9f35f71e6e94a5bcede649e67287b0c5b0ee4594b8950700b015462566b6f3f372da5193c984c36e21eda9a920fafcd9f87ea65715472002d650111d50ab3c91311731673e4f251404a000269585797a261d749a40569eb9999f19521da0af30b935d69bac0f460a82a400492989469b23c6e279507eae6f0a3f782a80000000000000000001c128b69a864f0d0eac4900e4a92ee551c92ca63239360b1eb99504b2bc8c904f24911209a501623c3e35619f3b14075d222a0c96ceec7cc46d963f432b89a000094704d25110249d04f0d8c5f0c70cf3a4a22b0a6212e44b2ec4a382ec7a3264ca656e7af2559116b2b0d67a61cc6c9f33342a8a900124a52234f21e1b9c91911b51cca44aa2a0e4000000000000000000e0e9261366bc32cc538001c9dc4a63eb636369945134e4ba93c00000092584a63c44352b1d08b282a8ef07d846e263e982f057000000000120b5924b816b3e003c6d3c8e3c963cf63a91dd0f47cf888fd60d9a47df2482f64b2fa0a2259a4ecf3b4cc80d9704e2a40049298aa34ed9e1d901c17332d7367d82a8880000000000000000009475e3e66349d1f9416b2981182e242655e6c853e99284ac2b4a9268000001016d2c642623a6b3f28c925497d338a360d82e05600084924c25109520a620241c9405f0b71544b2793c848c945bcf3b8d34e6e1b3d3c2e8509792ac84a03cd934ae911efc1b75ce0a8390704a29caa34d61e3614e72559f709bba4b8156720000000000000000000a33a2183518121d54b402a4b81d88d93266025d8ad0000000000483a217d2e0509ad18c498eb250119e911ba70af2e254800925b4a13aa9db8f310f2b4fa34f734ee05c4ba00000002d6426b492de6cbe2b8ad25138a5288c208d75e4e3d053765950444e04042483934a59e64109c9762237491ea095672000000000000000000705b4ebc7e0c69723e5f2c209e5e8fa08de1276a2b0bb00000000012ca03f2531b43c623ec03d8935951f129642023374a1e8c97f2a80053944598f028d7f878c05b8af32e7365717c2ec00000070598e9e79b669dd377e9f4195c4927148594d346793a571de4deca771222703829ce0e9868c03f0b29c1545d4d9c865d8541c800000000000000005b096405b8f314d56479c04a2497223241c9bd54fd88b8138000000e0e4e0eb440793c6aa93cea392acb99f509f20930a92b0d8a266e6561540eba46561f879aeb0c3d4a424934b81fa09bd44ee85d80000001425b898697e33ff32892bc1464a3c4034f89752d05f8deda7ea24f220704929cf8f8d1d44828c13c88cd94d8da5695c440000000000000000b39c8316a35a31f8c9782c45fcec874b2da58cde107db05413c00000084889075a3ce7350f1f28167294840009c55993e1b568985683af1653f2a353c9e2d9612d4521115c7ee46f4d3b09500000000148446b463f6d36249349a50128d5f662a0580925ecde9a7efa54800925218d49aa08a22402b4967bac6e0505c8880000000000001c021298a53a09aff008c2a8a12a4b21fbf1b3e0f470c29cc788f32cdc007b905cc9c000000700b416b35129e249d7cb51012c0009a561f579bc3cbc95e0b49f931aae0c7eca52da598a7222b4fbf0ddba4656800000005210185798dd1b6608c9a519e621a6ccfcdca52717237869f5d95001094e426bff302a280a704f213ea537989525d000000000000002414c492c47cd66b3931bc27154407b086d273d052a81c1a79ccc68cbb4b89540000005394a529e249a7c4905b8000023232a0a837871f6115c4b290c1e8d7524e28884e01115a7bc66de72ec54800000005212cc600c108dc7e4b2d45dcd57062e0508269506ee03d01392305314e466a033c2d2d249072561ddcde467efc5cc000000000000024124ea679446ac53cf724976290cce4d84e7663bd95672501ae88bf1b0f89c5c000000080b7120d69a61e240594000023222a480db86643456124b09a514f870eba51101c0222b4c9e0daac57956720000000a42418e09afa0dcb84a223c1b351010160259544f37589e95152440a32ce7cd469043ab168258056111ba9cf4d8ad00000000000e09072519c14e63166b293f1839383f48363a19789389e5413484b6186818c39b6d4945c8000000965b8b59a5e0f324a3248000008898466cca33172794c7e1468f63aa9d789051924985415665f66cc32bcae00000000a42d262c660de6e3d241d58d398791e5314a42541526e803d61269c82d6588c3c8d6cc5ac9653004d3936fb1ef617000000000000e0a528cebe53981098369d4cbb13cfa58da947b605d0af2ac0294b59e3e1a954de187762a400000096539d04d14e7e6a518000000392a0cef8d8544253962358518bc96328c88a2212f25acd86e67005d0ae00000000a42130833c0636ba16a304d35fa9445290827934dce47af400288a234f71e2114a4b21001c9b65cc944ae39000000000210493ae1f9c1ac9cc5ecaa2d05c8fbc8db447a04465f0ab2a40203aa96f34639b750f648af00000038298f930d1ec75a28800000002a4cadcda564c29ce8e531e011e3b9e559e789e6a1f8c9643d4b36e29f5797b2ac0000001c14a406afe3ef133fa3cba34e39d68b2968383927837389ebf80705b8f1c8d3a475f29c80e0039233687996b95c0000000004a280b39c1f1c1aac8f1e4b614a7783d3736cf1f601770000012884d50e7b6467765611911c80002029cf8bcd21a584a2000000009e64bc6d852a4964f392139392da594f928f844f560fd84ae2a400000002ca5acb61a524d99e7b3469e93cc02d60e01c93ce0dce47afc0964b28cd5be62aa5980001560d93c66944d000000000298925b8f2a0d5427c4875c2da5c8f55cdb6e7d385d0ba80000096539882187e1b7eca92223390000404b3f1c345b1d1ca2000000009e64406dc80541c800168261602e655911525480000000509d64f21cd4986ecf359a98c51c1d5c0009e4e37391ebc1c94c531e5c9a648b1968000392b084d92066ae4d39000000251014a53144637c6aeb3f242610130fbbcdbe47dac5c4e4aa0000012ca53e3b349c1bad0fb40aa2a4880001c16d290d1987cd8511200000001587bda6df526934000024109112c9a444c000000382516029cd6da75c3d05300528c9050800134ab37421eac934b695e6ab43176280a3000392b0e0d90266c4541c8000001016b3a9130c4c4d6c87e7a492ec5e8eda6dc23dbc2e04e00000004b298a73518192099c7154551c8000202c45d8d47663c64e2d60000000aa3df836f6952000000000000000080e4a33ab1f1c9a678cd0cc1c0e8a5214c00009e4f37589e921094663ec6a602cc5b484000e4ac38364119b015400000380492414660b46be82ec598b3172271b094cdd0ee65413800000012ca73a998c3180d9b990ba179260000249662618351af541610000000541efd9b7c09a00000000000000008480a7294d670633075d3f283ac148538001c9504c376e9f7d16f3a49a6bcf374b316e21000392ac1b220cd68aa0000016c2d4531446bc63093294a626154579eaa1b8f0ef65513000000000705a8e94692c36891ef39772a498720021241c1e739a580e4eac5212c000005d8c918db1a4d2a4e4000000000000005216b261e121a8c0eb65290909c0000222697d378d1f5392cd77a60f45b0927000001389a6cd3330d2b40000075e290eb06b2d315028ca02989856036aa19379782a88c000000000b192cc09cf058db447752613088000964a2ce6ac831953ac9484a00000138cc10d9be4c2a48800000000000000509d68fc54d3a47c2275c2c4000000464d3b11bd20fd90c750d53a754288b70000044559c9b3d0cba8ac0002594c492cc7e546ae831c6298b6120156707a406ea12b4ba938e400000000092584f9f0d28a6d663ddd2bcaa268001c128eb0799669cf3f3228c9048044447072464d3652999d119349a000000000000090521643ad1aa28f038ebe425840000009c5c0be9bd6cf90cd3f27caa5a896530000044571c9b48ccad8ae00028c9074e3f2935539e1a9d60a024826938ac33c6360097427000000000000a72de603a63846e042ec4c2f2000014a40614e6baa2de580a00571010911349e6e773d5d268279c800000000000e0b616f3ab1ac78c5b4ebe5a880000000138ad3f4337559a990f338eb452128000007256109b574ca10ac00029ceb67e106a5d3c9629cea250128111733936ef9efa1c95c00000000001c03aa9f869a650d83265885f8ac3900005ac80b598219808966294156425dcb71527dea6ebf2fa4f04f3900000000000109633a41ace4c5781d6cb4908000000392ea7d307aa6787c59cb41444b000001c956706d7d32672a0e4168382c67e006a523c76212410109c0232b4b89bb50fbe0aa390000000000002de75d31bf35a01b968fa8cbf15a4f2200101c14e598c6d8c0acf1d4b09f55199418941f1914866be6c342697f2ac9a00000000070539445b4bb1f2c9ac08c7a8a32d8529280000000046098424b222138000000222336e9990c1500144519f261aa08f200b214453800130af2fe6f2a3e942a0000000000000120b416b358a1f819b594b897d269c8000212de7572b8f944fcb8fb04c62cd62c4c3b01fba9b728f4e0bc95e4c00000000021294a02d0786a6b053e483aa967241080000000000000000000002236ef190893c0294b498309801148580a324000130ac2bcdd047a864f2b4000000000000945b0e867e7c69b7330033b72acbb9c134000e0b69094c594b81d04d3267c1a5e8ca38f4f8c294da12643a4f2039271308c007052930a3269504a3f07301c30a22d85d0eb24f2d4420000000000000000000000e4dbc4641a4f3905394c755356418c79116a20000232a8906d2632a02ea5dc00000000000010120ebe792c6a1f365519399fa09722126800005acb71d60c090c1409e76537351e9318991ad98cc54cf10fa30b11567622a4881c14c425acb103f3d30e9307c3e562d275f380000000000000000000000000466de232082ac029ca63ab1f8c1a91cf1d8b610000111524f324a36c71c15e000000000000080a63a014863d46af336b019061c154440000142511e1a9a8c0b2128cf3ccf60eb24079ba6ba03c93333032e43d172e24d3938390531d14f280c4f8c4a0f9b4e4b39703ae1c0000000000000000000000000261b768c83cab00e084a13ac9f129a858f8a4b7134a626948424a2a8ecc6dfd3d882e65f89c4e0000000000010909405bcc4f4d7206cfb32382d25e4ab2e2444048382d87cd469ff003ce1223d2b37211faa1102516831f430703c203d203db63d283f722a0eb07cbe78b478ee7cac425acb69208c94700000000000000000000000000a906df53deb2bc000a13ae952792e6a163f2f28417d2c0482d05697b3d9f36e59fa097b26918000000000001092084e9e63546b1a33bd33792bcbb173279c1404475e355b98d7920fd20dbc27ae87612e00a5284b3924f9b0f104f240f2acf904b71fa69e851fb918bb9f351e8c1e3a96d25900000000000000000000000000072559c9b9c0f5a8af220016d288128c6b4c7b8f56cee079e2624679fc509722b8a732e53670134aa2327000000000000e094493a115a79166ac63d78364b1f5d1545d4b495a4935ea983516d2f86c73332a2e84f2b8120a12de44725297e2325952792c608a6350656a67b06118610a5b494700000000000000000000000000130a93f5137999fa117f2700000010920e0a53f313068302f3b79d54ea65d8cee4cfc8aa2acbb91800000000000021290b19e5a1a694fa3ccec4cd28be95675c30bb35e294c5099869b298bc9500004a29cb0144725e8e8c63ac619c7840655a67547a28569aabcc5fca425000000000000000000000000000a82e27b6a6e122a4af0000000404a0594ad2c463206b283f16280bc9566c51335d2acae26800000000000020298b39f219a414be03edc334f32db318735bd968213dde36c51d9cee25680012c84eb2483c60316731633b11983196e1f7a944509586a1c3c1728c94000000000000000000000000002bcab363a99a59565c488000000e0e012c80a629cf17cd5387c964e2de4d362319b49017f26934e4000000000038202de7cda68de2d050138b71fa41d78b71d84f670db127d04015c4d251c9f999e629e3e9e0398f21f241f48909d74f5e8f4b8f57cfaecfa18fddcd79078185b8a725800000000000027130ece725809240528000008cad2fa7d886e7a3f7e2a09e000000000010166241f0d9aa28f324e8a5797e33b433cf2fc5c0ac2200000000000029cfc3cd190744298808402acec07eee7dec7dc27d0a764280fcb0f9c8f908f358e9646539584d327936849e6f1e539e4d9e7f9e609f3d9f9a1d34fc249053924000000000000156551ec99e9b98b49d70b496f000009a5c0aa2ec6d2a32772ec56000000000000e0a6290ebe7e226ac931ed2f44d2a4cc60d8e676b2a0e4e08888e400000000424a3a09a354fc0480944001507652716c382c67209a579c12c9e531712de766321a36c716b2e05597025162223c7d34df92096482000000000000111525419681b394c128c174fc5080e08ce09609a5514e7e8a6c9632fa212ee4f0000000000000092539f9d9af68c2a8bf961294f758da207d7c5682ea55930000000020298b7920d23c7c385112c00000000000002b0ae321036e0134a900109096f352a1e019d78a128c8400000000002e453111b2f8cc3c9e7cd0630863f278ae7c4c7442b8b79d98fba8c968cd64f42cb895c4400000000000000241425acb5988d1ae5cb31d50ecc7ed06c2c32d73b315055134000000020298a53a09a654f358a225800000000000005615265cc6cea2e24400259c96a3cdc34fa9f30128a32000000000000a82bced86eee3ead2d870465f8a63f0c3f2a3a61d9cfd68fd30ecc5a0bc15c5611800000000000000e0a4261672a8f1ecd5ba79b05ec80a33d7533ea32532f25b884aa2a8109c14c55146464f383c4135d59e261682592c960000000000004f2e24b368b195997527000e0e092594f124d4f67cf04649251249000000009854174233329364b9544054039392123070464b25120a82326110000000000000000042529407e426b8f31272228096539e8e998a99579f6b130b814e72529565a0945398d818491e10930b3101194a490000000000002f85c4f47cdc8c7e8276126000038249d2cf810d5fc78a47743ab16b290000000150579763ee937249f429702339000000000000000000000000000042539692da5f0c6b8d6e87c44519c15e48261e909eea1ef19e971f509753e2b3cdf3c2d31a53e513b110161241fa01f9e14c42464a0000000444c259083b01fb71b730f554ee45d08c00002de5b0b5124c4a0c124f3a01690088e08c84e4e08888aa3ed336d39ea017b2e0460000000000000000000000000000000124b31f93983818351f9e9752da4251144084e4e484e4aa2ec0a8203ed8361f1e969a880fc4ca8383ad00000002e276725124b29eaa9b370f630be152460000000128a12ca6372625463a27e2a5794855942519504b0768328236179f6b1763b1000000000000000000000000000000000124b716e280f8d8c1c0c408fce4a328ca238000055170269e9099a299819dc8a93c4a35679f281682ce000000725d4ac269f6d99a699921faa97a2a4aa2300000000945196804d3a19e249e1d9e731e6a9f809d58fa30fba8f5a8ca8cf4301762a8ba00000000000000000000000000000000002594c090561f20989798a39e461d34944c2a4a3223bb1e96991119479edc97924024901f3d986298779e7c9c901524a269c134a02ea7a146402651a640c77e2c65495e4d261c80000000424b28c9a72549288c119c8202220294985097027118000000000000000000000000000000000000212d84807cdc795c79987e7a561f599e879e851fb81762a4aa220002cc594e0f3bcf198f864f990e827723f7a3f693d8c3d173ebb202e257956720000000000000000000000000000000000000000000000000000000000000000e0a52948c984050934889c4d2888c84ae2a488000b49c1405295c4b2fa53952539444c251c11130af2a4e4000000000000000000000000000000000000000000000000000000000000000038382238392004472424442720e400002107072720e08884e08c10111c1c9c800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007ffda0008010200010500ff00c7427fffda0008010300010500ff00c7427fffda0008010100010500ff00e73f11edfdf063080ba7bfaa93c5dd22d99547fb211522ea4a4723b2fb1d31229da16f251b75edc04fb95e3957865534c0c04fef338fdd54915537479762b4bb887868bdadf27ec5ec2a6d97b9b5929b09ae38c26ec55c6db950306760ab540d1c83432a64ff00bbd450a9826b26a0bb9264c4b213d13168b47cd24d070cc5d25b0bdbbe19eb4a8edab722dcbfd8b498bc8306522bb39193967c915e7191dc646671587211c397e9bd48c603947af22ff772ddfc574d3381d049a214dc22a323796ed596c73a136adcbca56546e7dd9ba990f5cbd49b3574ecc53aa914a25412031b14b276e96145fcd6b678db8d8de20c622f5d99ba0b103fc0bfddce0e628484937682de01ca8e76a5c88f0d75b1119f9b37cb9d975d3631acd562f5c47094a5220770a995511f46ab15bae9ae9c838e387b3f95d7866eb2a863656390727549e203fdd461ec02a1ba94a8508f384e39888d88992548d72872a31eb0ead5edcf958debc9eea51e4ad412407f648848ba6a651c8a87150c226379094e62f4654c62aaed45c8f645c3c4f8a6ee7663216976ce24239da40b88ff0074a9d797638bd634ac912978f45f6d739306206012b9e39ab97d9d5739f24c516c2e0150388088fdc7e52fe5e3f6c64ba1772cadfdc769ead6bdb0653b9094fee632c91043efd1ce54ca45d0709a6255cd92f925603142d96e4f9475e2cc34817492599cfbc6716e6784515ce80aa63f70f981058a555354a8f11fd6a1323f291c3d5a51d22a1d50fee62a453b859772bbe98899479d364db2e9edab915e256b8a17333601995b2eb8922e6122d918de2dfe8a4503a8e173ae572a2c4271d6c536b89fab44fd9287f730fdbafc5679fb13521756eeda1c62a1b725ca82bcc896b26e246b195729b88944cdd46fd38f654288087d1f4e8a6fd617893872ef0369d521b08888787f720a821d48c996312753ae0ed0932e59b668fcd2c5d946e1310757f41ed336ef955b41ae00126e44655db55de3d51f8019caa0b3438225407c8c9b4029da285299ba85222802c076e44ba16e220628947a287711ff00323c9672abec27ac1855f85e92e43882ebfbdfdc23e87f49045a2dd49bc0688cc9db0c2ee5b940da8c6783bc578ee8e44d7ab3979fa2a1fb09fee29fb85e924165005cae6e938d7af4e66084374e9d0b95984e1da11e2726f58b38a4bb3c1f7577282add5e9000151b94008253a917c53b2d16c96d6447373c79d375ee000f70fed0031447a3284274062983a1100ebccbd0a842f5dfbfc3b87cbdfb75f6101f1501cb541e972772aec36195a0dc3f24fc8fcff9776d8d12f1fcac42cd55f7c43b8f7f1504c43107a68e9f195b3f8899517faa1b51c5f76f574d0a27871ec4de291fc2eaec2b0f5970becca665bd1c5bf6b165e3aed6375f3b212e5746219d99d2fd76efd782a4e9b889124570069c51f36a731e3610b772c8a076e99fec1fd9e737651daaa2089dcfb6dcae5e9552a677c64103249aa84b7baa26f480e1441a11e19a3b2839504fe6e932a4ba626f8a9d3854a8a0d649fcc34f17eb976c1bcac55d56d299efb1cca9d9b5db12355555546e265136e818105c855d440e6c5ec1acb2cd2ac30ab8625cfa81ce26f1f0d58e1d3f888aa6a0942aa0205f210fbf473281d14fee05c8b3766ef5406cbf88863d5ef4f3070932535f37422e123275c2dfec67199cc060543b96025a7a9495d2f67e426c9b00cacda48a66ee5120f7280f7fecd6c288a8d0b3eea52a595a66968fc97deb6ae31619dc4e69385514eaabe6a936ac9d37cd46a36ef297e6b98c8e0317b9266ab727d95b6bd365aedc5a71ce9451390769bc55ba62a07d83e07f53a66551772b1344d3bb9de56b0b479ebcac2adba35a48c048c5303bc4c8c570419ae93c6892d873af4cc6d84d5fae4e1fd62ad039b296b2c7595a75523d44e69d7682ec6161caf0a22262fe3d1bee25281ba5918b782faa85d7532f308316b61369b74ba28bd7abab9aeea19394625394dd017cc01dbdfd4e2b1b2991c40cc65536c6137711208094bfd9003dc0ca017a5dd950059d82290cf91cb7ad6e0d076a694d9672f9b2f6a1fe5e6d7f3d7359464b342b85ddb755d3b7ac160338f22fba87b000898b8f1985941899516b9398ad794ac5e26e6de2d674d053737174fa2136c0cc9e4a3464d8b202a3519c4dc8e60e6de36e085a3dcef22ac82d96b948c08336a8b86caffeb9d3e4dc7b2f2d4dabba5796b1d5771147ab96c663f593c70a28ed9f8b9345313aeac7a0a19cb75544d062548a54bb741f60e849dfa3b6131566492e0fa898a98192a7d35897eac85aec98b63bd8d25577aa7b92589720d1221bb8ae2c5dc25593b4a55ba67d85d0fb2dc1717297b88add24a01c7fb1c9f8adf9c8382376b02d26177db2ada2e276af283d92ee6735766d5eff00ad2227925fba5f297f2fb8955145c33c39cdec9bc00ba5a7ddf5e36ed8e912b74a11946842cd74e1ca5201b67de3629eaba87ce9ceacadd875d437fea0e0f9448a84f249451a4973a5ab6d136666d02a4d7d6ad31075976d2401a3e60d3db293ea3e408e0cfdcaac63b25b1d6ce679d83d8ce0b5dbd7265f3f8c7d0abbc64994c26445b7138d86218af9c12ccd66cfdfae08ae927e26fec72f6f150044f342ec53dc26e0ad06a6ec4e5ae4edfacecbd8637fad52a279fbcf1cbb328dbe52fe4021d9032a76ea4941cac5d0951d6b69aa1e3c9bf84b6114d2d1f4b510c773bca8681b6c95715cdc0bcb56cacb4a48b36a8b532093212129da76a8b8553e99b8a2a49b7a6e0e9bb714bfebb171031ad954182043107ea1932fb8a3833359769ec979036a8a98d9561cc9349ea767162aed172b454bd359393a3a674f59b2967eeb908a8ba6243144bdfbff00630fdfa54e505a5d47c9259719416af08f1e362d9b172761194693959ac794eaa263a875044c23f3f90f605562a69100dd3778a7fb1b3b772e3e31dded8df224ca1cf3b3ee609935872ba5ce8fbed5e941762b1f0935f393bb19bc7a8ce3ff008a5ac0a5d6599b84bc5ba4dfd86ea245210a5fabdbee6210fd0014a0d914e25df29ad4c0621e50b9902f695996f2514ac8fbd1fc4cf638ae2fe60acc90299b18e20511100fb87f6208f602248a8e5a11e03ce557b36ab327f2d944e3993e7462b992726032df47ff00a688fd853158ed245f037887ade39716c4456826232ef7f623625d698f8fa640ecdaa8c3fc24c77d79dac6a8a0d1c11925e455123f401d83f8060f22b53224719cb88b6bf3f71772871bebfc28c947c0c1d3cfd566d0b6f2baa82d35c6d7565ed299fd85e0aa66393d0bf8ff005e1300742a943a2ae26033b0298aa0183cc3b2ae53274efc0037059d711aefc097d5dd4d59d7077904d936e1e281998801c9e025209ba3104bf3f7fb267297a32bdfa1762054d34972231e999ad3b19504bce69138b24fca1287b6f49daca4c90ab46159c22680376c74c856c990dfc1540e2470c163030609c68f2f2d5b9ae2da98b66d1eb445251c229251f231bc39f6069505749800b5288825d7bc50280f70feba7f553f1666742262ba055d0791ca98890add4e9ab2236eb99066f359baa8cdcc88269340059720083773d09520e8e744a06379740023d08087ce4ede47f1e910318d8e961ab3ca7bc1a66e3f38fbaca8855ca6edb21f629bd130ec3fc437e26eddebba4690b8f476e675cd556b1b395f2eb355d26eb18987791d54623e4fe33e44d079578ecd1607c9001923147b87f5d377130b7ee5abea4b7541c6dfddd36b371b632f4f335c26b7f297d79a3ddeaa42b8e555b84aa242b6df0ed4abf73782fadccbff005ebd91712af5084aa5f745b7f710fd1a86b909848c1d45162672272f747a22a913a39bc8df300088890c5e999ca41b15766aeb01786d74fab56d8bf6c8e3a47a1fc49ebfc437e27f49264ddfb4e4f1ad2719e3824a4da8b42b44dd4784b37f7d4e1df988f6e8e1f1db8a7d24729930eddbfab9d554cbaef891e2b3e5d64d29493f7489384c2fb65263a631c465a72f1d7fd8990ccee5b1b0cc825af8e7fe70e56256ab0df286f7c95ade347b77b9a7b13c2eb24eb48cb4dc30b182963dafe343ac9b7ed21b47ba9b866348eadf5c344366581d85b1dd278758a49156c1ec3b70695d74e05cc96a1d446aeea96f51684f51153a575f8ab6b02be25dee15564aa21be1c31f2e28283bbdc7ab66d69da5616ba72dad4074cac854873231b194dc7cfa0e4906bb43b36def3822e9145654a3af0a892af301dcae22d49dc3a27af600fe37897a745fd85d541abd4379582c4c07d92b89a3bc671a8b82b4d13e6f4ce0dec65bbc6f36c124ba00ec1fd5dd9d670baa670d147f1a9b45b3ab909eb7b06e1733b97567c641b4bbb90b92994b56e32e86b683954df0cf86353858cc76d04eb7b1e0d455a0b356d5ba0fddacb383a898af2099533b400069ed1488197157b07c540e95298c55089153f69358cf5cb187e8ab48bb3f21ce43f47e36c75c1adeb2b9d549fdd3ab0c9c3bf4686a2ebeafa72a6b6f722d2398d2a677f30d631334a95cba4b49f053f4beb3919072ba81ea4f5fe3bc44ca2483b2837e5c98054fdfcc27055159205ddb7105bfd6aba71c988ccb4d6eb0f7d3e807b87f5231bc7af74802e6599345147cd93211eb653a5966a8a1b1de47780380adf3a39206c37345d591c6ac91cbcb8d837c35af1d62961569075e98394fb5a6a3e218ae59c02b72b8f653403c9568b11755b0a9d7b1d80ed5258a8b2490f94e4110379a5d3d72811670f63631441ab67eeb90bf20ca5f16a9f9f7b2b2b50b4a8de372a2a316e183780d92bb17bc9a96d3ae3ceb82d45d8c55c67c85a6732b884e0c5f0266d719fd9be1d16a38daaa949cd79f25bcbbc2871827c91b5b39caf193a8e926867a920a2aed344c4548729544cfd7b84e80c06fe1adee019c35389725ed0b1c82c71bef682a8b057856885c6298c695e35e17f974cda22abe4d3911380081c047fa891551472732727d3d0671ace2e3106c1b26dae6186af68cd977254ce7cec5b1ff0015b25f30abdd6970fb18b2d91c59c67c5d858d91524ba8d07a50facb1932900a4600dda35728f214deed238254156d54d695ed4846eac8b73a278d0d4069d2fa6d3af0e12e19e336bd6d9b6116f28748c9ba302828a8f1668df2af58980b9ed4ae7bf0dbba94e2b7f716322f146bcd7deffb605af790d707267c08ce912bb248a028bd9155355154c513f8a7fc3130009942f4454a61e5698a52162767af59cc41824fcaa36e3ef9544c43da69d564fd1627726380078107effd4259e9d9a8f3d86ceab6aba86b6f01b7ce59d47d00ca7e6320f2f6f2eb0788fd757629cc64c4ec7ec34b66b2d2516e0865df28b3668b84611f269fd67cd41da4a376d26df7d1bb4a3b587686e15735cde5ae109575da400d4eada54d18de1da45c5c6dc71b2b8836a5fcb919492854a4482293807ed557dd00cfb355c26e5c186481a8de6b278cb98f4fec878765bfac14cbdc07cb3c02aef57fc8e33375f8a6bc776f84db1aa65620453648aa1d220080ff00084007a3149d140a437343c7f6b57e1fbb91959f05118f2c7464ccbc04cebe2e7b2be582c92c828240374021dffa6bb7256890b91f64d2ae171226abf799e19f18b3aeab67b83e40f933b3da835cba8acafd8fd6dab2d17625eb828efd82980e4238222d9140a2dd21328d10544a50297ea2ee176ee543bd4178f9593985f6f7b63b35aa6c75c88c80bbf99177d7725609a2e0f4f44683b46370f67b76ec658ab4f8d96cd023630249078910493399ba4730b44447f551ee7488722ac9b2c690838d934d340acc32131831db31a86d9e710ca89b1eb6a032130feebea83967de9b16fac9647597cb0b6b0afe61e914962b41769be704090408449c94e50301beb0800f460ec221e43bd2b1d0d7cb5971ef16682a18c8b876e0eb1f87ddf89fb9fae268d8124c823d014007fa6ac44d42c822321d2ecde3867b71ddd638ea82dae72e7f64eec6af0e9138cddf0cbd92b3d63acfe2d5bf95792ee5a47b64db3327a7f01a3f3cb231ebacf5967bec0ec66b871b73eb6037676439351309feed645940396da51d345dddaadf5b3566adae2e5a44cd20093741145347bf8fcc3f6e9cc52cee401ea00bb9715246bdcd8d61e0fec428cdb171cacb0d774beba3691945accba7887ccaf1c2e9ced89d956bf326d3060e25569441481631fe6e9a94049d26a098ff0054ff009797886485364b998d95c536ee89af5c992138a6451bf0c0c925a99bfea7fca4f5fe99ee13af753ecbba6e444c83a981ddcefeacdeb8a1ef45dbbe59cf911a0ce33d4f5a68d60ddf3c5e54ae93e81bcb53ed22a39760d48410fac63148549da0b749b941534dc80aef2fc5fab578ad65b717b63bafb74c986cb0cb8c0a0ac936d52eaf6eeecdf25717b176cf6195878586754fb83b772e4e46a629485f02fcc21dc0addd15c8b2f65c3d859074e9380689a929131b371bb8ee2bb6732591bf58e578b176ec53f355352131889be5d8fe1f3dc2ce6734f4d4ae29ecdb05f36a2ca98874b3f64c935e4d93700513128bc6de492e92c1dc3e89ff0025c04cde4a2965a98da150a7b71b0e227ee82440493e31d71db5b3dc1a85ff00227aff004c3a65131ca8a08a88b9fd6dfa6f1e89d665ae7ceef46525e1d1e684adc6075a93b92288a0b2082ffc157c048e962306cf9995d45b47b194ed37c96b7566cddbb268d7b14954116bd392164acddc6c80bafa91d6fdb0d5ee25c43f42659a498915faa7f50fb929e926d1321b41d36625ed3e90d946b2b227551917441e88a96ecdeed055f29cb4d0d297d71c6b2c08e527b06c487380dc9b75f59a810afe96aaa10b12119d3e5dd40b2a7e46426da3144e43fd03fe461f12a2a7ba9ef0db19a6dc8a614c1d9bb975315c2140ec4d8ac0e2309ebfd30e9095c1e2de3998dec6e7697d6563acf54977f29ef3f1e5d0253980548b87cea324637b22299126afbf82e932a8998e28b46f109394f951ede23ec35b12b0918c98fd23c9b492929272e78ae69f99e3fd909851aca3849ca3ee27e463fd53fa88f889e9d6cee4de1ffd8972af10ac0672596dd4f1efbe7ac9a87525bc2c96d5c56f6de85d496f8f1c33a3867c7464065a6b8733706e7f5edbdbcffd76bbd72f2a2c22cbc6547b8a6e66308e1daae19a20cd6fa07f553fe3665f1437c098136f454bcdb0081dbe37cd38a6322a905bf628de93fe9461ec0ab8503a2bf6ce5d6d2b66565f5818d799b98b7cf607911c6cb41b0d8f14a3359d4e326f18991216e9891bb349b8ff0000c71ed2222aacbcfba8d9bdcaecba80d65e205e2bd972f20aeaca4e3a99e9dcab8761c7bf5a6db6499c2c99c7c2333c7b4942328a6ac16222521bea8800f42900f40914a0942b24a41fb3379d514bd1d71a98dfff001e19dc4cab356bb34bf9ac3bebaecd89d82d94e3ede4b35692ff00d17b22e2158f772a1b31f57d9a98213faeadf06776bc25f597be1c22d9fc0a8b8c3b269289aedd79cfd05dbb92382fc9dfee62f7e951f133513f5be63fff00cbe11512a454c846564086797be8a0312842018c050101fe92a0f62abf7eae95d3a1ac95b2dcaed06bdd9ee59f188d1638bff519532264899472f64d1f73dbfe11c7b1540ff0aaea7a4e8fa5b7dbb4375b34cd3511408a7827d0a2770e78f06bde3704f5ee64d47332502817f8722539db2acccf63e4a9e84ade9ae461c7ce5f189feaef66f7d357d91988997163f3d2c147b8908d7b77aca595c96a57687c4468ea9e0abfb6f90787577b51bcb52e2d966b64aff581cbcb6f18aaccda40c632878e45403008ff0097c0ff0061f30eca13c8c888025ba9a8d1ab36abf628a82227c40a49d57395f4d242d2934ce1e253771fe8fdc3a139007f61baaa3655a2c3cabf71ff00fbfd75b44da73b8db31bff004050d4adbca250827f1a8a89389b62d5432887f04eaa6997ccaa10ae7c5cf2d2da1b3c7fc7d5dbb466dc8d54390a90a9d686f0a8739f654ab2422639f2ca20040002ff000dd09ca674c175946f18e9e3e988385ac233923e851de1a55fa3bdc1d69aabc90b6577edae4cda931539c842a8ac1219ff00aafc44d90505b62e3a997bae35b5ddb33c9ed695e4d56ef871236a347c546234ec53054be0ddeb47dd08800018a6e8fdfbf71ee5f10ea75e8475319fb3e15766da83dd4207f9686edb8dd1dac9d22a682650f102807f4837e32282eb9a4a1c252439076d4a9dd7161fd92b3f74b2d6ff006ae301e8cd6c61a45c5308d1fe18fd808283a28bc6ccc6f5dd2a62c1d9acf5cbeaf73d32b55f22ae8be322848b21894f857e31a6c6811103284fb97f8c3d159b632b75ad75117fe80dee6a6aabd6364f71a8ddbb8c16bb71ca47a8fc4e81d13f980d42c606a381dce715585ba0bc8475f9c3dbe1a44e4fb4364f327465146b274faa231cd956c89dd1533a61fe26fc8000dd652d70d6da62ed413f27525422dce402792a4e1fd8ab217633e54ff949ebfd1c7d0fe9544f120d3b8d5fdbdc6eb51b66cf39ed8ce71f137d472568eddb2937153c545184cd3f863d14112f4c1b9147dcb736905a6eca0449e1c8d04be06484fd3a5d7704e3bb8ec863b6b0d20edd13f1fe3a8f1345155cb4f7b37f08ec96c671c339f0a6f0603e46f151dba259036cd3609b648e3e20f5d97f563a71d3347721a24b03b5ca0f2c311b21b042f86a1f94dde8c3884c3bcdec69cf0b57feb6422c59bc4e50a8a62429bbf75486321caab2da5b1a35a8d3b3778ed550cb1ce3df888e26c8587c0111eea13d7fa30f4674a03755f1d46c444f21d7304d9631a2edde917012a4d83e7940d0f054653648f6e6760814abff0004c7297a59639488383b806ef91073b1eceeb57ae5c53cb0ca1b9f99790afdf02af85c8fecfbbedaaf904d41c016058ac1f4fd49e9fc716e99cebc0b133c9969fe993e445a8681d8ee2dd9dba776f0df22b5a19f36f763f896b9ce0d5aacd8e54a319a20ce2d38e5f649acec70d9b58ed936b5afc6b2efde0f676e526bd6ea696390f583d98b122c78a247ae644ade716787859c6d345e5df9d8bdfbccc56251076c85a288d8db4b397d2f362458f8dc60c52f31004ff128f70fe8a3e8b78011aa6566d721afe52d8a38e998993d72735f23f8cceb4e2f02306d315450443fc7febfe0ae9f993b8febc51dd8bbbc975ed6e34da4dc16ddee06e2721ff70eb3676d904cfdc0a23fe5d305bf5e53016a18dab30989ea4f4fe397d57f572d8af1b4648386ebf2bcd4a86375f2e359b627baff00cb24a423059a2dd1057fe9f43393be32f9d981160762561b63daebc81d59e4651e955518eb437c9da06e7b29d7629d3ce5e9d9a59af9436e702312eed5d7abb206f5462e2e4ac8516cb7120c096591f978badec2ce3ecb93fe327e3fd13bf6e8443b3c5c22104d024938e643b095dbc571c4d672bb06cdd6e542992818cba6900817b7f97d7f327974b2bed981d35156a9a9a96a1a9fe44dbe199d895d17ee9041f49b86f26f9ca63e43eab245f75d8780f193bfeadf9d5601449d2672093bf60f709d1944c80b2e8b74d25d05d2f97eff0001102f5dfbfc004043a139007e52876e96011ea4105976bec2f271b98f8996e335b18b30b17ae5e0be5271bad94b5d8360eb17e9c9c98983b094dddf19402a80914fb18d71d88d92d84cf6c25be5ae8c92723087478ef723998b7ee29d5e9e948ee5c3b3f35d5bb6c64c89b351baac5bb467233521a0bd7eb5c03d7dc7cb91c36540ca2a401f028760fe88a746ee22edb31709d7d57d3d692dbec172aaabcdacc0e2bb852ae29eb5bc0922c91ee2976edfc1708a467090ccba78f917ae02e8dd3b4b8c36df7b9c806e96c6aa86e005e950edd0f7eddc7e0d162aabfea1166dc3273823e91bae555fb5912145a8a9f89fb80be768b56728a4ab63254f908864c6c9f07b0c62721b9a3e2c51f297839926c42a17cef967ee1df846f2cedc2c62944730dda8444c5ade6cf42231589bc993571944950b71adddd38659bb9399d492a9198ca3d7e0ac8a6a2c4fc7e5ec03d1bec0a7d8a929ec2bcc735d4faada2b8e367b1b0736468159395cbe5e4528081ca98f4a1121e9caaa3543789a82a0b6b58c15cdbbaeec957ed9bbb52435e1c95ae2e27e105c9abaa8ba359b94590c3aef8528be2fbac67b9bb9a6aaaa7fb84d9b74dc9085217fa329d08ff97ea24f5c72cacdc3e346bc351b85f54675e78c1c1c75251a292665131ee4fe008f604bdb5962b59334a67b6c6b1635bd68f6ff00bc5c93daddc16720e614bdfbacaf4223e3f06872a6a20fbbb6c5dc83ad310b236c05e6a4f28ac180fb49018552aa43003c7dfa495f4bf76d30facfed6f96ede8bf295433b335cd4c9451e1d7985229d2c45da260aae82828b560bb439a4522a5148391c5ecefcdec2c96c02e62379ada3dc3cd8be18ec2e8f66de5db75272848341250ab25f31fd15fc07c3cf246c3c064fe3e664e3556f851943c723614967eebe88222241fb2841115121e80a66eaa4b316aff0095169c5b64ddaf8d0966f20846b02326934e578f4152c2c95afb5553e4a5f0d5de00d03ad7c451122252a0759eff004231bc7a157b749b958eab3afa9a9097ff0060f0560298c029f6ea5ae95aba689c90f37dce62ec8f87060835a12cba692a655362a15d000007d41fb742a8074ea48199d59a608b36f22a3c55272a3d5f6ebbe6c5fd645119cb9cb9079f97c1db82380ff62240f787b9cfe5d77fb7c127299021a4538c7ce008e8fc3fb69ed1dc3399215a5549604a35a4b24f63e564e1e9188dfd6e42e0eca725e5976429be91646e9b49bb64a3c9274fcdfb4b740e55f20903765241ca9d22e0e8aae25557ea0a8d8e959fbbd782c4d5ba90e5bb50a1294756546ddba68271b10cbcaffdb6ae0cbb7f73af73a0fbfc0fe86379019bf90a7e450e64984c9db9c88e1f5998bd9dcd15cc62181c894e261381c54eef90f366d51868e8db87595b6b776836795358997cd87aed490141e159a4459713716ad1ebcb270c1fb0e9eb768a7ecfb5e44280817fa09fd5527bc8d3cc66e14d365b7168a373cb966e09e2e4ce5572ebcebbca7b95b5dd9f5de7aae5665d45542c93aaaf4dd0d77e30c1e1fe1b21e84f5faa3e8a74a3649c1a4e4e2994d996f719ef2794151f6659d5356d5573aaea8deaae08afe01f73fcc98078a0a2645ed45d4ab318af4eb433e6d56c9f130c8b4554ecc25dc72cfd8948e2f618c73d8c6912cdda29c4aa999237ce1ea51ff18a32e824c5b309d7fa80ddc6536a8ae0e2665ce3ee7ed858b49db2754e1154e33e01e9d1fd3e1e6648dc82f1662b2d75618997eaa9c5bc92b2172a3ef659139bfc3c80822a104245606695552b46d194df228dfe1b33aa478c0ac15e87bf7b4d72e0e8abe589d93b69b29b1963644d2f18876e93fe84220007f1ee62a28176c1c9a71bf0496ce8dbde7b6c06a066b46b56e93d4c152c8b55c5673149bde39f8acdf2bb69aa1db78a3d13d7ea0080f43f70504005e3155dab93793d8f587f6af705c97f2073b2764d846325bf659c984cc8a2f0c7fc4bdc0dd761ebc47aedf0ec3d263d8a44d254ac8a41478e9eda9a6b1f29697978aaa616399249bce5ad924d2f5ec094ff005cb95bb71595580c553e70f528878b17266ee993a490998a96711939ae3d9ee546acefb619664d93cf4c788617007fb77f412fa747f4f82e51292a8a4a12b3a43635654f8e79cfc63327dfe4a6ad5529576e0981fa336eabfaf68bb53426fe3913cf666ba852c2c33778dced1c98e24e88a8a265e35c8b4e2a1b697d8af924e152fee23e2504c43b7f3c7d0c3dba94170556afa9e9ca0a037c3c932b3b969a8b3c93597318047b002223dc009dddaea3c4f85d625b48db469248a9245fc87ec01e9f45450de6fe5106c0dccd9ba02e245d13c4a467b5edece266ade94cfdd9a6546cf2ebb7914146e27380771ebb88749888880077390bdda423e71d396b28c536c44592ce4ac1650c5280abf6e8047b9847b99007b1bc6177e6dacf2ac8a22a7202a566e87d968076e8c2621844447e8771ebb8f5dc7b8287f71ec9c8153d0e6e02b6d5a64c525595315c526e1a848b8620631880001f1ec1d3b0077d3454891f977e34a566f3df858e46366f4e3574652400aee153ca4caab0f84f68b757bf4be7b34ae4c83066d507cca5506cf57868fd4d6a2ef7ed4a4af9d99afb1b2f2965dcc519bc84953131a24d86b0d91600b28e76f1ba02404fd7f9e6f430800cac548bf97e4d5bd890bf9542267edcde5e40e3bf99bb78a3f907465d4725d0b62697117575171c31accbf90fa07a7d173e2655f2a9a4ddba326f13be391761314a81db072e397ae9a55956d457326dfb578298b815531f5f823ea1dfba054543aca24dcea3d229d3974d16141c471da2c062a8b7a17f237e689c13631d032912d38e0721a4ee235e5e18cf3965b31c7b77388f7fa81f7e927a66eddd260975c48b692f7202d340b43c374e086ee9144a4f9154c535a58c56c1cd52cac854f64b8abde25ad96d75f40b876e76a5b8cc5ed58db2d946d2329f69f77cb32c22e37f559ae891cb22a1a88d396426d1ef361861ee3be02d9ae605afc9cb41922b3f68ac647aad1ac4f16bd813fc3ed834faf208908060689fe1fce6b26474e5bb923b5f9436df5f60b63ea52b22c250f24e4c6fdb2882a7f21eff00644bd15113a984d8cf299739874e5bd35236c5828bb9e8a97611fbf41f6f82eb020522a4397f73fee0ac52003b6c3d1dd940893822a531dc773a6dd01c8fd8761862653d9f5ccb61e38d96f9c394f9d1714eba809a35018e8bb9020981f910e847c8ded08f49b551412c62c672e4a0c94c15d5a65f6c32b6c4fe17545c29d8713ad384636b95c46b54f52d359c9c3e329ac6405c1b795fda4ab1f3451bf4b340404483dc920423782ac1ec574cea5353b3f949baa89d82ebbd54546663000fd50fb09dc2662b3551f3d6665654d8719e717351f54c1285554509dfc7e023d8055edd2e64c893e7c451b728ab7acab7d3ce8eeb3a32dc6c7b6e3ca6ed15806d792f7de3ca4ba0e8e83564a3259924aac98f5a5fe3819099e1238bf8d963b15ad2c5d3a8345b7ab8770d9a1ad28f2211dd30311f4c12a392a62b0d20ec121762580ef64d44dc91628814de5fcd500448a9db13abb372e94b0b69b62f99958e75e66c93b4dc112f1101f5f8263d115f68bc56ad539b9fb7e76b015340a4227f23a51249351b195028b64019c8a922bb48449b2f7b72fb15b1b90ca6e55babec77532939a5dcda91ae42ef976af9329d47255354aea1e35051877efd2bf97c43d49f62b36ebac930946504df47bc66ebeccf676d6d25a4b1f4ba66977aa192541b15f3b6493a788c4466ceb491887b5da0f649abaca2d635ec7f230f2a0ba20505400000a23d7b23d9357d8e94f71c1cc9887d63fd8521128337ee62a5751f765ddfbd7017b15320f70f81fd0c3fe5262c5318529665bf256ccfc67b77af565151e104ee31bb8a6dc49c77b12ad4235f50d45d7b75ab2d2df163a62854d93d4a3d3844e32210382855e46298d4107b9ec458ec25d991c41a3a8864c25d8f122d8b238d396f29380ce6fc40a7276eff00cc1100055ab555e72caceb1c66c2004d36ed44a6308fd83e25376e84c024e13d6463e5aae290e0e12ff97e47297bc9ba66ed64ee95d9b3d60e8dcc4e5b780f610f973cabf66b90cb5cebbd782f74d269362f4d8ecd351c490a8721d4209dd33128faa83dcdf10f527e22f1768871a2d2e476725e39476680792642354904241448c73b7493151d33689a7fa88b4fd626eb768fabb85b0770e4e97755c1dffb9d287037426f1e9baa06e962808a7d808757b89ff2fa87fc92503b28a08f5c75527cdf4da750853076f89bb0f454bcbac8ac82c7bc64a0767fcbd9d3a25d6bef762fdd7d26d601ba916ce3261daf231cd1c6bc7547975b47b89ab0d166256b5609d07eeb8fd6f6562336aa281e20a2cba6dbae6738825a3afb13b98916d9fb897a4ebaaaad75c7d6a656c0e716187a1c81dc7f96a88814ee0c89e98897ccdf72a9ca875909b3f977c49131bf1288987e050fb261dcee3b01786adb35e8fd7d17c85982e74db9c578f4184a463d9666f6555728bc9078be5bec0f12f07a91cf8e645286472433b32ff30aa45526e6328aaa4440c600ebccc1d7710e8aaa85e84e611f330f42223f207a93d2cd5abaa2fbdddc0ac5aa4308b11d68e494e8ec5b914713cec8f1d483cf176d5ecbc3e73ed2f0cf5956ff00669ca5735b36185a8b177f327eb7d73710ec84b9efb637c4160585a9bd3626f2637d769c483361e22e9eb86c503747f5faad10055bb09a6d12ca9fa5e4aacaf704acdb4c68c32f6d37c31d50317bd3370fd478f4b2dfb77caffd94c6ca0f619cc828ba59ce54e73658e6fd6c087ea15b8376e11d4f3b72683a72adbc9576a4389456f5e2568ad0d9cc60a0102a8f0a749353af693e88991332a994014020a7cb3f1fe5ef5eb01b2e08b76ea4832e9d09a450e1939e916e6997a80aa9014cdd1440e06fe51c3b94502aa77d34844c0ec9ab7ffdc7cf932a450a7fc49f71f8147b0813b74a9fb9740d6719d97d6614c02b9d04c89fb4a3e51dc312515cb5cf3c4ec04b79b30e601776e71ae95c5bdf7e245ac7a882ae1ea9efae72286543b8789baf01ebc0dd0876fa01ea51f127179c6c8cbcdb20968f74e2a250c1fb0f5aa8abd9696332524e53fd1c5ee53951dbab06dee35d4c83cc9bc3a9fe28975af04be2c60c632e0b42c9028aad1276ad92cf0d6d6226ca6d86d2b8d065b6bf9fae63924d56c471f03fafd40fb891c7ebb766ab78b478ce6b36473cf355c2ad538b952546dd83588fd52662eda302b0661b35799add7a8dd655673e60e7656cad3cfd255e3c45937220e1306a48593771432158555aaed27616eb5add36009649ab58f6a3dce737c043fc95fb93c3de26cb6832dccd7c28ddc20a11c9c44af576c9ebbb2c6adc0fcd2a62e0c45d3b54fddaa68e48de69ff0028c600ebcc00d91f2a34ae395d09809eba22054ba32a51028f6f8a299955138d5d74940314f84f10deda61df87b6fd33acf55c8bca5c7dc49a0765dcc3aaa9891bed91d7f7286b215c89334652658a0d4ce8e2a49839e8a472e0f67f103266fdc9dbee34bb67b8cc91e277b825c2e671a7db35ad4ef2e2264ce3ecb037381906ab3a3998ae929feb9e07476c7209d3313a00ee22025102f921c42ab78a659d475c8470a540943c891c0834bfd90167310ad2ee7b9285f5ce997c09d6b6566c72e7ea1b8f2e2e6b2e11cc3ad28d5162e239896085650ad5f3772f20165df4a375e443649c66f0633919ec1344db00d76aa90f753f55654ea373a2a1486399462b2440414314123792898a63f281447af64fd1e3ce930d676a8328765578301f062c86bdec464fec630b709697cb5e64f87f41c6e68f245d9e6610d5353561583f8e6c45589e71c0948e241cacf5fa2c97c3cc05cb9d8adc8bf3c71317f5fba92c6ea2d7b879214a468a340c63b0995c891856310fe5f0edf757ee053827d5790695556fb31ad6ab65b2efb7eaf49acd946aedd11c32e28f97537929ad88e40c541b98a62ff294f531fdb2e5c14cfb156e333559dc25c0407e48f3026e4a672aad484416a8abecb44bf89c7eb99726dc59da1f657cc16de5bf7d95b97793b9a75bba6f1af143410162135914da164e5661f61671fbd9c671130ff86463b52f4b6386a1f5ed89547d1d48db4873fee26dd77afdda0249041f84d50b6faa5759e5c7775cd9e23b26e35b9cfaf945791072e0d2aa4716463cb1ebb80edf04cbe7d7b9e03a7ac9c71881b226cee1a798020c5dbbc9fc8db238876d76fdbaec82da0dddd306852f9ecbeabc45c2cc7fc14b4cc527064d3309c9f24cbe74d0546920b8548a53353b6cfde2f9af6cc2367271ded8d610489d008b7842c6a891153aee5d375d01308f9ac502fcc9fa07dc6d356ad6d4d7b4c7298c98b1d67720770db0ac9f91b80b56b52a856a70e9dbb3ac604d45c91bfeb3a72bc6b2531535f399d9d352eb3b87dd0b4427696d2594c75a7795a5725a5b517a9f5e946f9f30c9b76d4fc3324e39a27f600fb87c4ff9281dc8dd329da6e46216a6b69abaa2b2c50000310140e21b97e5b0db023185883548c907f294f512028157d34ceaea2b3d2dea16d3385e0095c7c8d0c1e48828c0704a80a5aaccb8d88724fc28c07b65b04dc3e736cd2a18d8841170ce40ac5f3f74c517f6f12b8b53caebf78a767765f0e0768675bbaed74b1ff68629da8dd937fdb274f9b4f387291a592289dd1000ce0c255cedd6960a81fb950ec1c47ee6f8c5597cb689bb967ae9e3ddca9168b473d7221d07dfa21fdbebdbf73a1efedf1b0cef8ece6d6edf3bd56b3162ceeee371371b6af7c7433a1bb8d9fb702d45a8a1ec65169306be7dd40e8a3dcbf2191f07728dde2eea401c1ca9c1c72a68a1977a5ccad07eb433755cc3e1ab927417590781b99189f5495e3c8d7722e9bbb5152f8fcc90fdc03fcbb383ac2f24648a0e6313649a8c8156ad547cb20762cdd469e62524f08b43bb1aceea8f023886e29d8f35abb6767ec05308b978fa6d89c5093e6a37fa4a93b174dcecc51d516a8f2f21336f00ca098913f4f90ff9143c85838f715dfec6158edd09e84f427701b39776a8b2b7bb1b6f05379278f881c55fe58800f47f144b16d1444fc8bf1a6571836c55031211d28402fc8022516cf1cb472b555502d24a951131c9e4cd8c29564882e117fac8e3419b5b036d80da32d7eebea14ca26e54f67b9db43c7b3706452375d8040ad9129c40040cdd2375eca5d2f1ed1c9506e8b749dc3b372d20d159b17717a46b01b60b6b9458c775b0f2f3b88e8d6887fa5410891029c43ec0887769c5fb618df0bb3a3923ee82aecd7bd7a25d3256fb2abd96e685a2eca504dd8a6574544a51ec03f3288914ebd84c7a00edd11ba2998e8a673192218a9a446c1732d9db3bbb47e4a719ad50e4340655f0c2c97a20d7ef50db22c6b524e2a4a19f89930e85aa49008a6023ff0073a6e9aa0468dc1774627fab7114220abb2306aad348cf54cae36e9a364394f2d8afc2aee5484ae23e8c758f846de31260dd9a89115ebdb2095f45337e52229992e65d90b0371b339d38f34b85edd80a8f099212fb69fa7c87fcba6e8913579193649beda43b75dc43af74c4e944d5551e2399484bdbacb8f3083521c4c711ec1fc930144b00e641597e671855375a5af70f1dc882bf3007712fe8c63609b228d30b75ff00977b06b95a9fe3098a58220a0b46addbbd33f2b78a16ca8788a9f45c242b22e8828b67f14e1a33dd4695ad2ed131fee85b1b878ed752257f77af1f01e992aba4e29c935d94d6bab016f76cdf2b30f712acd60b5858b8f5637a6c8890ff0054ff0061945124a2a19c36908b68056a9bb704912df2d4aeb5724de649f119d715e142e2f094aa2258df8e2b1b28b58acde8e76bb0ae0fa7adabb4561b467b649ceac8f14ed8d5d18bdaae97f20f5523c7c6da6ba6fa656589d5d6bf30dc84789b58b5a51138c7289bb49a11549ffc0a5394cab842359edb2faaf935b204d0172870c3bb6fa9ccdb327edaa9fa7c87fc87ec2917b17915b82afb6c54be2b7460ee09aa518ee1cd912eadc6c2c04a99d3fccff8ff00257289d170baac899bd8bd4e668620dffb255e637dea5e025d36ca355924fe09a6650ea26648cc621ec811b91d1d6d40f18ac82cd2531670fec3e115ad5e34a759e45acfcea303354db7ec1932a6051f9fbfc1450124d36e91cebb4773e768e251bc97289d2d37caab589c43f7ab0337c0d00a2246ef7f4cb1f229c6b1e19991563622bc76c1bba78d1daae144d22fbdf218c042a6e91544164c7a5dd24dd36cf9b3a289c81d14e06e957ad915539168b38465193c1709a0edbb48aff5dd022512ff00ae740a7b4a1c8299d0e92038f420a76005c0ddcfdd70722570f1c94db59c13a336238675952375b112ff00e9c73da1763781b14bb315904d15d04225d365d30281faf32874776549eee1b231be31eb9debd9499750e749bb9e32776d95a8db6ac026e89f6e80c03f1ee1dd4fb7405138a6721fae4092cde636f4e4c5f77c8bd018bdc82523cd7ddfa718c99e71b24d67a293fc843b87f29251015a975645bcd72c2d3ccdca2f4dd672d1924f540556f835fb291eb374a4695a5ea4b855669a78c1dacc694936058762d489a46fac27ee693826f2120aa24629b341c2624565547dca6f519058c57e5ecbb38e33e2a4d5cb828105b18c0aea172a830bf61adea262ea9e78a90ad9128f70f91c18854c54f36e9a2fd1691eeea53aae518e64d3243717ac5c517b73b9726b4a9e7d8d7c9b354191f271550d2d53d3116283a6accc92c97d11f451545b74d124da1b97a6be52b13907c4436090962b299689452593ec270fc3a37e250f251a3d6922ef995e6834a46d7b2f77af012afa9daf1bdbad83b1581cc7f44fcbe021fe6af612a43d8c8815126e52ad46b5da29c444dd17f22810458bf73112fa62c95572cf5a09f41e9fc930f881526c8b851133d90cc5c84c79c5dc78cb6afed7d6b933269a4bfc51314bd20c41e3ac4aae5ddafc8cb7ab16a2b56dd2916fd32729a8bfd550c0005f78c7bc977acb63d523915cba35ad6c5c551cd72fa2d216439975ab68f68bd93eac378364f61582b5debeb2c26a19b30a9a7da8b27cf5b8b341ca0e930d48e55d359b9af221817894847cbe472521931055bb58e8c7a99b655c8770935e0db3df7f1b07cf7a8d47d33594bba8a3c7392c4232e1c5db71357e34dfa957ab3849249b83bfa261ec0545072e1570e1ad69bb6c2aa673b35d78f576672c0df7c65bcf1f9238d881bcc0bf62f46fc4a224339187a4d96f0f2e899abb3055754846c532cc2cc4ebca32f45b99134c5bae89f97c0c3d80a3e6270ec7b8f37fe86dbe4e566bdc9c8e744f071f047c8e27593ff4dc3a7219bdc0d7d0076307a7f1de3c168a26f1670509645c28f8a77ee3679b77c50d56db1d94ecf72c7681761a7ea9513472a8a4c08c4aacc538ab30fd38860c1ba4eca4a66a6734cd57609e8d518f2297eb010a411fa223d83a1fb04fbb9049b309a565d3dc36e02c86a82c2e756cbf30f625588fdca063a662bf53f5a94ab2a6a1aa1c92ce9c86cb357de545433b7072aafdc3d48255e2711c2aef5212d8fc83441b0b638983e0e9d3f72b99e395dab075fb8d6fa645dabc5bb51b9fe52574b2bdc483892937c0a1db0a8e5550cddf396eaba9074f3ab3d2b214d5e4b642b256a58b045bb8fa4b47b7582620e3e6d37d09153309bb5c72a3316365fc4eb2f2b0c94d7237039132987b9c9f6505d0024751637220cdc430af5bae947cfba720d5741372aa28d24e4e6ad2c62befd8f27f9001403e221dc3c40863a8250d86dc946cf60d2cbba7ae9d9bdc37c08a2897443f925c296ea0c16503c5dda0bb45d4598944443f8ce4ed9376ba6a9dbb1410126ecb9265a0c08699257e6f864cdd19c71d88ac5347f4f1fd93a1174a4d54754d7d03736807244194e3513cb2293a298aaebbab846e3e0327dd46480f917e89ff001e963f895d22edeb9daaecdaca6aab16328f25af166adff59b84574a1ca71388f7f951fc809ee0f127be3ffb4fb5e2a0649f9131071f07cd5415e4583d7c17ff00246c7e21d8adcf6e9aeeed76f81ddc3b0732893e49eabf8f44fc8be98bb4d856993348b406745a23dcdf4cfe887af316c5e42de65470abbd8e612ecadff217d4e3d8aa2e20d62c829b7e5a5b0e264ee652f5122b452c9aaccbf7f6e9cee8d4389d27feef17d3f4f90e3dc4e51393959e40bbb1dabd6062fb4a7e1f0298a605403c78e3e422b8f3b4497ec2d19ffd86040ec1fc21100e80407a2aa99ba464193855c8366ebd5d58c0da4a67743ca3eb3b96e262ab7572256716711066928cd68e8070462eb10f106f5e6c5e5d39f1e8b09ad5a7f36b553849b15a2b32786c642502b561a72da7db79e9b8d978599e39b75595dbd5b33584c28f600fa260ee1dfb02ce92545cc87fa08ddee6c2dde726c22a874f8f240a11f9542824750de43f2a5ea06f01c16bf1238cf97b4a4ea552d1ac153992eff60101e9dbb68c53ae6e153b636df6fef71355ec26f5c8b8a75fa707251f1afe69e2ef24553770e89f907a6ab28896aff614dcc91583730f9fd33fa799889f35ca51cc8e22f166bb616f3666b76f70043b9c7b91202aa9ee233469ac10c18ac6ebcfdc5b8926469d9650ce923024668d1641171afc94466b095301f93c8be4b2e8908d95456eb9a4646414dbb41928ba2e4be2b7c00003a1f21eb066a7ff00ecacce2bb4659babe2a2ff00c3507b09ce72958b12b618f2a6ddd65565ed8ec17b4bb85e4277f7625271a77d1656d24d9946c73062e3a96326d14d4ee8e32af69f59ebc75a58a3adcb566039ce4276e8eafb4a776cf0bc8831111c4dd90f0caaf14a875ee82408bf4ca003f45d09ca8ac750a8200d9917911674bfc13d678a6f1e24774a9dbf710f9cbf8a3f9183b97b83436bb6e4b0bbd83ff8adff0042461ee58d44ce797b6cfdfdb4a50e92c41edd9237e43ebf027e41e9c69e933567b6d9037e92044c017fa67f429fc4dcb5a951a9358dc78dd26d76ecb7fc9d4d8ba044a814e3ca2b6812d9a59a442895ba81d203d8c8184aa241e2fb55aec1eebe7cfa00ee3f058413e8a926e5121118e67c8d2fd40df9db6367478d55530a871fb7c03d53f4b652230b747126a825678dacd3f071fc35043b94c09840c3c8c5c96d0b7158b9ab0b67b0ad8964a6c5af7a7eec6ac90b87cf50294f28ac49df543a4de2ed58644b2a3a8ea32cc5bd76231ea955138114fb18521049b95b979af5b86711903c2fb259a42dd876064158e57f612fa2a180a54d5171d324d9c89f99265e54370f35de48fbad9d912fd2f9cbf8a5f91bd1d1c54eb8b4dd390ba9a8231044ff00fd3443b8b89d6b171db4cc8fa9b2a33f6aa9446640dff108ff0098fafc09f9772943888d2c5a836f92a0550fe7dd50f4fa47f4121847950bd4da6af7402604f6deb07fdce8111593e43fb306fae9c0670ee59d4b4a362b472a77e80443a3144a50ee5269d5f8c8eb6d3379149f8fc1e002a91dc7b4c738f2369dc46c42adab49bb9370dc10a772a2664fe44bbf882aab571a67ae0971359406fbfd730f6015843a05bbf4e1ff00b26ff64d156c9ac59147749c8e2ccebf61af6df6ba993f7423583f987318d4acde0c53a14e83b6b5de41561a2ce33f6eb15298689894e68d6e75158a6e702b32140110005132989d9729799463a12b8c56e2c37222edbedcddfb26463d2fd627d154a0722a89c5ac343842c3ee56fccbe42ec708a022902e700f9fbf4530944561374713025c36ae6ad3181edca201e43d815f6c726a8fa8eb2c72bbada5299be68c63f7888342b174e9b333aaa224487b25d1d24c08bc7aaccae238538fe1a94922eb3e1227be66800a17e99fd241db96c6e5f55fa1486b638f24292776f4e5c249aad9c1565ebcb854c5a7a23745b21acf6719b677aa392a8ece713184c3d18e22558fd93d1dc82b27abd4d2029403b07c1441517ec9b2a2bf31acce83b7f896a4aa8f22d5707015961509f12aa25051515038cbd4ceaa8d3aa603dc3ee1f58c1dc0e1f63ade3d393bc60f241c5314146ef0f93f9eb5354d544b577392083913c43678e4230c8c82584f835925b0cbdda83d1be3d6afadd4ba92c58b60e0ce5893f10f8b80380bc77e4c37cf62d4c99d50611de790c75cb3a2aa46f5d5ba6ca9164fe8abdfc5750c54eebd425a62d35e59c75565e53f7fa61f6150c5327c2eeeda84ae7c80141f4ff1ef0cf0e45b936ea02bcc68cb323d5891a8ccc7c69de3d75326fd674d52348b83f4827fb2ac72a9361518a8ab5e1758d8f62ad0463a2b8e9001409f4cfe89780a9cd9aaf453c76e2896857b8fb3b303570ab6007d23cb5b6f4c984319b398f51527b62700037c03d1710f2d121bdcd5907dbe474f536c0ce45abf6fc83b3819e7b6ca931f10507a37cbff004f147a95397d51a3f754a0201f57c8bd09c8503ff9f4e8ca1cf7deff005a6c5db53bc8e4577533d1fc6aa94603a7914f4461e445a2647b2286b6f58f921b36bebaddd63580d5e5827284a045451e719b1443cd3294403e2637dd122ca12428d8caa689ca3a2646d364fe8572814ca4d5833144897701fa223d80c605033a2a13531871582beed6a7f4fa6dc3fcb879d60ee3769e06eee87d0482269f8065705a54b46d155840e437167d53e47d63935c2ce9870deb7e1e5b53a711bc7c78f6bf660b5662665a5b6772b46d770dd2eee4244facad57e446ccaf6e19e235b6c06c648d682d1a8791c3e9088000894e088a265f97fe453faf73ef84ada141c54cf0c76ef3703b2db75ab5c41b9b74eadbd1766a77089a65c11378b88761e8a1dc7a57d743bfff00561f11100e9d014aaef976011faecd753f32ea09040015101111eff2761ebc4413e1f350a725aff40a20afd5f3ee2e13101959118f64c9472ab6ce9cf9c72d6b582db4ee8326b6af73e663168166e1b11b375c8b14b3b56b44e2f533aa5bf3b4dbc982d8496175f9638aa9c8efb742003d00007cc700e92100372bbc50431cf64fc313328d31498a644544ba3fa07a7cca7e0528f8ec558292784353f71ab4fe9f4c14fbf129740d771862091c907eea144448000025288953213a1011e80043a59590496958aa5aa742edebcf0b2f244539c75b52f07545bcb5f6631ea01abb07e8147b800760fa4e4ae8cb5408be64c1c4d37a5684da2e4d38cbece9e3538b54c6306aeafbe41db8c49b05b67d945dbda1e5a4a24ba661111e80443e203d87a543b1b43e1e3aaf0f410ee1e7e3d09c0e28b55cb23cb13608cb2a336dc002261f5f903ee29876e97ff8f8631c4d8b2907dbea90a2077270002b65d5eb67fb85c55d5d5adcf6d84646ed1720a5a6df4a02b2ae154534d55ce9b8fd543549aa3be3b5cbf188388b61b02f1fd5609ae76e5ec3f414e803fef7303c3b6d76f0b78dbe5341e2aed1c5449cb74fbf7387dcbf8fcc7fc47b94720a942d6f61ae447ffa8b9a7f4fa69a6260e2d13010db8673f604c7bf42003d07d83e4320ec5d39149222f229a629a6451349c98e4281c00be9f4cce4c0e937d22dea0df7e7947600ebcb156d0d439339438f36e203197197918ee1ea6d8be42cc9cee646a08e770a5f943d170fbe894be3ab20f4e96011e92298c7dcee76c66be7012ae9fa86b2aa1da6558e3f6f943d49e8bffc7c2fd6f2c642ff00c61e9f45531c80ab821089492473272a292e92cf5f496f5b9035b5d6dd1f90d91976f292ebb59351974d66667f68ad97992c7b3398baf2c02bd1b39c9dc0dc07b15adec7369088b4215b01408dfb1be829d1c00473f71ae0b2e70d4e4a931e6fb6be727e1f31b0d193e51d314d7159227e3f31bd1073efa8e0e77f1196d6f24a80cb71453f03a02537d24840bd71974ccaedf1510514225e3f4154854e966a9ae811104d14db014452ee204edf4847b015501117c2de7e14ebb994e6219c85bb1943c4030b1ade2cb2e49dc821ab08b425a499a067bd9abd9277223f29bec0b7dd3d203108cd609171307ba0505a65a20bf8a690f2a2d9c36cd1ccf597581315fcd3f943d49e8bff00c5c2e8ddf1c0a603103d3e8a9dfc10444e6752a92726c8a7aa5cefd392252d88a9d7d5655f722a850c754c61ec114e41b254e97c9ddbfb5b5b5d5b9fa2ad54525ab4c5b5d674828879787d253a3077308b639b931e199f11f673c3733e1dd696e3f61368ebda005003b07cc73014a601424d31488af285b08cb1fb6e0721c4fe409987d7e893b79718c0efb83f1ffd57f18c3d84ff00813f29e6eeddbbd8ee64d07af9c359a7d75f36f273317366dae9475229ff00b2afdea8298996f4f983ee1dfc874e2cbf435b21fe1d28e53488b2b10f16e469b528ed6f618ca397328f1c7a17d7e50f527a2fff001f0b92ff00fa6e2fd10101ebb874ba8298289154e9e2b0b0c9f21ce490ad2292927224969d7484c260897da58be278d50a882ed1e41f5c5074ed1f4952899572c9157f790444c25fa4a746efd9aa8bc4a7cb4f11585f7d7b696b34a670773e9948a352d3a92fef748888a5dfbfcce0a2649e076925ce0673cd0f12db4c5b13781619eb43923fe9241dcfc62bcbff00de10e3d94fe30fe473144a50ee0c562f9f2c5da4bbc8dc91c72b949e3655d772ee5757bae5cb98b16ed42a499951eff307a93b08a03dde6a89a1996bcd5ee00b78885d3b9f41d83b55b64d8f5cbd9fe61c99a3545d710e8bf307a9040016ff008b85d9142e3397e80fdfa0295b95e3a671a48d9570e48f9ec7d171fc80392948deb7a0abd4d55bee06398c29a87e80004589d357ad3e601d6bb25cc6b774ac0db5b7c2421ba4c0a05fa820000efc0c4baf6ea02f15acd82e2ad5783798bc7073ed1ce9d752cd192c8ff994a908897bff0097c87fb944a511f12f6db461e43e726074f5373341d74791196584a501503b1be8144a46bc4ca9c2545b8c3ba29dc17bf62fdc3f88e4562f46049516e82ee0bbfedb530d5de22cb4bccd6d53ba5bdc219758c98a87317b8f5dc47e62fe4b0075189a4e1e60746846e18345049d26633e5b94f6e4246bfabda28f1105d1336504c23f40a1d800de2df870b34d2c2a4ffe5fa1ef911949a904d9bfb8171686b31446f83919dcccef9f2a0e229dba154cbac3f6e89d07dfa54c404b8a8ebc7ffc47c0d21bfd93f2888989e9f55eaa2aba7cb0c3979956be080cb8dd6cbd7d7ce7abf8d5a61e2c3fe68fd8bff57c821dfa314003fea0966cee5794c6bb5c622e71b83b4750fd2bebf40541325c356d14a4fec0ce894ab907a27e3fc478b99b26f19953572eb2cad1e17589d9cec32ed6cff2faa74914decf461221cfd14ff30ffb86a78a07a83175a1a2719d48e76790e429b9886d70d8177594e55f591e4cc799934544dc7ce40ee2997bf4e0a0547878b6f6b0353ff9fe5554f6888bb150aee55a344debe8a8c7578ef6db8c66b6bbdadf75d8d98552b3d41603cbaa814ee8ca09cfe5d244f70cd9a7ba1e6253ea330fe773873f29d8287a521d835324e012ec250f10faa641313c8315dd972af1ba8fcb8c5fcaec6db8986f90fc73f6210b9e7af53c800f42e413226a14ff0030877032423d4e44ac50db86be295d9a6185d2b4358592bb0a47bd2ba74d544975d1140df02940dd7b7d0907af6fa044445d37040786263f274d61e1142b8e8a5f1e80fd803eff00c11100e8ce512f4b49a0dfa96926e2bd7f70aded8da0b7cdba5afb6777d63aa20838d4e5c82b49ca36936df4500eea376e056f48b3554aaecb15761627675b23b2dad1c6acc8cc0ba19cb7edf3e41d19da8438b874a39fa041ec2918001d98051e20f00769ae243b94ff002b95448759370e14913b6ff6592b90b62f0f6d1ee737657c76c9762558be886eb76132a3dfe290f639fdc40eb94a935e16d894e1cd40533a17e4484a7fe02a9ff881bd8372f5d6c2abc5e84f67352eb6336a2e5e26ada7e2505c0a89565647e758caa62439c8a7264d1449df7a5e31da91e7938b95827b20537bdd07aa2dc0e0aa0291bc8a60020f73147c143a4ab1d2f62ec56196b8d112f87c03d3f803d84088b532b22fa205c57d3b405b5a5f7e9bde95d83dc266f158fe9c791943fe5f49030154407b8daf897b55dd9c81cc7b1daf2c3dda36cbaf1ed83250cce1dcb1efdfa507edf403d49e8b8f74f890a1ed6add20ff000f95c0a6424f484a958e4ae4ad90c2bb25b8bdc75f4daede8a6dc116673ef7dfe9412f4a0fc49f63a800a3b7c9a8bc871bcb671f6fb4d0771ddb2075cc1f5c07bf421dc2a872a3265752cbd0793762f63584970b5df981c5fb6c13f97b681bb695467c8730b9fb7cebae745dbf726215c3e2326fc83b8dccb555333eea7cf28ecc632bd077ee53ae874a38157a91893c6b529804131289b577896ef36b3ca2a9561034b13fc0ff0000f4fe01c04c539d1327726e050367e81dff00720aaff35676258312745a7a463241d01c0e7fcbe90771144a05530aeb3a62dd6516eaf6db71363b78ea86cda35b3e66d08c4e2002a7d10f52087673dbb713a69fabaac47fe00f4f81cca24f01639107b24dd51cbfcc7b33839623703b71bedb41bd429a4533970ba85070b027ee1fa1111f893f210ee48b299c4ceada844adc6bdd24c9d000007f06447c937027a68792a6a3d96c2317f08b306efebf728b113332dee6fe2dab2aefbfed1853414319328f70f90e991403a49a80f8889dab45576e8ed678d4620ec2cf985a05d9c6179cab2900664b3549d598c41cb8ca677a81e30b0d6b69bd8fdeeb6f78b35e1e404d26741a48c6f0e0c57b31555e17522e5acd3134b0193398dd10007eb08f6031c43a72f8880a42a7bce81c3b6d95b98f8d58316cf75fbe6bc9b2cafe459271e574e923b54e49fa0b9d651453e98088082870e8aa1cbd7ed38fd7159512098447ccc3d0888fd203183a3088a7c5c1ba0969d8800097c7c41c20d0e9382662e65e3760bdacdbcedcf20b6d57c113b368458130516f993fcca7282f4c9924eb7c36938f98c4e4fb87f0dc090124cb20891a22ddc38e4f5a699ac3ebf1c73b7353baebbfd4c4c5395853ad974945082420076edf31c0a2450a28a5fa718a3c681312037235e3817781e476a3f593472569ad8d99b6515cb6f3edde3661c2cc99ff00af076903f84a7a6ee7d5788799d911805917ab1db1e38ecf2c8365a6cae51edd27f58ff89fa77fa9e30894b039dab7201c48d6fd239c1b18ca7d8bdca6654993439c0e7508a818c3dc7f9dff004f1762f6d3817fe20fb87c0be45e98b63b57fcbff0972d2ebc731aa44ed1c1523a2727b60a9807e64c7a6cd8eeba64a10927a50bad1f7a757ed9fa2aaad9f24e8dfc15930548f517e11f1b494dc43cca1c72b6398b607679aeabb9acfca4e2d3bc88f9544a826de4179b8a45d914289015011efdfe53079019928555ec4b67a00d5db432d0f1c7552964dec55d1ba54163dd99d94e6fd75b35ccf7a56d10591231a557e297aeb95ca7cc5e44dc7224eb17f89997390dafbbeda5edff00e3a6c9a8328a6506ae5ab922cfd1481b3f6ee4867052a80a147a01eff279007477652745709981f499189824d87465d12810def9b20f22ec3e2ed1bb5de5b35d5cc6f535635357b520cc24705aad33f44eba40b2ce9ba89808797f3bff002e2ec629b4e203dc03ec1f15fee150b4a6ea38ce47da5b94d7e640c5463c9c7ced151aa87f5f953ede44151b8a807375c44b2a21aef6b69a0b96ec228864c9fc23f70e8047ce30cac83bdc4ea62d1ed4f1c2e958abc18c77f38eb6f1697d845b7abe896f50bc66b91ca45f1000fb1be79567fec107ac8556a325273537cb3f6e8c2aa55e2268e72aa6b20ceda5115f5eaadb53f83946eb8f09912b66ed774bc68ad367034bab6a2f9621de7d56f2c6ae2dd238c791d8d79456e936a68fe973d3f3ee23509a66e8bdbb93f1f8183b8781ca2aa899c1537ed15ec84b453996a259cdc9df0c83b098bd48ec73983da7a4d865166fe5867456c930611655dc4920023dc7fa176ff0e2f409869cc9ff0027c8bfe320fcad16c9ec75b4599963f6d5a9dbd3ab0bf6e9e99fa87f5f94a02225228b024404478b6e77b4c3fd8bb9314ab24555273fc23fa08089e653a824a7205dc921517200d10521b2eb7b4c5697d70f320b48fbb6b5db48b4046c9376e54cfdca1d83e6efdfa76431c4566a675beadb2d2dac9c57ab6a0abee1d47189a4778e965239ef113d4b3a597a8086518c44d49ca199493f4a43645a77c2dda3535b35e3859d1afeeb1773572ab07abcc11e65924ccb8bdb41d7a66344333309010444a250ec1dfb7406efd180443d401b010f5b57d6bedbb6cb7df96b1b1220337f997de0adda64a666e51e68564dd28b8f1978e062f5d206495032af1a88761fe843ff001f172101d3993fe4f8f60e84841e9ea6815aba871ff5f9ff0083569b62f8f99dd8137b35d9906b47c6a3d48a4a0188d1b1d069e092cb3178a9bf41c874242a209aca10e63997ea3a4e6a9a9bd28ec7a2f6638334f3e975dd3c76e88ed031cc8222225fe07897a4c84202cc9a79ca392c423c8374014c6764452759e49602644690b907595d90d18a3a2c63c09c92ff007123289b33f9981320f72f4a144c4281c1348144fa76772b3ac9cca3b4386762f693b00b95b3ecba068f522fb40b466a3b5af71367b9616cada523622d918e74d5060d01c1983432ea336e9f524e1ba2cb621c6bb01b3cbace4e31db1ec4b94aaad7de6b392f8f1bd8da4e32c3636f31dcb6a112a539b9d8af3479a9e082888f34ec090248735bc34f2aff009b2403b472439586d2ef34b5fbcf4cd3cbd791b169ba87246326d18261315c2a7389bedd02ca0144c23fd0d3214c0b140a9f1948f2b0d358f994ff002bb72281de47bb6ef241ec8354b70fab0b73b53c5dbf960ee8e25de99076848206936498ff00b232a46c2472d5fa1261d2c4660c40ddba44de3d344d06aae9576cd56ea27292d25e4a2efe5b1591051d204f14d32f887f04bd2ff90108aa2065a9e43791a03b57b27b6f71a8ac84c3dbf3a30e4c94d5dd44a2e1d536a1907ec8c667188b653dd4ba30f880fb827581550d52d470340c17228ddcbbd95dea78ba71e9c7ba7f0fd59bb4170321aeae95b54742ea9b14a1147f28e0542a8e03edf07652191218eb3438316ad632797f6aeae1ee1ae453bc9fe287ae5bf92f77f85447a09de0e249b13a0dc3ee34fb706ab23c6d36eeb2b05c6036a327d597e1c595f5d33bc5a10d50eb369bcb6bf58fd315de3ed89bf192d707633a70bddad2b3843f9a2afe67f5fe861f714c3b019351c29a27b5f236735509981454a3dc3e4934d555b26d1eb38a6aa498327aa4d7eeefd74411bb1ea231838615ff00af612dcf0c8c2ca7632a0e1cf83526db2578521a2a9acdbd5a672ebda7c03f74a299ca64da3900203378d91519ac5e31fbca7586d72d9c8c54947339662f0c676814c45d3507f8001dba54826155b8acda069791a5e30b0b22b37db6e97b1976976af3bb59d959aeeafb511c983267052530b33e316b6176b105ccb2512f1572809ca5034e4776f70ab366af923b4e4f3be742b734711234781c4a9bc77faec78a4e9c67b1ba85fd7964669d15c838fd7f6ce1f05c4dda41b2aeda2710d9ab1fd2f06cde1639897fd4be55da4ecab82ce05ba40f04ed9257cd1d80eeb70435e14d6c8795ce5de5123213791396f7275a3c45720f201961c6bbb0cb03298e67777a4e6aee7997db5bf211effd108411e920139ecbd30b5497d2cc5291b69ed31551457400e097d13089404007af100ebb39516b9d48da9bb901bb0e2a909174d3c4e5a2ea26cbc5b698ad24d39ca83a8c8d7d2aff008d7eff00d5a41dc947a72c55088948cc3fc8debfc2308802861134cbb731cb6edac5dbcc82d62c2336e6678f192f92584571358bcbf2db5cf7d6fee1db6bc34a270874dcfb5111cc9942acf94e48dbe246d945b74646366a68c63b9929d07c5e31ba4e6d94156b14a30912d843d9f94febff0053a8f68266d040a9aa972f9ab5764926b175656b435aaa7f35794c6b931a21360dc9e36099aeda94b7b7db24eb8d747128c93bf438adad0c10c17829a76011ad59220b72d9bb48d7db44ff00c95f5fe89dc412688f66fc79f0e5ce686cd5ec73574ba89a2b2a1f7fa47f4f828478e1eacd9b19c9aa56c8cf6ee38e5593cf2a76f6d89bcd895751ebb33f310c1de3bf6c574dbce42caf1c5dff00445e7816710da359b72081bb080ff08fe861ec66c45d277b0e8c090d7e4691654e9cbaee8d2d04c4e386bb32cd3c06a9f04f990da0aac2c465be27e62dbfe407c8410c4281907550cecd3545cbb7cca5578053453a53b85b48beb6c289a02ccd30c906d22f198144bf2a9d1483dd952ec98bb997b4ad329e537227d5962acae5f7322bdd2b359599f39bd9a53984faf2bcbb15adb0c786341a11787dad5c45c13a49d83806ef4104917a8aafd9b15441d726a857109b881e95f5fe88926064dc38f6e37872610bbb6363d4050af1997fed143b07d11001ebc0bd7817a51122a2bb54dc74edb26549eac318db6f5a60c7ada7da5ccfc0ec83d7ddf5458369a98771a56e26917c74d94bce3798e39dc8c9add664f64548970e64ddb47e776997a22c438147bff004007af6ca3d2a817cb341911de1eaef5c44554a39508ba2f9cb731251d910fb7542de2baf6c5ed5959d535dccb57ce92463dc44b38ad3ee9feabda0de4c59c70b33881655fa0e408920638c7337682e62bbe9322c00dd37443395106c5abaf9d96b7ccb2077dfabbc730be1cc9f02e964721f9886c42e2a97ef3eb32729ea155aa8e55c51c3cbcb997575d0c59caeb18eec3648dfac49aea96e4dbb73a497b17cc933269d3da4e6778b7205a7f984ea825868ae521a93ae7aa4f904eb06af93e47d90560727b61721fa80a02427051314c7f844200f5ec14458402550b88d816924d9362650ea3451232844849f4085f21222898e922ce39d6bbf052e6ec332cb17f1aada626e3c83539ca46e42143edf5d4281888ae62024cddb70d846bb7157643637695a9ec92d4f5ef563629dc1148b895a24b22729566c3a05e4d8ec1c20f447a599094edd1314a50ec1fc1397b0e4cc7ffb6c71bab183037594377ebc03b9ff002f8a5e847ed0632cde4e647631756837bdb54b252917cb0f71f08e20f994ec35ab72f331ce62f4fb9966792c94b72fcd96bf34e728bdbbccad79377fb4cbe8c27ee7dd6aedf2857ced42c7a098a466682abbb49d92258bb2bae22d537ff6f6dc6b1b756d6b81c84d2feb23279cdc5e215aeaa95b5d4e1375e2927787884ec0adaa5733441b2bb6e771aaad8b47a0a60e671307d74b17b256cdc1b2210e9abe65516f3eff00c2483ec8a64514d05d8db6592db4fe41bc7f2b5c1dafe49e46d4ce641ac9c5aaaa49893e72262706a548a630b3070853f2d5ad5dc6df4e8e35c161993c3482499d71307a7d7377ec74fc889b45c5b2918ac9b4c8ac55b2398361f737a06c82d5dd5c93858c73aeab64a3daaaf906a93493478fff002539fc6e97a5eaea66e1c17ef354c3de4bdb05486202c90f40728f40203f57ccbd1564541bab1ee65ed5658c53a82c99301bb808009c4a23f148c50e919587461e45570ee19a49a0ddb484cc82e0024ee6381ba0f1e88e05337efb84ba51f7bc0d9c3327483368af42b7b2b37518382f6220e225b25521f8a6cdc6d3db767883c5578ba55a462a76ee965bff00548983ee02a1faa8a61f433478f4c0c37ab884cb2e359cac7c8c7bb050c06700a8984862ff0004a53184a60288000a5c4131e1d5c6cf495a6a12a4a7b701c49c66662f7d8abf98eb5682826e8c412f4528984e82a430a2a943af5ebd953c5041d0b5218c51b6368ee65f2adb41fc6fe0711a3de373bd4e3fc90e88711fe229f7e8eb762dc6b7b41dd0a0f771c5c2a5b38668fd446748ee3dcbb6693a239423cd34aea377d7949ab9ab70733ff16b62f66e318be45d3e77eea29263ed13edd27f50fe861ec64d10034420e556db328c2c66c407d54fe225f8350f23f171875e6b6ef204299169e4287c861edd29dbc08445c36e48fac7aa30073b99c9c61e5654be326a008017f80899121008651671e498f0cec7b9db7f85a2e5160e5abd6e9b9c8fc2ec4ecb487cb7e1b587f76ea3cb8e22b9f562dad6fa96d98db725716b6e25b89023b553304833f1517218d4c51d5cd68e6c6eaa361f9072989bc34ef8d6ee30535a5845aeea400efd7320270e8a25fe2ae0220431531927874d3808f48196eb78cc5b2ccc0be562eeee32dcc33c74bc32cc5f41ac94546aaa63265264a6135cfd46f2b2b359505a524692ab19bb74d9239407b13d7e99fd1401eeab33b86750d7540d9a80dc4ab493fd911fa53f889fa114f689c37ec9beaab620e1432ca1400a5f90fd29f87647f5f68baecb53b50c53ca9c68bbd8437b5ca4ba075bbf45edfc021007af34db276aedcd5179ae6e15e3730c48c3c6cd08244d64e49f185cc32eeda3991511729091ff00e9bd42a4c67c66ac5c4beb93032a432baa2d7aa9d416b530329c0a6b15716e9154e64e907722f5cc790a844ba324f1539513797452f6fe2f6fbaecc8b748b722446d4f3164bb162ce249b5ad2ee2e6d1280d806adb3175a3713f65dbf160b9126eb3691957722dccde4b5d3bc5ce3d6e54faf5e50782796d130d3f0557c59d65510732c2c8507ef0453976aa74771f62aaa980ce4e90acab8326d5691eebaab883a974d824d24c1d26abd2075e428a5b1fdf9e0fe00c06cf77d7981b32a8df397efdd81c45450a5f254a0537f04c818bd326c4703251efe34fc4bb079f63de0891438482060127c821dfa30790022421538b3c5a9bb4d2e59bdad59acb0c54be386178944c82ce3e21694e9e453c6428b251605d01407e9109e5d11b81c3fd620e5a3b8e61fe9b892ea924ef1dfe1288bf040a52b7649b7e8504cc3ec241d0a2988112227d28dd154c54932742401ebc0fdfb770144829a2d48910b18d48afeb261d15102f452f8ff20ff8a9d3932c41c84c71b3f9516cb73bc602eb62584828d9874994670920b492bd327ecd14d4691a0ae1aed8f3af5fb3f825ccbadcd428e316c8f04b32da326d1af134d074a98be2a0180a89bcdbba2229b849577269354db462e4e9a03c9271372f48d0b1db0be535823882bec3b90a67be7caae5c964ddac46c9b7214e41ee4efed95415c3b1ff0082d51fd52a6d80896a7f022e0ecef36693a4606ccd0316aae58948854c9f3087701eca250479e6721b1fd58e286cded86d4745f97bab7aa1350a3d0a0e219a26c1750ce852f2fa4880f4987da39b1573eb8b5ed76f66195b8ad8f96cf106c7103b3853a0f4fe8c6fc4c1dc566ce9dbc323386746511744db671aec58cf981ce3d6be5a6bbae0a6f1ec89017248a8b288aa75107092cfe4db4974d65d5835b19f72fb26c49431e799567551eb5aee64daedaa91b71c8af543731ad27b78d66d51d3fdb4eb7238b7bb9246a92c916e87328d77c342e49731ece7aebabf79bb949975590a0d9470d2a25d345c37807ae174ff0040ed5b484bbfafaccddfb5a44886021caa009087505445547e9814c3d15bae6e8c53107e09a6a372638e3bdd9cb8bc3a80d545add5ce35d28d25d9c92a88aae93301c9f383650aa1567865dcc2cb264a868fa7ebda4367dc4cf1d72309993a98cf6c1fa81c49a8b9240cc8e8fc7c0dd80a61ebda507a12183af03f4621cbd112515e921ec2a18e8170a7092fdec16f16ad757369f5838cb4fb672c3a210c558e0221fd2d701144ebba60daebd99b3193f416d2f880ac9a773ad15d9c7bace3136ee9c328e13a8e4a282ab033f6cc630008f6318407e00221d799be0021d2601e31a83b76a90d1c42346eb2ce1dc8a2cd7c26d72e61ec66e3eae38b4e3161613723aa5b7db4bc4cbfb65ee4e2add05954dbae65d87774d97552fa482e56c11318f1e020d1a95c91bc73d51c9d9a2a6b7b53394bb3babb51da65c76d5c5ac8094565102888893d3b76fa3d83e0a761e95f70109ca569eaf29bcd4e2c1ae0ca1719a3c48f6118de4b9f8e99096225534db3351dc944ac09225700568d9a82dee098c07015123a4555720a457408a545464dd4d2dac8e2b597597a7c08d71e29ebc6d842bb9c4d68858aedc76fe9ae1315506a9aad5b9148f64a1decd395f32f5df8779fb47ec6387ede9b507bd166ef8598a986a0295bacb3658a7fc4debf310c05247ca0c71a0a49ab17d887a9fcfacf8aa75cfc3cecddb1796e6ddda8c7fa01a1d5973c3cf1165f729a2bc70dad5219bd81990faefbdeaaf4ebc66814cfd1fa21dfb9ca76ab497e93749954631cdb1375999b79cb3dad9e1f36da96258bb4162b1d6868f751f2e76ed126204f527a7d353d4444a0b3b5bdd78e1b2a562dcad3ab936b2d2de389c80e31daa1be4f6f2f0a58e9a7d74b86a67b50acee0f1bedb4d17233da46db052c66ba70da34a2f44f1d7db756836d788fec3ab1571b7850c6c4d4b875a90d7f6bf63929d59c3367171052b55d6501b374591ffa71d30374a322184ecfb97fd5a2a8a091900c97c1bc3bcba8ace1e1a969eb37b94ba03d9b62dccd6b6f6e05b7961147b7440484574da109f6e8049d5156cae2dc890b35a38da9df093c5be1697ceae2e24f1c9d5b6294152b48d2d4353cd5aaa445a43b561d122c8616b088a2b32832b4739238758c796f059edc34212402ff006adb3f71a7a59314942820206020185ba624040c6e818b81e859380118b79e01d83a89819c9d71687529b29c81eb0e787565bde02e1ff170d62631216ead9db9b4b4b78a8744b4e336aa0c23231526fe0982401d00760fa66281ba048005f46a4f41a34fd64c5835f3127d976c9392822528094c06ee6e8047a1efd7753a100300a5f6518262246e63115856e639db81c85214a1fd48e220516483b226a396856ce577dd5e6c37c41bf0d2eaf1a8d4a5d4eaa5e18785126fd7e1478c27341f0a7c526cf2df7113d6f51aa5b2e3efa9eb72ded4624627d95445dcd83a23d31cc4efdc9f8fcaee41b15722cea356a922293aa985e5d37eb42fbb4bd9c3eb5ed72dc4ef08fb58e02b4e1617563dd7ff00e2f72884f15c296fc3a3d39c22234e8d15c28b1ea0a56c5f1aad50d9c8bb638098236713898b89a76348ea51d9906ae5baa4e8bf8ff6b08f6001f2224d404c44566e7f32a82a350101222975e492804642029b4140eb28650a9a06f166cd6495389c1e90043a27e3f2ae5585eb831882fd14c8d594603941ba4640a455e82a0b7810ea3a5c53338107290add7eab64fa215720bb6eb3a2aecc0e42a8f504d040c072008007a7f6bf60e80a52fc3c4bf0f6c9d7b64e80003af5ebc4bd76e808501ec03d760fa02428f46214e054c840f12f40502f42529ba0294bf012147af6c9d00007c3db27405000f12f5d83ff008d47ffda0008010202063f007427ffda0008010302063f007427ffda0008010101063f00ff00f1edc807eef0c07959a7504d282a0934ebe18fac4383cb4a52e16c015503fc35a1c294fc4763329a83248fe5a69dc8232c4b4c797e6dbd9393a509d46bd129a53be1adcdcf9ca7b6f61c29aea19811ef1718ad5c273ab3a50989096ea1d520abaab218b47317196e385baf655e608996f956f79b91164b3501557192bd2f2358a8ea2b881b81855613a5025c3a0d6c85120927ae5edc3262ac7fd4a12a42b2f942935a1f68184859d4b006a3e27bff00e3451f0fdd960a241a344f5240015daa4e1a623c517180b2005547f2c781cffd589d76bfcfb7586cb1622e45ce75c25b10a0c48eda3538e499529688cc36d819a94462efc33e8f2459f9df9b1226b176be5a5f33361ecd9c9ab210fdd0153574b9072a4a1b3a1ba77c5ef93fd44f26dc2ed7069c5bb61db8fc8799b1c46dc5973c8830cad0c12d8a252ad3514cb113d0e7aa2dd6b57067284c6addc63b92fd21c5c6d8fbd643de5b16e9129fd54b3de94e0673500daca48e801b83ce4e666586f484982197038c16e4d1719c674d50a47974d2a191041c29970eb75a244504d49456893e15a0c053bf8940135ea3c07d9ff8c352cd078e2885572ae35497d2df6028a528922a28120e1a7e74c6d96dea79668a5955456b4425440a1ef81261bc97195e4179a6a7bfcaaa1cc60b3e616d217f37cb5ad3c33c4c95cd7c8902e3c80980f48dbfc53b7a5479fbcef4f250a2d36a868594dbda52e952f14aa86a062f3b2369dd6e1c15e9f1e79d8d0f8ff6bdc9d66e97a82564217b96f11bc97649792012da4e5d356586a33ad3ce5d9d7bcd9d715ad4f25d716e15ea70b8a528a8159a91427b938b7c05cc4260b09405cb48a04957e309f0a11fb71164596e463c8b138cbf6f92c2d4cbcd488ab4badca61e6f4adb901e6d2a4a86614907ae217a5de72dcf107a94e0eb3c2b6d97ebe479727913634060b50ef51cbcbd732f56f69b08909aa894a4a80c8d5d1253a11195ff004eb0281e49fb7f0d70a42c84ad0a234fb077eb4c020f515c75ebefff00c5c289d40ab3f60a1c04a55e4acd0050ca99f88f0c3af04b72dd4a320ee9ce94a7e2d5d0e274f782a5b12df5176248525d6a2ea27ff974a8a82114e83c3178e4ee6be45dafc5db06c119d953f706e7bb46b4446d2ca75a9a8c1d5f9d3e514fe16586dc715d938dd7c2dfe5cd675db2da1f7adaff00a87bfb01373991db5969c5ed1b1c86dd662b528249125c05c2857c9a0e78baf2172def5be6f6dd57894f4cb95f3705c655c252d6fb85d7436e4a75d5211aba0068001808668f25245424d73a0c81ebd71a92df943481a7dc3efc10456b4fdff763cb4a6bac14fb73a7dd8d8dcf5c4f75916ade1b26e716e3196cbcb611323a1e42e4c27ca0d16cc869250a041052a20e44e38f3d44ec0b9c37ae572b4c7b7efcb1c6750a99b5f7cdbe321378b54d8e93e6472b92952db0400a41cb21871f5ea492e28d0826999a0e9d32c00b27203d98a753dcff00e2e404900a96139f81eb80c3cd92fb8901b23a55590a1cc8cf0b9732638cb3ff003034859d3a732428a8d129a75c6e7e3ed8973b573afa958cc4966271bed7b9b6fd92c177d0a4b2bded7f8cb751112d3a41530c6b73a82527177e4cf513c8f7076cfaca36e719d8e6ceb6f1ced1b6a1c52e3dbecfb790ff00d1b8f3493454a792b90e1ccab3c2a544097a3a3ff9c5bc28a629d920d3cc57b4003d980d4071696ce44a7e5afefeb80b4abcc55411aa9fbfae0a94349f0f676c7ebe27087959845723d092282b960c7989d09709f29ecaa8aab2ccd3ad7c7165e38dfdba65c6f4e1ea06742d9fbde0cb94a4592c9b925a831b6779061d70478ceb125cfa779ccaa8706ac86215eb6d4a8975b3dc1866547b841750fc3931e4252e32f32eb7a90b4b8850208c88c216a41403f1ae7eecb15cc573ff00c55978e3203dfdc7b69df0888da172a6382894b6905b428e414e907203c30ecfbcbecca716bab31612121c424d68950d44922980ea61c88802fe553a28534a126995750c5f39a3d477226dde3fd95b6a22e53d3ef1259fea33dc403a22596d69519d749cea8512db28567d698dc9c27e86d37be13e1d92a936c99c8fe62e27236ef84a529a5b914a4055821496ab448fe650d4e789f7ddc5749d76bd5d653b3ae572b94a7e6dc274b90b2e3f2664b92a71e9121e5a895294a24e16da0eb6d5d52be8707c9594b672532492d28760a456870565b6d249ad103481df218af4c548cfbfb71953ecc693e20fd98650528416a9a5691a54682999f1c4571490dbf0e810fb64a1c3a4829505268a0a4a856bd41c2ffcbd3d45dfe249e4be39dbca9dc19bae72a971defb36dad244edb57479e59336ff00b79b05c6dcaea7e3d053527394ddd56872238e0105681d028e429d8823e1805c50285e69a1ad01e829ecaffe2a1f1fdd8a53ad07dbfedc0872d97e426e8ea9f1715a0381b2b511e4ab2252949e8312af1364ea861265243ce86e334d84975c75e2e108434da054934000a9c5cf88786a75b3d42fa885c6970d703685c214fd81c777000b2d3dbd6ff09e71b93263ba757d144f35c3a7e7205462e1ca7ea3f926fdbce15ca639276fd998b8be364edcb7bae972343b4591977e822fd3b4427514170d3ae1a76df6d7bce6db01d98925514903e6555543ace0aabf31ebd8038af603fd7827c4fe70fd7a678029ab3e9e3d72fdb8e26e4af4fd72bd45e5ddbfbbad7236933b7d128dc645d1c98dc74da52dc705c92c5cdb714d389008d0a24f4ae384f76f2bdbd766dffb838f76bdeb77dade4869c8bb9265ae33f398751fc0e79cb25432cf1e51414c64b43cb3fc396429f01ff89f4ad69493d89a1c54743852d6a0942415294a34000ea49ec0612eb4f216da89d2b49aa4e5534f860a9b58210aa2baf51e1953b62fdcc5ea1f7fedde3fd8db7a1bd2e4cebecc65b7a6ad96d4b112d36f52feaae53dda510db4926a73a63757a77f458abc70afa779cb7ad178df5e6396de47e44b736bd2a4a64b0ea5cdb96297a35794821e58a6a230fceb8bcedd254d2eaa549905721d54879456ebcebeea96b75e7144a8a944a89eb85403290ed8dd72aec62b0e48009cd284a8d5b19f6e9811a106dab3a722c280f38ff8abdea70a5303435d927aff007e2807c7f3d2e96d41b3d1445011d2b5c21c295250a5fcaae80e44f5c5ff00d66725edf44de29f4db48bb45ab9c50f5b771f28dde2ba88c1b43a85b3253b6e0acbebae416b48eb872df1a2a996213cd96dfa69438940a51b0280247414ed80953652a4000a94082481427d95ff00c4e54f0a907207ddf69c18ecb9e5b68e8544a4507f776c3258b8a8b0c515220a3ac9033d2a3edc4675857d2b710d64463f204694fcc160fe10295a9c88c5f3606c1bad9f9cbd4aaa3cb8d6ed81b62e0ccbb36d8b9796a435277a5d21a9c6a1a187684b20eb5d29ecc5c790bd45f27ddb705bc4d90f59b66c292e5b7656d784b7d6b8f06cbb7d95a221fa4694101d712a5ab4d6a2a461eb208497a52164b92c01e605114a173be9f66148491a54b0ad2684fecf0fd12527a13fad7d986e134451229f6a7a78d30888b57cacd4d3b54ff76380ecea4b28bb72adb0f30df9410843abb86f36da90d87d63371422348d353924818a361000ff000803ae673f6ffe27ae14f395f280355760477f0c16a16a6d96884b92135141954aa9dcd3a6370f29f36724d8f63ed1b2dbdf9b71bbee5ba4784c0622b65d5350a3bce25f9b2d7a6886db0a5a8e54c6ecf4dde80a7df789b8e9f9af5aef3cd91e42e06f6deb0592a6a445b138d51760b2cf46a49524f9ce24e668062e33efd366cfddf7094eccb85c67497a648bb4875456e4879e796b5aa438a355289a1eb84466ae6a8f34a421f61a5694a72a0069dcf7c195228f970d545449249cca8935ad71e62069574081901515e9ecc67fa1a8c477c0d4564541cea47dd861b0d10f485a1a6d1420a96ea929427c7e62a18f4a163768cb96be09e3269c420d405276adbca93f2e445578001ad3215ad7f53ff892b90f8604c9007d12451c5201538951ad0e9ee30d4eb4c644c8ebc945dd6da8134a643b61736facb70a3000028d4b22a32a839e7e180b8291fd39c4503ca4d350efa475cebd317199c93bb2ddb8393df8ceaf6f7156df9b1e56e4b94f2d1531fd45865c5b96e8eb552bac0569ce830eee4e40bacada9c3b0ae72d3b3b8d6cf35e66cd1190e14b122f08438113e6a1aa01a86847604e7868b49a4969417e68ee7b01d452b87a4269f54e9147e9f3a7b65edc216b6109935fe63e2ba9ca0ea6b9026980dbab2a48a5124f80a0c5528192ba8ea7bfdd83e6d401debd3150b70aab4a01dc0fdb80b14a2b300e4a00e79fb8602fcb5d0e5502a2bf018228b4abb2883a093edf660059aabd84fdbecc6a40cbda7afbb2c50f5fc807dbeec24a6a4b042923c731f2e7db10ae68690c3b1551dd6289aa3cd8cb42d2a23a1f9d032ee31e95b76d9de0f5b6f9c21c67292f36a4a92527695bdb7cea47ca0264b4a1ecc23c95ea4a87bcd301b281a7c699ff00e223ee38f8ff007e1b726af5308eb17af9abce848ea6988e98d19488cb21284369290555a01403ae25cedd92e1da36ddbe3b93ae736e8fb30598b163275b8fc992f290db0ca11995a94062fbc05e81eeb64e4de5a67eb76f6e0e4388af3f6bec39410b69cfe94e805376b832affd447ca973a1cab8dc1cb5cd5bdaf7bcb776e5b8489f72bc5e25bf2df53b21c2e16e3a5e5ad11e3a0aa89427a0030c474bc4da924f90d1ad6bdd4a1e048c659f87b3a76c01d4ff007d30284d29fa8af4a63527b67e029eccab8fa669056b4e6682b403a934ee4e03656d363bea5014ee721de980f48534f9a64010afb0781c2968fe520e6135a01f66470960b0cbf5a0d4b008f6f51853c88d163b448aad05095007dd43d0e3cc95210aa0268161598ce99e78f22278803a835182dbdf8e80f5edf9003d28712c83980a23c7b9fbf095904869febd7250d39fc4e2cdc7fb9eea99fbc380375dd78ee54575df324a36c796ccbdb5240512af24c77149e944a8530fa164ab495147fc3fc3ece980b48cf5693d3c3b75c57ff08d0104f8022bf93e65a13ff1280fbc8c552428788351fb3f2549a0f13963f127ed1fdf8a296849f02a03ef38a8cc7e4ea3ed1f9b5390c75c88ebdb1fcb525ca2a8ad241a1f034273c1436b4add6bf16958aa0f85077c5fb98fd45720d83636ccdb509e95e75ce54745c2ed2196d4b66d962b72d699374b93ea4e9421b49cce640c6e3e1ee039976e10f4cc99b2aded41b3cc762eecdf96d4ad4c2276e4b83250ec662537f3790834483db0d4d8b23fa979c8f36517d5ad6b71d214ef9c6bf3952946a7a9ea709f2db3f51ffc008a34da89a1091d3016b57f2d7f81015f28efd06431a42493e031f855aab5a50f6ff6606b5a93427209afefcb098d110b92e3aad0d32db4b75d714ae8943680a5ad47c00270cedbe22e06e4fddb7a968439aadbb46f6cc44b2e28043aece931188496d648ccac9a67d311e68e14b36c8872c214d4adedbc6159c292b206a5a021e58d35cf0cbbbdb7ef0e5992402ec5897f76ec135c9482e84212aa572200c36e5c39ef6f46bdad15763b4da9d86dac8e8958a28a527a77c3ee6c9e73e2dbaa4254b65bbb8950d648cd2d94b6ad59f4ad7174bcced8db737bed4b4b4b952ee3b1b720bcbc2237f89e36a094c941091d28aa6275b79078c39036bb109d5a05c6f1b5af506dce210749589af434c402a3ba86584b89147475557234efef384ca79b5842ff00039a4e83dbf174ad462833380ad0b4d6b4252a15f71230bad4eb06b5a834f6e7872065fcd3a81574a8208cfb1f0c593d3ecfbf43b5f1efa936deb05c5576b8b50ad9177159e23b71b6ba85497111c4cb8351551db0735ad4122aa2308f3051971010951392946a0a7d94c299716da495fc95581aea680024d0fc314fd9ff0083c849a9ee2b535cebd33180ba6aa53550134c190d32a71c51d2467f2d7f8a9ecc7986e2968ab3fa65a14a27c4001271aa6c77295cde4ea4a3c2a003d3e18096d6020a469ea682997515c55b903454d0547874354f8e029e7c2d248ab491d7dd40308794cb8b4e472a90927b1cfb610e94389391a851191f60cbae0331d7542520509e9977af7c7cd98a57307dbe1801668b272153550ef4cf3a7e60f8feec3f2140a90c36b5ad1fe20815207b6984cc809fa48882429b58fe62c039e824548a610f5993f4852e79721974fc8e1fe274950a9a7b0e24edfb9dde0725fa8fbfdbe43fb778b36fcc6a5c882f0414b572ddaec67166d16f6de228d28a5d73d98baf26fa83dfd739160625c97368ec18721e8db37685b96e2971e1daed0dad1117210d0014fad2a5f6040c262406c8091fce91534a27a8a9e86bdf1f4c54a79d4d503493434a65952a72c1325b355574b6914501952b4a76f1c352d7154a815aa6b419788cc1a8c19115c0c9400032b02a7fe1ec6b5c5bf68fa78e1bde1bf2e1717da8c2e70ad7322edb87e628203d3af8eb220b0ca2b5528294401d316ddc3eb8b9aed9b36caf36cbf2f637143a8ba6e1425684ad51dfbfcd6950599093549d2d903db4c5b2efb2b8363ef4de96c5b6e35bc39567237a5d94fb54fe6b6ddc23081154a2330d34819e19b35876f58ad3022464223b36c8302032cb6801296998f198425284814a00301284e901390a0a0e94000a014c0248fb3dbefc751f61fefc1a280a13fc3d87c70a43a94ad3a0955402143a10506a0d7170d9dc9dc77b43776de9e8718976fbfd8ed53e3c943892d9494c98aba12951a1ec717ce4bf42db84705723be97a6af8e6f0e2a6f1adf257cee29104d3eaac2fc9715fc2af2465961ee1af54fc6975db0fb6e3ee59ae9f4ee3960dcb1d2a20ceb1ddc27e9e7b208ad0282c0cc8c5dae905c4db61db1a43ecb0fa927ce5a5254a4d144a8034c196a6511a1c3514f9e1012dbc452a124a7e6341db06941da99679f5c54751dc7c7163dddb765ccb4de76eddedf7ab35ea03ceb12edd78b54b6a75ba6c67da525c8f221ca610b4292410a00f5c714f332e5a1ce45db96e638ff0095a197126544df9b661b31264d7920eb4377a6d099082afc7a94ae986613ca2dc882ef9ada90a3a8e93f354d6a413f7634d4fca027a9ce83bf8e127d983efa7d94ff00c1afe85953c14aaa147349ea283df87beacf956d4d74274a4151ec075ae470fdff0074ee8b5ed7b1dbd05c9773bddd6df67b64600575c89d3dd62335d3f88e78992f7b7aa2d93bb6fd6f4bc91b638f2731bbef6f3ed6b498da2d958c97ca9040ab9d6987e3f1b701733eea65a5290d4fbe3567b233208a80e22389ee484b64e7f35154c4b56d1f4d6d45b529c3f46d5c6632e496dbec1c597d616a3e386dcdcfe9b3fa8430a1e6336fba448aea91535095ab5202a9d2a0e7886deecf4b3ca76e52f409b22d77ab24c4355345ad0d2ca16e53ad053d988d1e573a5bf85af531b424d979713ff6e39f52a02ac352f4c88c485e414b281866e5c4dc95b1f92e03d1c498f23676e5b4ee169c68a75856bb6c9782069cc855081854c51115c50ca3b675272e9523f88e3e9a4a0e90424288fc4321e0477c34e26a0e447eb9600f0fca3dd8790013e636a4d72350452943d4e2e97cdd777b4ededbd638b22e373bc5ce646b7daedd6e8cda9d912ae13652da8f1d969b4d54a5282478e3777a69ff002d79f1b706eb65526c3b9bd4638c21fb15a9fd4b626b1c7919ca373df64ea027b9f26afc0914a9dc5bd396376dff007cf20eef96edce7ee7bddc9eb9cf9d365bab75e7a5befad6bff9ae1d084d1b40c929032c3624cf6d0d28d43295fcc41ec0541eb86e2428de525c5a50f4800eba1342a2acb3230d47b424c995a0296f14ea295115553dbf76247f5788644906829968575008a8188bb1bd3670edfb73c14496d170dceb872206d1b130b527548b9df642445a3685ea296f528d3161e4df5dbbbc737ee982966e5ffd2a2c0b936dd830a5b690ea63dde6b2e333af7e538334ea0d288e988bb0b84f8df6971b58ad2ca62c4b46dab143b433e5b69084871e61943f21442732b5289f1c3af3b2b4851aa5b4b9514ed44e12daed0992deaa1905bf9f3fe20aa675ae3fad460f2273c8056871f71c4a6bd53e5a894a69ecc13f75075381f9143da70aa92348d591ea4763efc29c96d29b758d4a4b416a6c3b4f9ab44fe2ad3f6e0468f213664c62021b9274adfd1d1282aa170903e384717faade2db06f6b5a96fb9b72e12d0a87b8f6ddc94d2db66edb7af1196d4d86f216bd7e5eb2cb840d48389fbb36646bbf22fa5fdcd35f7f69ef78f1dd725589971657ff006f6e94c7416da7a3a0e94b868169fb70ddae3b488f6d8692e8891d390a535acabf12abd7338cabf6608fd7d9836765216dad41cd205575ad680f7a9a61cf4bdbf6f4a8bc3bea664c6b7b31243da61daf92e3305ab04e4a96b0db6bb846d51f20352c815cf11eed09485f9e10a4b8820b6eb4e27505a48eba81c6a3dc03f1c0a7ebdf0aff0088ff00e08ae331848d054a59a2520f5fd980a52479abfc0ceaf98f7f676c3cab4b4274a8ca09911b5796a64ff10554549f0c5c790393772d8362582db19c9576bcee0ba46b6dbe221b4296a497e4b8da16e1427f08aa89c6ebe20f449b064f306e88826da25f2cdeae3fd23665b66a35b0b72c715a8f225de151dc1f8ea96cd2808c3cc73973cef299b4a43ae3b1b62d8ae126c1b49942d7ad285c084ea1c9fa0002afb8e0cb20305eb836f4904959485e6b5a89254e289d4a249a9cf338f3111502385821a56ad5a075495050eb80188086680742af8ff16023c96401d28835f7ead55c291e427cd3d1c05597b86a23007ce95f89a2924fb800733887ba7d3ef346fde31b8c292894da36f5f25b36b75e6cea064da56e396e7c13d75379f7c58f8d3d7f71f237e3c27478a79cf67145bae48b604a1b5bbb936a8496264e06aa2f4771a42bba1386391fd3572a6dae46b636cc75dd2df025a1bdc3b69f9084b8989b86cca57d55bde01406a214d28e49592080dcbbbc94c4869a243caa90575c814804d30cdcd0ef996f90942da94805482959a05103309c225bae0f21c00a169cc1a80474af507099886496149f302ab9f97fe2a50572c349b6a0cb2e39e53840212d114a859fe109d599c5e7993d4972359b62edab64479e836f7a4b6f6e0dcb39b412ddab6dd982c4ab8cd90e0d228036927e650c5cb8ab8905ef833d2c459d223b3b360dd1c6373f234765d52635df7adc22792a2c4a6f316f42bca6864ad649c06a2b21c90e8fe72960a80503914e600a76c07541c370fc519b701503fef6ae80d7b60397743cf3942511d4bd02bdb2a90054fc70e33721f4ac1068842756906b4a509afbf10762706f1eeece4bde17894d44856bdaf6199779c5c94b2db0970456d6dc5694a34f31e521b1dce36af3aff9956e64dbd0e390ef317d3ceda752e4928551d623efadc695869875596b8ac215a6a52a3515c42e3ee05e3bdabc75b56df1d865bb6eddb6b50db792ca0210eca7db487653e46654b5124e10f26580d8002d8d3fcb23be54d5dfc7024f9212f752a47c953e240cb017f3050ed5a83efc06d85b4d529f329bd46832a0cf2a8c554ad4e1eaba50663a01db3c75ebf1fdc300787e439d2bfbf00257a540d6bd6b4f1e984a96007929a25c4ff0aa9d69dfa61b7ef0dfd4cc65454cbed12d06c8ff0096424541228316c53f2d5f5305c496d4925b4b88411a41483994a40cf1baf84f9776c44dd1b3b79d9a5dbae51264669efa7f3d953499d0dd712afa69b194b0a6d69ceb974c5bf756c79973defe9d392a7cf56ddde2882b439b6e6bae3b21adb17f4b61d6e1b8db5ad2d39ab43ba3a8a805b9e9f99a7b248fe2d5dc100e43c0e28005114d42bf87efe9843cd292bd40024e7a154229f0f862c1bdf6cdc1fb3ee2dab77b6dfed37486e2d99302eb6a98d4d832d97104292e224b2922871c67cd1618236f6eddb7118e3de4cda0b9c27cab06f2daf0d88129f3214db4e49837a435f551dd52105c4ace4298f2358f35340524e75191af6fdf8d0b1a08c854f5cfefc2d3dd2acfff00040fd7b9c7c0609d3e6485a5423a695ab805539e74cc6785cabaea2920a900fe040272423e0712792b99f76451bdee56e94368714599f69fdd7bfe7042cb0cc2b736a53b0da69dd25c94ea50ca507f112298dc770df3bbeefb4b88245ca5ff00d9dc41b6a6c885b72c3635384448930b2a6ffab4d532029e75c0a2a709a1a6036fbe13281156142841f03d4f5fb70dc771a3adb1442fa009cb2190fce1faf6c0009ed4effb30c32ea0452d2be59450343a08cc02948528fbce58b3732fa6de46bceccbbc39d1557380cbef2b6f6eeb6b2ea5c9363dc5692bfa5b85b66369d27524b88aea42927ac4e24e546ecdc4bea8a1466d171e3b9b704b16fde2e32c21522efb1273fa132d0e3809fa634791f8749a54b3618709c950d969290169252964039051140a14eb5c2db6a5f9c88ab2872013934a1914907ad08ed85daacd25b6a442d25e65c42820b550027c695ef8bc6db7ee96ce45f54d79b56bd8fc1bb7640913d53a4a0b316f5bca5c72e35b7ac4c48554a5d522448a69423aa85d796fd526fdb94b01f96e6dddabe63d1f6d6d682e38551ad563b405263476996e88f334eb5d2a7338a6b1a1af910120e684e4935a0cce021a49511974a9f61e9dc9c49665c7adcd47fe91e200d09f1196441c290f953ae90743c5745a757894e648c5a2ef60dbd2f8cf8163cc8dff0071f346f182f45b4ff4f2f054a8fb6a3bc1b7efd745c70af28341684aa9a8d316cdafc1db2e03fba5b811d8dcdc8b776634cdd9b9ae9e5a11327c9b82db71f8c97dd048692bd281900065865737534d2d685a52144957f10e94c8fecc25b61bd2c252341e84f7cc77fd2a);
INSERT INTO `tbl_images` (`id`, `name`) VALUES
(2, 0xffd8ffe000104a46494600010100000100010000fffe003b43524541544f523a2067642d6a7065672076312e3020287573696e6720494a47204a50454720763632292c207175616c697479203d2039350affdb00430006040506050406060506070706080a100a0a09090a140e0f0c1017141818171416161a1d251f1a1b231c1616202c20232627292a29191f2d302d283025282928ffdb0043010707070a080a130a0a13281a161a2828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828ffc000110800ec00d203012200021101031101ffc4001d000100010501010100000000000000000000060104050708030209ffc4004110000103030302030408030508030000000100020304051106122107311341511422617108152332428191a15262b1246372829216253453a2b2c1d143d2e1ffc4001b01010003010101010000000000000000000001020403050607ffc40029110003000202020202010305000000000000010203110412213105134151221442611532526291ffda000c03010002110311003f00ea94444011110044440111100444401150f0a9b901f48be7776e157280aa2f9ddc15f48022220088880222200888802222008888022220088880222200888802f395ed8e373dee0d63464b9c7000f3257a2e67fa5a751eb2db491e94b2c92446a5a4d7ced18f77008841f521c1cef839bea5018bebbfd20aa1959358b40d63591b06d9ee71e092ee72d88f603f987e5eab4d52f59ba834b432d1c5aaae06290e4ba52d9241f291c0b87e45637a67a2ab75d6a465b28dc2285a3c4a9a82dc8863cf7c7993d80f32a77d5de8a4ba56dcdbb69d96a6bed91b47b4b6500cb09fe3f740cb4fcb8f3cf75479253ead9758e9ad975a4ed9d48d756d1596aea1fb46cc19217dd2712404e787376f1f9647c5661bd38eb0d21df4dac1e5ff00dddd6607f701692d1ba8abf4adfe96e96b95f1cb13807b01c0919f898ef5042ef481de2c6c91a0e1ed0e00f7c1191c7af659f3e5bc6fc1a38f8a3227bfc1cfd535fd72d1d699eb6aef91496ea56ef924a99e9e6e3d373c6f27e00f7587aafa4feb592d6c82182d50d58fbd542124bbe4d2703f7fc9607e909af24d4fa965b4513c8b3dae431b5a0f134a321d211f9903e1f32a3dd32e9b5db5f554e28dcca5a1a7e25ab9412d0e3d9a00e4b8f7c7ebf1ef34d4f6a3854eeb526e7e98fd26eb24b9c543af21a614927ba2be9e32d319f22f6e705bea47e8baa28aaa1ada48aa692664f4f3303e395872d7b4f2083e8bf3c7a91d32be6849192d7359556e94ed8eb2004b377f0b81e5a7e07bf9679c4a7a23d6eb8e827c56bba07d769d73f262ce64a6c9e4c6738c773b7fa1ce6f2d52da651cb9f0ceed458fb1dde86fb6aa5b9da2a59554352c12452b338703f03c83ea0f20ac829202222008888022220088880222200be438fa2b7abada7a431fb554450095e236788f0ddee3d9a33dc9f40a05afee975a3d4311a0ae969e2a4a07d732160696d4b992343dae04648d871c1182f07be310de91296cd8e8bc6967654411cd0b83e391a1ec70ec41ec42f64440444520a2e69ea1f4e5dd47b6beaa2ac8a8eed05cab48748d26391be318f0e3dc10d8998efe9f2e96ec0e56a4a9f6aa8b75f20a18bde9ae735335c0801b1be5c3e41fe10e90fcc7cd70cf6e2768efc7954da642ba43a1a5d3f63a98696e023a5a820c9594adc495af6e40735e7ee42de43481b9d92ecb41199f7fb3f48d8f6c73dcd8fc826417098b9c47f165c43bf3057add6e56cd35667555c2a20a1b652b0460bb86b40186b001e7818007a2d4b5ff0048cd35092da2b4ddaa5c091993c3881ffa9c7f50b0b5932bed26d5f5e35aa3251f49f4adb35743575d4027a5aa981a776ff0d914fc911be3186969c1da46067dd23b13b6c13dfccf3c7fe16bad3faf6c3d43d3b5f4f6895f05c840f93d92a0012b1ccf79af6f70e01c01047a73853ab5d6b2e36aa2af88623ab823a868f301ed0e19fd5572f749762f854eda9346eb7e803aefaae7b8d9eeb051dbeae532cf1ccc25d09272e2dc70e1dcf25b8e07c56cbd20ca6b5d8a92d7a26859576ba6fb3f6e9e711432bb1973dae0d26424f72d6edf2078594bcc1f5cdca3b4c8e1f57c718a8ad603ccc0b888e223f8096b9cef5da0762739d680d680d003400000380076012f3373aa2270a54dc91fbbc13dca82a2df79b0d3d75b2a232d9594d55e23bbff000bdace7cc169272070b913a8dd3facd3370f1e819355d8ea5c4d2d5363396f7fb290632c91b8c169f42bb6d626f0f7dbe68ee511020dec8ab5840c3e324344993d8b09073e6ddc39c0c5f06671e914cf85579d9cf1d06ea1ddba6776a3b6eaaa7ab874d5d46f8fc7696880976df1580fe1c8c380f81f2e7b56291b2b1af610e63802d734e411e442d1bd67d1f16b1d1b5713cecb85135d554b279873412e693e8e1c1f880b11f44cea4fd6f687e93bbd4175c285bbe8dcf39f1201f873eacfe9f25bb165fb16cc39717d6f4746a2a37968555d8e41111004444011110054554406bfea859db3c94577a9a4171a0a48e582ae8dd11971149b732b1a392f6ecec0676b9f8e719865e6f52dadb65ae9e786e16b8240296e7e26e3253c876be195d9c1206d91af04eff0b040711bb725debe9ad76eabafae7eca5a589d34aec670d6824f1f92d0f5f4f5553a7eed572ba48edb555ef8aed660d60742c32e311e0e2391cd7465e0939dce70c3b04f1c8b5e4eb8ff0046d3e9aca68e8ab2c3238ffbaa40ca7dc72e34aec98bcf386fbd1e7fbb2a65c1195a3686df43571da6eb68a1aaa5ae9ae90d2b6a0d74924ae89951893dede72d2d8e4e3246395b8aed73a7b45a6b2e158e2da7a485d34847276b412703ccf0a715ed7923246998fd4ba81b693152d253bab6e950d261a663b6f03bbdee3c31838e79f4009c03139a92e97298cd79bdd690723d9281fecd0341e3196fda388c7de2e1dcf03b0fab2c756f8e5b85d5ae6dd2bc8967639dbbc16f3b2107c8301238f32e3ddc564161cfc96dea4ddc7e2cb9dd18b658689b196135cec9c92eaf9dceff00517e71f057b474d151d3c74f4b13228231b58c60c0039ec3f3f8af74ce39f4595dd57b66c58e67d2392be931a9eb2e9aea5b29716505a8358c8c1e1cf73439cf3f1e40e7b01f3523e8bfd1fa1d6ba460d417abbcb4b4d57e20a68699a0bfdd7966e7170c776bb803d3951cfa4668aafb46b3adbeb2073ed57393c56cccc90c93037b5c7c8939233dfcbb1580d23d5fd67a4ec0db2d96e822a0664c4c7c2d798b24b8ed246792e257b38b5d1753c5cbbecf65a6b3b1d7f4c3a8d516f82b37555ba56490d43063734b439a48f2c870047cd767e9caa8abb4eda6ae9a164305451c12c71306046d74608681e83385c4767b65fba87ab844c74f5d73ae94c93cef3bb009f79ee3e407fe80f25dc569a286d96aa2b7d2e7d9e9208e9e3c9c92d63434127e402c9cd6b491b3829edb3ddb146d95f2358d123c00e7639206719f964feaa3fd41d5b45a2f4cd45debc3a4da447042dfbd2c87b373e4060927d01ee71991ad09f4b5f1c58b4f869fecc6a252f007776d1b79f9172cb8215de99af914e21b46a0bd752759ea6b9bfc3bad7c6679331d2503dec6b7d1ac6b4e7fa954a2ea16b1b299e86e171aea8a77b1d154515c1cf78735c082d21c770e0f70415b7be88172d216e37475deae929b524b235b03ea9c1998703dd8c9e37176720738c7a15f1f4bdbfe93bafd4f0d9a7a3acbe42f719aa295e1db22c70c711c125d8239e307d57aeb1cfa48f1fbd37b6cdafd3fd5b43ae74a32e5440b24c18aa607bb2e8a4dbc827cc1ce41f3cfa82b8d7486a1aad25ad286f5407ede8ea77edf27b738730fc08c8fcd6e2fa24baa5b59a971bfd8bc088bbf877e5d8fcf1b9682abff008b9c83f8cff52b8e28515491db2d3b84d9fa7d68af82e76ba4afa4787d3d544d9a370e72d70c8feaaf168ffa27eab379e9ac56bab91a6b2d32181ad27de30f763b1e8325bfe50b781380b4198f29a46431ba495ed646d05c5ce38000e4925561919344d9217b5f1b80735cd390e07b10544f5f490d51b6da27f09f1d5ca669a1906449145871041182dde62041ee0e3cd6374cde9b65d0f63a5a567b657d4425f4b4bbb6e232e2417100ec8da0b4671c70064900d3bade89eafd9b0822c4e99b94b75b441553c51c52b8bdaf6c52788ccb5c5a76bb03238ef81dd6595c8088880222202dabe8e9ebe8aa292b626cd4d3c6e8a58ddd9ed702083f3195a8aa74a36d9ad2d71dd6a22af88533c51c92b4b65a89232dda26c1d92bd8cc9076e7193e595b99632f765b7df284d25e28a1aca72e0e0c99bb8070ec47a1f88f554b8ecb45a6babd9a96e370d3b41036d8279a8e2b430cd0d553bc86d34b1b49f0c499399761712c21d904e47385ac343df6f725cedb679ae9572525c2ae1f69867778a1ce6b848e20bb904ec20e0e393c656d9eba691dfa22dc2c7411b28ad351e3ba929e11c34b5cdded68f36e73f2cad29a326647ac34fccf7011b6ba3e73c7bc0b07eef1faac5915636a51f45c0c38f3f1f264af2ce92ca7aa028bcf6739f013d531c2a76ce7842765258e39a27473319246eeec7b720fcc28956f4c74556d71aca9d3740e9dddf60746d3ce7258d706e7f252f08af392a7d328f14d7b459db2d76fb54021b650d2d2441bb76c11358303e415e799445574ebd969953e10583d5fa66d9ab2c3536abcc25f04982d91bf7e170ecf69f51fbf9ace224d397b44d4aa5a67296a1fa3dea8a19a53689a8ae7067dd225113c8f8b5dc67e44ac7d9fa0facab6b228ab2969e8207387893cb3b5c18d3e7b5a4927e0175ea2d6b997a31be14b7b221a53495b74168faaa2b4b5cf73617cd3d43c61f3bc34fbc7c801e43cbe6568fe8274ae0d42e3a9351c25f6c63c8a6a63902a1c0f2e77f203c63cc83e40e7a66ae9d9574b3d3ca5c19346e8dc5b8ce0820e3bfaaf8b6d153db6829e868626c1494d1b628a36f66b4703ff0079f8aaaced4bfdb2d5c74e97e91695f45e0b69ab2d34b0b6e34077d306b433737f14391c06bdb96e318ced3f8429edbaeb4d70b4417182502965884bbdfeeed6e327703db1ce73d882a2c160aeb79b6d168dbedaab6e14904a2a1fb209e41ba663b6ccf6869ef90f70c05db8b95f94ccfc9c2b7b9460b58f50acacabd4b74a7ba53cd3c14828adfe1b8b9ae786b9c4b5df77991ed19047118cacb5a2dd53308285933dd77b8d3c666a988e451d2b46d6ec776186921b8fbcf2e76300e2f3575e6bad16d6496da017091cf730c0647372d11bdd8680d7124ecda063cc2855a582d1054df34a57c41d4d04b24eea46661a995ef698a8c46ec90d680470439ae906319215a6fbbd9cea1c2d1bfedd434d6fa2a7a4a289b0d340c11c71b7b35a060057483b22da8c8111148088880222203ce56078c1edf25ca3d58d24fd1faa5cda37be2a1ac79a8a0947789c0ee7307f81d823e040f22bac54775ce99a5d59a7aaad95676178dd14a00262907dd70f91f2f3190b965c7dd68dbc0e5be364dbf4fd90ad197d8f50e9da4b802c13b878750c6f664a387371e5ce48f810b3839385a06db5b79e9e6a9a9a5ac85ac99a1a2a6989223a8664ed918ee3e387738fba7b7bbb9f4cea2b66a2a6335b2a5b21663c485feec9167f89bdc7c0f63ce095e55c355a3d8c91d5779f32fd322bd4ed7a74dbc5b6d2c8e4babd81ef924196d330e7048fc4e23b03818e4e780759d2751b54d3d4994dc8540ce7c29e06161f8600047e4428f5fe4a997505da4afdc6b1d5b30989ee1c242d03e400007c005643bad538d4ad1ca2135b674f68bd4506a7b0c57082330bc38c53425dbbc39001900f98e410703823201cacea807446d92d0e8d754cac7b3eb1a8755461c307c3dac635df27066e1f30a7f838e3b2c592754d210fc04420b41cf1f3e1625fa8ec91c334cfbd5ac4509db23bdae32187d0fbdc1eeaaa5b2766591475fae34b474de33b515ab67f2d4b5ceff4839fd958cbd49d2cd8cbe2b99a8c63dd829e479ffb54f464caa7e913009e4b59d77576823cb682cd71aa233874af8e069f97bce3fa8518d45d49bcdde97d9e8d8db331c3df7d34c5f3387a07e06c1dbb0cfc4053d3f6cef1c4cd91ea64ddf34d1c10493d448c8a18c6e7c8f706b5a3d493c01f350abcf53ec342f962a132dd2560fbd4d81093e9e29e0fcdbb969cb9dd6e7750d176b95657359f75b3c99603ebb40033f1232acfbf7f2529caf47a383e1eabce564baedd46d475f2ca62a98adf0bbeec34cccb9a33e723b249c7980d51aa6aa0dbc52d7d7b64afd9511cb50277991f3b5a465a5ce393c01804f9056dfa2cce94d3772d537516fb446d32000cb33f3b2069fc4efdf00727e0395786eab526dcdc5e2f1b0d76f06e4b66b1b7de5f34d436dbcd5d2534db1b550db9f237c4d81dc35a0bda76bfef1681cf7526d2ba4db35de6bfdd29e7a77ccf64d050ba676d8dc1bb7c592307678a4003807000e4924acee85d2d47a4ac51db689cf970e324b349f7a479eee3e43b0000e00002916d1e8bd2c7854793e033e6eeda5e8fa4445dcce111100444401111004444042ba8fa229b595a3c27b8415f4f9752d48192c71ee1deac38191f23dc2e58b85055daee92d357c1252dc68dfb5cdecf8dc3b16b8791ee08ee30bb6b6e4616b8eaf74fd9aa6da2b2dad8d97ca56e217bb8133339313881d8f383e47e6567cf87badaf67b1f17f23fd3d7d793cc3396ebe09eaaa5f542773a6908f14cce73f790300e49ce700056efb7c9346e64d5458c3c110b7693fe6393fa615d31ef7574ed7b248fc0fb17c6f182d93bb811ea3818f9af75e7bc952baecfb2c7c3e3655dd2f0cc8417dbdc5132217dba9898d0c630549635800c000331c018e178c973b8487ed2e77278f47564ae1fa172b540b9776ced3c2c13e54a2de6a3a79a674b3411cb21393248ddce3f124f24fcd7a32085aedcd863691d88637217a228ecd9d960c4bfb500e3b89fc5e47b1c2ae491ef124aa61146d96512bd20888a0b24113f4523d11a36edac2b5d15b23f069227b5b3d6c8df722cf7007e3781f847032327055f1e3ab7a467e4f2b1f1a1d64658e98d3f72d4b768add688b7cae23c495cd26381a7f13cfa7a0ee78c7724754e84d2745a42c915be846f71f7a7a870f7e6931cb8ff00e0790e17be91d336ed31668add698bc385bef3de797cae3ddcf7772e3ffe76016770bd6c385635fe4f81f92f92be65ff00d4a8f3555468c2aaee796111100444401111004444011110145e551236289f23ce1ac6927e417a950aeb35c9f6de9adfa4888f16783d9184bb1832911e41f86fcfe4a1bd2d97c72eed4afc9cb172acfacee95d71e3756d4c9547191c3dc5c073e8081f92f054000181d8703e4aabc2baed4d9fa8f1f1fd78a617e10444553b044440111100444033d94a21bd2d9b0fa55d389757b9d5f747494f64612c698dd87d4b81c3803ddad18209e093db18c9e94b5dbe96db451525053c54f4d1376b228dbb5ad03c80510e8953474fd34b37860812b5f31cf9ef7b9d9fdd4e87ecbd9c30a27c1f9afc8f2f272335777e10c602fa445d8c011110044440111100444401111004444053b2d3ff00494ac1169ab4d187373515a1c584f25ac638e71e81c59fa85b809e17397d24ab64935a59a8dc07874d6f92661c725d24801fd3c26febf15c7356b1b37fc6477e542ff26a9441d9005e31fa53a49796111140549fa6115473d86500cf91fd508ef2bdb2889faa2689ec82f974823639e7b3324afa5e552d269a66b464b98ec7c4e085695e4e792d747e4ec4e9c41ecfa0f4ec40018b7c1903d7c36e7f7ca9237cd60b41bc4ba274fc8dfbaeb7d391f2f0dab3a3cd7b93e8fcb7279a6caa222b140888802222008888022220088880222203e4f6385af3a8162b5ea7d5367b65ce9c4cda7a59eade58f731edf7a36306e690769cbce33c960f45b0c9c0512a770a9d5d799c066218a9e9323be407c8ecfc3ed5bfa2f37e5333c3c7aa474c2dcd6d322e3a49a3f2736ea971fe6af9ff00fbabea4e9ae91a687c26d8e9646e7399f74cefccbc92a608be25f37357ba36bcf95fba6446fdd3cd3578a210496b8695cc0447351b443233e45a307b0e082385188fa2564c8f1aeb7878ce486c91301fd23cfeeb6a61554cf3b34ad2a2d1c9cb0b534c8351f4ab48d33daffaadd3b8707da2a65901f9b4bb1fb2cb4ba1f4bc90b627e9fb59634607f6668c63e385235454ae5e6a7fee2959b257b6c82cfd28d1f33dcefab2489ceff95573300f900ec7ecbcd9d23d201bef50553cfa9af9c7f47a9f61555973b3afee2dfd4e54b4a990883a5ba3e16ed6d983c63ff92a257feee72c26b0e97e99a7d3976acb7db64655c14cf96302ae7dae2c05db7687f9e31dbcd6d25e550436279730bc069cb40ce7e185d3073732c89ba2bf764ff932fac8293ea9a1faac3050780cf670ce1be16d1b31f0c6164147b401074469ec6302df4f800631f66d521eebf4187b94cc0c2222b901111004444011110044440111100444407c9eca1fa62a1b5b15caba3dbb2a2be7da5a72088de62cfe7e1e7f3529af98d3d1544e23748628dcf0c6f77606703e256bdd177bb0dbb49daa9df7cb607b29d8642eaa60f7c8cbb8cf1ef13c2f07e77b3c4a656ceb8bd93245e14b55055c225a49a39e23d9f13839a7e4470bd9bcf62be39e3b9f68edbfd1556374b8c56d85b2d432a5f1b9e19f614ef988e09c90c04e38ef8f457b903ba678279c24cf9fe48931b66be5b2f71992d370a5ac60c6ef0640e2ccf938672d3f038593506d6f3d25aaf960b9454701ac6d634d44ed686b853bfec1c5c7b901f34671cf6f829b87039f9ad19f8fd12b95e19099f48a848e50107256424aaa14c84cf75694d3da40c774f9ec86d7576c6939b655c94db718c30e248c0e7b6c919ca9537cd4174f9107546f90b23635b556ba4a87bbcdcf6c93b33fe9da3f20a743cd7e8dc2b778269fe8c94bc954445a880888802222008888022220088880222202846410bc3d961ff96c3918fba3b7a7c95c2a1ecaae53f637a358f5074669c7565824163b6b5d3dc1cc94b299ad320f669dd87600cf2d69e7d17853698b5d1b4b6db049400905c28a79200e23cc8638027e241521d7d3b05db4bd3ba46b5efac9a50d3dc86d34c0e3fd6178b79202f33972bbeb47a5c49558db661adb6c7dd7573adedb95d7d86928fc6abdb5af05d248fc42d18391811ca4e0f9b739e14b468cb7ecc7b5ddf3d81fac66c8ff00a959f4cc7b4dbee7743b715b5f3787b5c483144ef0587f311eeff329985ab171b1f55b9461c95fc9e88b53686b2c315c1af8a7a892ba310cf354d43e590b01c86873892d00924018e7954aad1c251f617ebed311f8a3a90eff00b9a54a55575ac18e969c94db2271694ae8e3d8dd57797379e5f1d339dfaf82a2b6765e64a370abd437035514b243296c34c06e63cb72078448c800e093dc2dab85ae6af6516b9bd513321b550c170030000f3ba27e3f28a33f32562e4f0b0a8ed328d1c67daf5461afd417082cf73ac6ea5bf78f0d349347892168696b1c461ad88039c739fd94ca874a45516ca7f6bb9de6573d8d73b35af6738fe5c28f6a919d2f7b1b8b7fb05473e9f66e5b16dbc5be97deddf64de4f9f1dd389871d4f9945b952a2b48b1b3e9eb75a2a66a8a385fed1331b1be69657caf2d69381b9e49c724e3e2565f185545e8a952b48c8111158044440111100444401111004444011110043d9532be5efda39c63d54035cf531d52dd5da44d1514b5d3c62b2534f148c63dccf0dac71697900905e0e32158fd6b7c78df47a3ee71b2339925b8d453d2b180725d90f7920019e02f2a6d4b537bea8699a8923862b44c2e115bc35aef1642c6b7323ce701ae0d716803b60e79c099750eacc5a62a2923dded3727b2df006bb0e2e95db091fe169738fc1a567eb8f37f25e4ed392f1aea8fae98b58de9ee9b31b1ac0fb753c85adec0ba30e3fb92a50bc28e16414d1c3180238da18d1e80703fa2f75a12d783884445202d63ad0575075069ab69ad9597286a6d8e87c3a431ef8cc72ee270f7343b3e20e01cfbab6728b6baa57b2df4d78a661755d9e7158c03bba3c16cadec7bc6e7e063b86fa2ad4aa5a64cd397b46bfd477bac9b4f5de11a5752b5cfa29dbba4a58d8c6e6370c9778a4607c33f9adbb687f896aa27e41dd0b0f1f10162756dc20a7d1779b83878f4cca0966dac23ed1be193807b723faac5f4c6e95d3da1f69bcb22171b5b6289cf85a5ac9637460b1e0127047bcd3c91961f5c0e50a313e89f965eeeb27964d91501550bb9cc22220088880222200888802222008888022220239ad352334c597dbe4a774e1d23621991b146c2ece1d248ef758ce31b8f9900024807585cf5c7d6504df5ceb5b250524a0b052d9676c8f0d39e0cc72ece0f76b19db82b774d1b2589f1c8c6bd8e182d70c823e215b52dba9290e696929e03fdd461bdfe4b2f230de55a9ad169a53e59a52baa34f5d6d34301b5de6e34947b5d4c696db599680d2d696b9ac07b1f55674f6fa1a8aa654d974eeae82ef0bb7d3554b4f54d746fc1fc53bb6e0e4820f04123cd74137b2a858b07c4ce1f575ffa75aceebf05858a5aaa8b4d1cd71a7f65ad92063e7803b708a42d05cdc8ef83919590445eb24700888a414513ea44b766e98962b1c134934f23219a480073e085c7ed246b4fde70682001ce483ce14b551569764d05e1ecd05358f4e32cb252cacbf5aede4b237899f5b046e03b35c24f71cde31c8c71e4a4549747477b75cf4e5cecf5551342c867a6966044ac6bcb9a43d849611bdfc96bb391e8b6d903d02b2abb5d1564ad92aa8e9a77b7b3a589ae23e4485e2ffa5649c9f64657b5fbf268fbd39eae48cd2ebba689d0457ea49ed52c8437c477dac01e480078ade064b801bc372a60c76e2560a6d1da765a9150fb1db8ce1c1c1feced0720e41edf059e637008f2f25ebe256a756f6ce0f5f83ed11175202222008888022220088880222200888802222008888022220088880222200888802222008888022220088880222203ffd9);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbl_images`
--
ALTER TABLE `tbl_images`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbl_images`
--
ALTER TABLE `tbl_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Cơ sở dữ liệu: `test_db`
--
CREATE DATABASE IF NOT EXISTS `test_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `test_db`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employee`
--
-- Error reading structure for table test_db.employee: #1932 - Table 'test_db.employee' doesn't exist in engine
-- Error reading data for table test_db.employee: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `test_db`.`employee`' at line 1
--
-- Cơ sở dữ liệu: `user`
--
CREATE DATABASE IF NOT EXISTS `user` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `user`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `inf2o`
--

CREATE TABLE `inf2o` (
  `t1ID` int(11) NOT NULL,
  `t2ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `info`
--

CREATE TABLE `info` (
  `t1ID` int(11) NOT NULL,
  `t2ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `info`
--

INSERT INTO `info` (`t1ID`, `t2ID`) VALUES
(1, 2),
(1, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbluser`
--
-- Error reading structure for table user.tbluser: #1932 - Table 'user.tbluser' doesn't exist in engine
-- Error reading data for table user.tbluser: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `user`.`tbluser`' at line 1

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `inf2o`
--
ALTER TABLE `inf2o`
  ADD PRIMARY KEY (`t1ID`,`t2ID`);

--
-- Chỉ mục cho bảng `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`t1ID`,`t2ID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `inf2o`
--
ALTER TABLE `inf2o`
  MODIFY `t1ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Cơ sở dữ liệu: `word`
--
CREATE DATABASE IF NOT EXISTS `word` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `word`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lists`
--

CREATE TABLE `lists` (
  `id` int(11) NOT NULL,
  `list_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `lists`
--

INSERT INTO `lists` (`id`, `list_name`) VALUES
(1, 'Đang học');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `list_detailed`
--

CREATE TABLE `list_detailed` (
  `word_id` int(11) NOT NULL,
  `list_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `list_detailed`
--

INSERT INTO `list_detailed` (`word_id`, `list_id`) VALUES
(4, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `word`
--

CREATE TABLE `word` (
  `id` int(11) NOT NULL,
  `word` text NOT NULL,
  `mean` text NOT NULL,
  `eng_sentence` text NOT NULL,
  `trans_sentence` text NOT NULL,
  `status` int(2) NOT NULL,
  `spell` varchar(50) NOT NULL,
  `added` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `word`
--

INSERT INTO `word` (`id`, `word`, `mean`, `eng_sentence`, `trans_sentence`, `status`, `spell`, `added`) VALUES
(2, 'dog', 'ghi nhận thêm 7 ca dương tính với Covid-19', 'asdas', 'asddas', 0, '', 0),
(4, 'jarring ', 'ghi nhận thêm 7', 'á', 'ádsadas', 0, '', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `lists`
--
ALTER TABLE `lists`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `list_detailed`
--
ALTER TABLE `list_detailed`
  ADD KEY `list_id` (`list_id`),
  ADD KEY `word_id` (`word_id`);

--
-- Chỉ mục cho bảng `word`
--
ALTER TABLE `word`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `lists`
--
ALTER TABLE `lists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `word`
--
ALTER TABLE `word`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `list_detailed`
--
ALTER TABLE `list_detailed`
  ADD CONSTRAINT `list_detailed_ibfk_1` FOREIGN KEY (`list_id`) REFERENCES `lists` (`id`),
  ADD CONSTRAINT `list_detailed_ibfk_2` FOREIGN KEY (`word_id`) REFERENCES `word` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
