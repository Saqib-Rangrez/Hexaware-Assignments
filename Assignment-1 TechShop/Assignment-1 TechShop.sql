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

	-- SQL query to retrive the names and emails of all customers

SELECT FirstName,LastName,Email
FROM Customers;

--SQL query to list all orders with their order dates and corresponding customer names.

SELECT O.OrderID,O.OrderDate,C.FirstName,C.LastName
FROM Orders O
JOIN Customers C ON O.CustomerID=C.CustomerID;

--SQL query to insert a new customer record into the "Customers" table. Include customer information such as name, email, and address.

INSERT INTO Customers VALUES (11,'Rohit','Kulkarni','krohitr2000@gmail.com','8055998766','Sangli,Maharshtra,India');
SELECT*FROM Customers;

--SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%.

UPDATE Products
SET Price=Price*1.1; 
SELECT*FROM Products;

--SQL query to delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter.

DECLARE @OrderIDToDelete int = 101;
DELETE FROM Orders WHERE OrderID= @OrderIDToDelete;
DELETE FROM OrderDetails WHERE OrderID=@OrderIDToDelete;
SELECT*FROM Orders;
SELECT*FROM OrderDetails;

--SQL query to insert a new order into the "Orders" table. Include the customer ID, order date, and any other necessary information.

INSERT INTO Orders (OrderID,CustomerID, OrderDate, TotalAmount) VALUES (111,11, '2023-12-15', 999.99);

/*SQL query to update the contact information (e.g., email and address) of a specific customer in the "Customers" table. 
Allow users to input the customer ID and new contact information.*/

UPDATE Customers
SET Email='rrkulkarni0507@gmail.com', Address='Solapur,India'
WHERE CustomerID=11;
SELECT*FROM Customers;

--an SQL query to recalculate and update the total cost of each order in the "Orders" table based on the prices and quantities in the "OrderDetails" table.

UPDATE Orders
SET TotalAmount= TotalAmount*Quantity
FROM OrderDetails OD
JOIN Orders O ON OD.OrderID=O.OrderID;

/*SQL query to delete all orders and their associated order details for a specific customer from the "Orders" and "OrderDetails" tables. 
Allow users to input the customer ID as a parameter.*/

DELETE FROM OrderDetails
FROM OrderDetails OD
JOIN Orders O ON O.OrderID = OD.OrderID
WHERE O.CustomerID = 10;
SELECT*FROM OrderDetails;

DELETE FROM Orders
WHERE CustomerID = 10;
SELECT*FROM Orders;

--SQL query to insert a new electronic gadget product into the "Products" table, including product name, category, price, and any other relevant details.

INSERT INTO Products (ProductID, ProductName,Price) VALUES (11, 'Smartwach', 1299.00); 
SELECT*FROM Products;

-- SQL query to update the status of a specific order in the "Orders" table (e.g., from "Pending" to "Shipped"). Allow users to input the order ID and the new status.

ALTER TABLE Orders 
ADD OrderStatus varchar(10);

UPDATE Orders
SET OrderStatus = 'Shipped'
WHERE OrderID = 102;

--SQL query to calculate and update the number of orders placed by each customer in the "Customers" table based on the data in the "Orders" table.

ALTER TABLE Customers
ADD NumberOfOrdersPlaced int;

UPDATE Customers
SET NumberOfOrdersPlaced = (SELECT COUNT(OrderID)
FROM Orders
WHERE Customers.CustomerID=Orders.CustomerID
);
SELECT*FROM Customers;
SELECT*FROM Orders;

--Write an SQL query to retrieve a list of all orders along with customer information (e.g., customer name) for each order.

SELECT O.OrderID,O.CustomerID,O.OrderDate,O.TotalAmount,C.FirstName,C.LastName,C.NumberOfOrdersPlaced
FROM Orders O
JOIN Customers C ON C.CustomerID=O.CustomerID;

--SQL query to find the total revenue generated by each electronic gadget product. Include the product name and the total revenue.

SELECT P.ProductName, P.ProductID, SUM(P.Price*OD.Quantity) AS TotalRevenue
FROM Products P
JOIN OrderDetails OD ON OD.ProductID=P.ProductID
GROUP BY P.ProductID,P.ProductName;	

--SQL query to list all customers who have made at least one purchase. Include their names and contact information.

SELECT FirstName,LastName,Phone
FROM Customers
WHERE NumberOfOrdersPlaced>0;

--SQL query to find the most popular electronic gadget, which is the one with the highest total quantity ordered. Include the product name and the total quantity ordered.

SELECT TOP 1 P.ProductName,P.ProductID, SUM(OD.Quantity) AS TotalQuantityOrdered
FROM Products P
JOIN OrderDetails OD ON OD.ProductID=P.ProductID
GROUP BY P.ProductName,P.ProductID
ORDER BY TotalQuantityOrdered DESC;

--an SQL query to retrieve a list of electronic gadgets along with their corresponding categories.

SELECT ProductName,Description
FROM Products;

--SQL query to calculate the average order value for each customer. Include the customer's name and their average order value.

SELECT C.CustomerID,C.FirstName,C.LastName, AVG(TotalAmount*Quantity) AS AverageOrderValue
FROM Customers C
JOIN Orders O ON O.CustomerID=C.CustomerID
JOIN OrderDetails OD ON OD.OrderID=O.OrderID
GROUP BY C.CustomerID,C.FirstName,C.LastName;

--SQL query to find the order with the highest total revenue. Include the order ID, customer information, and the total revenue.

SELECT TOP 1 O.OrderID, C.CustomerID,C.FirstName,C.LastName, SUM(TotalAmount*Quantity) AS HighestTotalRevenue
FROM Customers C
JOIN Orders O ON O.CustomerID= C.CustomerID
JOin OrderDetails OD ON OD.OrderID=O.OrderID
Group BY O.OrderID,C.CustomerID,C.FirstName,C.LastName
ORDER BY HighestTotalRevenue DESC;

--SQL query to list electronic gadgets and the number of times each product has been ordered.

SELECT P.ProductID,P.ProductName,COUNT(OD.OrderID) AS OrderCount
FROM Products P
LEFT JOIN OrderDetails OD ON OD.ProductID=P.ProductID
GROUP BY P.ProductID,P.ProductName
ORDER BY OrderCount DESC;

--SQL query to find customers who have purchased a specific electronic gadget product. Allow users to input the product name as a parameter.
DECLARE @ProductName varchar(100)
SET @ProductName='Gaming Console'

SELECT C.FirstName,C.LastName,P.ProductName,O.OrderID,P.ProductID
FROM Customers C
JOIN Orders O ON O.CustomerID=C.CustomerID
JOIN OrderDetails OD ON OD.OrderID=O.OrderID
JOIN Products P ON P.ProductID=OD.ProductID
WHERE P.ProductName=ProductName;

--SQL query to calculate the total revenue generated by all orders placed within a specific time period. Allow users to input the start and end dates as parameters.

DECLARE @StartDate DATE
DECLARE @EndDate DATE
SET @StartDate='2023.12.02'
SET @EndDate='2023.12.06'
SELECT SUM(O.TotalAmount*OD.Quantity) AS RevenueGenerated
FROM Orders O
JOIN OrderDetails OD ON OD.OrderID=O.OrderID
WHERE OrderDate >=@StartDate AND OrderDate<=@EndDate;

USE TechShop;

--SQL query to find out which customers have not placed any orders.

SELECT C.CustomerID,C.FirstName,O.OrderID
FROM Customers C
LEFT JOIN Orders O
ON O.OrderID=C.CustomerID
WHERE NumberOfOrdersPlaced=0;

--SQL query to find the total number of products available for sale.

SELECT SUM(QuantityInStock) AS ProductsAvailable
FROM Inventory;

--SQL query to calculate the total revenue generated by TechShop.

SELECT SUM(TotalAmount*Quantity) AS RevenueGenerated
FROM Orders O
JOIN OrderDetails OD
ON OD.OrderID=O.OrderID;

--SQL query to calculate the average quantity ordered for products in a specific category. Allow users to input the category name as a parameter.

DECLARE @ProductCategory varchar(20);
SET @ProductCategory ='Laptop Pro';
SELECT P.ProductName,P.ProductID,AVG(OD.Quantity) AS AverageQuantityOrdered
FROM OrderDetails OD
JOIN Products P ON P.ProductID=OD.ProductID
WHERE P.ProductName=@ProductCategory
GROUP BY P.ProductID,P.ProductName;

-- SQL query to calculate the total revenue generated by a specific customer. Allow users to input the customer ID as a parameter.

DECLARE @CustomerID int
SET @CustomerID='3';
SELECT C.CustomerID, SUM(O.TotalAmount*OD.Quantity) AS RevenueByCustomer
FROM Orders O
JOIN OrderDetails OD ON OD.OrderID=O.OrderID
JOIN Customers C ON C.CustomerID=O.CustomerID
WHERE C.CustomerID=@CustomerID
GROUP BY C.CustomerID;

--SQL query to find the customers who have placed the most orders. List their names and the number of orders they've placed.

SELECT FirstName,LastName,COUNT(NumberOfOrdersPlaced) AS OrdersPlaced
FROM Customers
GROUP BY FirstName,LastName
ORDER BY OrdersPlaced DESC;

--SQL query to find the most popular product category, which is the one with the highest total quantity ordered across all orders.

SELECT TOP 1 P.ProductID,P.ProductName,SUM(OD.Quantity) AS NumberOfOrders
FROM Products P
JOIN OrderDetails OD ON OD.ProductID=P.ProductID
GROUP BY P.ProductID,P.ProductName
ORDER BY NumberOfOrders DESC;

-- an SQL query to find the customer who has spent the most money (highest total revenue) on electronic gadgets. List their name and total spending.

SELECT TOP 1 C.CustomerID,C.FirstName,C.LastName,SUM(O.TotalAmount*OD.Quantity) AS MoneySpent
FROM Customers C
JOIN Orders O ON O.CustomerID=C.CustomerID
JOIN OrderDetails OD ON OD.OrderID=O.OrderID
GROUP BY C.CustomerID,C.FirstName,C.LastName;


--SQL query to calculate the average order value (total revenue divided by the number of orders) for all customers.
SELECT AVG(TotalAmount) AS AverageOrderValue
FROM Orders;

--SQL query to find the total number of orders placed by each customer and list their names along with the order count.

SELECT C.CustomerID,C.FirstName,C.LastName,COUNT(O.OrderID) AS OrderCount
FROM Customers C
JOIN Orders O ON O.CustomerID=C.CustomerID
GROUP BY C.CustomerID,C.FirstName,C.LastName;
