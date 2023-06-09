﻿CREATE DATABASE BAICUOIKY
GO
USE BAICUOIKY
GO
CREATE TABLE KHUCHUNGCU
(	
	MAKHU NVARCHAR(4) NOT NULL,
	TENKHU NVARCHAR(20),
	DIACHI NVARCHAR(50) NOT NULL,

	PRIMARY KEY (MAKHU)
)
CREATE TABLE TOA
(
MATOA NVARCHAR(6) NOT NULL,
MAKHU NVARCHAR(4) NOT NULL,
TENTOA NVARCHAR(30),
SOCAN INT NOT NULL
PRIMARY KEY (MATOA)
)
CREATE TABLE CANHO
(
	MACAN NVARCHAR(6) NOT NULL,
	MATOA NVARCHAR(6) NOT NULL,
	SLPHG INT,
	GIACHOTHUE FLOAT,
	GIABAN FLOAT,
	CCCD_CMND_THUE NVARCHAR(15),
	MAHDTHUE NVARCHAR(30),
	NGBD DATE,
	NGKT DATE,
	GIATHUE FLOAT,
	CCCD_CMND_MUA NVARCHAR(15),
	MAHDMUA NVARCHAR(30),
	NGMUA DATE,
	GIAMUA FLOAT

	PRIMARY KEY (MACAN)
)
CREATE TABLE KHACHHANG
(
	CCCD_CMND NVARCHAR(15) NOT NULL,
	HOTEN NVARCHAR(30),
	EMAIL NVARCHAR(50),
	SDT NVARCHAR(15),
	PHAI NVARCHAR(3),
	CAN NVARCHAR(10),
	LOAIKH NVARCHAR(20)

	PRIMARY KEY(CCCD_CMND)
)
CREATE TABLE NHANVIEN
(
MANV NVARCHAR(8) NOT NULL,
MAKHU NVARCHAR(4) NOT NULL,
TENNV NVARCHAR(30),
PRIMARY KEY (MANV)
)
CREATE TABLE DICHVU
(
	MADV NVARCHAR(7) NOT NULL,
	TENDV NVARCHAR(15),
	TIENDV FLOAT
	PRIMARY KEY(MADV)
)
CREATE TABLE HOADON	
(
	MAHD NVARCHAR(4) NOT NULL,
	NVPT NVARCHAR(8) NOT NULL,
	NGHD DATE,
	TONGTIENDV FLOAT,
	TIENTHUECH FLOAT,
	TONGSOTIEN FLOAT,
	MACAN NVARCHAR(6) NOT NULL
	PRIMARY KEY(MAHD)
)
CREATE TABLE CTHD
(
	MAHD NVARCHAR(4) NOT NULL,
	MADV NVARCHAR(7) NOT NULL,
	SL INT
	PRIMARY KEY(MAHD,MADV)
)
CREATE TABLE LOAIXE
(
	CCCD_CMND NVARCHAR(15) NOT NULL,
	XE NVARCHAR(15) NOT NULL,
	PRIMARY KEY(CCCD_CMND,XE)
)

-- Cài đặt ràng buộc khóa ngoại cho các bảng 
ALTER TABLE TOA
ADD CONSTRAINT FK_TOA_KHU
FOREIGN KEY (MAKHU)
REFERENCES KHUCHUNGCU (MAKHU)

ALTER TABLE CANHO
ADD CONSTRAINT FK_CANHO_TOA
FOREIGN KEY (MATOA)
REFERENCES TOA (MATOA)

ALTER TABLE NHANVIEN
ADD CONSTRAINT FK_NV_KHU
FOREIGN KEY (MAKHU)
REFERENCES KHUCHUNGCU (MAKHU)

ALTER TABLE HOADON
ADD CONSTRAINT FK_HD_CH
FOREIGN KEY (MACAN)
REFERENCES CANHO (MACAN)

ALTER TABLE HOADON
ADD CONSTRAINT FK_HD_NV
FOREIGN KEY (NVPT)
REFERENCES NHANVIEN (MANV)

ALTER TABLE CTHD
ADD CONSTRAINT FK_CTHD_DV
FOREIGN KEY (MADV)
REFERENCES DICHVU (MADV)

ALTER TABLE CTHD
ADD CONSTRAINT FK_CTHD_HD
FOREIGN KEY (MAHD)
REFERENCES HOADON (MAHD)

ALTER TABLE LOAIXE
ADD CONSTRAINT FK_XE_KH
FOREIGN KEY (CCCD_CMND)
REFERENCES KHACHHANG (CCCD_CMND)
BEGIN /** KHUCHUNGCU **/
	ALTER TABLE KHUCHUNGCU
	NOCHECK CONSTRAINT ALL
	INSERT INTO KHUCHUNGCU (MAKHU, TENKHU, DIACHI)
	VALUES ('DH01', 'DreamHome Palace', N'1436 Trịnh Quang Nghị, Phường 7, Quận 8, TP.HCM')
	INSERT INTO KHUCHUNGCU (MAKHU, TENKHU, DIACHI)
	VALUES ('DH02', 'DreamHome Riverside', N'2225 Phạm Thế Hiển, Phường 6, Quận 8, TP.HCM')
	INSERT INTO KHUCHUNGCU (MAKHU, TENKHU, DIACHI)
	VALUES ('DH03', 'DreamHome Residence', N'Đường số 59, Phường 14, Gò Vấp, TP.HCM')
	ALTER TABLE KHUCHUNGCU
	CHECK CONSTRAINT ALL
END

BEGIN /** TOA **/
	ALTER TABLE TOA
	NOCHECK CONSTRAINT ALL
	INSERT INTO TOA (MATOA, MAKHU, TENTOA, SOCAN)
	VALUES ('DH01_A', 'DH01', N'DreamHome Palace tòa A', 165),
			('DH01_B', 'DH01', N'DreamHome Palace tòa B', 165),
			('DH01_C', 'DH01', N'DreamHome Palace tòa C', 240),
			('DH01_D', 'DH01', N'DreamHome Palace tòa D', 240),
			('DH02_A', 'DH02', N'DreamHome Riverside tòa A', 280),
			('DH02_B', 'DH02', N'DreamHome Riverside tòa B', 280),
			('DH03_A', 'DH03', N'DreamHome Residence tòa A', 320),
			('DH03_B', 'DH03', N'DreamHome Residence tòa B', 320)
	ALTER TABLE TOA
	CHECK CONSTRAINT ALL
END

BEGIN /** CANHO **/
	ALTER TABLE CANHO
	NOCHECK CONSTRAINT ALL
	INSERT INTO CANHO (MACAN, MATOA, SLPHG, GIACHOTHUE, GIABAN, CCCD_CMND_THUE, MAHDTHUE, NGBD, NGKT, GIATHUE, CCCD_CMND_MUA, MAHDMUA, NGMUA, GIAMUA )
	VALUES ('A01_06', 'DH01_A', 3, 15000000, 5200000000, '068203000665', '12-10/2020/HDDHP', '2020/10/12', '2022/10/12', 15000000, NULL, NULL, NULL, NULL),
			('B14_08', 'DH01_B', 2, NULL, 1800000000, NULL, NULL, NULL, NULL, NULL, '091202006106', '11-10/2021/HDDHP', '2021/10/11', 1800000000),
			('B06_02', 'DH01_B', 3, NULL, 2000000000, NULL, NULL, NULL, NULL, NULL, '056203008851', '10-01/2021/HDDHP', '2021/01/10', 2000000000),
			('C07_17', 'DH01_C', 1, NULL, 1700000000, NULL, NULL, NULL, NULL, NULL, '072099006336', '05-03/2019/HDDHP', '2019/03/05', 1700000000),
			('C08_13', 'DH01_C', 2, NULL, 1800000000, NULL, NULL, NULL, NULL, NULL, '058302006886', '04-02/2022/HDDHP', '2022/02/04', 1800000000),
			('D17_12', 'DH01_D', 2, NULL, 1800000000, NULL, NULL, NULL, NULL, NULL, '064202006945', '13-05/2016/HDDHP', '2016/05/13', 1800000000),
			('A02_05', 'DH02_A', 5, 20000000, 6500000000, '072203008140', '29-06/2021/HDDHR', '2021/06/29', '2024/06/29', 20000000, NULL, NULL, NULL, NULL),
			('A12_14', 'DH02_A', 1, NULL, 1700000000, NULL, NULL, NULL, NULL, NULL, '0221518848', '12-01/2017/HDDHR', '2017/01/12', 1700000000),
			('B14_16', 'DH02_B', 2, NULL, 1900000000, NULL, NULL, NULL, NULL, NULL, '0215588829', '30-04/2020/HDDHR', '2020/04/30', 1900000000),
			('B14_18', 'DH02_B', 3, NULL, 2200000000, NULL, NULL, NULL, NULL, NULL, '044302002782', '12-07/2020/HDDHR', '2020/07/12', 2200000000),
			('A15_01', 'DH03_A', 1, NULL, 1900000000, NULL, NULL, NULL, NULL, NULL, '077203000613', '28-02/2018/HDDHR', '2018/02/28', 1900000000),
			('B01_01', 'DH03_B', 4, 20000000, 5500000000, '075202020249', '15-01/2017/HDDHR', '2017/01/15', '2024/01/15', 20000000, NULL, NULL, NULL, NULL),
			('B08_12', 'DH03_B', 1, NULL, 1900000000, NULL, NULL, NULL, NULL, NULL, '0221518234', '24-03/2021/HDDHR', '2021/03/24', 1900000000)
	ALTER TABLE CANHO
	CHECK CONSTRAINT ALL
END

BEGIN /** KHACHHANG **/
	ALTER TABLE KHACHHANG
	NOCHECK CONSTRAINT ALL
	INSERT INTO KHACHHANG (CCCD_CMND,HOTEN,EMAIL,SDT,PHAI,CAN,LOAIKH)
	VALUES ('221547312', N'Nguyễn Tự Trung Nhã', 'nhanguyen.31201024805@st.ueh.edu.vn', '0868724674', N'Nam', 'D17_12', N'Người ở cùng'),
			('352592163', N'Nguyễn Hữu Nhân Tài', 'tainguyen.31201023119@st.ueh.edu.vn', '0946112679', N'Nam', 'D17_12', N'Người ở cùng'),
			('064202006945', N'Nguyễn Tùng Đức', 'ducnguyen.31201027227@st.ueh,edu.vn', '0977155622', N'Nam', 'D17_12', N'Người ở cùng'),
			('191926916', N'Trần Lê Quỳnh Trang', 'trangtran.31201024049@st.ueh,edu.vn', '0794633162', N'Nữ', 'D17_12', N'Chủ hộ '),
			('068203000665', N'Bùi Trung Hiếu', 'hieuchodien71@gmail.com', '0332235595', N'Nam', 'A01_06', N'Chủ hộ '),
			('072203008140', N'Nguyễn Bình Phương Đăng', 'phuongdang6426@gmail.com', '0338722278', N'Nam', 'A02_05', N'Chủ hộ '),
			('075202020249', N'Trần Xuân Gia Đức', 'tranxuangiaduc1612@gmail.com', '0964742420', N'Nam', 'B01_01', N'Chủ hộ '),
			('091202006106', N'Nguyễn Trường An', 'Annguyen.31201020912@st.ueh.edu.vn', '0775037794', N'Nam', 'B14_08', N'Chủ hộ '),
			('056203008851', N'Lưu Hoàng Quốc Bảo', 'baoluu.312@gmail.com', '0396406873', N'Nam', 'B06_02', N'Chủ hộ '),
			('072099006336', N'Trần Đình Lân', 'trandinhlan7799@gmail.com', '0966169521', N'Nam', 'C07_17', N'Chủ hộ '),
			('058302006886', N'Phan Tuyết Như', 'phantuyetnhu.tht@gmail.com', '0353297066', N'Nữ', 'C08_13', N'Chủ hộ '),
			('221518848', N'Trần Hoàng Duy', 'hoangduytran9202@gmail.com', '0779522264', N'Nam', 'A12_14', N'Chủ hộ '),
			('215588829', N'Huỳnh Lê Phương Thảo', 'thaohuynh140909@gmail.com', '0931934339', N'Nữ', 'B14_16', N'Chủ hộ '),
			('044302002782', N'Nguyễn Nữ Hoài Phương', 'hoaiphuong31@gmail.com', '0823568268', N'Nữ', 'B14_18', N'Chủ hộ '),
			('077203000613', N'Đậu Đức Huy Hoàng', 'hoangdau@gmail.com', '0983094489', N'Nam', 'A15_01', N'Chủ hộ '),
			('221518234', N'Đậu Nguyễn Vĩnh An', 'anvinhnguyendau69@gmail.com', '0983483102', N'Nam', 'B08_12', N'Chủ hộ '),
			('221736312', N'Nguyễn Thị Hiệp', 'thihiep.1984@gmail.com', '0935112113', N'Nam', 'B01_01', N'Người ở cùng'),
			('783017638', N'Thái Phước Trường', 'phuoctruongsg.httl@ggmail.com', '0865726672', N'Nam', 'B01_01', N'Người ở cùng')
	ALTER TABLE KHACHHANG
	CHECK CONSTRAINT ALL
END

BEGIN /** NHANVIEN **/
	ALTER TABLE NHANVIEN
	NOCHECK CONSTRAINT ALL
	INSERT INTO NHANVIEN (MANV, MAKHU, TENNV)
	VALUES ('DH01_001', 'DH01', N'Ngô Đình Diệm'),
			('DH01_002', 'DH01', N'Nguyễn Trần Thu Trang'),
			('DH02_001', 'DH02', N'Lê Quang Nguyên'),
			('DH02_002', 'DH02', N'Trần Hoài Nhật'),
			('DH03_001', 'DH03', N'Đặng Phan Kim Hội'),
			('DH03_002', 'DH03', N'Đinh Hữu Khang')
	ALTER TABLE NHANVIEN
	CHECK CONSTRAINT ALL
END

BEGIN /** DICHVU **/
	ALTER TABLE DICHVU
	NOCHECK CONSTRAINT ALL
	INSERT INTO DICHVU (MADV, TENDV, TIENDV)
	VALUES ('VS', N'Vệ sinh', 100000),
			('GXM', N'Giữ xe máy', 100000),
			('GXO', N'Giữ xe ô tô', 500000),
			('GXD', N'Giữ xe đạp', 50000),
			('HB', N'Hồ bơi', 0)
	ALTER TABLE DICHVU
	CHECK CONSTRAINT ALL
END

BEGIN /** HOADON **/
	ALTER TABLE HOADON
	NOCHECK CONSTRAINT ALL
	INSERT INTO HOADON (MAHD, NVPT, NGHD, TONGTIENDV, TIENTHUECH, TONGSOTIEN, MACAN)
	VALUES ('HD01', 'DH01_001', '2022/03/01', 750000, 0, 750000, 'D17_12'),
			('HD02', 'DH01_001', '2022/03/01', 300000, 0, 300000, 'D17_12'),
			('HD03', 'DH01_001', '2022/03/01', 800000, 0, 800000, 'D17_12'),
			('HD04', 'DH01_001', '2022/03/01', 700000, 0, 700000, 'D17_12'),
			('HD05', 'DH01_001', '2022/03/01', 200000, 15000000, 15200000, 'A01_06'),
			('HD06', 'DH02_001', '2022/03/02', 200000, 20000000, 20200000, 'A02_05'),
			('HD07', 'DH03_001', '2022/03/01', 200000, 20000000, 20200000, 'B01_01'),
			('HD08', 'DH01_001', '2022/03/04', 200000, 0, 200000, 'B14_08'),
			('HD09', 'DH01_001', '2022/03/02', 200000, 0, 200000, 'B06_02'),
			('HD10', 'DH01_002', '2022/03/05', 200000, 0, 200000, 'C07_17'),
			('HD11', 'DH01_002', '2022/03/05', 200000, 0, 200000, 'C08_13'),
			('HD12', 'DH02_002', '2022/03/01', 200000, 0, 200000, 'A12_14'),
			('HD13', 'DH02_002', '2022/03/02', 200000, 0, 200000, 'B14_16'),
			('HD14', 'DH02_002', '2022/03/04', 200000, 0, 200000, 'B14_18'),
			('HD15', 'DH03_002', '2022/03/04', 200000, 0, 200000, 'A15_01'),
			('HD16', 'DH03_002', '2022/03/02', 600000, 0, 600000, 'B08_12'),
			('HD17', 'DH03_002', '2022/03/01', 150000, 0, 150000, 'B01_01'),
			('HD18', 'DH03_002', '2022/03/01', 200000, 0, 200000, 'B01_01'),
			('HD19', 'DH01_001', '2022/04/01', 750000, 0, 750000, 'D17_12'),
			('HD20', 'DH01_001', '2022/04/01', 300000, 0, 300000, 'D17_12'),
			('HD21', 'DH01_001', '2022/04/01', 800000, 0, 800000, 'D17_12'),
			('HD22', 'DH01_001', '2022/04/01', 700000, 0, 700000, 'D17_12'),
			('HD23', 'DH01_001', '2022/04/01', 200000, 15000000, 15200000, 'A01_06'),
			('HD24', 'DH02_001', '2022/04/02', 200000, 20000000, 20200000, 'A02_05'),
			('HD25', 'DH03_001', '2022/04/01', 200000, 20000000, 20200000, 'B01_01'),
			('HD26', 'DH01_001', '2022/04/04', 200000, 0, 200000, 'B14_08'),
			('HD27', 'DH01_001', '2022/04/02', 200000, 0, 200000, 'B06_02'),
			('HD28', 'DH01_002', '2022/04/05', 200000, 0, 200000, 'C07_17'),
			('HD29', 'DH01_002', '2022/04/05', 200000, 0, 200000, 'C08_13'),
			('HD30', 'DH02_002', '2022/04/01', 200000, 0, 200000, 'A12_14'),
			('HD31', 'DH02_002', '2022/04/02', 200000, 0, 200000, 'B14_16'),
			('HD32', 'DH02_002', '2022/04/04', 200000, 0, 200000, 'B14_18'),
			('HD33', 'DH03_002', '2022/03/04', 200000, 0, 200000, 'A15_01'),
			('HD34', 'DH03_002', '2022/04/02', 600000, 0, 600000, 'B08_12'),
			('HD35', 'DH03_002', '2022/04/01', 150000, 0, 150000, 'B01_01'),
			('HD36', 'DH03_002', '2022/04/01', 200000, 0, 200000, 'B01_01'),
			('HD37', 'DH01_001', '2022/05/01', 750000, 0, 750000, 'D17_12'),
			('HD38', 'DH01_001', '2022/05/01', 300000, 0, 300000, 'D17_12'),
			('HD39', 'DH01_001', '2022/05/01', 800000, 0, 800000, 'D17_12'),
			('HD40', 'DH01_001', '2022/05/01', 700000, 0, 700000, 'D17_12'),
			('HD41', 'DH01_001', '2022/05/01', 200000, 15000000, 15200000, 'A01_06'),
			('HD42', 'DH02_001', '2022/05/02', 200000, 20000000, 20200000, 'A02_05'),
			('HD43', 'DH03_001', '2022/05/01', 200000, 20000000, 20200000, 'B01_01'),
			('HD44', 'DH01_001', '2022/05/04', 200000, 0, 200000, 'B14_08'),
			('HD45', 'DH01_001', '2022/05/02', 200000, 0, 200000, 'B06_02'),
			('HD46', 'DH01_002', '2022/05/05', 200000, 0, 200000, 'C07_17'),
			('HD47', 'DH01_002', '2022/05/05', 200000, 0, 200000, 'C08_13'),
			('HD48', 'DH02_002', '2022/05/01', 200000, 0, 200000, 'A12_14'),
			('HD49', 'DH02_002', '2022/05/02', 200000, 0, 200000, 'B14_16'),
			('HD50', 'DH02_002', '2022/05/04', 200000, 0, 200000, 'B14_18'),
			('HD51', 'DH03_002', '2022/05/04', 200000, 0, 200000, 'A15_01'),
			('HD52', 'DH03_002', '2022/05/02', 600000, 0, 600000, 'B08_12'),
			('HD53', 'DH03_002', '2022/05/01', 150000, 0, 150000, 'B01_01'),
			('HD54', 'DH03_002', '2022/05/01', 200000, 0, 200000, 'B01_01')
	ALTER TABLE HOADON
	CHECK CONSTRAINT ALL
END

BEGIN /** CTHD **/
	ALTER TABLE CTHD
	NOCHECK CONSTRAINT ALL
	INSERT INTO CTHD (MAHD,MADV,SL)
	VALUES ('HD01', 'VS', 1),
			('HD01', 'GXM', 1),
			('HD01', 'GXO', 1),
			('HD01', 'HB', 10),
			('HD01', 'GXD', 1),
			('HD02', 'VS', 1),
			('HD02', 'GXM', 2),
			('HD03', 'VS', 1),
			('HD03', 'GXM', 2),
			('HD03', 'GXO', 1),
			('HD03', 'HB', 30),
			('HD04', 'VS', 1),
			('HD04', 'GXM', 1),
			('HD04', 'GXO', 1),
			('HD05', 'VS', 1),
			('HD05', 'GXM', 1),
			('HD06', 'VS', 1),
			('HD06', 'GXM', 1),
			('HD07', 'VS', 1),
			('HD07', 'GXM', 1),
			('HD08', 'VS', 1),
			('HD08', 'GXM', 1),
			('HD09', 'VS', 1),
			('HD09', 'GXM', 1),
			('HD10', 'VS', 1),
			('HD10', 'GXM', 1),
			('HD11', 'VS', 1),
			('HD11', 'GXM', 1),
			('HD12', 'VS', 1),
			('HD12', 'GXM', 1),
			('HD13', 'VS', 1),
			('HD13', 'GXM', 1),
			('HD14', 'VS', 1),
			('HD14', 'GXM', 1),
			('HD15', 'VS', 1),
			('HD15', 'GXM', 1),
			('HD16', 'VS', 1),
			('HD16', 'GXO', 1),
			('HD17', 'VS', 1),
			('HD17', 'GXD', 1),
			('HD18', 'VS', 1),
			('HD18', 'GXM', 1),
			('HD19', 'VS', 1),
			('HD19', 'GXM', 1),
			('HD19', 'GXO', 1),
			('HD19', 'HB', 10),
			('HD19', 'GXD', 1),
			('HD20', 'VS', 1),
			('HD20', 'GXM', 2),
			('HD21', 'VS', 1),
			('HD21', 'GXM', 2),
			('HD21', 'GXO', 1),
			('HD21', 'HB', 30),
			('HD22', 'VS', 1),
			('HD22', 'GXM', 1),
			('HD22', 'GXO', 1),
			('HD23', 'VS', 1),
			('HD23', 'GXM', 1),
			('HD24', 'VS', 1),
			('HD24', 'GXM', 1),
			('HD25', 'VS', 1),
			('HD25', 'GXM', 1),
			('HD26', 'VS', 1),
			('HD26', 'GXM', 1),
			('HD27', 'VS', 1),
			('HD27', 'GXM', 1),
			('HD28', 'VS', 1),
			('HD28', 'GXM', 1),
			('HD29', 'VS', 1),
			('HD29', 'GXM', 1),
			('HD30', 'VS', 1),
			('HD30', 'GXM', 1),
			('HD31', 'VS', 1),
			('HD31', 'GXM', 1),
			('HD32', 'VS', 1),
			('HD32', 'GXM', 1),
			('HD33', 'VS', 1),
			('HD33', 'GXM', 1),
			('HD34', 'VS', 1),
			('HD34', 'GXO', 1),
			('HD35', 'VS', 1),
			('HD35', 'GXD', 1),
			('HD36', 'VS', 1),
			('HD36', 'GXM', 1),
			('HD37', 'VS', 1),
			('HD37', 'GXM', 1),
			('HD37', 'GXO', 1),
			('HD37', 'HB', 10),
			('HD37', 'GXD', 1),
			('HD38', 'VS', 1),
			('HD38', 'GXM', 2),
			('HD39', 'VS', 1),
			('HD39', 'GXM', 2),
			('HD39', 'GXO', 1),
			('HD39', 'HB', 30),
			('HD40', 'VS', 1),
			('HD40', 'GXM', 1),
			('HD40', 'GXO', 1),
			('HD41', 'VS', 1),
			('HD41', 'GXM', 1),
			('HD42', 'VS', 1),
			('HD42', 'GXM', 1),
			('HD43', 'VS', 1),
			('HD43', 'GXM', 1),
			('HD44', 'VS', 1),
			('HD44', 'GXM', 1),
			('HD45', 'VS', 1),
			('HD45', 'GXM', 1),
			('HD46', 'VS', 1),
			('HD46', 'GXM', 1),
			('HD47', 'VS', 1),
			('HD47', 'GXM', 1),
			('HD48', 'VS', 1),
			('HD48', 'GXM', 1),
			('HD49', 'VS', 1),
			('HD49', 'GXM', 1),
			('HD50', 'VS', 1),
			('HD50', 'GXM', 1),
			('HD51', 'VS', 1),
			('HD51', 'GXM', 1),
			('HD52', 'VS', 1),
			('HD52', 'GXO', 1),
			('HD53', 'VS', 1),
			('HD53', 'GXD', 1),
			('HD54', 'VS', 1),
			('HD54', 'GXM', 1)
	ALTER TABLE CTHD
	CHECK CONSTRAINT ALL
END

BEGIN /** LOAIXE **/
	ALTER TABLE LOAIXE 
	NOCHECK CONSTRAINT ALL
	INSERT INTO LOAIXE (CCCD_CMND,XE)
	VALUES ('221547312', N'Ô tô'),
			('221547312', N'Xe máy'),
			('221547312', N'Xe đạp'),
			('352592163', N'Xe máy'),
			('064202006945', N'Ô tô'),
			('064202006945', N'Xe máy'),
			('191926916', N'Ô tô'),
			('191926916', N'Xe máy'),
			('068203000665', N'Xe máy'),
			('072203008140', N'Xe máy'),
			('075202020249', N'Xe máy'),
			('091202006106', N'Xe máy'),
			('056203008851', N'Xe máy'),
			('072099006336', N'Xe máy'),
			('58302006886', N'Xe máy'),
			('221518848', N'Xe máy'),
			('215588829', N'Xe máy'),
			('044302002782', N'Xe máy'),
			('077203000613', N'Xe máy'),
			('221518234', N'Ô tô'),
			('221736312', N'Xe đạp'),
			('783017638', N'Xe máy')
	ALTER TABLE LOAIXE
	CHECK CONSTRAINT ALL
END
-- In so tien B01_01 phai tra trong thang 5
SELECT DISTINCT CAN, TONGTIENDV TIENDICHVU, TIENTHUECH, TONGSOTIEN FROM KHACHHANG, HOADON, CANHO
WHERE KHACHHANG.CAN=CANHO.MACAN AND HOADON.MACAN=CANHO.MACAN AND KHACHHANG.CCCD_CMND=CANHO.CCCD_CMND_THUE AND CAN='B01_01' AND MONTH(NGHD)='5'
 
--Ai la chu ho D17_12
SELECT HOTEN FROM KHACHHANG
WHERE KHACHHANG.CAN='D17_12' AND KHACHHANG.LOAIKH=N'CHỦ HỘ'
 
--In ra can ho su dung nhieu dich vu nhat
SELECT TOP (1) MACAN, SUM(SL) SOLUONGDICHVU FROM HOADON, CTHD
WHERE HOADON.MAHD=CTHD.MAHD
GROUP BY MACAN
ORDER BY SUM(SL) DESC
 
--in ra thong tin khach hang trong can ho D17_12
SELECT * FROM KHACHHANG
WHERE KHACHHANG.CAN='D17_12'

