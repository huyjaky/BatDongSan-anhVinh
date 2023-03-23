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
  PRIMARY KEY (`MaViTri`),
  KEY `MaQuan` (`MaQuan`),
  KEY `MaPhuong` (`MaPhuong`),
  CONSTRAINT `diachi_ibfk_1` FOREIGN KEY (`MaQuan`) REFERENCES `quan` (`MaQuan`),
  CONSTRAINT `diachi_ibfk_2` FOREIGN KEY (`MaPhuong`) REFERENCES `phuong` (`MaPhuong`),
  CONSTRAINT `khachban` FOREIGN KEY (`MaViTri`) REFERENCES `khachban` (`MaViTri`),
  CONSTRAINT `khachchothue` FOREIGN KEY (`MaViTri`) REFERENCES `khachchothue` (`MaViTri`),
  CONSTRAINT `khachmua` FOREIGN KEY (`MaViTri`) REFERENCES `khachmua` (`MaViTri`),
  CONSTRAINT `khachthue` FOREIGN KEY (`MaViTri`) REFERENCES `khachthue` (`MaViTri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bdsdatabase.diachi: ~0 rows (approximately)

-- Dumping structure for table bdsdatabase.hinhanh
CREATE TABLE IF NOT EXISTS `hinhanh` (
  `MaAnh` varchar(50) NOT NULL,
  `Hinh` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MaAnh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bdsdatabase.hinhanh: ~0 rows (approximately)

-- Dumping structure for table bdsdatabase.khachban
CREATE TABLE IF NOT EXISTS `khachban` (
  `MaKhachBan` varchar(50) NOT NULL,
  `MaViTri` varchar(50) DEFAULT NULL,
  `TenKhach` varchar(50) DEFAULT NULL,
  `Gia` varchar(50) DEFAULT NULL,
  `Sdt` varchar(50) DEFAULT NULL,
  `NgayDang` datetime DEFAULT NULL,
  `MaAnh` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MaKhachBan`),
  KEY `FK1KhachBan.MaViTri` (`MaViTri`),
  KEY `FK2KhachBan.MaAnh` (`MaAnh`),
  CONSTRAINT `FK1KhachBan.MaViTri` FOREIGN KEY (`MaViTri`) REFERENCES `vitri` (`MaViTri`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bdsdatabase.khachban: ~0 rows (approximately)

-- Dumping structure for table bdsdatabase.khachchothue
CREATE TABLE IF NOT EXISTS `khachchothue` (
  `MaKhachChoThue` varchar(50) NOT NULL,
  `MaViTri` varchar(50) DEFAULT NULL,
  `TenKhachChoThue` varchar(50) DEFAULT NULL,
  `Gia` varchar(50) DEFAULT NULL,
  `ThongTinChiTiet` varchar(50) DEFAULT NULL,
  `Sdt` varchar(50) DEFAULT NULL,
  `NgayDang` datetime DEFAULT NULL,
  `MaAnh` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MaKhachChoThue`),
  KEY `FK1KhachChoThue.MaViTri` (`MaViTri`),
  KEY `FK2KhachChoThue.MaAnh` (`MaAnh`),
  CONSTRAINT `FK1KhachChoThue.MaViTri` FOREIGN KEY (`MaViTri`) REFERENCES `vitri` (`MaViTri`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bdsdatabase.khachchothue: ~0 rows (approximately)

-- Dumping structure for table bdsdatabase.khachmua
CREATE TABLE IF NOT EXISTS `khachmua` (
  `MaKhachMua` varchar(50) NOT NULL,
  `MaViTri` varchar(50) DEFAULT NULL,
  `TaiChinh` varchar(50) DEFAULT NULL,
  `TenKhach` varchar(50) DEFAULT NULL,
  `NhuCauChiTiet` varchar(50) DEFAULT NULL,
  `Sdt` varchar(50) DEFAULT NULL,
  `NgayDang` datetime DEFAULT NULL,
  `MaAnh` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MaKhachMua`),
  KEY `FK1KhachMua.MaViTri` (`MaViTri`),
  KEY `FK2KhachMua.MaAnh` (`MaAnh`),
  CONSTRAINT `FK1KhachMua.MaViTri` FOREIGN KEY (`MaViTri`) REFERENCES `vitri` (`MaViTri`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `MaAnh` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MaKhachThue`),
  KEY `FK1KhachThue.MaViTri` (`MaViTri`),
  KEY `FK2KhachThue.MaAnh` (`MaAnh`),
  CONSTRAINT `FK1KhachThue.MaViTri` FOREIGN KEY (`MaViTri`) REFERENCES `vitri` (`MaViTri`) ON DELETE NO ACTION ON UPDATE NO ACTION
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

-- Dumping data for table bdsdatabase.nhanvien: ~0 rows (approximately)
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

-- Dumping data for table bdsdatabase.phuong: ~0 rows (approximately)

-- Dumping structure for table bdsdatabase.phuongquan
CREATE TABLE IF NOT EXISTS `phuongquan` (
  `MaPhuong` varchar(50) DEFAULT NULL,
  `MaQuan` varchar(50) DEFAULT NULL,
  KEY `MaPhuong` (`MaPhuong`),
  KEY `MaQuan` (`MaQuan`),
  CONSTRAINT `phuongquan_ibfk_1` FOREIGN KEY (`MaPhuong`) REFERENCES `phuong` (`MaPhuong`),
  CONSTRAINT `phuongquan_ibfk_2` FOREIGN KEY (`MaQuan`) REFERENCES `quan` (`MaQuan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bdsdatabase.phuongquan: ~0 rows (approximately)

-- Dumping structure for table bdsdatabase.quan
CREATE TABLE IF NOT EXISTS `quan` (
  `MaQuan` varchar(50) NOT NULL,
  `TenQuan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MaQuan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bdsdatabase.quan: ~0 rows (approximately)

-- Dumping structure for table bdsdatabase.quanlyanh
CREATE TABLE IF NOT EXISTS `quanlyanh` (
  `MaAnh` varchar(50) NOT NULL,
  `MaKhach` varchar(50) DEFAULT NULL,
  KEY `MaKhach` (`MaKhach`),
  KEY `FK_quanlyanh_hinhanh` (`MaAnh`),
  CONSTRAINT `FK_quanlyanh_hinhanh` FOREIGN KEY (`MaAnh`) REFERENCES `hinhanh` (`MaAnh`),
  CONSTRAINT `quanlyanh_ibfk_1` FOREIGN KEY (`MaKhach`) REFERENCES `khachban` (`MaKhachBan`),
  CONSTRAINT `quanlyanh_ibfk_2` FOREIGN KEY (`MaKhach`) REFERENCES `khachchothue` (`MaKhachChoThue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bdsdatabase.quanlyanh: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
