﻿-- Database QuanLyChuyenBay
CREATE DATABASE QuanLyChuyenBay

USE QuanLyChuyenBay
GO
/****** Table CHUYENBAY ******/
SET ANSI_NULLS ON
GO

CREATE TABLE CHUYENBAY
(
	MACB nvarchar(4) NOT NULL,
	SBDI nvarchar(3) NULL,
	SBDEN nvarchar(3) NULL,
	GIODI time(0) NULL,
	GIODEN time(0) NULL,
	CONSTRAINT PK_CHUYENBAY PRIMARY KEY (MACB)
)


/****** Table DATCHO ******/

CREATE TABLE DATCHO
(
	MAKH nvarchar(15) NOT NULL,
	NGAYDI date NOT NULL,
	MACB nvarchar(4) NOT NULL,
	CONSTRAINT PK_DATCHO PRIMARY KEY (MAKH, NGAYDI, MACB)
)

/****** Table KHACHHANG ******/
CREATE TABLE KHACHHANG
(
	MAKH nvarchar(15) NOT NULL,
	TEN nvarchar(15) NULL,
	DCHI nvarchar(50) NULL,
	DTHOAI nvarchar(12) NULL,
	CONSTRAINT PK_KHACHHANG PRIMARY KEY (MAKH)
)

/****** Table KHANANG ******/
CREATE TABLE KHANANG
(
	MANV nvarchar(15) NOT NULL,
	MALOAI nvarchar(15) NOT NULL,
	CONSTRAINT PK_KHANANG PRIMARY KEY (MANV, MALOAI)
)

/****** Table LICHBAY ******/
CREATE TABLE LICHBAY
(
	NGAYDI date NOT NULL,
	MACB nvarchar(4) NOT NULL,
	SOHIEU int NOT NULL,
	MALOAI nvarchar(15) NOT NULL,
	CONSTRAINT PK_LICHBAY PRIMARY KEY (NGAYDI, MACB)
)

/****** Table LOAIMB ******/
CREATE TABLE LOAIMB
(
	MALOAI nvarchar(15) NOT NULL,
	HANGSX nvarchar(50) NULL,
	CONSTRAINT PK_LOAIMB PRIMARY KEY (MALOAI)
)

/****** Table MAYBAY ******/
CREATE TABLE MAYBAY
(
	SOHIEU int NOT NULL,
	MALOAI nvarchar(15) NOT NULL,
	CONSTRAINT PK_MAYBAY PRIMARY KEY (SOHIEU, MALOAI)
)

/****** Table NHANVIEN ******/
CREATE TABLE NHANVIEN
(
	MANV nvarchar(15) NOT NULL,
	TEN nvarchar(15) NULL,
	DCHI nvarchar(50) NULL,
	DTHOAI nvarchar(12) NULL,
	LUONG numeric(10, 2) NULL,
	LOAINV bit NULL,
	CONSTRAINT PK_NHANVIEN PRIMARY KEY (MANV)
)

/****** Table PHANCONG ******/
CREATE TABLE PHANCONG
(
	MANV nvarchar(15) NOT NULL,
	NGAYDI date NOT NULL,
	MACB nvarchar(4) NOT NULL,
	CONSTRAINT PK_PHANCONG PRIMARY KEY (MANV, NGAYDI, MACB)
)

ALTER TABLE DATCHO ADD CONSTRAINT FK_DATCHO_KHACHHANG FOREIGN KEY(MAKH)
REFERENCES KHACHHANG (MAKH)

ALTER TABLE DATCHO ADD CONSTRAINT FK_DATCHO_LICHBAY FOREIGN KEY(NGAYDI, MACB)
REFERENCES LICHBAY (NGAYDI, MACB)

ALTER TABLE KHANANG ADD CONSTRAINT FK_KHANANG_LOAIMB FOREIGN KEY(MALOAI)
REFERENCES LOAIMB (MALOAI)

ALTER TABLE KHANANG  ADD CONSTRAINT FK_KHANANG_NHANVIEN FOREIGN KEY(MANV)
REFERENCES NHANVIEN (MANV)

ALTER TABLE LICHBAY  ADD CONSTRAINT FK_LICHBAY_CHUYENBAY FOREIGN KEY(MACB)
REFERENCES CHUYENBAY (MACB)

ALTER TABLE LICHBAY  ADD CONSTRAINT FK_LICHBAY_MAYBAY FOREIGN KEY(SOHIEU, MALOAI)
REFERENCES MAYBAY (SOHIEU, MALOAI)

ALTER TABLE MAYBAY ADD CONSTRAINT FK_MAYBAY_LOAIMB FOREIGN KEY(MALOAI)
REFERENCES LOAIMB (MALOAI)

ALTER TABLE PHANCONG ADD CONSTRAINT FK_PHANCONG_LICHBAY FOREIGN KEY(NGAYDI, MACB)
REFERENCES LICHBAY (NGAYDI, MACB)

ALTER TABLE PHANCONG ADD CONSTRAINT FK_PHANCONG_NHANVIEN FOREIGN KEY(MANV)
REFERENCES NHANVIEN (MANV)


--Insert KHACH HANG
INSERT INTO KHACHHANG (MAKH, TEN, DCHI, DTHOAI) VALUES (N'0009', N'Nga', N'223 Nguyen Trai', N'8932320')
INSERT INTO KHACHHANG (MAKH, TEN, DCHI, DTHOAI) VALUES (N'0101', N'Anh', N'567 Tran Phu', N'8826729')
INSERT INTO KHACHHANG (MAKH, TEN, DCHI, DTHOAI) VALUES (N'0045', N'Thu', N'285 Le Loi', N'8932203')
INSERT INTO KHACHHANG (MAKH, TEN, DCHI, DTHOAI) VALUES (N'0012', N'Ha', N'435 Quang Trung', N'8933232')
INSERT INTO KHACHHANG (MAKH, TEN, DCHI, DTHOAI) VALUES (N'0238', N'Hung', N'456 Pasteur', N'9812101')
INSERT INTO KHACHHANG (MAKH, TEN, DCHI, DTHOAI) VALUES (N'0397', N'Thanh', N'234 Le Van Si', N'8952943')
INSERT INTO KHACHHANG (MAKH, TEN, DCHI, DTHOAI) VALUES (N'0582', N'Mai', N'789 Nguyen Du', NULL)
INSERT INTO KHACHHANG (MAKH, TEN, DCHI, DTHOAI) VALUES (N'0934', N'Minh', N'678 Le Lai', NULL)
INSERT INTO KHACHHANG (MAKH, TEN, DCHI, DTHOAI) VALUES (N'0091', N'Hai', N'345 Hung Vuong', N'8893223')
INSERT INTO KHACHHANG (MAKH, TEN, DCHI, DTHOAI) VALUES (N'0314', N'Phuong', N'395 Vo Van Tan', N'8232320')
INSERT INTO KHACHHANG (MAKH, TEN, DCHI, DTHOAI) VALUES (N'0613', N'Vu', N'348 CMT8', N'8343232')
INSERT INTO KHACHHANG (MAKH, TEN, DCHI, DTHOAI) VALUES (N'0586', N'Son', N'123 Bach Dang', N'8556223')
INSERT INTO KHACHHANG (MAKH, TEN, DCHI, DTHOAI) VALUES (N'0422', N'Tien', N'75 Nguyen Thong', N'8332222')

--Insert CHUYENBAY
INSERT INTO CHUYENBAY (MACB, SBDI, SBDEN, GIODI, GIODEN) VALUES (N'100', N'SLC', N'BOS', CAST(N'08:00:00' AS Time), CAST(N'17:50:00' AS Time))
INSERT INTO CHUYENBAY (MACB, SBDI, SBDEN, GIODI, GIODEN) VALUES (N'112', N'DCA', N'DEN', CAST(N'14:00:00' AS Time), CAST(N'18:07:00' AS Time))
INSERT INTO CHUYENBAY (MACB, SBDI, SBDEN, GIODI, GIODEN) VALUES (N'121', N'STL', N'SLC', CAST(N'07:00:00' AS Time), CAST(N'09:13:00' AS Time))
INSERT INTO CHUYENBAY (MACB, SBDI, SBDEN, GIODI, GIODEN) VALUES (N'122', N'STL', N'YYV', CAST(N'08:30:00' AS Time), CAST(N'10:19:00' AS Time))
INSERT INTO CHUYENBAY (MACB, SBDI, SBDEN, GIODI, GIODEN) VALUES (N'206', N'DFW', N'STL', CAST(N'09:00:00' AS Time), CAST(N'11:40:00' AS Time))
INSERT INTO CHUYENBAY (MACB, SBDI, SBDEN, GIODI, GIODEN) VALUES (N'330', N'JFK', N'YYV', CAST(N'16:00:00' AS Time), CAST(N'18:53:00' AS Time))
INSERT INTO CHUYENBAY (MACB, SBDI, SBDEN, GIODI, GIODEN) VALUES (N'334', N'ORD', N'MIA', CAST(N'12:00:00' AS Time), CAST(N'14:14:00' AS Time))
INSERT INTO CHUYENBAY (MACB, SBDI, SBDEN, GIODI, GIODEN) VALUES (N'335', N'MIA', N'ORD', CAST(N'15:00:00' AS Time), CAST(N'17:14:00' AS Time))
INSERT INTO CHUYENBAY (MACB, SBDI, SBDEN, GIODI, GIODEN) VALUES (N'336', N'ORD', N'MIA', CAST(N'18:00:00' AS Time), CAST(N'02:14:00' AS Time))
INSERT INTO CHUYENBAY (MACB, SBDI, SBDEN, GIODI, GIODEN) VALUES (N'337', N'MIA', N'ORD', CAST(N'20:30:00' AS Time), CAST(N'23:53:00' AS Time))
INSERT INTO CHUYENBAY (MACB, SBDI, SBDEN, GIODI, GIODEN) VALUES (N'394', N'DFW', N'MIA', CAST(N'19:00:00' AS Time), CAST(N'21:30:00' AS Time))
INSERT INTO CHUYENBAY (MACB, SBDI, SBDEN, GIODI, GIODEN) VALUES (N'395', N'MIA', N'DFW', CAST(N'21:00:00' AS Time), CAST(N'23:43:00' AS Time))
INSERT INTO CHUYENBAY (MACB, SBDI, SBDEN, GIODI, GIODEN) VALUES (N'449', N'CDG', N'DEN', CAST(N'10:00:00' AS Time), CAST(N'19:29:00' AS Time))
INSERT INTO CHUYENBAY (MACB, SBDI, SBDEN, GIODI, GIODEN) VALUES (N'930', N'YYV', N'DCA', CAST(N'13:00:00' AS Time), CAST(N'16:10:00' AS Time))
INSERT INTO CHUYENBAY (MACB, SBDI, SBDEN, GIODI, GIODEN) VALUES (N'931', N'DCA', N'YYV', CAST(N'17:00:00' AS Time), CAST(N'18:10:00' AS Time))
INSERT INTO CHUYENBAY (MACB, SBDI, SBDEN, GIODI, GIODEN) VALUES (N'932', N'DCA', N'YYV', CAST(N'18:00:00' AS Time), CAST(N'19:10:00' AS Time))
INSERT INTO CHUYENBAY (MACB, SBDI, SBDEN, GIODI, GIODEN) VALUES (N'991', N'BOS', N'ORD', CAST(N'17:00:00' AS Time), CAST(N'18:22:00' AS Time))

--Insert NHANVIEN
INSERT INTO NHANVIEN (MANV, TEN, DCHI, DTHOAI, LUONG, LOAINV) VALUES (N'1006', N'Chi', N'12/6 Nguyen Kiem', N'8120012', CAST(150000.00 AS Numeric(10, 2)), 0)
INSERT INTO NHANVIEN (MANV, TEN, DCHI, DTHOAI, LUONG, LOAINV) VALUES (N'1005', N'Giao', N'65 Nguyen Thai Son', N'8324467', CAST(500000.00 AS Numeric(10, 2)), 0)
INSERT INTO NHANVIEN (MANV, TEN, DCHI, DTHOAI, LUONG, LOAINV) VALUES (N'1001', N'Huong', N'8 Dien Bien Phu', N'8330733', CAST(500000.00 AS Numeric(10, 2)), 1)
INSERT INTO NHANVIEN (MANV, TEN, DCHI, DTHOAI, LUONG, LOAINV) VALUES (N'1002', N'Phong', N'1 Ly Thuong Kiet', N'8308117', CAST(450000.00 AS Numeric(10, 2)), 1)
INSERT INTO NHANVIEN (MANV, TEN, DCHI, DTHOAI, LUONG, LOAINV) VALUES (N'1004', N'Phuong', N'351 Lac Long Quan', N'8308155', CAST(250000.00 AS Numeric(10, 2)), 0)
INSERT INTO NHANVIEN (MANV, TEN, DCHI, DTHOAI, LUONG, LOAINV) VALUES (N'1003', N'Quang', N'78 Truong Dinh', N'8324461', CAST(350000.00 AS Numeric(10, 2)), 1)
INSERT INTO NHANVIEN (MANV, TEN, DCHI, DTHOAI, LUONG, LOAINV) VALUES (N'1007', N'Tam', N'36 Nguyen Van Cu', N'8458188', CAST(500000.00 AS Numeric(10, 2)), 0)

--Insert LOAIMB
INSERT INTO LOAIMB (MALOAI, HANGSX) VALUES (N'A310', N'Airbus')
INSERT INTO LOAIMB (MALOAI, HANGSX) VALUES (N'A320', N'Airbus')
INSERT INTO LOAIMB (MALOAI, HANGSX) VALUES (N'A330', N'Airbus')
INSERT INTO LOAIMB (MALOAI, HANGSX) VALUES (N'A340', N'Airbus')
INSERT INTO LOAIMB (MALOAI, HANGSX) VALUES (N'B727', N'Boeing')
INSERT INTO LOAIMB (MALOAI, HANGSX) VALUES (N'B747', N'Boeing')
INSERT INTO LOAIMB (MALOAI, HANGSX) VALUES (N'B757', N'Boeing')
INSERT INTO LOAIMB (MALOAI, HANGSX) VALUES (N'DC10', N'MD')
INSERT INTO LOAIMB (MALOAI, HANGSX) VALUES (N'DC9', N'MD')

--Insert MAYBAY
INSERT INTO MAYBAY (SOHIEU, MALOAI) VALUES (10, N'B747')
INSERT INTO MAYBAY (SOHIEU, MALOAI) VALUES (11, N'B727')
INSERT INTO MAYBAY (SOHIEU, MALOAI) VALUES (13, N'B727')
INSERT INTO MAYBAY (SOHIEU, MALOAI) VALUES (13, N'B747')
INSERT INTO MAYBAY (SOHIEU, MALOAI) VALUES (21, N'DC10')
INSERT INTO MAYBAY (SOHIEU, MALOAI) VALUES (21, N'DC9')
INSERT INTO MAYBAY (SOHIEU, MALOAI) VALUES (22, N'B757')
INSERT INTO MAYBAY (SOHIEU, MALOAI) VALUES (22, N'DC9')
INSERT INTO MAYBAY (SOHIEU, MALOAI) VALUES (23, N'DC9')
INSERT INTO MAYBAY (SOHIEU, MALOAI) VALUES (24, N'DC9')
INSERT INTO MAYBAY (SOHIEU, MALOAI) VALUES (70, N'A310')
INSERT INTO MAYBAY (SOHIEU, MALOAI) VALUES (80, N'A310')
INSERT INTO MAYBAY (SOHIEU, MALOAI) VALUES (93, N'B757')

--Insert LICHBAY
INSERT INTO LICHBAY (NGAYDI, MACB, SOHIEU, MALOAI) VALUES (CAST(N'2000-11-01' AS Date), N'100', 80, N'A310')
INSERT INTO LICHBAY (NGAYDI, MACB, SOHIEU, MALOAI) VALUES (CAST(N'2000-11-01' AS Date), N'112', 21, N'DC10')
INSERT INTO LICHBAY (NGAYDI, MACB, SOHIEU, MALOAI) VALUES (CAST(N'2000-11-01' AS Date), N'206', 22, N'DC9')
INSERT INTO LICHBAY (NGAYDI, MACB, SOHIEU, MALOAI) VALUES (CAST(N'2000-11-01' AS Date), N'334', 10, N'B747')
INSERT INTO LICHBAY (NGAYDI, MACB, SOHIEU, MALOAI) VALUES (CAST(N'2000-11-01' AS Date), N'337', 10, N'B747')
INSERT INTO LICHBAY (NGAYDI, MACB, SOHIEU, MALOAI) VALUES (CAST(N'2000-11-01' AS Date), N'395', 23, N'DC9')
INSERT INTO LICHBAY (NGAYDI, MACB, SOHIEU, MALOAI) VALUES (CAST(N'2000-11-01' AS Date), N'991', 22, N'B757')
INSERT INTO LICHBAY (NGAYDI, MACB, SOHIEU, MALOAI) VALUES (CAST(N'2000-10-31' AS Date), N'100', 11, N'B727')
INSERT INTO LICHBAY (NGAYDI, MACB, SOHIEU, MALOAI) VALUES (CAST(N'2000-10-31' AS Date), N'112', 11, N'B727')
INSERT INTO LICHBAY (NGAYDI, MACB, SOHIEU, MALOAI) VALUES (CAST(N'2000-10-31' AS Date), N'206', 13, N'B727')
INSERT INTO LICHBAY (NGAYDI, MACB, SOHIEU, MALOAI) VALUES (CAST(N'2000-10-31' AS Date), N'334', 10, N'B747')
INSERT INTO LICHBAY (NGAYDI, MACB, SOHIEU, MALOAI) VALUES (CAST(N'2000-10-31' AS Date), N'335', 10, N'B747')
INSERT INTO LICHBAY (NGAYDI, MACB, SOHIEU, MALOAI) VALUES (CAST(N'2000-10-31' AS Date), N'337', 24, N'DC9')
INSERT INTO LICHBAY (NGAYDI, MACB, SOHIEU, MALOAI) VALUES (CAST(N'2000-10-31' AS Date), N'449', 70, N'A310')

--Insert DATCHO
INSERT INTO DATCHO (MAKH, NGAYDI, MACB) VALUES (N'0009', CAST(N'2000-10-31' AS Date), N'449')
INSERT INTO DATCHO (MAKH, NGAYDI, MACB) VALUES (N'0009', CAST(N'2000-11-01' AS Date), N'100')
INSERT INTO DATCHO (MAKH, NGAYDI, MACB) VALUES (N'0045', CAST(N'2000-11-01' AS Date), N'991')
INSERT INTO DATCHO (MAKH, NGAYDI, MACB) VALUES (N'0012', CAST(N'2000-10-31' AS Date), N'206')
INSERT INTO DATCHO (MAKH, NGAYDI, MACB) VALUES (N'0238', CAST(N'2000-10-31' AS Date), N'334')
INSERT INTO DATCHO (MAKH, NGAYDI, MACB) VALUES (N'0582', CAST(N'2000-11-01' AS Date), N'991')
INSERT INTO DATCHO (MAKH, NGAYDI, MACB) VALUES (N'0091', CAST(N'2000-11-01' AS Date), N'100')
INSERT INTO DATCHO (MAKH, NGAYDI, MACB) VALUES (N'0314', CAST(N'2000-10-31' AS Date), N'449')
INSERT INTO DATCHO (MAKH, NGAYDI, MACB) VALUES (N'0613', CAST(N'2000-11-01' AS Date), N'100')
INSERT INTO DATCHO (MAKH, NGAYDI, MACB) VALUES (N'0586', CAST(N'2000-11-01' AS Date), N'991')
INSERT INTO DATCHO (MAKH, NGAYDI, MACB) VALUES (N'0586', CAST(N'2000-10-31' AS Date), N'100')
INSERT INTO DATCHO (MAKH, NGAYDI, MACB) VALUES (N'0422', CAST(N'2000-10-31' AS Date), N'449')

--Insert KHANANG
INSERT INTO KHANANG (MANV, MALOAI) VALUES (N'1001', N'B727')
INSERT INTO KHANANG (MANV, MALOAI) VALUES (N'1001', N'B747')
INSERT INTO KHANANG (MANV, MALOAI) VALUES (N'1001', N'DC10')
INSERT INTO KHANANG (MANV, MALOAI) VALUES (N'1001', N'DC9')
INSERT INTO KHANANG (MANV, MALOAI) VALUES (N'1002', N'A320')
INSERT INTO KHANANG (MANV, MALOAI) VALUES (N'1002', N'A340')
INSERT INTO KHANANG (MANV, MALOAI) VALUES (N'1002', N'B757')
INSERT INTO KHANANG (MANV, MALOAI) VALUES (N'1002', N'DC9')
INSERT INTO KHANANG (MANV, MALOAI) VALUES (N'1003', N'A310')
INSERT INTO KHANANG (MANV, MALOAI) VALUES (N'1003', N'DC9')

--Insert PHANCONG
INSERT INTO PHANCONG (MANV, NGAYDI, MACB) VALUES (N'1001', CAST(N'2000-10-31' AS Date), N'100')
INSERT INTO PHANCONG (MANV, NGAYDI, MACB) VALUES (N'1001', CAST(N'2000-11-01' AS Date), N'100')
INSERT INTO PHANCONG (MANV, NGAYDI, MACB) VALUES (N'1002', CAST(N'2000-10-31' AS Date), N'100')
INSERT INTO PHANCONG (MANV, NGAYDI, MACB) VALUES (N'1002', CAST(N'2000-11-01' AS Date), N'100')
INSERT INTO PHANCONG (MANV, NGAYDI, MACB) VALUES (N'1003', CAST(N'2000-10-31' AS Date), N'100')
INSERT INTO PHANCONG (MANV, NGAYDI, MACB) VALUES (N'1003', CAST(N'2000-10-31' AS Date), N'337')
INSERT INTO PHANCONG (MANV, NGAYDI, MACB) VALUES (N'1004', CAST(N'2000-10-31' AS Date), N'100')
INSERT INTO PHANCONG (MANV, NGAYDI, MACB) VALUES (N'1004', CAST(N'2000-10-31' AS Date), N'337')
INSERT INTO PHANCONG (MANV, NGAYDI, MACB) VALUES (N'1005', CAST(N'2000-10-31' AS Date), N'337')
INSERT INTO PHANCONG (MANV, NGAYDI, MACB) VALUES (N'1006', CAST(N'2000-11-01' AS Date), N'991')
INSERT INTO PHANCONG (MANV, NGAYDI, MACB) VALUES (N'1006', CAST(N'2000-10-31' AS Date), N'337')
INSERT INTO PHANCONG (MANV, NGAYDI, MACB) VALUES (N'1007', CAST(N'2000-11-01' AS Date), N'112')
INSERT INTO PHANCONG (MANV, NGAYDI, MACB) VALUES (N'1007', CAST(N'2000-11-01' AS Date), N'991')
INSERT INTO PHANCONG (MANV, NGAYDI, MACB) VALUES (N'1007', CAST(N'2000-10-31' AS Date), N'206')