	--Task-1
	CREATE DATABASE TechShop;
	USE TechShop;


	CREATE TABLE Customers
	( CustomerID INT PRIMARY KEY not null,
	FirstName varchar(30) not null,
	LastName varchar(30) not null,
	Email varchar(30) not null,
	Phone varchar(15) not null,
	Address varchar(30) not null);

	CREATE TABLE Products
	( ProductID int PRIMARY KEY,
	ProductName varchar(30) not null,
	Description varchar(50),
	Price int not null);

	CREATE TABLE Orders
	( OrderID int PRIMARY KEY,
	CustomerID int,
	OrderDate date,
	TotalAmount int
	FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
	);

	CREATE TABLE OrderDetails
	( OrderDetailID int PRIMARY KEY,
	OrderID int,
	ProductID int,
	Quantity int,
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
	);

	CREATE TABLE Inventory
	( InventoryID int PRIMARY KEY,
	ProductID int,
	QuantityInStock int,
	LastStockUpdate DATE
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
	);

	SELECT*FROM Customers;

	INSERT INTO Customers VALUES (1,'Raj','Patil','rajp12@gmail.com','23462742756','403,Pune, Maharshtra');
	INSERT INTO Customers VALUES (2,'Rohit','Kulkarni','rohitk212@gmail.com','23563742756','103,Pune, Maharshtra');
	INSERT INTO Customers VALUES (3,'Ravi','Patil','ravip234@gmail.com','7447565576','Pune, Maharashtra');
	INSERT INTO Customers VALUES (4, 'Sara', 'Khan', 'sara123@gmail.com', '9876543210', 'Mumbai, Maharashtra');
	INSERT INTO Customers VALUES (5, 'Amit', 'Sharma', 'amit.sharma@gmail.com', '8765432109', 'Delhi, India');
	INSERT INTO Customers VALUES (6, 'Anita', 'Singh', 'anita_s@gmail.com', '7890123456', 'Bangalore, Karnataka');
	INSERT INTO Customers VALUES (7, 'Rahul', 'Gupta', 'rahul_g@gmail.com', '9012345678', 'Chennai, Tamil Nadu');
	INSERT INTO Customers VALUES (8, 'Priya', 'Yadav', 'priya_yadav@gmail.com', '7654321098', 'Kolkata, West Bengal');
	INSERT INTO Customers VALUES (9, 'Rajesh', 'Mehta', 'raj_mehta@gmail.com', '6543210987', 'Ahmedabad, Gujarat');
	INSERT INTO Customers VALUES (10, 'Neha', 'Shah', 'neha_shah@gmail.com', '8901234567', 'Hyderabad, Telangana');

	INSERT INTO Products (ProductID, ProductName, Description, Price) VALUES (1, 'Smartphone X', 'High-end smartphone', 799.99);
	INSERT INTO Products (ProductID, ProductName, Description, Price) VALUES  (2, 'Laptop Pro', 'Powerful laptop with SSD', 1299.99);
	INSERT INTO Products (ProductID, ProductName, Description, Price) VALUES  (3, 'Wireless Earbuds', 'Noise-canceling earbuds', 149.99);
	INSERT INTO Products (ProductID, ProductName, Description, Price) VALUES  (4, 'Smartwatch', 'Fitness tracking smartwatch', 199.99);
	INSERT INTO Products (ProductID, ProductName, Description, Price) VALUES  (5, 'Tablet', 'Portable tablet with HD display', 499.99);
	INSERT INTO Products (ProductID, ProductName, Description, Price) VALUES  (6, 'Bluetooth Speaker', 'Waterproof portable speaker', 79.99);
	INSERT INTO Products (ProductID, ProductName, Description, Price) VALUES  (7, 'Gaming Console', 'Next-gen gaming console', 499.99);
	INSERT INTO Products (ProductID, ProductName, Description, Price) VALUES  (8, 'Digital Camera', 'High-resolution digital camera', 699.99);
	INSERT INTO Products (ProductID, ProductName, Description, Price) VALUES  (9, 'External Hard Drive', '1TB external hard drive', 89.99);
	INSERT INTO Products (ProductID, ProductName, Description, Price) VALUES  (10, 'Smart TV', '4K Ultra HD Smart TV', 999.99);

	INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES (101, 1, '2023-12-01', 799.99);
	INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES  (102, 2, '2023-12-02', 1449.98);
	INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES  (103, 3, '2023-12-03', 149.99);
	INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES  (104, 4, '2023-12-04', 199.99);
	INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES  (105, 5, '2023-12-05', 499.99);
	INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES  (106, 6, '2023-12-06', 79.99);
	INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES  (107, 7, '2023-12-07', 499.99);
	INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES  (108, 8, '2023-12-08', 699.99);
	INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES  (109, 9, '2023-12-09', 89.99);
	INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES  (110, 10, '2023-12-10', 999.99);
	SELECT*FROM Orders;

	INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES (201, 101, 1, 1);
	INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES  (202, 102, 2, 1);
	INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES  (203, 102, 3, 2);
	INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES  (204, 103, 4, 1);
	INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES  (205, 104, 5, 1);
	INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES  (206, 105, 6, 1);
	INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES  (207, 105, 7, 2);
	INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES  (208, 106, 8, 1);
	INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES  (209, 107, 9, 1);
	INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES  (210, 108, 10, 1);
	SELECT*FROM OrderDetails;

	INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate) VALUES (301, 1, 50, '2023-12-01');
	INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate) VALUES  (302, 2, 20, '2023-12-02');
	INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate) VALUES  (303, 3, 30, '2023-12-03');
	INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate) VALUES  (304, 4, 15, '2023-12-04');
	INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate) VALUES  (305, 5, 40, '2023-12-05');
	INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate) VALUES  (306, 6, 25, '2023-12-06');
	INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate) VALUES  (307, 7, 10, '2023-12-07');
	INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate) VALUES  (308, 8, 35, '2023-12-08');
	INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate) VALUES  (309, 9, 18, '2023-12-09');
	INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate) VALUES  (310, 10, 22, '2023-12-10');
	SELECT*FROM Inventory;


--Task-2

SELECT FirstName,LastName,Email
FROM Customers;


SELECT O.OrderID,O.OrderDate,C.FirstName,C.LastName
FROM Orders O
JOIN Customers C ON O.CustomerID=C.CustomerID;


INSERT INTO Customers VALUES (11,'Rohit','Kulkarni','krohitr2000@gmail.com','8055998766','Sangli,Maharshtra,India');
SELECT*FROM Customers;


UPDATE Products
SET Price=Price*1.1; 
SELECT*FROM Products;


DECLARE @OrderIDToDelete int = 101;
DELETE FROM Orders WHERE OrderID= @OrderIDToDelete;
DELETE FROM OrderDetails WHERE OrderID=@OrderIDToDelete;
SELECT*FROM Orders;
SELECT*FROM OrderDetails;


INSERT INTO Orders (OrderID,CustomerID, OrderDate, TotalAmount) VALUES (111,11, '2023-12-15', 999.99);


UPDATE Customers
SET Email='rrkulkarni0507@gmail.com', Address='Solapur,India'
WHERE CustomerID=11;
SELECT*FROM Customers;


UPDATE Orders
SET TotalAmount= TotalAmount*Quantity
FROM OrderDetails OD
JOIN Orders O ON OD.OrderID=O.OrderID;


DELETE FROM OrderDetails
FROM OrderDetails OD
JOIN Orders O ON O.OrderID = OD.OrderID
WHERE O.CustomerID = 10;
SELECT*FROM OrderDetails;

DELETE FROM Orders
WHERE CustomerID = 10;
SELECT*FROM Orders;


INSERT INTO Products (ProductID, ProductName,Price) VALUES (11, 'Smartwach', 1299.00); 
SELECT*FROM Products;


ALTER TABLE Orders 
ADD OrderStatus varchar(10);

UPDATE Orders
SET OrderStatus = 'Shipped'
WHERE OrderID = 102;


ALTER TABLE Customers
ADD NumberOfOrdersPlaced int;

UPDATE Customers
SET NumberOfOrdersPlaced = (SELECT COUNT(OrderID)
FROM Orders
WHERE Customers.CustomerID=Orders.CustomerID
);
SELECT*FROM Customers;
SELECT*FROM Orders;


--Task-3

SELECT O.OrderID,O.CustomerID,O.OrderDate,O.TotalAmount,C.FirstName,C.LastName,C.NumberOfOrdersPlaced
FROM Orders O
JOIN Customers C ON C.CustomerID=O.CustomerID;


SELECT P.ProductName, P.ProductID, SUM(P.Price*OD.Quantity) AS TotalRevenue
FROM Products P
JOIN OrderDetails OD ON OD.ProductID=P.ProductID
GROUP BY P.ProductID,P.ProductName;	


SELECT FirstName,LastName,Phone
FROM Customers
WHERE NumberOfOrdersPlaced>0;


SELECT TOP 1 P.ProductName,P.ProductID, SUM(OD.Quantity) AS TotalQuantityOrdered
FROM Products P
JOIN OrderDetails OD ON OD.ProductID=P.ProductID
GROUP BY P.ProductName,P.ProductID
ORDER BY TotalQuantityOrdered DESC;


SELECT ProductName,Description
FROM Products;


SELECT C.CustomerID,C.FirstName,C.LastName, AVG(TotalAmount*Quantity) AS AverageOrderValue
FROM Customers C
JOIN Orders O ON O.CustomerID=C.CustomerID
JOIN OrderDetails OD ON OD.OrderID=O.OrderID
GROUP BY C.CustomerID,C.FirstName,C.LastName;


SELECT TOP 1 O.OrderID, C.CustomerID,C.FirstName,C.LastName, SUM(TotalAmount*Quantity) AS HighestTotalRevenue
FROM Customers C
JOIN Orders O ON O.CustomerID= C.CustomerID
JOin OrderDetails OD ON OD.OrderID=O.OrderID
Group BY O.OrderID,C.CustomerID,C.FirstName,C.LastName
ORDER BY HighestTotalRevenue DESC;


SELECT P.ProductID,P.ProductName,COUNT(OD.OrderID) AS OrderCount
FROM Products P
LEFT JOIN OrderDetails OD ON OD.ProductID=P.ProductID
GROUP BY P.ProductID,P.ProductName
ORDER BY OrderCount DESC;


DECLARE @ProductName varchar(100)
SET @ProductName='Gaming Console'

SELECT C.FirstName,C.LastName,P.ProductName,O.OrderID,P.ProductID
FROM Customers C
JOIN Orders O ON O.CustomerID=C.CustomerID
JOIN OrderDetails OD ON OD.OrderID=O.OrderID
JOIN Products P ON P.ProductID=OD.ProductID
WHERE P.ProductName=ProductName;


DECLARE @StartDate DATE
DECLARE @EndDate DATE
SET @StartDate='2023.12.02'
SET @EndDate='2023.12.06'
SELECT SUM(O.TotalAmount*OD.Quantity) AS RevenueGenerated
FROM Orders O
JOIN OrderDetails OD ON OD.OrderID=O.OrderID
WHERE OrderDate >=@StartDate AND OrderDate<=@EndDate;


--Task-4

SELECT C.CustomerID,C.FirstName,O.OrderID
FROM Customers C
LEFT JOIN Orders O
ON O.OrderID=C.CustomerID
WHERE NumberOfOrdersPlaced=0;


SELECT SUM(QuantityInStock) AS ProductsAvailable
FROM Inventory;


SELECT SUM(TotalAmount*Quantity) AS RevenueGenerated
FROM Orders O
JOIN OrderDetails OD
ON OD.OrderID=O.OrderID;


DECLARE @ProductCategory varchar(20);
SET @ProductCategory ='Laptop Pro';
SELECT P.ProductName,P.ProductID,AVG(OD.Quantity) AS AverageQuantityOrdered
FROM OrderDetails OD
JOIN Products P ON P.ProductID=OD.ProductID
WHERE P.ProductName=@ProductCategory
GROUP BY P.ProductID,P.ProductName;


DECLARE @CustomerID int
SET @CustomerID='3';
SELECT C.CustomerID, SUM(O.TotalAmount*OD.Quantity) AS RevenueByCustomer
FROM Orders O
JOIN OrderDetails OD ON OD.OrderID=O.OrderID
JOIN Customers C ON C.CustomerID=O.CustomerID
WHERE C.CustomerID=@CustomerID
GROUP BY C.CustomerID;


SELECT FirstName,LastName,COUNT(NumberOfOrdersPlaced) AS OrdersPlaced
FROM Customers
GROUP BY FirstName,LastName
ORDER BY OrdersPlaced DESC;


SELECT TOP 1 P.ProductID,P.ProductName,SUM(OD.Quantity) AS NumberOfOrders
FROM Products P
JOIN OrderDetails OD ON OD.ProductID=P.ProductID
GROUP BY P.ProductID,P.ProductName
ORDER BY NumberOfOrders DESC;


SELECT TOP 1 C.CustomerID,C.FirstName,C.LastName,SUM(O.TotalAmount*OD.Quantity) AS MoneySpent
FROM Customers C
JOIN Orders O ON O.CustomerID=C.CustomerID
JOIN OrderDetails OD ON OD.OrderID=O.OrderID
GROUP BY C.CustomerID,C.FirstName,C.LastName;


SELECT AVG(TotalAmount) AS AverageOrderValue
FROM Orders;


SELECT C.CustomerID,C.FirstName,C.LastName,COUNT(O.OrderID) AS OrderCount
FROM Customers C
JOIN Orders O ON O.CustomerID=C.CustomerID
GROUP BY C.CustomerID,C.FirstName,C.LastName;
