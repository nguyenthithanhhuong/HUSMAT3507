-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 04, 2023 at 04:18 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quanlydeancongty`
--

-- --------------------------------------------------------

--
-- Table structure for table `congviec`
--

CREATE TABLE `congviec` (
  `MADA` int(11) NOT NULL COMMENT 'Mã số đề án',
  `STT` int(11) NOT NULL COMMENT 'Số thứ tự công việc trong một đề án',
  `TEN_CONG_VIEC` varchar(50) NOT NULL COMMENT 'Tên công việc'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `congviec`
--

INSERT INTO `congviec` (`MADA`, `STT`, `TEN_CONG_VIEC`) VALUES
(1, 1, 'Thiet ke san pham X'),
(1, 2, 'Thu nghiem san pham X'),
(2, 1, 'San xuat san pham Y'),
(2, 2, 'Quang cao san pham Y'),
(3, 1, 'Khuyen mai san pham Z'),
(10, 1, 'Tin hoc hoa nhan su tien luong'),
(10, 2, 'Tin hoc hoa Kinh doanh'),
(20, 1, 'Lap dat cap quang'),
(30, 1, 'Dao tao nha vien Marketing'),
(30, 2, 'Dao tao chuyen vien vien thiet ke');

-- --------------------------------------------------------

--
-- Table structure for table `dean`
--

CREATE TABLE `dean` (
  `TENDA` varchar(15) NOT NULL COMMENT 'Tên đề án',
  `MADA` int(11) NOT NULL COMMENT 'Mã số đề án',
  `DDIEM_DA` varchar(15) NOT NULL COMMENT 'Địa điểm diễn ra đề án',
  `PHONG` int(11) NOT NULL COMMENT 'Mã số phòng ban phụ trách đề án'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dean`
--

INSERT INTO `dean` (`TENDA`, `MADA`, `DDIEM_DA`, `PHONG`) VALUES
('San pham X', 1, 'Vũng Tàu', 5),
('San pham Y', 2, 'Nha Trang', 5),
('San pham Z', 3, 'TP HCM', 5),
('Tin hoc hoa', 10, 'Hà Nội', 4),
('Cáp quang', 20, 'TP HCM', 1),
('Dao tao', 30, 'Hà Nội', 4);

-- --------------------------------------------------------

--
-- Table structure for table `diadiem_phg`
--

CREATE TABLE `diadiem_phg` (
  `MAPHG` int(11) NOT NULL COMMENT 'Mã phòng ban',
  `DIADIEM` varchar(15) NOT NULL COMMENT 'Địa điểm của phòng ban'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `diadiem_phg`
--

INSERT INTO `diadiem_phg` (`MAPHG`, `DIADIEM`) VALUES
(1, 'TP HCM'),
(4, 'Hà Nội'),
(5, 'NHA TRANG'),
(5, 'TAU'),
(5, 'TP HC');

-- --------------------------------------------------------

--
-- Table structure for table `nhanvien`
--

CREATE TABLE `nhanvien` (
  `HONV` varchar(15) NOT NULL COMMENT 'Họ của nhân viên',
  `TENLOT` varchar(15) NOT NULL COMMENT 'Tên lót của nhân viên',
  `TENNV` varchar(15) NOT NULL COMMENT ' Tên của nhân viên',
  `MANV` varchar(9) NOT NULL COMMENT 'Mã số nhân viên',
  `NGSINH` date NOT NULL COMMENT 'Ngày tháng năm sinh nhân viên',
  `DCHI` varchar(30) NOT NULL COMMENT 'Địa chỉ cư ngụ của nhâ viên',
  `PHAI` varchar(3) NOT NULL COMMENT 'Giới tính',
  `LUONG` float NOT NULL COMMENT 'Lương nhân viên',
  `MA_NQL` varchar(9) NOT NULL COMMENT 'Mã người quản lý',
  `PHG` int(11) NOT NULL COMMENT 'Mã phòng ban'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nhanvien`
--

INSERT INTO `nhanvien` (`HONV`, `TENLOT`, `TENNV`, `MANV`, `NGSINH`, `DCHI`, `PHAI`, `LUONG`, `MA_NQL`, `PHG`) VALUES
('Lê', 'Quỳnh', 'Như', '001', '0000-00-00', '291 Hồ Văn Huế, Tp HCM', 'Nữ', 43000, '006', 4),
('Trần', 'Thanh', 'Tâm', '003', '0000-00-00', '34 Mai Thị Lự, Tp HCM', 'Nam', 25000, '005', 5),
('Nguyễn', 'Mạnh', 'Hùng', '004', '0000-00-00', '95 Bà Rịa, Vũng Tàu', 'Nam', 38000, '005', 5),
('Nguyễn', 'Thanh', 'Tùng', '005', '0000-00-00', '222 Nguyễn Văn Cừ, Tp HCM', 'Nam', 40000, '006', 5),
('Phạm', 'Văn', 'Vinh', '006', '0000-00-00', '45 Trưng Vương, Hà Nội', 'Nữ', 55000, '', 1),
('Bùi', 'Ngọc', 'Hằng', '007', '0000-00-00', '332 Nguyễn Thái Học, Tp HCM', 'Nam', 25000, '001', 4),
('Trần', 'Hồng', 'Quang', '008', '0000-00-00', '80 Lê Hồng Phong, Tp HCM', 'Nam', 25000, '001', 4),
('Đinh', 'Bá', 'Tiên', '009', '0000-00-00', '119 Cống Quỳnh, Tp HCM', 'Nam', 30000, '005', 5);

-- --------------------------------------------------------

--
-- Table structure for table `phancong`
--

CREATE TABLE `phancong` (
  `MA_NVIEN` varchar(9) NOT NULL COMMENT 'Mã số nhân viên',
  `MADA` int(11) NOT NULL COMMENT 'Mã số đề án',
  `STT` int(11) NOT NULL COMMENT ' Số thứ tự công việc trong một đề án',
  `THOIGIAN` float(5,1) NOT NULL COMMENT 'Thời gian làm việc 1 đề án \r\n    của 1 nhân viên trong 1 tuần'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `phancong`
--

INSERT INTO `phancong` (`MA_NVIEN`, `MADA`, `STT`, `THOIGIAN`) VALUES
('001', 20, 1, 15.0),
('001', 30, 1, 20.0),
('003', 1, 2, 20.0),
('003', 2, 1, 20.0),
('004', 3, 1, 40.0),
('005', 3, 1, 10.0),
('005', 10, 2, 10.0),
('005', 20, 1, 10.0),
('006', 20, 1, 30.0),
('007', 10, 2, 10.0),
('007', 30, 2, 30.0),
('008', 10, 1, 35.0),
('008', 30, 2, 5.0),
('009', 1, 1, 32.0),
('009', 2, 2, 8.0);

-- --------------------------------------------------------

--
-- Table structure for table `phongban`
--

CREATE TABLE `phongban` (
  `TENPHG` varchar(15) NOT NULL COMMENT 'Tên phòng ban',
  `MAPHG` int(11) NOT NULL COMMENT 'Mã phòng ban',
  `TRPHG` varchar(9) NOT NULL COMMENT 'Mã người trưởng phòng',
  `NG_NHANCHUC` date NOT NULL COMMENT 'Ngày nhận chức trưởng phòng'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `phongban`
--

INSERT INTO `phongban` (`TENPHG`, `MAPHG`, `TRPHG`, `NG_NHANCHUC`) VALUES
('Quản lý', 1, '006', '0000-00-00'),
('Điều hành', 4, '008', '0000-00-00'),
('Nghiên cứu', 5, '005', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `thannhan`
--

CREATE TABLE `thannhan` (
  `MA_NVIEN` varchar(9) NOT NULL COMMENT 'Mã số nhân viên',
  `TENTN` varchar(15) NOT NULL COMMENT 'Tên thân nhân của nhân viên',
  `PHAI` varchar(3) NOT NULL COMMENT 'Giới tính',
  `NGSINH` date NOT NULL COMMENT 'Ngày tháng năm sinh nhân viên',
  `QUANHE` varchar(15) NOT NULL COMMENT 'Mối quan hệ với nhân viên'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `thannhan`
--

INSERT INTO `thannhan` (`MA_NVIEN`, `TENTN`, `PHAI`, `NGSINH`, `QUANHE`) VALUES
('001', 'Minh', 'Nam', '0000-00-00', 'Vợ chồng'),
('005', 'Khang', 'Nam', '0000-00-00', 'Con trai'),
('005', 'Phương', 'Nữ', '0000-00-00', 'Vợ chồng'),
('005', 'Trinh', 'Nữ', '0000-00-00', 'Con gái'),
('009', 'Châu', 'Nữ', '0000-00-00', 'Con gái'),
('009', 'Phương', 'Nữ', '0000-00-00', 'Vợ chồng'),
('009', 'Tiến', 'Nam', '0000-00-00', 'Con trai');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `congviec`
--
ALTER TABLE `congviec`
  ADD PRIMARY KEY (`MADA`,`STT`);

--
-- Indexes for table `dean`
--
ALTER TABLE `dean`
  ADD PRIMARY KEY (`MADA`);

--
-- Indexes for table `diadiem_phg`
--
ALTER TABLE `diadiem_phg`
  ADD PRIMARY KEY (`MAPHG`,`DIADIEM`);

--
-- Indexes for table `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`MANV`),
  ADD KEY `PHG` (`PHG`);

--
-- Indexes for table `phancong`
--
ALTER TABLE `phancong`
  ADD PRIMARY KEY (`MA_NVIEN`,`MADA`,`STT`),
  ADD KEY `MADA` (`MADA`,`STT`);

--
-- Indexes for table `phongban`
--
ALTER TABLE `phongban`
  ADD PRIMARY KEY (`MAPHG`);

--
-- Indexes for table `thannhan`
--
ALTER TABLE `thannhan`
  ADD PRIMARY KEY (`MA_NVIEN`,`TENTN`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `congviec`
--
ALTER TABLE `congviec`
  ADD CONSTRAINT `congviec_ibfk_1` FOREIGN KEY (`MADA`) REFERENCES `dean` (`MADA`);

--
-- Constraints for table `diadiem_phg`
--
ALTER TABLE `diadiem_phg`
  ADD CONSTRAINT `diadiem_phg_ibfk_1` FOREIGN KEY (`MAPHG`) REFERENCES `phongban` (`MAPHG`);

--
-- Constraints for table `phancong`
--
ALTER TABLE `phancong`
  ADD CONSTRAINT `phancong_ibfk_1` FOREIGN KEY (`MADA`,`STT`) REFERENCES `congviec` (`MADA`, `STT`),
  ADD CONSTRAINT `phancong_ibfk_2` FOREIGN KEY (`MA_NVIEN`) REFERENCES `nhanvien` (`MANV`);

--
-- Constraints for table `phongban`
--
ALTER TABLE `phongban`
  ADD CONSTRAINT `phongban_ibfk_1` FOREIGN KEY (`MAPHG`) REFERENCES `nhanvien` (`PHG`);

--
-- Constraints for table `thannhan`
--
ALTER TABLE `thannhan`
  ADD CONSTRAINT `thannhan_ibfk_1` FOREIGN KEY (`MA_NVIEN`) REFERENCES `nhanvien` (`MANV`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
