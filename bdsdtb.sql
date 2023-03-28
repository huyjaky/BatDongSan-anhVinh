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
	('2e86e43a-631c-4ef7-8813-c5f9db05a45a', 'Q2', 'P11', '123'),
	('d4add3d9-3665-4bb1-997e-cb51d3fe7027', 'Q3', 'P11', '123');

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

-- Dumping data for table bdsdatabase.folderanh: ~0 rows (approximately)

-- Dumping structure for table bdsdatabase.hinhanh
CREATE TABLE IF NOT EXISTS `hinhanh` (
  `MaAnh` varchar(50) NOT NULL,
  `Hinh` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`MaAnh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bdsdatabase.hinhanh: ~0 rows (approximately)

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

-- Dumping data for table bdsdatabase.khachchothue: ~0 rows (approximately)

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

-- Dumping data for table bdsdatabase.khachmua: ~1 rows (approximately)
INSERT INTO `khachmua` (`MaKhach`, `MaViTri`, `TaiChinh`, `TenKhach`, `NhuCauChiTiet`, `Sdt`, `NgayDang`, `Linkface`, `MaAnhKhach`, `SoPhongNgu`, `SoPhongVeSinh`, `TheLoai`) VALUES
	('f08e7f40-b343-4404-ad56-4aa576b6d968', 'd4add3d9-3665-4bb1-997e-cb51d3fe7027', '0123', '123', '123123', '123', '2023-03-27 15:53:30', '123', '0758fa74-1396-4fa6-b44f-6fb13a75bbf5', '11', '11', 'Nguyen Can');

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

-- Dumping data for table bdsdatabase.khachthue: ~1 rows (approximately)
INSERT INTO `khachthue` (`MaKhach`, `MaViTri`, `TenKhach`, `TaiChinh`, `NhuCauChiTiet`, `Sdt`, `NgayDang`, `Linkface`, `MaAnhKhach`, `SoPhongNgu`, `SoPhongVeSinh`, `TheLoai`) VALUES
	('10bc5631-9fcf-4ccd-93ba-45be38fb3729', '2e86e43a-631c-4ef7-8813-c5f9db05a45a', '123', '0123', '123123123123123', '123', '2023-03-27 14:55:13', '123', '9f008465-bd2d-4d78-abcf-55360099deb4', '1', '2', 'Can Ho');

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
	('0758fa74-1396-4fa6-b44f-6fb13a75bbf5'),
	('9f008465-bd2d-4d78-abcf-55360099deb4');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
