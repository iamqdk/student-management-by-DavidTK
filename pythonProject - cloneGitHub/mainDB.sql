CREATE mainDatabase
GO
USE mainDatabase
GO

//Tạo bảng
CREATE TABLE sinhVien(
    maSV INT IDENTITY(1,1) PRIMARY KEY,
	hoSV NVARCHAR(100),
	tenSV NVARCHAR(100),
	email NVARCHAR(100),
	ngaySinhSV NVARCHAR(100),
	gioiTinhSV NVARCHAR(10),
	sdtSV NCHAR(100),
)
CREATE TABLE nienKhoa(
	maSV INT,
	nkBatDau INT,
	nkKetThuc INT,
)
CREATE TABLE hocPhi(
	maSV INT,
	nam INT,
	hocPhi REAL,
	trangThai NVARCHAR(100),
)
CREATE TABLE monHoc(
	maMH NVARCHAR(10) PRIMARY KEY,
	tenMH NVARCHAR(100),
	soTinChi INT,
	caHoc NVARCHAR(100),
	tenGiaoVien NVARCHAR(100),
	ngayBatDau NVARCHAR(100)
)
CREATE TABLE SV_MH(
	maMH NVARCHAR(10),
	maSV INT,
	diemGK REAL,
	diemCK REAL,
	diemTB REAL,
	loai NVARCHAR(100),
	trangThai NVARCHAR(100) 
)
DROP TABLE dbo.SV_MH
DROP TABLE dbo.monHoc
//Khóa phụ
ALTER TABLE dbo.hocPhi ADD FOREIGN KEY (maSV) REFERENCES dbo.sinhVien(maSV) ON DELETE CASCADE
ALTER TABLE dbo.nienKhoa ADD FOREIGN KEY (maSV) REFERENCES dbo.sinhVien(maSV) ON DELETE CASCADE
ALTER TABLE dbo.SV_MH ADD FOREIGN KEY (maSV) REFERENCES dbo.sinhVien(maSV) ON DELETE CASCADE
ALTER TABLE dbo.SV_MH ADD FOREIGN KEY (maMH) REFERENCES dbo.monHoc(maMH) ON DELETE CASCADE

SELECT 
SELECT tenMH,hoSV,tenSV,gioiTinhSV,diemGK,diemCK FROM dbo.sinhVien JOIN dbo.SV_MH ON SV_MH.maSV = sinhVien.maSV JOIN dbo.monHoc ON monHoc.maMH = SV_MH.maMH
WHERE monHoc.maMH='cntt1'

INSERT monHoc(maMH,tenMH,soTinChi,caHoc,tenGiaoVien)
VALUES
(N'cntt1',N'Lập trình cơ bản',3,2,N'Mixi'),
(N'cntt2',N'Lập trình nâng cao',5,2,N'Phùng Thanh Độ'),
(N'cntt3',N'Đại số tuyến tính',2,3,N'Max Aaron'),
(N'cntt4',N'Cơ sở dữ liệu cơ bản',3,5,N'Lenon'),
(N'cntt5',N'Cơ sở dữ liệu cơ bản nâng cao',3,2,N'David K'),
(N'cntt6',N'Lập trình mạng',3,1,N'David H'),
(N'cntt7',N'Lập trình Python',5,2,N'Mohammed'),
(N'cntt8',N'Hệ điều hạnh',1,4,N'Professor K'),
(N'cntt9',N'Cơ sở mạng',3,7,N'Professor K'),
(N'cntt10',N'Lắp ráp',1,8,N'Professor K');




// Nháp
SELECT dbo.monHoc.maMH,tenMH,tenGiaoVien,gioHoc,soTinChi FROM dbo.chiTietMonHoc JOIN dbo.monHoc ON monHoc.maMH = chiTietMonHoc.maMH
SELECT * FROM dbo.SV_MH JOIN dbo.sinhVien ON sinhVien.maSV = SV_MH.maSV WHERE sinhVien.maSV=1
SELECT * FROM
UPDATE dbo.SV_MH SET diemGK=2,diemCK=2 FROM dbo.sinhVien JOIN dbo.SV_MH ONd SV_MH.maSV = sinhVien.maSV WHERE sinhVien.maSV=1 AND maMH=N'toan'

SELECT maMH,tenMH,tenGiaoVien,caHoc,soTinChi,ngayBatDau FROM dbo.monHoc

DELETE FROM dbo.monHo

DELETE FROM dbo.SV_MH
SELECT * FROM dbo.monHoc
SELECT monHoc.maMH,monHoc.tenMH,tenGiaoVien,caHoc,soTinChi FROM dbo.chiTietMonHoc JOIN dbo.monHoc ON monHoc.maMH = chiTietMonHoc.maMH
SELECT monHoc.maMH,tenMH,hoSV,tenSV,diemGK,diemCK,diemTB,loai,trangThai FROM dbo.SV_MH JOIN dbo.sinhVien ON sinhVien.maSV = SV_MH.maSV JOIN dbo.monHoc ON monHoc.maMH = SV_MH.maMH  WHERE  tenSV='Đăng Khoa'
SELECT maMH,tenMH,hoSV,tenSV,diemGK,diemCK,diemTB,loai,trangThai FROM dbo.SV_MH JOIN dbo.sinhVien ON sinhVien.maSV = SV_MH.maSV WHERE hoSV='Trần'