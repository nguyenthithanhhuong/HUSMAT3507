-- 2
SELECT 
       HONV, TENLOT, TENNV
FROM 
       nhanvien
WHERE 
       (SELECT COUNT(*)
              FROM thannhan
              WHERE thannhan.MA_NVIEN = nhanvien.MANV) > 2;


-- 3
SELECT 
       HONV, TENLOT, TENNV
FROM 
       nhanvien
WHERE 
      (SELECT COUNT(*)
       FROM thannhan
       WHERE thannhan.MA_NVIEN = nhanvien.MANV) = 0;

-- 4
SELECT HONV, TENLOT, TENNV
FROM nhanvien
WHERE 
       MANV IN (
              SELECT MA_NVIEN
              FROM thannhan
       )
       AND 
       MANV IN (
              SELECT TRPHG
              FROM phongban
       )

-- 5
SELECT HONV
FROM nhanvien
WHERE MANV IN (
       SELECT MA_NVIEN 
       FROM thannhan
       WHERE NOT QUANHE = 'Vợ chồng'
       )
       AND
       MANV IN (
              SELECT TRPHG
              FROM phongban
       )

-- 6
SELECT HONV, TENLOT, TENNV
FROM nhanvien
WHERE LUONG >= ALL
       (SELECT AVG(nhanvien.LUONG)
       FROM nhanvien, phongban
       WHERE nhanvien.PHG = phongban.MAPHG
       AND phongban.TENPHG = 'Nghiên cứu'
       )

-- 7
SELECT phongban.TENPHG, nhanvien.HONV, nhanvien.TENLOT, nhanvien.TENNV
FROM phongban JOIN nhanvien
       ON phongban.TRPHG = nhanvien.MANV
WHERE MAPHG = (
       SELECT PHG
       FROM nhanvien
       GROUP BY PHG
       ORDER BY COUNT(*) desc
       LIMIT 1
)