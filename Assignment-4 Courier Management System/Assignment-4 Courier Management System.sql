--Task-1
CREATE DATABASE CourierManagementSystem;
USE CourierManagementSystem;


CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    Password VARCHAR(255),
    ContactNumber VARCHAR(20),
    Address TEXT
);

CREATE TABLE Couriers (
    CourierID INT PRIMARY KEY,
    SenderName VARCHAR(255),
    SenderAddress TEXT,
    ReceiverName VARCHAR(255),
    ReceiverAddress TEXT,
    Weight DECIMAL(5, 2),
    Status VARCHAR(50),
    TrackingNumber VARCHAR(20) UNIQUE,
    DeliveryDate DATE
);

CREATE TABLE CourierServices (
    ServiceID INT PRIMARY KEY,
    ServiceName VARCHAR(100),
    Cost DECIMAL(8, 2)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    ContactNumber VARCHAR(20),
    Role VARCHAR(50),
    Salary DECIMAL(10, 2)
);

CREATE TABLE Locations (
    LocationID INT PRIMARY KEY,
    LocationName VARCHAR(100),
    Address TEXT
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    CourierID INT,
    LocationID INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    FOREIGN KEY (CourierID) REFERENCES Couriers(CourierID),
    FOREIGN KEY (LocationID) REFERENCES Locations(LocationID)
);




INSERT INTO Users (UserID, Name, Email, Password, ContactNumber, Address)
VALUES
(1, 'Raj Sharma', 'raj.sharma@email.com', 'password123', '9876543210', '123 Main Street, Delhi'),
(2, 'Priya Patel', 'priya.patel@email.com', 'pass456', '7890123456', '456 Oak Avenue, Mumbai'),
(3, 'Amit Verma', 'amit.verma@email.com', 'amit123', '8765432109', '789 Elm Street, Bangalore'),
(4, 'Neha Reddy', 'neha.reddy@email.com', 'neha456', '7654321098', '101 Pine Avenue, Hyderabad'),
(5, 'Rahul Kapoor', 'rahul.kapoor@email.com', 'rahul567', '6543210987', '202 Oak Street, Kolkata'),
(6, 'Anjali Desai', 'anjali.desai@email.com', 'anjali456', '5432109876', '303 Maple Avenue, Chennai'),
(7, 'Sanjay Mehra', 'sanjay.mehra@email.com', 'sanjay789', '4321098765', '404 Elm Street, Pune'),
(8, 'Meera Iyer', 'meera.iyer@email.com', 'meera987', '3210987654', '505 Pine Avenue, Ahmedabad');

INSERT INTO Couriers (CourierID, SenderName, SenderAddress, ReceiverName, ReceiverAddress, Weight, Status, TrackingNumber, DeliveryDate)
VALUES 
(1, 'Raj Sharma', '789 Pine Street, Delhi', 'Suresh Kumar', '567 Elm Street, Mumbai', 8.5, 'In Transit', 'TN123456', '2023-04-01'),
(2, 'Priya Patel', '321 Oak Street, Kolkata', 'Anita Gupta', '456 Maple Street, Bangalore', 6.0, 'Delivered', 'TN789012', '2023-03-28'),
(3, 'Jyoti Singh', '111 Pine Street, Hyderabad', 'Alok Gupta', '222 Oak Street, Chennai', 7.0, 'In Transit', 'TN654321', '2023-04-05'),
(4, 'Arun Verma', '505 Maple Avenue, Pune', 'Shweta Reddy', '606 Elm Street, Ahmedabad', 4.5, 'Delivered', 'TN987654', '2023-04-02'),
(5, 'Kavita Patel', '777 Oak Street, Delhi', 'Vinod Iyer', '888 Maple Avenue, Mumbai', 9.2, 'In Transit', 'TN789002', '2023-04-08'),
(6, 'Rohit Deshmukh', '999 Pine Street, Kolkata', 'Sneha Kapoor', '111 Elm Street, Bangalore', 6.8, 'Scheduled', 'TN345678', '2023-04-10'),
(7, 'Raj Sharma', '303 Oak Street, Hyderabad', 'Suman Mehra', '404 Maple Avenue, Pune', 5.3, 'Delivered', 'TN012345', '2023-03-30'),
(8, 'Sangeeta Iyer', '202 Elm Street, Chennai', 'Vivek Desai', '303 Pine Street, Ahmedabad', 8.0, 'In Transit', 'TN678901', '2023-04-12');

INSERT INTO CourierServices (ServiceID, ServiceName, Cost)
VALUES
(11, 'Delivery Driver', 20.00),
(2, 'Express', 15.00),
(3, 'Next Day Delivery', 20.00),
(4, 'Two-Day Delivery', 18.00),
(5, 'Economy', 12.00),
(6, 'Same Day Delivery', 25.00),
(7, 'Standard', 15.00),
(8, 'Express', 22.00);

INSERT INTO Employees (EmployeeID, Name, Email, ContactNumber, Role, Salary)
VALUES
(1, 'Rohan Gupta', 'rohan.gupta@email.com', '111-222-3333', 'Delivery Driver', 50000.00),
(2, 'Chitra Iyer', 'chitra.iyer@email.com', '444-333-5555', 'Customer Service', 45000.00),
(3, 'Vikram Singh', 'vikram.singh@email.com', '777-888-1111', 'Warehouse Manager', 55000.00),
(4, 'Pooja Desai', 'pooja.desai@email.com', '444-333-5555', 'Dispatcher', 48000.00),
(5, 'Kunal Kapoor', 'kunal.kapoor@email.com', '111-222-3333', 'Delivery Driver', 52000.00),
(6, 'Aarti Singh', 'aarti.singh@email.com', '666-555-7777', 'Customer Service', 47000.00),
(7, 'Rajat Mehta', 'rajat.mehta@email.com', '888-999-1111', 'Warehouse Staff', 45000.00),
(8, 'Ananya Iyer', 'ananya.iyer@email.com', '222-333-4444', 'Dispatcher', 48000.00);

INSERT INTO Locations (LocationID, LocationName, Address)
VALUES
(1, 'Main Office', '123 Main Street, Delhi'),
(2, 'Branch Office', '456 Oak Avenue, Mumbai'),
(3, 'Warehouse A', '777 Pine Street, Hyderabad'),
(4, 'Warehouse B', '888 Oak Street, Pune'),
(5, 'Branch Office 2', '999 Elm Street, Bangalore'),
(6, 'Branch Office 3', '101 Maple Avenue, Chennai'),
(7, 'Warehouse C', '222 Oak Street, Kolkata'),
(8, 'Branch Office 4', '333 Elm Street, Ahmedabad');

INSERT INTO Payments (PaymentID, CourierID, LocationID, Amount, PaymentDate)
VALUES
(1, 1, 1, 20.00, '2023-03-25'),
(2, 2, 2, 30.00, '2023-04-02'),
(3, 3, 3, 15.00, '2023-04-01'),
(4, 4, 4, 25.00, '2023-04-02'),
(5, 5, 5, 18.00, '2023-04-03'),
(6, 6, 6, 22.00, '2023-04-04'),
(7, 7, 7, 30.00, '2023-04-05'),
(8, 8, 8, 20.00, '2023-04-06');

--TASK 2

SELECT * FROM Users;

SELECT * FROM Couriers WHERE SenderName = (SELECT Name FROM Users WHERE UserID = 2) OR ReceiverName = (SELECT Name FROM Users WHERE UserID = 2);

SELECT * FROM Couriers;

SELECT * FROM Payments WHERE CourierID = 3;

SELECT * FROM Couriers WHERE Status != 'Delivered';

SELECT * FROM Couriers WHERE DeliveryDate = '2023-04-01';

SELECT * FROM Couriers WHERE Status = 'In Transit';

SELECT CourierID, COUNT(*) AS TotalPackages
FROM Couriers
GROUP BY CourierID;

SELECT CourierID, AVG(DATEDIFF(dd,DeliveryDate,'05-01-2023')) AS AverageDeliveryTime
FROM Couriers
GROUP BY CourierID;

SELECT * FROM Couriers WHERE Weight BETWEEN 5.0 AND 10.0; -- Adjust the range as needed

SELECT * FROM Employees WHERE Name LIKE '%na%';

SELECT Couriers.*, Payments.Amount
FROM Couriers JOIN Payments ON Couriers.CourierID = Payments.CourierID
WHERE Payments.Amount > 20.0;

SELECT * FROM Couriers 


--Task-3

SELECT e.Name AS EmployeeName, COUNT(c.CourierID) AS TotalCouriersHandled
FROM Employees e
 JOIN Couriers c ON e.EmployeeID = c.CourierID
GROUP BY e.Name;


SELECT l.LocationName, SUM(p.Amount) AS TotalRevenue
FROM Locations l
LEFT JOIN Payments p ON l.LocationID = p.LocationID
GROUP BY l.LocationName;


SELECT l.LocationName, COUNT(c.CourierID) AS TotalCouriersDelivered
FROM Locations l
LEFT JOIN Couriers c ON l.LocationName = 'Kolkata'
GROUP BY l.LocationName;


SELECT c.CourierID, AVG(DATEDIFF(dd,c.DeliveryDate, '05-01-2023')) AS AvgDeliveryTime
FROM Couriers c
GROUP BY c.CourierID
ORDER BY AvgDeliveryTime DESC;


SELECT l.LocationName, SUM(p.Amount) AS TotalPayments
FROM Locations l
LEFT JOIN Payments p ON l.LocationID = p.LocationID
GROUP BY l.LocationName
HAVING SUM(p.Amount) < 20;


SELECT l.LocationName, SUM(p.Amount) AS TotalPayments
FROM Locations l
LEFT JOIN Payments p ON l.LocationID = p.LocationID
GROUP BY l.LocationName;


SELECT c.CourierID, c.ReceiverName, SUM(p.Amount) AS TotalPayments
FROM Couriers c
JOIN Payments p ON c.CourierID = p.CourierID
WHERE p.LocationID = 5
GROUP BY c.CourierID, c.ReceiverName
HAVING SUM(p.Amount) > 10;


SELECT c.CourierID, c.ReceiverName, SUM(p.Amount) AS TotalPayments
FROM Couriers c
JOIN Payments p ON c.CourierID = p.CourierID
WHERE p.PaymentDate > '2023-04-01'
GROUP BY c.CourierID, c.ReceiverName
HAVING SUM(p.Amount) > 10;


SELECT l.LocationName, SUM(p.Amount) AS TotalPayments
FROM Locations l
JOIN Payments p ON l.LocationID = p.LocationID
WHERE p.PaymentDate < '2023-05-01'
GROUP BY l.LocationName
HAVING SUM(p.Amount) > 20;



--Task-4

SELECT p.*, c.*
FROM Payments p
JOIN Couriers c ON p.CourierID = c.CourierID;


SELECT p.*, l.*
FROM Payments p
JOIN Locations l ON p.LocationID = l.LocationID;


SELECT p.*, c.*, l.*
FROM Payments p
JOIN Couriers c ON p.CourierID = c.CourierID
JOIN Locations l ON p.LocationID = l.LocationID;


SELECT p.*, c.*
FROM Payments p
LEFT JOIN Couriers c ON p.CourierID = c.CourierID;


SELECT c.CourierID, c.ReceiverName, SUM(p.Amount) AS TotalPayments
FROM Couriers c
LEFT JOIN Payments p ON c.CourierID = p.CourierID
GROUP BY c.CourierID, c.ReceiverName;


SELECT * FROM Payments
WHERE PaymentDate = '2023-03-25';


SELECT p.*, c.*
FROM Payments p
LEFT JOIN Couriers c ON p.CourierID = c.CourierID;


SELECT p.*, l.*
FROM Payments p
LEFT JOIN Locations l ON p.LocationID = l.LocationID;


SELECT c.CourierID, c.ReceiverName, SUM(p.Amount) AS TotalPayments
FROM Couriers c
LEFT JOIN Payments p ON c.CourierID = p.CourierID
GROUP BY c.CourierID, c.ReceiverName;


SELECT * FROM Payments
WHERE PaymentDate BETWEEN '2023-04-01' AND '2023-05-01';


SELECT u.*, c.*
FROM Users u JOIN Couriers c ON u.Name = c.SenderName OR u.Name=c.ReceiverName;


SELECT c.*, cs.* FROM Couriers c
FULL JOIN CourierServices cs ON c.CourierID = cs.ServiceID;


SELECT e.*, p.* FROM Employees e
CROSS JOIN Payments p;


SELECT u.*, cs.*
FROM Users u
CROSS JOIN CourierServices cs;


SELECT e.*, l.*
FROM Employees e
CROSS JOIN Locations l;


SELECT c.*, u.Name AS SenderName, u.Address AS SenderAddress
FROM Couriers c JOIN Users u ON u.Name = c.SenderName ;


SELECT c.*, u.Name AS ReceiverName, u.Address AS ReceiverAddress
FROM Couriers c JOIN Users u ON u.Name = c.ReceiverName;


SELECT c.*, cs.*
FROM Couriers c
LEFT JOIN CourierServices cs ON c.CourierID = cs.ServiceID;


SELECT e.*, COUNT(c.CourierID) AS TotalCouriersAssigned
FROM Employees e JOIN Couriers c ON e.EmployeeID = c.CourierID
GROUP BY e.EmployeeID;


SELECT LocationName, SUM(p.Amount) AS TotalPayments
FROM Locations l
LEFT JOIN Payments p ON l.LocationID = p.LocationID
GROUP BY l.LocationID;


SELECT c.*, u.Name AS SenderName
FROM Couriers c JOIN Users u ON u.Name = c.SenderName
WHERE c.SenderName IS NOT NULL;


SELECT e1.*, e2.* FROM Employees e1
JOIN Employees e2 ON e1.Role = e2.Role AND e1.EmployeeID <> e2.EmployeeID;


SELECT p.*, l.LocationName
FROM Payments p
LEFT JOIN Locations l ON p.LocationID = l.LocationID
WHERE p.LocationID IS NOT NULL;


SELECT c.*, l.LocationName AS SenderLocation
FROM Couriers c
LEFT JOIN Locations l ON c.CourierID = l.LocationID
WHERE c.CourierID IS NOT NULL;


SELECT e.*, COUNT(c.CourierID) AS TotalCouriersDelivered
FROM Employees e
LEFT JOIN Couriers c ON e.EmployeeID = c.CourierID
WHERE c.Status = 'Delivered'
GROUP BY e.EmployeeID;


SELECT c.*, p.Amount, cs.Cost AS ServiceCost
FROM Couriers c
LEFT JOIN Payments p ON c.CourierID = p.CourierID
LEFT JOIN CourierServices cs ON c.CourierID = cs.ServiceID
WHERE p.Amount > cs.Cost;



--Task-5
SELECT * FROM Couriers
WHERE Weight > (SELECT AVG(Weight) FROM Couriers);


SELECT Name FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);


SELECT SUM(Cost) AS TotalCost
FROM CourierServices
WHERE Cost < (SELECT MAX(Cost) FROM CourierServices);


SELECT c.*
FROM Couriers c
INNER JOIN Payments p ON c.CourierID = p.CourierID;


SELECT l.LocationName FROM Locations l
WHERE LocationID = (SELECT TOP 1 LocationID FROM Payments ORDER BY Amount DESC);


SELECT c.* FROM Couriers c
WHERE Weight > ALL (SELECT Weight FROM Couriers WHERE SenderName = 'Shweta Reddy');