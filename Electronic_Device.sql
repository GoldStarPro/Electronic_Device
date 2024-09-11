USE [master]
GO

CREATE DATABASE Electronic_Device
GO
USE Electronic_Device
GO

CREATE TABLE Category (
	CategoryID INT PRIMARY KEY,
	CategoryName NVARCHAR(100)
);
GO

CREATE TABLE Product (
	ProductID INT PRIMARY KEY,
	ProductName NVARCHAR(255),
	CategoryID INT,
	Brand NVARCHAR (255),
	Price DECIMAL(18,2),
	QuantityInStock INT,
	FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);
GO

-- Nhập hàng, chứa thông tin các lần nhập hàng vào kho
CREATE TABLE Import (
	ImportID INT PRIMARY KEY,
	SupplierName NVARCHAR(255),
	ImportDate DATETIME,
	TotalAmount DECIMAL (18,2) -- Tổng số tiền cho lô hàng nhập
);
GO

-- Chi tiết nhập hàng, chứa thông tin chi tiết về từng sản phẩm trong mỗi lần nhập hàng
CREATE TABLE ImportDetail (
	ImportDetailID INT PRIMARY KEY,
	ImportID INT,
	ProductID INT,
	QuantityImported INT,		-- số lượng sản phẩm nhập
	UnitPrice DECIMAL (18,2),	-- giá nhập mỗi đơn vị sản phẩm
	FOREIGN KEY (ImportID) REFERENCES Import(ImportID),
	FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
);
GO

-- Đơn hàng, chứa thông tin về các đơn hàng từ khách hàng
CREATE TABLE [Order] (
	OrderID INT PRIMARY KEY,
	CustomerName NVARCHAR(255),
	OrderDate DATETIME,
	TotalAmount DECIMAL(18,2)  -- Tổng số tiền của cả đơn hàng
);
GO

-- Chi tiết đơn hàng, chứa thông tin chi tiết về các sản phẩm trong mỗi đơn hàng
CREATE TABLE OrderDetails (
	OrderDetailID INT PRIMARY KEY,
	OrderID INT,
	ProductID INT,
	QuantitySold INT,
	UnitPrice DECIMAL(18,2),
	FOREIGN KEY (OrderID) REFERENCES [Order](OrderID),
	FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);
GO

-- Insert Data

INSERT INTO Category (CategoryID, CategoryName)
VALUES
(1, 'Mouse'),
(2, 'Keyboard'),
(3, 'Laptop'),
(4, 'Monitor'),
(5, 'Headset');

INSERT INTO Product (ProductID, ProductName, CategoryID, Brand, Price, QuantityInStock)
VALUES
(1, 'Logitech G502', 1, 'Logitech', 50.00, 150),
(2, 'Razer DeathAdder V2', 1, 'Razer', 60.00, 120),
(3, 'Corsair K95 RGB Platinum', 2, 'Corsair', 200.00, 80),
(4, 'SteelSeries Apex Pro', 2, 'SteelSeries', 190.00, 90),
(5, 'Dell XPS 13', 3, 'Dell', 1200.00, 50),
(6, 'MacBook Pro 16', 3, 'Apple', 2500.00, 40),
(7, 'ASUS ROG Swift PG279Q', 4, 'ASUS', 800.00, 30),
(8, 'Acer Predator XB273K', 4, 'Acer', 900.00, 25),
(9, 'HyperX Cloud II', 5, 'HyperX', 100.00, 200),
(10, 'SteelSeries Arctis 7', 5, 'SteelSeries', 150.00, 180);

INSERT INTO Import (ImportID, SupplierName, ImportDate, TotalAmount)
VALUES
(1, 'Logitech Supplier', '2024-08-01', 7500.00),
(2, 'Razer Supplier', '2024-08-05', 7200.00),
(3, 'Dell Supplier', '2024-08-10', 60000.00),
(4, 'Apple Supplier', '2024-08-12', 100000.00),
(5, 'Acer Supplier', '2024-08-15', 27000.00);


INSERT INTO ImportDetail (ImportDetailID, ImportID, ProductID, QuantityImported, UnitPrice)
VALUES
(1, 1, 1, 150, 50.00),  -- Logitech G502
(2, 2, 2, 120, 60.00),  -- Razer DeathAdder V2
(3, 3, 5, 50, 1200.00),  -- Dell XPS 13
(4, 4, 6, 40, 2500.00),  -- MacBook Pro 16
(5, 5, 8, 30, 900.00);   -- Acer Predator XB273K


INSERT INTO [Order] (OrderID, CustomerName, OrderDate, TotalAmount)
VALUES
(1, 'John Doe', '2024-09-01', 1800.00),
(2, 'Jane Smith', '2024-09-02', 2740.00),
(3, 'Alice Johnson', '2024-09-03', 800.00),
(4, 'Bob Brown', '2024-09-04', 2500.00),
(5, 'Charlie Green', '2024-09-05', 1000.00);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, QuantitySold, UnitPrice)
VALUES
(1, 1, 5, 1, 1200.00),  -- Dell XPS 13 (John Doe)
(2, 1, 1, 12, 50.00),   -- Logitech G502 (John Doe)
(3, 2, 6, 1, 2500.00),  -- MacBook Pro 16 (Jane Smith)
(4, 2, 2, 4, 60.00),    -- Razer DeathAdder V2 (Jane Smith)
(5, 3, 7, 1, 800.00),   -- ASUS ROG Swift PG279Q (Alice Johnson)
(6, 4, 6, 1, 2500.00),  -- MacBook Pro 16 (Bob Brown)
(7, 5, 9, 10, 100.00);  -- HyperX Cloud II (Charlie Green)

