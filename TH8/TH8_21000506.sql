-- 1 Danh sách những nhân viên (HONV, TENLOT, TENNV) làm việc trong mọi đề án của công ty
SELECT 
    nv.HONV, nv.TENLOT, nv.TENNV
FROM
    nhanvien AS nv
WHERE NOT EXISTS
(
    SELECT *
    FROM
        phongban AS pb, dean AS da
    WHERE
        da.PHONG = pb.MAPHG
        AND
        da.MADA NOT IN
        (
            SELECT pc.MADA
            FROM phancong AS pc
            WHERE pc.MA_NVIEN = nv.MANV
        )
)

-- 2 Danh sách những nhân viên (HONV, TENLOT, TENNV) được phân công tất cả đề án do phòng số 4 chủ trì.
SELECT
    nv.HONV, nv.TENLOT, nv.TENNV
FROM
    nhanvien AS nv
WHERE NOT EXISTS
(
    SELECT da.MADA
    FROM dean AS da
    WHERE 
        da.PHONG = 4
        AND
        da.MADA NOT IN
        (
            SELECT pc.MADA
            FROM phancong AS pc
            WHERE pc.MA_NVIEN = nv.MANV
        )
)

-- 3 Tìm những nhân viên (HONV, TENLOT, TENNV) được phân công tất cả đề án mà nhân viên ‘Đinh Bá Tiến’ làm việc
SELECT 
    nv.HONV, nv.TENLOT, nv.TENNV
FROM
    nhanvien AS nv
WHERE NOT EXISTS
(
    SELECT MADA
    FROM phancong
    WHERE 
        MA_NVIEN = (
            SELECT MANV
            FROM nhanvien
            WHERE CONCAT(HONV, ' ', TENLOT, ' ', TENNV) = 'Đinh Bá Tiến'
        )
        AND MADA NOT IN (
            SELECT pc.MADA
            FROM phancong AS pc
            WHERE pc.MA_NVIEN = nv.MANV
        )
        
)

-- 4 Cho biết những nhân được phân công cho tất cả các công việc trong đề án ‘Sản phẩm X’
SELECT 
    nv.HONV, nv.TENLOT, nv.TENNV
FROM
    nhanvien AS nv
WHERE NOT EXISTS
(
    SELECT MADA, STT
    FROM congviec
    WHERE 
        MADA IN (
            SELECT MADA
            FROM dean
            WHERE TENDA = 'Sản phẩm X'
        )
        AND (MADA, STT) NOT IN (
            SELECT MADA, STT
            FROM phancong
            WHERE phancong.MA_NVIEN = nv.MANV
        )            
)

-- 5 Cho biết danh sách nhân viên tham gia vào tất cả các đề án ở TP HCM
SELECT 
    nv.HONV, nv.TENLOT, nv.TENNV
FROM
    nhanvien AS nv
WHERE NOT EXISTS (
    SELECT MADA
    FROM dean
    WHERE 
        DDIEM_DA = 'TP HCM'
        AND MADA NOT IN (
            SELECT MADA
            FROM phancong
            WHERE phancong.MA_NVIEN = nv.MANV
        )
)

-- 6 Cho biết phòng ban chủ trì tất cả các đề án ở TP HCM
SELECT da.PHONG
FROM dean AS da
WHERE NOT EXISTS (
    SELECT MADA
    FROM dean
    WHERE 
        DDIEM_DA = 'TP HCM'
        AND PHONG NOT IN (
            SELECT MAPHG
            FROM phongban
            WHERE phongban.MAPHG = da.PHONG
        )
) 

SELECT *
FROM phongban
WHERE NOT EXISTS (
    SELECT MADA
    FROM dean
    WHERE 
        DDIEM_DA = 'TP HCM'
        AND MADA NOT IN (
            SELECT MADA
            FROM dean
            WHERE phongban.MAPHG = dean.PHONG
        ) 
)