--Task-1
CREATE DATABASE TicketBookingSystem;
USE TicketBookingSystem;



CREATE TABLE Venu (
    venue_id INT PRIMARY KEY,
    venue_name VARCHAR(255),
    address VARCHAR(255)
);


CREATE TABLE Event (
    event_id INT PRIMARY KEY,
    event_name VARCHAR(255),
    event_date DATE,
    event_time TIME,
    venue_id INT,
    total_seats INT,
    available_seats INT,
    ticket_price DECIMAL(10, 2),
    event_type VARCHAR(50),
    booking_id INT
);


CREATE TABLE Booking (
    booking_id INT PRIMARY KEY,
    customer_id INT,
    event_id INT,
    num_tickets INT,
    total_cost DECIMAL(10, 2),
    booking_date DATE
);


CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255),
    email VARCHAR(255),
    phone_number VARCHAR(15),
    booking_id INT
);


-- Add Foreign Key Constraints using ALTER TABLE for Refrential Integerity
ALTER TABLE Customer
ADD FOREIGN KEY (booking_id) REFERENCES Booking(booking_id);

ALTER TABLE Booking
ADD FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (event_id) REFERENCES Event(event_id);

ALTER TABLE Event
ADD FOREIGN KEY (venue_id) REFERENCES Venu(venue_id),
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id);

-- Add CHECK constraint for event_type
ALTER TABLE Event
ADD CHECK (event_type IN ('Movie', 'Sports', 'Concert'));


INSERT INTO Venu (venue_id, venue_name, address) VALUES
(1, 'Grand Theater', '123 Main Street, Cityville'),
(2, 'City Arena', '456 Center Avenue, Townsville'),
(3, 'Sports Stadium', '789 Stadium Road, Sportstown'),
(4, 'Film Palace', '101 Movie Lane, Cinemaville'),
(5, 'Concert Hall', '202 Melody Street, Harmonytown'),
(6, 'Community Center', '303 Social Square, Gatherburg'),
(7, 'Live Lounge', '404 Entertainment Avenue, Showville'),
(8, 'Cinematic Complex', '505 Film Street, Filmington'),
(9, 'Soccer Park', '606 Goal Street, Kicksville'),
(10, 'Music Dome', '707 Harmony Road, Concertburg');


INSERT INTO Event (event_id, event_name, event_date, event_time, venue_id, total_seats, available_seats, ticket_price, event_type, booking_id) VALUES
(1, 'Movie Night: Inception', '2023-01-15', '18:00:00', 1, 150, 120, 2220.00, 'Movie', NULL),
(2, 'Concert: Acoustic Vibes', '2023-02-20', '20:00:00', 2, 300, 250, 1235.00, 'Concert', NULL),
(3, 'Soccer Match: City Rivals', '2023-03-25', '19:30:00', 3, 200, 180, 1525.00, 'Sports', NULL),
(4, 'Movie Night: The Great Gatsby', '2023-04-10', '21:00:00', 4, 120, 80, 1555.00, 'Movie', NULL),
(5, 'Concert: Pop Explosion', '2023-05-05', '17:45:00', 5, 250, 200, 3330.00, 'Concert', NULL),
(6, 'Live Music: Jazz Evening', '2023-06-12', '19:00:00', 6, 300, 280, 1440.00, 'Concert', NULL),
(7, 'Basketball Game: Finals', '2023-07-08', '18:30:00', 7, 350, 300, 1330.00, 'Sports', NULL),
(8, 'Movie Night: Casablanca', '2023-08-20', '20:15:00', 8, 150, 120, 2220.00, 'Movie', NULL),
(9, 'Soccer Match: International Clash', '2023-09-18', '19:45:00', 9, 200, 180, 1225.00, 'Sports', NULL),
(10, 'Concert: Rock Revolution', '2023-10-30', '22:00:00', 10, 250, 200, 3310.00, 'Concert', NULL);


INSERT INTO Customer (customer_id, customer_name, email, phone_number, booking_id) VALUES
(1, 'John Doe', 'john.doe@email.com', '555-1234', NULL),
(2, 'Jane Smith', 'jane.smith@email.com', '555-5678', NULL),
(3, 'Robert Johnson', 'robert.j@email.com', '555-9012', NULL),
(4, 'Samantha Brown', 'samantha.b@email.com', '555-3456', NULL),
(5, 'Chris Miller', 'chris.m@email.com', '555-7890', NULL),
(6, 'Emma White', 'emma.w@email.com', '555-2345', NULL),
(7, 'Michael Davis', 'michael.d@email.com', '555-6789', NULL),
(8, 'Olivia Taylor', 'olivia.t@email.com', '555-1234', NULL),
(9, 'Daniel Wilson', 'daniel.w@email.com', '555-5678', NULL),
(10, 'Sophia Adams', 'sophia.a@email.com', '555-9012', NULL);


INSERT INTO Booking (booking_id, customer_id, event_id, num_tickets, total_cost, booking_date) VALUES
(1, 1, 1, 2, 4440.00, '2023-01-15'),
(2, 2, 2, 3, 3705.00, '2023-02-20'),
(3, 3, 3, 1, 1525.00, '2023-03-25'),
(4, 4, 4, 4, 6220.00, '2023-04-10'),
(5, 5, 5, 2, 6660.00, '2023-05-05'),
(6, 6, 6, 3, 4320.00, '2023-06-12'),
(7, 7, 7, 5, 6650.00, '2023-07-08'),
(8, 8, 8, 1, 2220.00, '2023-08-20'),
(9, 9, 9, 2, 2450.00, '2023-09-18'),
(10, 10, 10, 3, 9930.00, '2023-10-30');


UPDATE Event SET booking_id = 1 WHERE event_id = 1;
UPDATE Event SET booking_id = 2 WHERE event_id = 2;
UPDATE Event SET booking_id = 3 WHERE event_id = 3;
UPDATE Event SET booking_id = 4 WHERE event_id = 4;
UPDATE Event SET booking_id = 5 WHERE event_id = 5;
UPDATE Event SET booking_id = 6 WHERE event_id = 6;
UPDATE Event SET booking_id = 7 WHERE event_id = 7;
UPDATE Event SET booking_id = 8 WHERE event_id = 8;
UPDATE Event SET booking_id = 9 WHERE event_id = 9;
UPDATE Event SET booking_id = 10 WHERE event_id = 10;


UPDATE Customer SET booking_id = 1 WHERE customer_id = 1;
UPDATE Customer SET booking_id = 2 WHERE customer_id = 2;
UPDATE Customer SET booking_id = 3 WHERE customer_id = 3;
UPDATE Customer SET booking_id = 4 WHERE customer_id = 4;
UPDATE Customer SET booking_id = 5 WHERE customer_id = 5;
UPDATE Customer SET booking_id = 6 WHERE customer_id = 6;
UPDATE Customer SET booking_id = 7 WHERE customer_id = 7;
UPDATE Customer SET booking_id = 8 WHERE customer_id = 8;
UPDATE Customer SET booking_id = 9 WHERE customer_id = 9;
UPDATE Customer SET booking_id = 10 WHERE customer_id = 10;


--Task-2

SELECT * FROM Event;

SELECT * FROM Event WHERE available_seats > 0;

SELECT * FROM Event WHERE event_name LIKE '%cup%';

SELECT * FROM Event WHERE ticket_price BETWEEN 1000 AND 2500;

SELECT * FROM Event WHERE event_date BETWEEN '2023-01-01' AND '2023-05-31';

SELECT * FROM Event WHERE available_seats > 0 AND event_name LIKE '%Concert%';

SELECT * FROM Customer ORDER BY customer_id OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;

SELECT * FROM Booking WHERE num_tickets > 4;

SELECT * FROM Customer WHERE phone_number LIKE '%000';

SELECT * FROM Event WHERE total_seats > 15000 ORDER BY total_seats;

SELECT * FROM Event WHERE NOT event_name LIKE '[x-z]%';


--Task-3


SELECT event_name, AVG(ticket_price) AS average_ticket_price
FROM Event GROUP BY event_name;


SELECT SUM(total_cost) AS total_revenue FROM Booking;


SELECT TOP 1 event_id, SUM(num_tickets) AS total_tickets_sold FROM Booking
GROUP BY event_id ORDER BY total_tickets_sold DESC;


SELECT event_id, SUM(num_tickets) AS total_tickets_sold
FROM Booking GROUP BY event_id;


SELECT event_id, event_name FROM Event
WHERE event_id NOT IN (SELECT DISTINCT event_id FROM Booking);


SELECT TOP 1 c.customer_id, c.customer_name, COUNT(b.booking_id) AS total_tickets_booked
FROM Customer c JOIN Booking b ON c.customer_id = b.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_tickets_booked DESC;


SELECT MONTH(booking_date) AS month, event_id, SUM(num_tickets) AS total_tickets_sold
FROM Booking GROUP BY MONTH(booking_date), event_id;


SELECT v.venue_id, v.venue_name, AVG(e.ticket_price) AS average_ticket_price
FROM Venu v
JOIN Event e ON v.venue_id = e.venue_id
GROUP BY v.venue_id, v.venue_name;


SELECT event_type, SUM(num_tickets) AS total_tickets_sold
FROM Event
JOIN Booking ON Event.event_id = Booking.event_id
GROUP BY event_type;


SELECT YEAR(booking_date) AS year, SUM(total_cost) AS total_revenue
FROM Booking
GROUP BY YEAR(booking_date);


SELECT c.customer_id, c.customer_name
FROM Customer c
JOIN Booking b ON c.customer_id = b.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(DISTINCT b.event_id) > 1;


SELECT c.customer_id, c.customer_name, SUM(total_cost) AS total_revenue
FROM Customer c
JOIN Booking b ON c.customer_id = b.customer_id
GROUP BY c.customer_id, c.customer_name;


SELECT v.venue_id, v.venue_name, e.event_type, AVG(e.ticket_price) AS average_ticket_price
FROM Venu v
JOIN Event e ON v.venue_id = e.venue_id
GROUP BY v.venue_id, v.venue_name, e.event_type;


INSERT INTO Booking (booking_id, customer_id, event_id, num_tickets, total_cost, booking_date) VALUES
(11, 1, 1, 2, 4440.00, '2023-11-15'),
(12, 2, 2, 3, 3705.00, '2023-12-20');


SELECT c.customer_id, c.customer_name, COUNT(b.booking_id) AS total_tickets_purchased
FROM Customer c
JOIN Booking b ON c.customer_id = b.customer_id
WHERE b.booking_date >= DATEADD(DAY, -30, GETDATE())
GROUP BY c.customer_id, c.customer_name;



--Task-4

SELECT venue_id, venue_name, (
    SELECT AVG(ticket_price)
    FROM Event
    WHERE venue_id = v.venue_id
) AS average_ticket_price
FROM Venu v;


SELECT event_id, event_name FROM Event
WHERE (
    SELECT SUM(num_tickets)
    FROM Booking
    WHERE Booking.event_id = Event.event_id
) > 0.5 * total_seats;


SELECT event_id, event_name, (
    SELECT SUM(num_tickets)
    FROM Booking
    WHERE Booking.event_id = Event.event_id
) AS total_tickets_sold
FROM Event;


SELECT customer_id, customer_name
FROM Customer c
WHERE NOT EXISTS (
    SELECT 1
    FROM Booking b
    WHERE b.customer_id = c.customer_id
);


SELECT event_id, event_name
FROM Event
WHERE event_id NOT IN (
    SELECT DISTINCT event_id
    FROM Booking
);


SELECT event_type, SUM(total_tickets_sold) AS total_tickets_sold
FROM (
    SELECT event_type, event_id, (
        SELECT SUM(num_tickets)
        FROM Booking
        WHERE Booking.event_id = Event.event_id
    ) AS total_tickets_sold
    FROM Event
) AS Subquery
GROUP BY event_type;


SELECT event_id, event_name, ticket_price
FROM Event
WHERE ticket_price > (
    SELECT AVG(ticket_price)
    FROM Event
);


SELECT customer_id, customer_name, (
    SELECT SUM(total_cost)
    FROM Booking
    WHERE Booking.customer_id = c.customer_id
) AS total_revenue
FROM Customer c;


SELECT customer_id, customer_name
FROM Customer
WHERE EXISTS (
    SELECT 1
    FROM Booking
    JOIN Event ON Booking.event_id = Event.event_id
    WHERE Event.venue_id = 1
    AND Booking.customer_id = Customer.customer_id
);


SELECT event_type, SUM(total_tickets_sold) AS total_tickets_sold
FROM (
    SELECT event_type, (
        SELECT SUM(num_tickets)
        FROM Booking
        WHERE Booking.event_id = Event.event_id
    ) AS total_tickets_sold
    FROM Event
) AS Subquery
GROUP BY event_type;


SELECT customer_id, customer_name
FROM Customer c
WHERE EXISTS (
    SELECT *
    FROM Booking b
    WHERE b.customer_id = c.customer_id
    AND FORMAT(b.booking_date, 'yyyy-MM') = '2023-01'  -- Replace with the desired month
);


SELECT venue_id, venue_name, (
    SELECT AVG(ticket_price)
    FROM Event
    WHERE venue_id = v.venue_id
) AS average_ticket_price
FROM Venu v;



























