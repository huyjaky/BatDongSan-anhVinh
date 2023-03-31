-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.27-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.3.0.6654
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for bdsdatabase
CREATE DATABASE IF NOT EXISTS `bdsdatabase` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `bdsdatabase`;

-- Dumping structure for table bdsdatabase.diachi
CREATE TABLE IF NOT EXISTS `diachi` (
  `MaViTri` varchar(50) NOT NULL,
  `MaQuan` varchar(50) DEFAULT NULL,
  `MaPhuong` varchar(50) DEFAULT NULL,
  `TenDuong` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MaViTri`),
  KEY `MaQuan` (`MaQuan`),
  KEY `MaPhuong` (`MaPhuong`),
  CONSTRAINT `diachi_ibfk_1` FOREIGN KEY (`MaQuan`) REFERENCES `quan` (`MaQuan`),
  CONSTRAINT `diachi_ibfk_2` FOREIGN KEY (`MaPhuong`) REFERENCES `phuong` (`MaPhuong`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bdsdatabase.diachi: ~2 rows (approximately)
INSERT INTO `diachi` (`MaViTri`, `MaQuan`, `MaPhuong`, `TenDuong`) VALUES
	('1cf6d56a-c35b-49c9-a91c-14b5c437e041', 'Q3', 'P10', '123'),
	('2f0095ea-18a7-417a-b87a-c0cf50dabf09', 'Q3', 'P11', '123'),
	('a454ce2d-9591-44eb-9a09-5dac56714500', 'Q5', 'P12', '123');

-- Dumping structure for table bdsdatabase.folderanh
CREATE TABLE IF NOT EXISTS `folderanh` (
  `MaAnh` varchar(50) DEFAULT NULL,
  `MaAnhKhach` varchar(50) DEFAULT NULL,
  `id` varchar(50) DEFAULT NULL,
  KEY `FK_folderanh_hinhanh` (`MaAnh`),
  KEY `FK_folderanh_quanlyanh` (`MaAnhKhach`),
  CONSTRAINT `FK_folderanh_hinhanh` FOREIGN KEY (`MaAnh`) REFERENCES `hinhanh` (`MaAnh`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_folderanh_quanlyanh` FOREIGN KEY (`MaAnhKhach`) REFERENCES `quanlyanh` (`MaAnhKhach`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bdsdatabase.folderanh: ~4 rows (approximately)
INSERT INTO `folderanh` (`MaAnh`, `MaAnhKhach`, `id`) VALUES
	('1680174929318-24be4870-3fbd-4bce-9961-681933ba557c', '27e6ea20-3405-4f08-bf12-7734ea2de708', '27e6ea20-3405-4f08-bf12-7734ea2de708'),
	('1680174929313-99dfaf7f-d1e3-4a10-9050-248719831617', '27e6ea20-3405-4f08-bf12-7734ea2de708', '27e6ea20-3405-4f08-bf12-7734ea2de708'),
	('1680174929316-1c91a5e1-e043-4133-a72b-82e411c5c4b6', '27e6ea20-3405-4f08-bf12-7734ea2de708', '27e6ea20-3405-4f08-bf12-7734ea2de708'),
	('1680174929317-1e1608c8-12ac-4293-8b0c-856a258ef32d', '27e6ea20-3405-4f08-bf12-7734ea2de708', '27e6ea20-3405-4f08-bf12-7734ea2de708');

-- Dumping structure for table bdsdatabase.hinhanh
CREATE TABLE IF NOT EXISTS `hinhanh` (
  `MaAnh` varchar(50) NOT NULL,
  `Hinh` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`MaAnh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bdsdatabase.hinhanh: ~7 rows (approximately)
INSERT INTO `hinhanh` (`MaAnh`, `Hinh`) VALUES
	('1680174456543-1a456753-5a36-43cb-8221-2632500d1225', 'src\\private\\img\\1680174456543-1a456753-5a36-43cb-8221-2632500d1225-332009658_1431758487632114_1333836561753660075_n.jpg'),
	('1680174456548-6dad5e8d-255c-4f1e-b8e9-d2dfdf6769f1', 'src\\private\\img\\1680174456548-6dad5e8d-255c-4f1e-b8e9-d2dfdf6769f1-332097836_1333232437249304_4417999153014363092_n.jpg'),
	('1680174456549-b73168ed-bb9d-4a58-951f-bf6525fb26b1', 'src\\private\\img\\1680174456549-b73168ed-bb9d-4a58-951f-bf6525fb26b1-332107462_890521025529153_6381195166255860553_n.jpg'),
	('1680174929313-99dfaf7f-d1e3-4a10-9050-248719831617', 'src\\private\\img\\1680174929313-99dfaf7f-d1e3-4a10-9050-248719831617-331990251_1706269343159111_2794523086690249994_n.jpg'),
	('1680174929316-1c91a5e1-e043-4133-a72b-82e411c5c4b6', 'src\\private\\img\\1680174929316-1c91a5e1-e043-4133-a72b-82e411c5c4b6-332009658_1431758487632114_1333836561753660075_n.jpg'),
	('1680174929317-1e1608c8-12ac-4293-8b0c-856a258ef32d', 'src\\private\\img\\1680174929317-1e1608c8-12ac-4293-8b0c-856a258ef32d-332097836_1333232437249304_4417999153014363092_n.jpg'),
	('1680174929318-24be4870-3fbd-4bce-9961-681933ba557c', 'src\\private\\img\\1680174929318-24be4870-3fbd-4bce-9961-681933ba557c-332107462_890521025529153_6381195166255860553_n.jpg');

-- Dumping structure for table bdsdatabase.khachban
CREATE TABLE IF NOT EXISTS `khachban` (
  `MaKhach` varchar(50) NOT NULL,
  `MaViTri` varchar(50) DEFAULT NULL,
  `TenKhach` varchar(50) DEFAULT NULL,
  `TaiChinh` varchar(50) DEFAULT NULL,
  `Sdt` varchar(50) DEFAULT NULL,
  `NgayDang` datetime DEFAULT NULL,
  `Linkface` varchar(255) DEFAULT NULL,
  `MaAnhKhach` varchar(50) DEFAULT NULL,
  `NhuCauChiTiet` varchar(200) DEFAULT NULL,
  `SoPhongNgu` varchar(50) DEFAULT NULL,
  `SoPhongVeSinh` varchar(50) DEFAULT NULL,
  `TheLoai` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MaKhach`) USING BTREE,
  KEY `FK1KhachBan.MaViTri` (`MaViTri`),
  KEY `FK_khachban_quanlyanh` (`MaAnhKhach`),
  CONSTRAINT `FK_khachban_diachi` FOREIGN KEY (`MaViTri`) REFERENCES `diachi` (`MaViTri`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_khachban_quanlyanh` FOREIGN KEY (`MaAnhKhach`) REFERENCES `quanlyanh` (`MaAnhKhach`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bdsdatabase.khachban: ~0 rows (approximately)
INSERT INTO `khachban` (`MaKhach`, `MaViTri`, `TenKhach`, `TaiChinh`, `Sdt`, `NgayDang`, `Linkface`, `MaAnhKhach`, `NhuCauChiTiet`, `SoPhongNgu`, `SoPhongVeSinh`, `TheLoai`) VALUES
	('4774bfee-5516-44e7-aef4-7d8b74216e15', 'a454ce2d-9591-44eb-9a09-5dac56714500', '123', '0123', '123', '2023-03-30 08:58:41', '123', 'aa7de639-27b9-4b29-8a5b-50b1ae360c8f', '123123', '23123', '123', 'Can Ho');

-- Dumping structure for table bdsdatabase.khachchothue
CREATE TABLE IF NOT EXISTS `khachchothue` (
  `MaKhach` varchar(50) NOT NULL,
  `MaViTri` varchar(50) DEFAULT NULL,
  `TenKhach` varchar(50) DEFAULT NULL,
  `TaiChinh` varchar(50) DEFAULT NULL,
  `NhuCauChiTiet` varchar(200) DEFAULT NULL,
  `Sdt` varchar(50) DEFAULT NULL,
  `NgayDang` datetime DEFAULT NULL,
  `Linkface` varchar(255) DEFAULT NULL,
  `MaAnhKhach` varchar(50) DEFAULT NULL,
  `SoPhongNgu` varchar(50) DEFAULT NULL,
  `SoPhongVeSinh` varchar(50) DEFAULT NULL,
  `TheLoai` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MaKhach`) USING BTREE,
  KEY `FK1KhachChoThue.MaViTri` (`MaViTri`),
  KEY `FK_khachchothue_quanlyanh` (`MaAnhKhach`),
  CONSTRAINT `FK_khachchothue_diachi` FOREIGN KEY (`MaViTri`) REFERENCES `diachi` (`MaViTri`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_khachchothue_quanlyanh` FOREIGN KEY (`MaAnhKhach`) REFERENCES `quanlyanh` (`MaAnhKhach`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bdsdatabase.khachchothue: ~1 rows (approximately)

-- Dumping structure for table bdsdatabase.khachmua
CREATE TABLE IF NOT EXISTS `khachmua` (
  `MaKhach` varchar(50) NOT NULL,
  `MaViTri` varchar(50) DEFAULT NULL,
  `TaiChinh` varchar(50) DEFAULT NULL,
  `TenKhach` varchar(50) DEFAULT NULL,
  `NhuCauChiTiet` varchar(200) DEFAULT NULL,
  `Sdt` varchar(50) DEFAULT NULL,
  `NgayDang` datetime DEFAULT NULL,
  `Linkface` varchar(255) DEFAULT NULL,
  `MaAnhKhach` varchar(50) DEFAULT NULL,
  `SoPhongNgu` varchar(50) DEFAULT NULL,
  `SoPhongVeSinh` varchar(50) DEFAULT NULL,
  `TheLoai` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MaKhach`) USING BTREE,
  KEY `FK1KhachMua.MaViTri` (`MaViTri`),
  KEY `FK_khachmua_quanlyanh` (`MaAnhKhach`),
  CONSTRAINT `FK_khachmua_diachi` FOREIGN KEY (`MaViTri`) REFERENCES `diachi` (`MaViTri`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_khachmua_quanlyanh` FOREIGN KEY (`MaAnhKhach`) REFERENCES `quanlyanh` (`MaAnhKhach`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bdsdatabase.khachmua: ~0 rows (approximately)

-- Dumping structure for table bdsdatabase.khachthue
CREATE TABLE IF NOT EXISTS `khachthue` (
  `MaKhach` varchar(50) NOT NULL,
  `MaViTri` varchar(50) DEFAULT NULL,
  `TenKhach` varchar(50) DEFAULT NULL,
  `TaiChinh` varchar(50) DEFAULT NULL,
  `NhuCauChiTiet` varchar(200) DEFAULT NULL,
  `Sdt` varchar(50) DEFAULT NULL,
  `NgayDang` datetime DEFAULT NULL,
  `Linkface` varchar(255) DEFAULT NULL,
  `MaAnhKhach` varchar(50) DEFAULT NULL,
  `SoPhongNgu` varchar(50) DEFAULT NULL,
  `SoPhongVeSinh` varchar(50) DEFAULT NULL,
  `TheLoai` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MaKhach`) USING BTREE,
  KEY `FK1KhachThue.MaViTri` (`MaViTri`),
  KEY `FK_khachthue_quanlyanh` (`MaAnhKhach`),
  CONSTRAINT `FK_khachthue_diachi` FOREIGN KEY (`MaViTri`) REFERENCES `diachi` (`MaViTri`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_khachthue_quanlyanh` FOREIGN KEY (`MaAnhKhach`) REFERENCES `quanlyanh` (`MaAnhKhach`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bdsdatabase.khachthue: ~2 rows (approximately)
INSERT INTO `khachthue` (`MaKhach`, `MaViTri`, `TenKhach`, `TaiChinh`, `NhuCauChiTiet`, `Sdt`, `NgayDang`, `Linkface`, `MaAnhKhach`, `SoPhongNgu`, `SoPhongVeSinh`, `TheLoai`) VALUES
	('3748abe6-678b-4cf8-83b9-c36112705daa', '2f0095ea-18a7-417a-b87a-c0cf50dabf09', 'huy', '123', '123123123123123sua roi', '123', '2023-03-30 10:22:33', '123123', '27e6ea20-3405-4f08-bf12-7734ea2de708', '123', '123123', 'Can Ho'),
	('654e8951-7d32-46d0-b360-ed3a48c845d4', '1cf6d56a-c35b-49c9-a91c-14b5c437e041', '123', '0123', '123', '123', '2023-03-30 07:15:20', '123', 'dacce250-1eab-47dc-bd4b-c38175ac4e42', '123', '123', 'Can Ho');

-- Dumping structure for table bdsdatabase.nhanvien
CREATE TABLE IF NOT EXISTS `nhanvien` (
  `MaNhanVien` varchar(50) NOT NULL,
  `TenNhanVien` varchar(50) DEFAULT NULL,
  `TaiKhoan` varchar(50) DEFAULT NULL,
  `MatKhau` varchar(50) DEFAULT NULL,
  `MaPQ` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MaNhanVien`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bdsdatabase.nhanvien: ~2 rows (approximately)
INSERT INTO `nhanvien` (`MaNhanVien`, `TenNhanVien`, `TaiKhoan`, `MatKhau`, `MaPQ`) VALUES
	('1', 'Huy', 'huy', '123', '1'),
	('2', 'Viet', 'Viet', '123', '2');

-- Dumping structure for table bdsdatabase.phuong
CREATE TABLE IF NOT EXISTS `phuong` (
  `MaPhuong` varchar(50) NOT NULL,
  `TenPhuong` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MaPhuong`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bdsdatabase.phuong: ~45 rows (approximately)
INSERT INTO `phuong` (`MaPhuong`, `TenPhuong`) VALUES
	('P1', 'Hòa Hiệp Bắc'),
	('P10', 'Tân Chính'),
	('P11', 'Chính Gián'),
	('P12', 'Vĩnh Trung'),
	('P13', 'Thạc Gián'),
	('P14', 'An Khê'),
	('P15', 'Hòa Khê'),
	('P16', 'Thanh Bình'),
	('P17', 'Thuận Phước'),
	('P18', 'Thạch Thang'),
	('P19', 'Hải Châu I'),
	('P2', 'Hòa Hiệp Nam'),
	('P20', 'Hải Châu II'),
	('P21', 'Phước Ninh'),
	('P22', 'Hòa Thuận Tây'),
	('P23', 'Hòa Thuận Đông'),
	('P24', 'Nam Dương'),
	('P25', 'Bình Hiên'),
	('P26', 'Bình Thuận'),
	('P27', 'Hòa Cường Bắc'),
	('P28', 'Hòa Cường Nam'),
	('P29', 'Thọ Quang'),
	('P3', 'Hòa Khánh Bắc'),
	('P30', 'Nại Hiên Đông'),
	('P31', 'Mân Thái'),
	('P32', 'An Hải Bắc'),
	('P33', 'Phước Mỹ'),
	('P34', 'An Hải Tây'),
	('P35', 'An Hải Đông'),
	('P36', 'Mỹ An'),
	('P37', 'Khuê Mỹ'),
	('P38', 'Hòa Quý'),
	('P39', 'Hòa Hải'),
	('P4', 'Hòa Khánh Nam'),
	('P40', 'Khuê Trung'),
	('P41', 'Hòa Phát'),
	('P42', 'Hòa An'),
	('P43', 'Hòa Thọ Tây'),
	('P44', 'Hòa Thọ Đông'),
	('P45', 'Hòa Xuân'),
	('P5', 'Hòa Minh'),
	('P6', 'Tam Thuận'),
	('P7', 'Thanh Khê Tây'),
	('P8', 'Thanh Khê Đông'),
	('P9', 'Xuân Hà');

-- Dumping structure for table bdsdatabase.phuongquan
CREATE TABLE IF NOT EXISTS `phuongquan` (
  `MaPhuong` varchar(50) DEFAULT NULL,
  `MaQuan` varchar(50) DEFAULT NULL,
  KEY `MaPhuong` (`MaPhuong`),
  KEY `MaQuan` (`MaQuan`),
  CONSTRAINT `phuongquan_ibfk_1` FOREIGN KEY (`MaPhuong`) REFERENCES `phuong` (`MaPhuong`),
  CONSTRAINT `phuongquan_ibfk_2` FOREIGN KEY (`MaQuan`) REFERENCES `quan` (`MaQuan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bdsdatabase.phuongquan: ~44 rows (approximately)
INSERT INTO `phuongquan` (`MaPhuong`, `MaQuan`) VALUES
	('P1', 'Q1'),
	('P2', 'Q1'),
	('P3', 'Q1'),
	('P4', 'Q1'),
	('P5', 'Q1'),
	('P6', 'Q2'),
	('P7', 'Q2'),
	('P8', 'Q2'),
	('P9', 'Q2'),
	('P10', 'Q2'),
	('P11', 'Q2'),
	('P12', 'Q2'),
	('P13', 'Q2'),
	('P14', 'Q2'),
	('P15', 'Q2'),
	('P16', 'Q3'),
	('P17', 'Q3'),
	('P18', 'Q3'),
	('P19', 'Q3'),
	('P20', 'Q3'),
	('P21', 'Q3'),
	('P22', 'Q3'),
	('P23', 'Q3'),
	('P26', 'Q3'),
	('P27', 'Q3'),
	('P28', 'Q3'),
	('P29', 'Q4'),
	('P30', 'Q4'),
	('P31', 'Q4'),
	('P32', 'Q4'),
	('P33', 'Q4'),
	('P34', 'Q4'),
	('P35', 'Q5'),
	('P36', 'Q5'),
	('P37', 'Q5'),
	('P38', 'Q5'),
	('P39', 'Q5'),
	('P40', 'Q6'),
	('P41', 'Q6'),
	('P42', 'Q6'),
	('P42', 'Q6'),
	('P43', 'Q6'),
	('P44', 'Q6'),
	('P45', 'Q6');

-- Dumping structure for table bdsdatabase.quan
CREATE TABLE IF NOT EXISTS `quan` (
  `MaQuan` varchar(50) NOT NULL,
  `TenQuan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MaQuan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bdsdatabase.quan: ~6 rows (approximately)
INSERT INTO `quan` (`MaQuan`, `TenQuan`) VALUES
	('Q1', 'Liên Chiểu'),
	('Q2', 'Thanh Khê'),
	('Q3', 'Hải Châu'),
	('Q4', 'Sơn Trà'),
	('Q5', 'Ngũ Hành Sơn'),
	('Q6', 'Cẩm Lệ');

-- Dumping structure for table bdsdatabase.quanlyanh
CREATE TABLE IF NOT EXISTS `quanlyanh` (
  `MaAnhKhach` varchar(50) NOT NULL,
  PRIMARY KEY (`MaAnhKhach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bdsdatabase.quanlyanh: ~29 rows (approximately)
INSERT INTO `quanlyanh` (`MaAnhKhach`) VALUES
	('11b4b1ca-4c46-4019-8d19-b770b920be90'),
	('1269ea90-60ce-429d-b7e4-8bdc94de5505'),
	('14cdb6aa-14e6-42b5-9da4-351241624b67'),
	('27e6ea20-3405-4f08-bf12-7734ea2de708'),
	('34781641-f87b-40ff-a368-9ee4e26bdbd7'),
	('4306eede-91bc-4a2f-9ef1-0a8f24be285c'),
	('578a01f8-ea0a-4ff0-881a-57e25159734a'),
	('75ff1a6a-d27c-4e24-94d2-da1da3d7855b'),
	('76fb87c5-9332-4523-8e5e-f4bb0555f1bf'),
	('79380fab-b767-4d20-bdf8-4276649f4152'),
	('7d96f3b9-a3c2-4002-a629-f4bd805ebbe9'),
	('83ca02f9-bf5c-40d5-8e93-890c9cbf177f'),
	('85d779a7-75dd-4700-9dcc-a8c4cf2e4825'),
	('9599744b-719b-499f-9e06-5ef58211815c'),
	('9a732085-034f-4ca3-9da4-3469e8256e91'),
	('9e0ea2fc-46c0-49df-aa5c-fb6e6e75294b'),
	('a6fd8340-8227-4297-8a24-d06ba65ed13f'),
	('aa7de639-27b9-4b29-8a5b-50b1ae360c8f'),
	('bdc7d196-775a-4265-aedd-a4751f2dcce6'),
	('cb51bf77-5185-4f6e-ad38-5bc28fad2876'),
	('d65b652c-61e1-4496-9881-cc81b2bc3043'),
	('dacce250-1eab-47dc-bd4b-c38175ac4e42'),
	('e2b8180b-d7d9-4909-a9d6-7c0a73807c93'),
	('e3febb77-b231-4a15-a4e8-6bb205c0851e'),
	('e6fb59f2-325f-4e1d-9e1a-99c632c6c996'),
	('e9ecac14-1161-4c5d-8811-4734d3515bc6'),
	('eeb4985f-7c23-4a77-b319-e8f32cf1139a'),
	('f46edc28-b603-424c-954c-809855556e18'),
	('ff5d9229-dacd-4158-81fb-a0915c95fa38');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
