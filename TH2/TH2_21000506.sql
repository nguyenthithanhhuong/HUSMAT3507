-- Tạo database quanlydeancongty
CREATE DATABASE quanlydeancongty;

-- Tạo bảng NHANVIEN và khóa chính
CREATE TABLE NHANVIEN
(
    HONV VARCHAR(15) NOT NULL COMMENT 'Họ của nhân viên',
    TENLOT VARCHAR(15) NOT NULL COMMENT 'Tên lót của nhân viên',
    TENNV VARCHAR(15) NOT NULL COMMENT ' Tên của nhân viên',
    MANV VARCHAR(9) NOT NULL COMMENT 'Mã số nhân viên',
    NGSINH DATE NOT NULL COMMENT 'Ngày tháng năm sinh nhân viên',
    DCHI VARCHAR(30) NOT NULL COMMENT 'Địa chỉ cư ngụ của nhâ viên',
    PHAI VARCHAR(3) NOT NULL COMMENT 'Giới tính',
    LUONG FLOAT NOT NULL COMMENT 'Lương nhân viên',
    MA_NQL VARCHAR(9) NOT NULL COMMENT 'Mã người quản lý',
    PHG INT NOT NULL COMMENT 'Mã phòng ban',
    PRIMARY KEY (MANV)
);

-- Tạo bảng PHONGBAN và khóa chính
CREATE TABLE PHONGBAN
(
    TENPHG VARCHAR(15) NOT NULL COMMENT 'Tên phòng ban',
    MAPHG INT NOT NULL COMMENT 'Mã phòng ban',
    TRPHG VARCHAR(9) NOT NULL COMMENT 'Mã người trưởng phòng',
    NG_NHANCHUC DATE NOT NULL COMMENT 'Ngày nhận chức trưởng phòng',
    PRIMARY KEY (MAPHG)
);

-- Tạo bảng DIADIEM_PHG và khóa chính
CREATE TABLE DIADIEM_PHG
(
    MAPHG INT NOT NULL COMMENT 'Mã phòng ban',    
    DIADIEM VARCHAR(15) NOT NULL COMMENT 'Địa điểm của phòng ban',
    PRIMARY KEY (DIADIEM, MAPHG)
);

-- Tạo bảng DEAN và khóa chính
CREATE TABLE DEAN
(
    TENDA VARCHAR(15) NOT NULL COMMENT 'Tên đề án',
    MADA INT NOT NULL COMMENT 'Mã số đề án',
    DDIEM_DA VARCHAR(15) NOT NULL COMMENT 'Địa điểm diễn ra đề án',
    PHONG INT NOT NULL COMMENT 'Mã số phòng ban phụ trách đề án',
    PRIMARY KEY (MADA)
);

-- Tạo bảng CONGVIEC và khóa chính
CREATE TABLE CONGVIEC
(
    MADA INT NOT NULL COMMENT 'Mã số đề án',
    STT INT NOT NULL COMMENT 'Số thứ tự công việc trong một đề án',
    TEN_CONG_VIEC VARCHAR(50) NOT NULL COMMENT 'Tên công việc',
    PRIMARY KEY (STT, MADA)
);

-- Tạo bảng PHANCONG và khóa chính
CREATE TABLE PHANCONG
(
    MA_NVIEN VARCHAR(9) NOT NULL COMMENT 'Mã số nhân viên',
    MADA INT NOT NULL COMMENT 'Mã số đề án',
    STT INT NOT NULL COMMENT ' Số thứ tự công việc trong một đề án',
    THOIGIAN FLOAT(5,1) NOT NULL COMMENT 'Thời gian làm việc 1 đề án 
    của 1 nhân viên trong 1 tuần',
    PRIMARY KEY (MA_NVIEN, MADA, STT)
);

-- Tạo bảng THANNHAN và khóa chính
CREATE TABLE THANNHAN
(
    MA_NVIEN VARCHAR(9) NOT NULL COMMENT 'Mã số nhân viên',
    TENTN VARCHAR(15) NOT NULL COMMENT 'Tên thân nhân của nhân viên',
    PHAI VARCHAR(3) NOT NULL COMMENT 'Giới tính',
    NGSINH DATE NOT NULL COMMENT 'Ngày tháng năm sinh nhân viên',
    QUANHE VARCHAR(15) NOT NULL COMMENT 'Mối quan hệ với nhân viên',
    PRIMARY KEY (MA_NVIEN, TENTN)
);


-- Chèn dữ liệu vào bảng NHANVIEN
INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG) 
VALUES
("Đinh", "Bá", "Tiên", "009", 11/02/1960, "119 Cống Quỳnh, Tp HCM", "Nam", 30000, "005", 5),
("Nguyễn", "Thanh", "Tùng", "005", 20/08/1962, "222 Nguyễn Văn Cừ, Tp HCM", "Nam", 40000, "006", 5),
("Bùi", "Ngọc", "Hằng", "007", 11/03/1954, "332 Nguyễn Thái Học, Tp HCM", "Nam", 25000, "001", 4),
("Lê", "Quỳnh", "Như", "001", 01/02/1967, "291 Hồ Văn Huế, Tp HCM", "Nữ", 43000, "006", 4),
("Nguyễn", "Mạnh", "Hùng", "004", 04/03/1967, "95 Bà Rịa, Vũng Tàu", "Nam", 38000, "005", 5),
("Trần", "Thanh", "Tâm", "003", 04/05/1957, "34 Mai Thị Lự, Tp HCM", "Nam",  25000, "005", 5),
("Trần", "Hồng", "Quang", "008", 01/09/1967, "80 Lê Hồng Phong, Tp HCM", "Nam", 25000, "001", 4),
("Phạm", "Văn", "Vinh", "006", 01/01/1965, "45 Trưng Vương, Hà Nội", "Nữ", 55000, "", 1);

-- Chèn dữ liệu vào bảng PHONGBAN
INSERT INTO PHONGBAN (TENPHG, MAPHG, TRPHG, NG_NHANCHUC)
VALUES
("Nghiên cứu", 5, "005", 22/05/1978),
("Điều hành", 4, "008", 01/01/1985),
("Quản lý", 1, "006", 19/06/1971);

-- Chèn dữ liệu vào bảng DEAN
INSERT INTO DEAN (TENDA, MADA, DDIEM_DA,PHONG)
VALUES
("San pham X", 1, "Vũng Tàu", 5),
("San pham Y", 2, "Nha Trang", 5),
("San pham Z", 3, "TP HCM", 5),
("Tin hoc hoa", 10, "Hà Nội", 4),
("Cáp quang", 20, "TP HCM", 1),
("Dao tao", 30, "Hà Nội", 4);

-- Chèn dữ liệu vào bảng THANNHAN
INSERT INTO THANNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
VALUES
("005", "Trinh", "Nữ", 05/04/1976, "Con gái"),
("005", "Khang", "Nam", 25/10/1973, "Con trai"),
("005", "Phương", "Nữ", 03/05/1948, "Vợ chồng"),
("001", "Minh", "Nam", 29/02/1932, "Vợ chồng"),
("009", "Tiến", "Nam", 01/01/1978, "Con trai"),
("009", "Châu", "Nữ", 30/12/1978, "Con gái"),
("009", "Phương", "Nữ", 05/05/1957, "Vợ chồng");

-- Chèn dữ liệu vào bảng DIADIEM_PHG
INSERT INTO DIADIEM_PHG (MAPHG, DIADIEM)
VALUES
(1, "TP HCM"),
(4, "Hà Nội"),
(5, "TAU"),
(5, "NHA TRANG"),
(5, "TP HCM");

-- Chèn dữ liệu vào bảng PHANCONG
INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
VALUES
("009", 1, 1, 32),
("009", 2, 2, 8),
("004", 3, 1, 40),
("003", 1, 2, 20.0),
("003", 2, 1, 20.0),
("008", 10, 1, 35),
("008", 30, 2, 5),
("001", 30, 1, 20),
("001", 20, 1, 15),
("006", 20, 1, 30),
("005", 3, 1, 10),
("005", 10, 2, 10),
("005", 20, 1, 10),
("007", 30, 2, 30),
("007", 10, 2, 10);

-- Chèn dữ liệu vào bảng CONGVIEC
INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
VALUES
(1, 1, "Thiet ke san pham X"),
(1, 2, "Thu nghiem san pham X"),
(2, 1, "San xuat san pham Y"),
(2, 2, "Quang cao san pham Y"),
(3, 1, "Khuyen mai san pham Z"),
(10, 1, "Tin hoc hoa nhan su tien luong"),
(10, 2, "Tin hoc hoa Kinh doanh"),
(20, 1, "Lap dat cap quang"),
(30, 1, "Dao tao nha vien Marketing"),
(30, 2, "Dao tao chuyen vien vien thiet ke");

