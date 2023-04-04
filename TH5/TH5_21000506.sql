-- 10. Với mỗi phòng ban, cho biết tên phòng ban và địa điểm phòng
SELECT TENPHG, DIADIEM
FROM (PHONGBAN JOIN DIADIEM_PHG ON PHONGBAN.MAPHG = DIADIEM_PHG.MAPHG);

-- 11. Tìm tên những người trưởng phòng của từng phòng ban
SELECT TENNV, TENPHG
FROM (NHANVIEN JOIN PHONGBAN ON NHANVIEN.MANV = PHONGBAN.TRPHG);

-- 12. Tìm tên và địa chỉ của tất cả các nhân viên của phòng nghiên cứu
SELECT TENNV, DCHI
FROM (NHANVIEN JOIN PHONGBAN ON NHANVIEN.PHG = PHONGBAN.MAPHG)
WHERE TENPHG = 'Nghiên cứu';

-- 13. Với mỗi đề án ở Hà Nội, cho biết tên đề án, tên phòng ban, họ tên và ngày nhận chức của trưởng phòng của phòng ban chủ trì đề án đó
SELECT TENDA, TENPHG, CONCAT(HONV, ' ', TENLOT, ' ', TENNV) AS HOTEN_TP, NG_NHANCHUC
FROM ((DEAN JOIN PHONGBAN ON DEAN.PHONG = PHONGBAN.MAPHG)
      JOIN NHANVIEN ON NHANVIEN.MANV = PHONGBAN.TRPHG)
WHERE DDIEM_DA = 'Hà Nội';

-- 14. Tìm tên những nữ nhân viên và tên người thân của họ
SELECT TENNV, TENTN
FROM(NHANVIEN JOIN THANNHAN ON NHANVIEN.MANV = THANNHAN.MA_NVIEN)
WHERE NHANVIEN.PHAI = 'Nữ';

-- 15. Với mỗi nhân viên cho biết họ ten nhân viên và họ tên người quản lý trực tiếp của nhân viên đó
SELECT CONCAT(NV1.HONV, ' ', NV1.TENLOT, ' ', NV1.TENNV) AS HOTEN_NV,
	   CONCAT(NV2.HONV, ' ', NV2.TENLOT, ' ', NV2.TENNV) AS HOTEN_NQL
FROM (NHANVIEN AS NV1 JOIN NHANVIEN AS NV2 ON NV1.MA_NQL = NV2.MANV);

-- 16. Với mỗi nhân viên, cho biết họ tên của nhân viên đó, họ tên người trưởng phòng và họ tên người quản lý trực tiếp của nhân viên đó
SELECT CONCAT(NV1.HONV, ' ', NV1.TENLOT, ' ', NV1.TENNV) AS HOTEN_NV, 
	   CONCAT(NV2.HONV, ' ', NV2.TENLOT, ' ', NV2.TENNV) AS HOTEN_TP,
       CONCAT(NV3.HONV, ' ', NV3.TENLOT, ' ', NV3.TENNV) AS HOTEN_NQL
FROM ((NHANVIEN AS NV1 JOIN NHANVIEN AS NV3 ON NV1.MA_NQL = NV3.MANV)
       JOIN (PHONGBAN JOIN NHANVIEN AS NV2 ON PHONGBAN.TRPHG = NV2.MANV)
	   ON PHONGBAN.MAPHG = NV1.PHG);

-- 17 Tên những nhân viên phòng số 5 có tham gia vào đề án "San pham X" và nhân viên này do "Nguyen Thanh Tung" quản lý trực tiếp.
SELECT CONCAT(NV1.HONV, ' ', NV1.TENLOT, ' ', NV1.TENNV) AS HOTEN_NV
FROM ((NHANVIEN AS NV1 JOIN DEAN AS DA ON NV1.PHG = DA.PHONG)
	  JOIN NHANVIEN AS NV2 ON NV2.MANV = NV1.MA_NQL)
WHERE DA.TENDA = 'San pham X'
	  AND NV1.PHG = '5'
	  AND NV2.HONV = 'Nguyễn'
      AND NV2.TENLOT = 'Thanh' 
      AND NV2.TENNV = 'Tùng';