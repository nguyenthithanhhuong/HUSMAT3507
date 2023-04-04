-- 10
SELECT 
	COUNT(MADA) AS SOLUONGDA
FROM 
	dean;

-- 11
SELECT 
	COUNT(MADA)
FROM 
	phongban JOIN dean 
	ON phongban.MAPHG = dean.PHONG
WHERE 
	phongban.TENPHG = "Nghiên cứu";

-- 12
SELECT 
	AVG(LUONG)
FROM 
	nhanvien
WHERE 
	PHAI = "Nữ";

-- 13
SELECT 
	COUNT(TENTN) AS SOLUONGTN
FROM 
	thannhan JOIN nhanvien 
	ON thannhan.MA_NVIEN = nhanvien.MANV
WHERE 
	HONV = "Đinh" AND TENLOT = "Bá" AND TENNV = "Tiên";

-- 14
SELECT 
	dean.TENDA AS TENDA, 
	SUM(phancong.THOIGIAN) AS TONGTHOIGIAN
FROM 
	dean JOIN phancong 
	ON dean.MADA = phancong.MADA
GROUP BY 
	dean.TENDA;

-- 15
SELECT 
	dean.TENDA AS TENDA, 
	COUNT(phancong.MA_NVIEN) AS SONV_THAMGIA
FROM 
	dean JOIN phancong ON dean.MADA = phancong.MADA
GROUP BY 
	dean.TENDA;

-- 16
SELECT 
	HONV, 
	TENNV, 
	COUNT(TENTN) AS SLTHANNHAN
FROM 
	nhanvien LEFT JOIN thannhan 
	ON nhanvien.MANV = thannhan.MA_NVIEN
GROUP BY 
	nhanvien.MANV;

-- 17
SELECT 
	CONCAT(HONV, ' ', TENLOT, ' ', TENNV) AS HOTENNV, COUNT(MADA)
FROM 
	nhanvien LEFT JOIN phancong
	ON nhanvien.MANV = phancong.MA_NVIEN
GROUP BY 
	nhanvien.MANV;

-- 18
SELECT 
    CONCAT(nv1.HONV, ' ', nv1.TENLOT, ' ', nv1.TENNV) AS HOTENNV,
    COUNT(nv2.MANV) AS SLNVQUANLY
FROM
    nhanvien AS nv1
    LEFT JOIN nhanvien AS nv2
    ON nv1.MANV = nv2.MA_NQL
GROUP BY
    nv1.MANV;

-- 19
SELECT 
	MAPHG, 
	TENPHG, 
	AVG(LUONG) AS LUONGTB
FROM 
	phongban LEFT JOIN nhanvien 
	ON phongban.MAPHG = nhanvien.PHG
GROUP BY 
	phongban.MAPHG;

-- 20
SELECT 
	TENPHG,
    COUNT(MANV) AS SLNV
FROM 
	phongban LEFT JOIN nhanvien 
    ON phongban.MAPHG = nhanvien.PHG
GROUP BY 
	phongban.MAPHG
HAVING 
	AVG(LUONG) > 30000;

-- 21
SELECT 
	MAPHG, 
	TENPHG, 
	COUNT(PHONG) AS SLDA
FROM 
	phongban LEFT JOIN dean ON phongban.MAPHG = dean.PHONG
GROUP BY 
	phongban.MAPHG;

-- 22
SELECT 
	MAPHG, 
	TENPHG, 
	CONCAT(HONV, ' ' , TENLOT, ' ', TENNV) AS HOTENTP, 
	COUNT(DEAN.PHONG) AS SLDA
FROM 
	(phongban JOIN nhanvien 
	ON phongban.TRPHG = nhanvien.MANV)
     JOIN dean 
     ON dean.PHONG = phongban.MAPHG
GROUP BY
	phongban.MAPHG;

-- 23
SELECT
	phongban.TENPHG,
    COUNT(dean.MADA) AS SLDA
FROM 
	phongban LEFT JOIN dean 
    ON phongban.MAPHG = dean.PHONG
WHERE 
	phongban.MAPHG IN
    (
    	SELECT PHG
        FROM nhanvien
        GROUP BY PHG
        HAVING AVG(LUONG) > 40000
    )
GROUP BY 
	phongban.MAPHG;
-- 24
SELECT 
	DDIEM_DA, 
	COUNT(TENDA) AS SODA
FROM 
	dean
GROUP BY 
	DDIEM_DA;

-- 25
SELECT 
	dean.TENDA, 
	COUNT(congviec.MADA) AS SLCONGVIEC
FROM 
	dean JOIN congviec
	ON dean.MADA = congviec.MADA
GROUP BY 
	dean.TENDA;

-- 26
SELECT 
	congviec.TEN_CONG_VIEC,
    COUNT(phancong.MA_NVIEN) AS SLNV
FROM 
	congviec LEFT JOIN phancong 
    ON (
        congviec.MADA = phancong.MADA
        AND congviec.STT = phancong.STT
        )
WHERE 
	congviec.MADA = 30
GROUP BY 
	congviec.TEN_CONG_VIEC;

-- 27
SELECT
	congviec.TEN_CONG_VIEC,
    COUNT(phancong.MA_NVIEN)
FROM
	congviec LEFT JOIN phancong
    ON (
        congviec.MADA = phancong.MADA
        AND congviec.STT = phancong.STT
        )
WHERE
	congviec.MADA IN (
    	SELECT MADA
        FROM dean 
        WHERE TENDA = 'Dao tao'
    )
GROUP BY 
	congviec.TEN_CONG_VIEC;