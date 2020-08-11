-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 04, 2020 lúc 03:06 PM
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
-- Cơ sở dữ liệu: `myshop1`
--

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
(3077, 'Tiền đô âm phủ loại 1', 12000, 'https://i.imgur.com/N0gZ9Un.jpg', 23, 'Hàng bao đẹp', 1, 0, 0),
(3078, 'Tiền đô âm phủ loại 2', 19000, 'https://i.imgur.com/jAFHP5X.jpg', 23, 'Tiền đô loại 2 cao cấp', 1, 0, 0),
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
(3397, 'Tampflex', 853000, 'https://robohash.org/saepeenimmodi.bmp?size=250x250&set=set1', 99, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 3, 0, 0);

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
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3398;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
