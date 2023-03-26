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
	('02bb2fef-b344-4866-80e2-6e633eb2cc0b', 'Q3', 'P11', '123'),
	('545bae9c-e30d-4131-ba73-526bd92112fd', 'Q4', 'P12', '123'),
	('59cb1c1d-8b2b-4f03-8cce-94c475e53238', 'Q2', 'P11', '12312');

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

-- Dumping data for table bdsdatabase.folderanh: ~7 rows (approximately)
INSERT INTO `folderanh` (`MaAnh`, `MaAnhKhach`, `id`) VALUES
	('1679834796108-4449bf61-b2ae-4ab7-a387-b20e61dc9060', 'a570f7ac-3f82-42c2-8054-c95079d8c319', 'a570f7ac-3f82-42c2-8054-c95079d8c319'),
	('1679839849511-b18bb01f-eaba-4759-a53c-97c71dd37d1c', 'deb42c07-0c8e-400f-92ce-9520ff441350', 'deb42c07-0c8e-400f-92ce-9520ff441350'),
	('1679839849512-f2fef407-07c3-4aec-ad87-b024615c8772', 'deb42c07-0c8e-400f-92ce-9520ff441350', 'deb42c07-0c8e-400f-92ce-9520ff441350'),
	('1679839849514-7364c1d0-1544-41db-9980-101ce0ca14ff', 'deb42c07-0c8e-400f-92ce-9520ff441350', 'deb42c07-0c8e-400f-92ce-9520ff441350'),
	('1679839849517-10371fc2-4d6e-415d-9d5e-6e13e3657835', 'deb42c07-0c8e-400f-92ce-9520ff441350', 'deb42c07-0c8e-400f-92ce-9520ff441350'),
	('1679839849518-ebf945e1-62fa-4355-8e86-3299a407f1ae', 'deb42c07-0c8e-400f-92ce-9520ff441350', 'deb42c07-0c8e-400f-92ce-9520ff441350'),
	('1679839849515-02f2b886-481a-4222-984b-a0d8a43120a2', 'deb42c07-0c8e-400f-92ce-9520ff441350', 'deb42c07-0c8e-400f-92ce-9520ff441350');

-- Dumping structure for table bdsdatabase.hinhanh
CREATE TABLE IF NOT EXISTS `hinhanh` (
  `MaAnh` varchar(50) NOT NULL,
  `Hinh` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`MaAnh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bdsdatabase.hinhanh: ~7 rows (approximately)
INSERT INTO `hinhanh` (`MaAnh`, `Hinh`) VALUES
	('1679834796108-4449bf61-b2ae-4ab7-a387-b20e61dc9060', 'src\\private\\img\\1679834796108-4449bf61-b2ae-4ab7-a387-b20e61dc9060-332107462_890521025529153_6381195166255860553_n.jpg'),
	('1679839849511-b18bb01f-eaba-4759-a53c-97c71dd37d1c', 'src\\private\\img\\1679839849511-b18bb01f-eaba-4759-a53c-97c71dd37d1c-330539875_1263931847868178_1870998456899492592_n.jpg'),
	('1679839849512-f2fef407-07c3-4aec-ad87-b024615c8772', 'src\\private\\img\\1679839849512-f2fef407-07c3-4aec-ad87-b024615c8772-331969395_458237079762086_6178410643103997480_n.jpg'),
	('1679839849514-7364c1d0-1544-41db-9980-101ce0ca14ff', 'src\\private\\img\\1679839849514-7364c1d0-1544-41db-9980-101ce0ca14ff-331990251_1706269343159111_2794523086690249994_n.jpg'),
	('1679839849515-02f2b886-481a-4222-984b-a0d8a43120a2', 'src\\private\\img\\1679839849515-02f2b886-481a-4222-984b-a0d8a43120a2-332009658_1431758487632114_1333836561753660075_n.jpg'),
	('1679839849517-10371fc2-4d6e-415d-9d5e-6e13e3657835', 'src\\private\\img\\1679839849517-10371fc2-4d6e-415d-9d5e-6e13e3657835-332097836_1333232437249304_4417999153014363092_n.jpg'),
	('1679839849518-ebf945e1-62fa-4355-8e86-3299a407f1ae', 'src\\private\\img\\1679839849518-ebf945e1-62fa-4355-8e86-3299a407f1ae-332107462_890521025529153_6381195166255860553_n.jpg');

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
  PRIMARY KEY (`MaKhach`) USING BTREE,
  KEY `FK1KhachBan.MaViTri` (`MaViTri`),
  KEY `FK_khachban_quanlyanh` (`MaAnhKhach`),
  CONSTRAINT `FK_khachban_diachi` FOREIGN KEY (`MaViTri`) REFERENCES `diachi` (`MaViTri`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_khachban_quanlyanh` FOREIGN KEY (`MaAnhKhach`) REFERENCES `quanlyanh` (`MaAnhKhach`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bdsdatabase.khachban: ~0 rows (approximately)

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
  PRIMARY KEY (`MaKhach`) USING BTREE,
  KEY `FK1KhachChoThue.MaViTri` (`MaViTri`),
  KEY `FK_khachchothue_quanlyanh` (`MaAnhKhach`),
  CONSTRAINT `FK_khachchothue_diachi` FOREIGN KEY (`MaViTri`) REFERENCES `diachi` (`MaViTri`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_khachchothue_quanlyanh` FOREIGN KEY (`MaAnhKhach`) REFERENCES `quanlyanh` (`MaAnhKhach`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bdsdatabase.khachchothue: ~0 rows (approximately)
INSERT INTO `khachchothue` (`MaKhach`, `MaViTri`, `TenKhach`, `TaiChinh`, `NhuCauChiTiet`, `Sdt`, `NgayDang`, `Linkface`, `MaAnhKhach`) VALUES
	('66b03d9e-e9d4-426a-aecc-9a44980aafe8', '59cb1c1d-8b2b-4f03-8cce-94c475e53238', '123', '012312', '3123123', '123', '2023-03-26 14:10:55', '3', 'deb42c07-0c8e-400f-92ce-9520ff441350');

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
  PRIMARY KEY (`MaKhach`) USING BTREE,
  KEY `FK1KhachMua.MaViTri` (`MaViTri`),
  KEY `FK_khachmua_quanlyanh` (`MaAnhKhach`),
  CONSTRAINT `FK_khachmua_diachi` FOREIGN KEY (`MaViTri`) REFERENCES `diachi` (`MaViTri`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_khachmua_quanlyanh` FOREIGN KEY (`MaAnhKhach`) REFERENCES `quanlyanh` (`MaAnhKhach`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bdsdatabase.khachmua: ~2 rows (approximately)
INSERT INTO `khachmua` (`MaKhach`, `MaViTri`, `TaiChinh`, `TenKhach`, `NhuCauChiTiet`, `Sdt`, `NgayDang`, `Linkface`, `MaAnhKhach`) VALUES
	('3a1fc37c-35de-4ed2-a27c-788b719737ed', '545bae9c-e30d-4131-ba73-526bd92112fd', '0123', '123', '123123', '123', '2023-03-26 12:58:16', '123', '8b6f53dc-0870-46b2-a4b4-9f87e15c1e9c'),
	('b8a1291a-847a-4b15-bbf7-5322b0c4f24f', '02bb2fef-b344-4866-80e2-6e633eb2cc0b', '0123', '123', '123', '123', '2023-03-26 12:46:39', '123', 'a570f7ac-3f82-42c2-8054-c95079d8c319');

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
  PRIMARY KEY (`MaKhach`) USING BTREE,
  KEY `FK1KhachThue.MaViTri` (`MaViTri`),
  KEY `FK_khachthue_quanlyanh` (`MaAnhKhach`),
  CONSTRAINT `FK_khachthue_diachi` FOREIGN KEY (`MaViTri`) REFERENCES `diachi` (`MaViTri`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_khachthue_quanlyanh` FOREIGN KEY (`MaAnhKhach`) REFERENCES `quanlyanh` (`MaAnhKhach`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bdsdatabase.khachthue: ~0 rows (approximately)

-- Dumping structure for table bdsdatabase.nhanvien
CREATE TABLE IF NOT EXISTS `nhanvien` (
  `MaNhanVien` varchar(50) NOT NULL,
  `TenNhanVien` varchar(50) DEFAULT NULL,
  `TaiKhoan` varchar(50) DEFAULT NULL,
  `MatKhau` varchar(50) DEFAULT NULL,
  `MaPQ` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MaNhanVien`),
  KEY `FK1NhanVien.MaPQ` (`MaPQ`),
  CONSTRAINT `FK1NhanVien.MaPQ` FOREIGN KEY (`MaPQ`) REFERENCES `phanquyen` (`MaPQ`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bdsdatabase.nhanvien: ~1 rows (approximately)
INSERT INTO `nhanvien` (`MaNhanVien`, `TenNhanVien`, `TaiKhoan`, `MatKhau`, `MaPQ`) VALUES
	('1', 'Huy', 'huy', '123', NULL);

-- Dumping structure for table bdsdatabase.phanquyen
CREATE TABLE IF NOT EXISTS `phanquyen` (
  `MaPQ` varchar(50) NOT NULL,
  `TenPQ` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MaPQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bdsdatabase.phanquyen: ~0 rows (approximately)

-- Dumping structure for table bdsdatabase.phuong
CREATE TABLE IF NOT EXISTS `phuong` (
  `MaPhuong` varchar(50) NOT NULL,
  `TenPhuong` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MaPhuong`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bdsdatabase.phuong: ~15 rows (approximately)
INSERT INTO `phuong` (`MaPhuong`, `TenPhuong`) VALUES
	('P1', 'An Hải Bắc'),
	('P10', 'Hòa Thọ Tây'),
	('P11', 'Hòa Xuân'),
	('P12', 'Hòa Minh'),
	('P13', 'Khuê Trung'),
	('P14', 'Hòa Quý'),
	('P15', 'Khuê Mỹ'),
	('P2', 'An Hải Đông'),
	('P3', 'An Hải Tây'),
	('P4', 'Mân Thái'),
	('P5', 'Nam Dương'),
	('P6', 'Phước Ninh'),
	('P7', 'Hòa An'),
	('P8', 'Hòa Phát'),
	('P9', 'Hòa Thọ Đông');

-- Dumping structure for table bdsdatabase.phuongquan
CREATE TABLE IF NOT EXISTS `phuongquan` (
  `MaPhuong` varchar(50) DEFAULT NULL,
  `MaQuan` varchar(50) DEFAULT NULL,
  KEY `MaPhuong` (`MaPhuong`),
  KEY `MaQuan` (`MaQuan`),
  CONSTRAINT `phuongquan_ibfk_1` FOREIGN KEY (`MaPhuong`) REFERENCES `phuong` (`MaPhuong`),
  CONSTRAINT `phuongquan_ibfk_2` FOREIGN KEY (`MaQuan`) REFERENCES `quan` (`MaQuan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bdsdatabase.phuongquan: ~15 rows (approximately)
INSERT INTO `phuongquan` (`MaPhuong`, `MaQuan`) VALUES
	('P1', 'Q1'),
	('P2', 'Q1'),
	('P3', 'Q1'),
	('P4', 'Q2'),
	('P5', 'Q2'),
	('P6', 'Q3'),
	('P7', 'Q3'),
	('P8', 'Q4'),
	('P9', 'Q4'),
	('P10', 'Q4'),
	('P11', 'Q5'),
	('P12', 'Q5'),
	('P13', 'Q6'),
	('P14', 'Q6'),
	('P15', 'Q7');

-- Dumping structure for table bdsdatabase.quan
CREATE TABLE IF NOT EXISTS `quan` (
  `MaQuan` varchar(50) NOT NULL,
  `TenQuan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MaQuan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bdsdatabase.quan: ~7 rows (approximately)
INSERT INTO `quan` (`MaQuan`, `TenQuan`) VALUES
	('Q1', 'Cẩm Lệ'),
	('Q2', 'Hải Châu'),
	('Q3', 'Liên Chiểu'),
	('Q4', 'Ngũ Hành Sơn'),
	('Q5', 'Sơn Trà'),
	('Q6', 'Thanh Khê'),
	('Q7', 'Quận Hòa Vang');

-- Dumping structure for table bdsdatabase.quanlyanh
CREATE TABLE IF NOT EXISTS `quanlyanh` (
  `MaAnhKhach` varchar(50) NOT NULL,
  PRIMARY KEY (`MaAnhKhach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bdsdatabase.quanlyanh: ~8 rows (approximately)
INSERT INTO `quanlyanh` (`MaAnhKhach`) VALUES
	('59ae7dcf-0b49-42a5-ab39-f11c33b7bcdd'),
	('775d4cdd-1706-4987-970b-c3eb1b9442be'),
	('83cddbaf-f701-4fd0-b19e-5787e03899ad'),
	('8b6f53dc-0870-46b2-a4b4-9f87e15c1e9c'),
	('9b723d09-5d80-4d03-8290-c65bca23e9fc'),
	('a1b28737-1895-454d-a2f6-bfe3f2ff9419'),
	('a570f7ac-3f82-42c2-8054-c95079d8c319'),
	('deb42c07-0c8e-400f-92ce-9520ff441350');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
