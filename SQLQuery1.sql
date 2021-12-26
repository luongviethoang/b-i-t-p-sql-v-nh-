CREATE DATABASE task5
GO
--tạo bảng
CREATE TABLE hoadon(
orderID CHAR(10) NOT NULL,
customerID CHAR(10) NOT NULL,
orderDate Date DEFAULT GETDATE(),
STATUS Nvarchar(15),
PRIMARY KEY (orderID, customerID))
GO

CREATE TABLE khachhang(
orderID CHAR(10),
customerID CHAR(10),
name NVARCHAR(15),
address NVARCHAR(39),
tel	BIGINT,
status NVARCHAR(20),
FOREIGN KEY (orderID,customerID) REFERENCES dbo.hoadon(orderID,customerID))
GO

CREATE TABLE ctdh(
orderID CHAR(10),
customerID CHAR(10),
productID INT PRIMARY KEY NOT NULL,
price FLOAT,
slg INT,
FOREIGN KEY(orderID,customerID) REFERENCES dbo.hoadon(orderID,customerID))
GO

CREATE TABLE sp(
productID INT,
name NVARCHAR(49),
mota NVARCHAR(60),
unit INT,
price	FLOAT,
slg INT,
status NVARCHAR(50),
FOREIGN KEY (productID) REFERENCES dbo.ctdh(productID))
GO
--nhập bảng hoadon
INSERT INTO dbo.hoadon
(
    orderID,
    customerID,
    orderDate,
    STATUS
)
VALUES
(   'A',        -- orderID - char(10)
    'A',        -- customerID - char(10)
    GETDATE(), -- orderDate - date
    N'đang đóng gói'        -- STATUS - nvarchar(15)
    )
	INSERT INTO dbo.hoadon
(
    orderID,
    customerID,
    orderDate,
    STATUS
)
VALUES
(   'B',        -- orderID - char(10)
    'B',        -- customerID - char(10)
    GETDATE(), -- orderDate - date
    N'đang đóng gói'        -- STATUS - nvarchar(15)
    )
	INSERT INTO dbo.hoadon
(
    orderID,
    customerID,
    orderDate,
    STATUS
)
VALUES
(   'C',        -- orderID - char(10)
    'C',        -- customerID - char(10)
    GETDATE(), -- orderDate - date
    N'đang đóng gói'        -- STATUS - nvarchar(15)
    )
GO
--thêm thông tin vào bảng
INSERT INTO dbo.khachhang
(
    orderID,
    customerID,
    name,
    address,
    tel,
    status
)
VALUES
(   'A',  -- orderID - char(10)
    'A',  -- customerID - char(10)
    N'Hoàng hoa thám', -- name - nvarchar(15)
    N'Tổ 56 ngõ 40 Nam Ninh, Hạ Trì', -- address - nvarchar(39)
    0981658446,   -- tel - bigint
    N'đã xác nhận đơn hàng'  -- status - nvarchar(20)
    )
INSERT INTO dbo.khachhang
(
    orderID,
    customerID,
    name,
    address,
    tel,
    status
)
VALUES
(   'B',  -- orderID - char(10)
    'B',  -- customerID - char(10)
    N'anh ăn súp cua', -- name - nvarchar(15)
    N'ngách 60 ngõ 40 Đà Nẵng quận 3', -- address - nvarchar(39)
    09866884,   -- tel - bigint
    N'đã xác nhận đơn hàng'  -- status - nvarchar(20)
    )
INSERT INTO dbo.khachhang
(
    orderID,
    customerID,
    name,
    address,
    tel,
    status
)
VALUES
(   'C',  -- orderID - char(10)
    'C',  -- customerID - char(10)
    N'Ngũ hổ vồ xôi', -- name - nvarchar(15)
    N'Tây Nguyên sapa Việt Trì', -- address - nvarchar(39)
    09816324236,   -- tel - bigint
    N'đã xác nhận đơn hàng'  -- status - nvarchar(20)
    )
GO
--bảng cuối
INSERT INTO dbo.SanPham
(
    MaSP,
    Tenp
)
VALUES
(   1, -- MaSP - int
    'giày cho người ko có chân' -- Tenp - varchar(40)
    )
INSERT INTO dbo.SanPham
(
    MaSP,
    Tenp
)
VALUES
(   2, -- MaSP - int
    'tai nghe cho người điếc' -- Tenp - varchar(40)
    )
INSERT INTO dbo.SanPham
(
    MaSP,
    Tenp
)
VALUES
(   3, -- MaSP - int
    'kính cho người mù' -- Tenp - varchar(40)
    )
	GO
-- bảng ctđh 
	INSERT INTO dbo.ctdh
	(
	    orderID,
	    customerID,
	    productID,
	    price,
	    slg
	)
	VALUES
	(   'A',  -- orderID - char(10)
	    'A',  -- customerID - char(10)
	    1,   -- productID - int
	    100.000, -- price - float
	    1    -- slg - int
	    )
	INSERT INTO dbo.ctdh
	(
	    orderID,
	    customerID,
	    productID,
	    price,
	    slg
	)
	VALUES
	(   'B',  -- orderID - char(10)
	    'B',  -- customerID - char(10)
	    2,   -- productID - int
	    200.000, -- price - float
	    1    -- slg - int
	    )
	INSERT INTO dbo.ctdh
	(
	    orderID,
	    customerID,
	    productID,
	    price,
	    slg
	)
	VALUES
	(   'C',  -- orderID - char(10)
	    'C',  -- customerID - char(10)
	    3,   -- productID - int
	    300.000, -- price - float
	    1    -- slg - int
	    )
	GO
	--chạy các bảng
	SELECT*FROM dbo.hoadon
	SELECT*FROM dbo.khachhang
	SELECT*FROM dbo.SanPham
	SELECT*FROM dbo.ctdh
	--liệt kê danh sách khách hàng đã mua hàng tại cửa hàng
	SELECT name FROM dbo.khachhang
	GO
	--liệt kê danh sách sản phẩm của cửa hàng 
	SELECT Tenp FROM dbo.SanPham
	GO
	--liệt kê danh sách đơn đặt hàng
	SELECT  orderID FROM dbo.ctdh
	GO
	--liệt kê danh sách khách hàng theo thứ tự alphabet
	SELECT name FROM dbo.khachhang ORDER BY name ASC
	--liệt kê danh sách sản phẩm của cửa hàng theo thứ tự giảm dần
SELECT  Tenp FROM dbo.SanPham ORDER BY Tenp DESC
--số khách hàng đã mua hàng tại cửa hàng
SELECT COUNT (customerID) AS N'số khách hàng đã mua hàng tại cửa hàng' 
FROM dbo.khachhang
