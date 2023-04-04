-- Tạo khóa ngoại cho bảng CONGVIEC tham chiếu đến bảng DEAN
ALTER TABLE congviec ADD FOREIGN KEY(MADA) REFERENCES dean(MADA);

-- Tạo khóa ngoại cho bảng PHANCONG tham chiếu đến bảng CONGVIEC
ALTER TABLE phancong ADD FOREIGN KEY(MADA, STT) REFERENCES congviec(MADA, STT);

-- Tạo khóa ngoại cho bảng PHANCONG tham chiếu lên bảng NHANVIEN
ALTER TABLE phancong ADD FOREIGN KEY(MA_NVIEN) REFERENCES nhanvien(MANV);

-- Tạo khóa ngoại cho bảng THANNHAN tham chiếu lên bảng NHANVIEN
ALTER TABLE thannhan ADD FOREIGN KEY(MA_NVIEN) REFERENCES nhanvien(MANV);

-- Tạo khóa ngoại cho bảng PHONGBAN tham chiếu lên bảng NHANVIEN
ALTER TABLE phongban ADD FOREIGN KEY(TRPHG) REFERENCES nhanvien(MANV);

-- Tạo khóa ngoại cho bảng DIADIEM_PHG tham chiếu lên bảng PHONGBAN
ALTER TABLE diadiem_phg ADD FOREIGN KEY(MAPHG) REFERENCES phongban(MAPHG);

-- Tạo khóa ngoại cho bảng NHANVIEN tham chiếu đến chính nó
ALTER TABLE nhanvien ADD FOREIGN KEY(MA_NQL) REFERENCES nhanvien(MA_NVIEN);