-- 1. Tìm các nhân viên làm việc ở phòng số 4
SELECT * FROM NHANVIEN WHERE PHG = 4;

-- 2. Tìm các nhân viên có mức lương trên 30000
SELECT * FROM NHANVIEN WHERE LUONG > 30000;

-- 3. Tìm các nhân viên có mức lương trên 25000 ở phòng 4 hoặc các nhân viên có mức lương trên 30000 ở phòng 5
SELECT * FROM NHANVIEN WHERE (LUONG > 25000 AND PHG = 4) OR (LUONG > 30000 AND PHG = 5);

-- 4. Cho biết họ tên đầy đủ của các nhân viên ở TP HCM
SELECT CONCAT(HONV, ' ', TENLOT, ' ', TENNV) as HOTENNV, DCHI
FROM NHANVIEN
WHERE RIGHT(DCHI, 6) = 'Tp HCM';

-- 5. Cho biết họ tên đầy đủ của các nhân viên có họ bắt đầu bằng kí tự 'N'
SELECT CONCAT(HONV, ' ', TENLOT, ' ', TENNV) as HOTENNV
FROM NHANVIEN
WHERE HONV LIKE 'N%';

-- 6. Cho biết ngày sing và địa chỉ của nhân viên Đinh Bá Tiên
SELECT HONV, TENLOT, TENNV, NGSINH, DCHI
FROM NHANVIEN
WHERE HONV = 'Đinh' AND TENLOT = 'Bá' AND TENNV = 'Tiên';

-- 7. Cho biết các nhân viên có năm sinh trong khoảng 1960 đến 1965
SELECT HONV, TENLOT, TENNV, YEAR(NGSINH) as NAMSINH
FROM NHANVIEN
WHERE YEAR(NGSINH) BETWEEN 1960 AND 1965;

-- 8. Cho biết các nhân viên và năm sinh của nhân viên
SELECT HONV, TENLOT, TENNV, YEAR(NGSINH) as NAMSINH
FROM NHANVIEN;

-- 9. Cho biết các nhân viên và tuổi của nhân viên
SELECT HONV, TENLOT, TENNV, (YEAR(CURRENT_TIMESTAMP) - YEAR(NGSINH)) as TUOI
FROM NHANVIEN;

