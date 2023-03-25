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

-- Dumping data for table bdsdatabase.diachi: ~19 rows (approximately)
INSERT INTO `diachi` (`MaViTri`, `MaQuan`, `MaPhuong`, `TenDuong`) VALUES
	('10898639-40cb-4b7f-88ed-8cd8efccdad8', 'Q2', 'P11', '123'),
	('17d49dc9-bf93-4a7f-bbc5-5d80786b0a0e', 'Q3', 'P11', '123'),
	('279e803c-849f-4a73-94cb-f3e563b53396', 'Q2', 'P11', '123'),
	('3262da73-c55a-489c-8b6e-dcb32dd1632c', 'Q3', 'P10', '123'),
	('34f2be68-9bc6-4286-b906-b6d3418bae3a', 'Q2', 'P11', '123'),
	('3df55520-8026-434c-aaa9-4400705372cf', 'Q2', 'P11', '123'),
	('41d40bee-1dec-490e-9bd3-c06b5cb734c4', 'Q2', 'P11', '123'),
	('46a85702-2131-4f12-8c0b-038f859ece25', 'Q3', 'P10', '123'),
	('489db767-a797-4ba0-8a0b-66ae3ab3c0bf', 'Q2', 'P11', '123'),
	('549567b2-8ca0-44d2-86c6-2d009d0797aa', 'Q3', 'P10', '123'),
	('71ad7ed3-71d7-43c9-9517-d22436d2879b', 'Q3', 'P11', '123'),
	('7b540fc8-abe4-451b-91e3-d335819d7c52', 'Q2', 'P10', '123'),
	('808be63b-f9cc-4abb-b3f1-c52f65d31c97', 'Q2', 'P11', '123'),
	('a90794df-5b8c-4cf9-8c28-e84e592b66cd', 'Q1', 'P10', '123'),
	('af99a2c0-27ff-4d39-9a06-4bac81b54ced', 'Q3', 'P11', '123'),
	('d4ea91e6-1dc1-4505-a366-850ce1cd22c5', 'Q2', 'P10', '123'),
	('d8cda9d7-72ec-438f-bbdb-3710b408d05d', 'Q3', 'P11', '123'),
	('df868043-f0f5-4d53-b59b-cd12fbb398e1', 'Q2', 'P11', '123'),
	('f1c350fd-a57b-42e2-a945-f9e8b413c6ac', 'Q3', 'P10', '123');

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
	(NULL, '1', NULL),
	('1679710852799-f3e0ee41-5594-4592-b99a-4ea07c398086', 'b9fe8a49-4d85-453b-bed9-1b91c3b71999', 'b9fe8a49-4d85-453b-bed9-1b91c3b71999'),
	('1679710852791-baea6b03-1664-4c1a-bec5-7ec2204bf35b', 'b9fe8a49-4d85-453b-bed9-1b91c3b71999', 'b9fe8a49-4d85-453b-bed9-1b91c3b71999'),
	('1679710852798-019573fa-ad63-4014-9176-6b4620162d89', 'b9fe8a49-4d85-453b-bed9-1b91c3b71999', 'b9fe8a49-4d85-453b-bed9-1b91c3b71999');

-- Dumping structure for table bdsdatabase.hinhanh
CREATE TABLE IF NOT EXISTS `hinhanh` (
  `MaAnh` varchar(50) NOT NULL,
  `Hinh` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MaAnh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bdsdatabase.hinhanh: ~0 rows (approximately)
INSERT INTO `hinhanh` (`MaAnh`, `Hinh`) VALUES
	('1679710852791-baea6b03-1664-4c1a-bec5-7ec2204bf35b', 'src\\private\\img\\1679710852791-baea6b03-1664-4c1a-b'),
	('1679710852798-019573fa-ad63-4014-9176-6b4620162d89', 'src\\private\\img\\1679710852798-019573fa-ad63-4014-9'),
	('1679710852799-f3e0ee41-5594-4592-b99a-4ea07c398086', 'src\\private\\img\\1679710852799-f3e0ee41-5594-4592-b');

-- Dumping structure for table bdsdatabase.khachban
CREATE TABLE IF NOT EXISTS `khachban` (
  `MaKhachBan` varchar(50) NOT NULL,
  `MaViTri` varchar(50) DEFAULT NULL,
  `TenKhach` varchar(50) DEFAULT NULL,
  `Gia` varchar(50) DEFAULT NULL,
  `Sdt` varchar(50) DEFAULT NULL,
  `NgayDang` datetime DEFAULT NULL,
  `Linkface` varchar(255) DEFAULT NULL,
  `MaAnhKhach` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MaKhachBan`),
  KEY `FK1KhachBan.MaViTri` (`MaViTri`),
  KEY `FK_khachban_quanlyanh` (`MaAnhKhach`),
  CONSTRAINT `FK_khachban_diachi` FOREIGN KEY (`MaViTri`) REFERENCES `diachi` (`MaViTri`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_khachban_quanlyanh` FOREIGN KEY (`MaAnhKhach`) REFERENCES `quanlyanh` (`MaAnhKhach`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bdsdatabase.khachban: ~1 rows (approximately)
INSERT INTO `khachban` (`MaKhachBan`, `MaViTri`, `TenKhach`, `Gia`, `Sdt`, `NgayDang`, `Linkface`, `MaAnhKhach`) VALUES
	('1', '279e803c-849f-4a73-94cb-f3e563b53396', '12', '12', '12', '2023-03-25 09:12:44', '12', NULL);

-- Dumping structure for table bdsdatabase.khachchothue
CREATE TABLE IF NOT EXISTS `khachchothue` (
  `MaKhachChoThue` varchar(50) NOT NULL,
  `MaViTri` varchar(50) DEFAULT NULL,
  `TenKhachChoThue` varchar(50) DEFAULT NULL,
  `Gia` varchar(50) DEFAULT NULL,
  `ThongTinChiTiet` varchar(50) DEFAULT NULL,
  `Sdt` varchar(50) DEFAULT NULL,
  `NgayDang` datetime DEFAULT NULL,
  `Linkface` varchar(255) DEFAULT NULL,
  `MaAnhKhach` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MaKhachChoThue`),
  KEY `FK1KhachChoThue.MaViTri` (`MaViTri`),
  KEY `FK_khachchothue_quanlyanh` (`MaAnhKhach`),
  CONSTRAINT `FK_khachchothue_diachi` FOREIGN KEY (`MaViTri`) REFERENCES `diachi` (`MaViTri`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_khachchothue_quanlyanh` FOREIGN KEY (`MaAnhKhach`) REFERENCES `quanlyanh` (`MaAnhKhach`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bdsdatabase.khachchothue: ~1 rows (approximately)
INSERT INTO `khachchothue` (`MaKhachChoThue`, `MaViTri`, `TenKhachChoThue`, `Gia`, `ThongTinChiTiet`, `Sdt`, `NgayDang`, `Linkface`, `MaAnhKhach`) VALUES
	('1', '3df55520-8026-434c-aaa9-4400705372cf', '12', '12', '12', '12', '2023-03-25 08:45:39', '12', '1'),
	('6045774f-053a-462c-b184-fd7418b3a83e', '3262da73-c55a-489c-8b6e-dcb32dd1632c', '123', '123', '123', '123', '2023-03-25 02:21:03', '123', 'b9fe8a49-4d85-453b-bed9-1b91c3b71999');

-- Dumping structure for table bdsdatabase.khachmua
CREATE TABLE IF NOT EXISTS `khachmua` (
  `MaKhachMua` varchar(50) NOT NULL,
  `MaViTri` varchar(50) DEFAULT NULL,
  `TaiChinh` varchar(50) DEFAULT NULL,
  `TenKhach` varchar(50) DEFAULT NULL,
  `NhuCauChiTiet` varchar(50) DEFAULT NULL,
  `Sdt` varchar(50) DEFAULT NULL,
  `NgayDang` datetime DEFAULT NULL,
  `Linkface` varchar(255) DEFAULT NULL,
  `MaAnhKhach` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MaKhachMua`),
  KEY `FK1KhachMua.MaViTri` (`MaViTri`),
  KEY `FK_khachmua_quanlyanh` (`MaAnhKhach`),
  CONSTRAINT `FK_khachmua_diachi` FOREIGN KEY (`MaViTri`) REFERENCES `diachi` (`MaViTri`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_khachmua_quanlyanh` FOREIGN KEY (`MaAnhKhach`) REFERENCES `quanlyanh` (`MaAnhKhach`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bdsdatabase.khachmua: ~0 rows (approximately)

-- Dumping structure for table bdsdatabase.khachthue
CREATE TABLE IF NOT EXISTS `khachthue` (
  `MaKhachThue` varchar(50) NOT NULL,
  `MaViTri` varchar(50) DEFAULT NULL,
  `TenKhachThue` varchar(50) DEFAULT NULL,
  `TaiChinh` varchar(50) DEFAULT NULL,
  `NhuCauChiTiet` varchar(50) DEFAULT NULL,
  `Sdt` varchar(50) DEFAULT NULL,
  `NgayDang` datetime DEFAULT NULL,
  `Linkface` varchar(255) DEFAULT NULL,
  `MaAnhKhach` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MaKhachThue`),
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

-- Dumping data for table bdsdatabase.quanlyanh: ~2 rows (approximately)
INSERT INTO `quanlyanh` (`MaAnhKhach`) VALUES
	('1'),
	('b9fe8a49-4d85-453b-bed9-1b91c3b71999');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
