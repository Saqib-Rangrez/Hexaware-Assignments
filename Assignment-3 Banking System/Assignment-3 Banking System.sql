--TASK 1
CREATE DATABASE HMBank;
USE HMBank;


CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    DOB DATE,
    email VARCHAR(100),
    phone_number VARCHAR(15),
    address VARCHAR(255)
);

CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE SET NULL
);

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_type VARCHAR(20),
    amount DECIMAL(10, 2),
    transaction_date DATE,
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id) ON DELETE SET NULL
);


--TASK 2

INSERT INTO Customers VALUES
(1, 'Rahul', 'Sharma', '1990-05-15', 'rahul.sharma@email.com', '9876543210', 'Delhi'),
(2, 'Priya', 'Patel', '1985-08-22', 'priya.patel@email.com', '8765432109', 'Mumbai'),
(3, 'Amit', 'Singh', '1988-04-12', 'amit.singh@email.com', '7654321098', 'Kolkata'),
(4, 'Deepa', 'Shah', '1995-09-28', 'deepa.shah@email.com', '6543210987', 'Chennai'),
(5, 'Rajesh', 'Kumar', '1977-12-05', 'rajesh.kumar@email.com', '5432109876', 'Hyderabad'),
(6, 'Anita', 'Gupta', '1982-03-20', 'anita.gupta@email.com', '4321098765', 'Bangalore'),
(7, 'Suresh', 'Verma', '1992-06-18', 'suresh.verma@email.com', '3210987654', 'Mumbai'),
(8, 'Preeti', 'Agarwal', '1980-11-15', 'preeti.agarwal@email.com', '2109876543', 'Delhi'),
(9, 'Vikram', 'Rajput', '1993-02-25', 'vikram.rajput@email.com', '1098765432', 'Chandigarh'),
(10, 'Neha', 'Sharma', '1986-07-30', 'neha.sharma@email.com', '9876543210', 'Jaipur');


INSERT INTO Accounts VALUES
(101, 1, 'savings', 5000.00),
(102, 10, 'zero_balance', 10000.00),
(103, 2, 'savings', 8000.00),
(104, 3, 'current', 12000.00),
(105, 4, 'savings', 6000.00),
(106, 5, 'zero_balance', 15000.00),
(107, 6, 'savings', 7000.00),
(108, 7, 'current', 18000.00),
(109, 8, 'zero_balance', 9000.00),
(110, 9, 'current', 20000.00);


INSERT INTO Transactions VALUES
(1001, 101, 'deposit', 2000.00, '2023-01-10'),
(1002, 101, 'withdrawal', 1000.00, '2023-02-15'),
(1003, 107, 'deposit', 3000.00, '2023-03-20'),
(1004, 102, 'withdrawal', 1500.00, '2023-04-25'),
(1005, 104, 'deposit', 2500.00, '2023-05-10'),
(1006, 103, 'withdrawal', 1200.00, '2023-06-15'),
(1007, 104, 'deposit', 4000.00, '2023-07-05'),
(1008, 109, 'withdrawal', 2000.00, '2023-08-18'),
(1009, 105, 'deposit', 3500.00, '2023-09-22'),
(1010, 105, 'withdrawal', 1800.00, '2023-10-30');


SELECT first_name, last_name, account_type, email FROM Customers, Accounts 
WHERE Customers.customer_id = Accounts.customer_id;


SELECT * FROM Transactions
JOIN Accounts ON Transactions.account_id = Accounts.account_id
JOIN Customers ON Accounts.customer_id = Customers.customer_id;


UPDATE Accounts SET balance = balance + 700 WHERE account_id = 102;


SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM Customers;


DELETE FROM Accounts WHERE balance = 0 AND account_type = 'savings';


SELECT * FROM Customers WHERE address = 'Mumbai';


SELECT balance FROM Accounts WHERE account_id = 102;


SELECT * FROM Accounts WHERE account_type = 'current' AND balance > 1000;


SELECT * FROM Transactions WHERE account_id = 101;


SELECT account_id, balance * 0.05 AS interest_accrued FROM Accounts WHERE account_type = 'savings';


SELECT * FROM Accounts WHERE balance < 500;


SELECT * FROM Customers WHERE address�!=�'Delhi';


--TASK 3

SELECT AVG(balance) AS average_balance
FROM Accounts;


SELECT TOP 10 *
FROM accounts
ORDER BY balance DESC;


SELECT c.customer_id, c.first_name, SUM(t.amount) AS total_deposits
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
JOIN transactions t ON a.account_id = t.account_id
WHERE t.transaction_type = 'deposit' AND CONVERT(DATE, t.transaction_date) = '2023-05-10'
GROUP BY c.customer_id, c.first_name;


SELECT TOP 1 *FROM Customers
ORDER BY DOB ASC;


SELECT TOP 1 *FROM Customers
ORDER BY DOB DESC;


SELECT
    t.transaction_id,
    t.transaction_date,
    t.amount,
    t.transaction_type,
    a.account_type
FROM transactions t
JOIN accounts a ON t.account_id = a.account_id;


SELECT
    c.customer_id,
    c.first_name,
    a.account_id,
    a.account_type,
    a.balance
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id;


SELECT
    t.transaction_id,
    t.transaction_date,
    t.amount,
    t.transaction_type,
    c.customer_id,
    c.first_name,
    a.account_id,
    a.account_type,
    a.balance
FROM transactions t
JOIN accounts a ON t.account_id = a.account_id
JOIN customers c ON a.customer_id = c.customer_id
WHERE a.account_id = '104';


SELECT
    c.customer_id,
    c.first_name,
    COUNT(a.account_id) AS number_of_accounts
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.first_name
HAVING COUNT(a.account_id) > 1;


SELECT
    t.account_id,
    SUM(CASE WHEN t.transaction_type = 'Deposit' THEN t.amount ELSE -t.amount END) AS difference_amount
FROM transactions t
GROUP BY t.account_id;


SELECT
    t.account_id,
    AVG(t.amount) AS average_daily_balance
FROM transactions t
WHERE t.transaction_date BETWEEN '2023-01-10' AND '2023-10-30'
GROUP BY t.account_id;


SELECT
    a.account_type,
    SUM(t.amount) AS total_balance
FROM transactions t
JOIN accounts a ON t.account_id = a.account_id
GROUP BY a.account_type;


SELECT
    a.account_id,
    COUNT(t.transaction_id) AS transaction_count
FROM accounts a
JOIN transactions t ON a.account_id = t.account_id
GROUP BY a.account_id
ORDER BY transaction_count DESC;


SELECT
    c.customer_id,
    c.first_name,
    a.account_type,
    SUM(t.amount) AS aggregate_balance
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
JOIN transactions t ON a.account_id = t.account_id
GROUP BY c.customer_id, c.first_name, a.account_type
ORDER BY aggregate_balance DESC;


WITH DuplicateTransactions AS (
    SELECT amount, transaction_date, account_id, COUNT(*) AS num_duplicates
    FROM Transactions
    GROUP BY amount, transaction_date, account_id
    HAVING COUNT(*) > 1
)
SELECT *
FROM DuplicateTransactions;


--Task 4

SELECT TOP 1 c.customer_id, c.first_name, c.last_name, MAX(a.balance) AS highest_balance
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY highest_balance DESC;


SELECT sub.customer_id, AVG(sub.avg_balance) AS average_balance
FROM (
    SELECT c.customer_id, AVG(a.balance) AS avg_balance
    FROM Customers c
    JOIN Accounts a ON c.customer_id = a.customer_id
    GROUP BY c.customer_id
    HAVING COUNT(a.account_id) > 1
) AS sub GROUP BY sub.customer_id;


SELECT a.*, t.*
FROM Accounts a
JOIN Transactions t ON a.account_id = t.account_id
WHERE t.amount > (SELECT AVG(amount) FROM Transactions);


SELECT
    c.customer_id,
    c.first_name
FROM customers c
LEFT JOIN Accounts a ON c.customer_id = a.customer_id
LEFT JOIN Transactions t ON a.account_id = t.account_id
WHERE t.transaction_id IS NULL;


SELECT
    a.account_id,
    a.account_type,
    CASE WHEN SUM(a.balance) IS NULL THEN 0 ELSE SUM(a.balance) END AS total_balance
FROM Accounts a
LEFT JOIN transactions t ON a.account_id = t.account_id
WHERE t.transaction_id IS NULL
GROUP BY a.account_id, a.account_type;


SELECT *
FROM transactions 
WHERE amount = (SELECT MIN(amount) FROM transactions);


SELECT
    customer_id,
    first_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM accounts
    GROUP BY customer_id
    HAVING COUNT(DISTINCT account_type) > 1
);


SELECT account_type,
       COUNT(*) AS num_accounts,
       ROUND((COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Accounts)), 2) AS percentage
FROM Accounts
GROUP BY account_type;


SELECT * FROM Transactions
WHERE account_id IN (SELECT account_id FROM Accounts 
WHERE customer_id = 1
);

SELECT account_type,
       (SELECT SUM(balance) FROM Accounts A WHERE A.account_type = Accounts.account_type) AS total_balance
FROM Accounts
GROUP BY account_type;