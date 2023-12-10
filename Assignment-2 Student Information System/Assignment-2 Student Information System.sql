--Task-1
CREATE DATABASE SISDB;
USE SISDB;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    email VARCHAR(100),
    phone_number VARCHAR(15)
);

CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE, 
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    student_id INT,
    amount DECIMAL(10, 2),
    payment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE SET NULL
);

INSERT INTO Students VALUES
(1, 'David', 'Curran', '1990-01-15', 'davidcurran@email.com', '23514269842'),
(2, 'Steve', 'Smith', '1992-05-20', 'jane.smith@email.com', '9876543210'),
(3, 'Michael', 'Johnson', '1991-08-10', 'michael.johnson@email.com', '5551234567'),
(4, 'Sean', 'Williams', '1993-03-25', 'emily.williams@email.com', '1112223333'),
(5, 'Daniel', 'Vittori', '1989-11-02', 'daniel.brown@email.com', '9998887777'),
(6, 'Olivia', 'Miller', '1995-04-12', 'olivia.miller@email.com', '3334445555'),
(7, 'Ethan', 'Davis', '1994-09-18', 'ethan.davis@email.com', '6667778888'),
(8, 'Ava', 'Jones', '1992-06-30', 'ava.jones@email.com', '4445556666'),
(9, 'Logan', 'Paul', '1990-12-05', 'logan.anderson@email.com', '2223334444'),
(10, 'Sophia', 'Moore', '1993-02-28', 'sophia.moore@email.com', '8889990000');

INSERT INTO Teacher VALUES
(1, 'Professor', 'Smith', 'prof.smith@email.com'),
(2, 'Dr.', 'Johnson', 'dr.johnson@email.com'),
(3, 'Ms.', 'Williams', 'ms.williams@email.com'),
(4, 'Mr.', 'Davis', 'mr.davis@email.com'),
(5, 'Professor', 'Moore', 'prof.moore@email.com'),
(6, 'Dr.', 'Anderson', 'dr.anderson@email.com'),
(7, 'Mrs.', 'Brown', 'mrs.brown@email.com'),
(8, 'Ms.', 'Miller', 'ms.miller@email.com'),
(9, 'Mr.', 'Jones', 'mr.jones@email.com'),
(10, 'Mrs.', 'Doe', 'mrs.doe@email.com');

INSERT INTO Courses VALUES
(101, 'Introduction to Computer Science', 3, 1),
(102, 'Mathematics for Engineers', 4, 2),
(103, 'History of Art', 3, 3),
(104, 'Physics for Beginners', 4, 1),
(105, 'Business Ethics', 3, 2),
(106, 'Literature and Society', 3, 3),
(107, 'Chemistry Fundamentals', 4, 2),
(108, 'Psychology 101', 3, 3),
(109, 'Data Structures', 4, 1),
(110, 'Introduction to Marketing', 3, 2);

INSERT INTO Enrollments VALUES
(1, 1, 101, '2023-01-01'),
(2, 2, 102, '2023-04-02'),
(3, 3, 103, '2023-03-03'),
(4, 4, 104, '2023-02-04'),
(5, 5, 105, '2023-10-05'),
(6, 6, 106, '2023-09-06'),
(7, 7, 107, '2023-02-07'),
(8, 8, 108, '2023-04-08'),
(9, 9, 109, '2023-01-09'),
(10, 10, 110, '2023-03-10'),
(11, 1, 107, '2023-08-05'),
(12, 8, 104, '2023-05-12');

INSERT INTO Payments VALUES
(1, 1, 500.00, '2023-01-01'),
(2, 2, 750.00, '2023-04-02'),
(3, 3, 600.00, '2023-03-03'),
(4, 4, 800.00, '2023-02-04'),
(5, 5, 550.00, '2023-10-05'),
(6, 6, 700.00, '2023-09-06'),
(7, 7, 850.00, '2023-02-07'),
(8, 8, 600.00, '2023-04-08'),
(9, 9, 700.00, '2023-01-09'),
(10, 10, 500.00, '2023-03-10'),
(11, 1, 500.00, '2023-08-01'),
(12, 8, 600.00, '2023-05-12');



--TASK-2

INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number)
VALUES (11, 'John', 'Doe', '1995-08-15', 'john.doe@example.com', '1234567890');

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES (13,7, 109, '2023-12-10');

UPDATE Teacher
SET email = 'new.email@example.com'
WHERE teacher_id = 1;

DELETE FROM Enrollments
WHERE student_id = 1 AND course_id = 101;

UPDATE Courses
SET teacher_id = 2
WHERE course_id = 105;

DELETE FROM Students
WHERE student_id = 4;  --All the enrollments records will automatically be deleted because we're using ON DELETE CASCADE in enrollments table

UPDATE Payments
SET amount = 1500.00
WHERE payment_id = 1;



--Task-3

SELECT s.student_id, s.first_name, s.last_name, SUM(p.amount) AS total_payments
FROM Students s
INNER JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.student_id, s.first_name, s.last_name;

SELECT c.course_id, c.course_name, COUNT(e.student_id) AS enrolled_students_count
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

SELECT s.first_name, s.last_name
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;

SELECT s.first_name, s.last_name, c.course_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;

SELECT t.first_name, t.last_name, c.course_name
FROM Teacher t
JOIN Courses c ON t.teacher_id = c.teacher_id;

SELECT s.first_name, s.last_name, e.enrollment_date
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id;

SELECT s.first_name, s.last_name
FROM Students s
LEFT JOIN Payments p ON s.student_id = p.student_id
WHERE p.payment_id IS NULL;

SELECT c.course_id, c.course_name
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
WHERE e.enrollment_id IS NULL;

SELECT e1.student_id, count(e1.student_id) AS no_of_enrollments
FROM Enrollments e1
JOIN Enrollments e2 ON e1.student_id = e2.student_id AND e1.enrollment_id <> e2.enrollment_id
GROUP BY e1.student_id HAVING COUNT(DISTINCT e2.course_id) > 1;

SELECT t.teacher_id, t.first_name, t.last_name
FROM Teacher t
LEFT JOIN Courses c ON t.teacher_id = c.teacher_id
WHERE c.course_id IS NULL;



--Task-4

SELECT course_id, AVG(student_count) AS avg_students_enrolled
FROM (
    SELECT course_id, COUNT(student_id) AS student_count
    FROM Enrollments
    GROUP BY course_id
) AS course_enrollment_counts
GROUP BY course_id;

SELECT student_id, first_name, last_name
FROM Students
WHERE student_id = (
    SELECT TOP 1 student_id
    FROM Payments
    ORDER BY amount DESC
);

--Fetches top 5 courses with maximun enrollments
SELECT TOP 5 course_id, course_name, enrollment_count
FROM (
    SELECT C.course_id, C.course_name, COUNT(E.student_id) AS enrollment_count
    FROM Courses C
    JOIN Enrollments E ON C.course_id = E.course_id
    GROUP BY C.course_id, C.course_name
) AS course_enrollment_counts
ORDER BY enrollment_count DESC;

SELECT teacher_id, SUM(amount) AS total_payments
FROM (
    SELECT T.teacher_id, P.amount
    FROM Teacher T
    JOIN Courses C ON T.teacher_id = C.teacher_id
    JOIN Enrollments E ON C.course_id = E.course_id
    JOIN Payments P ON E.student_id = P.student_id
) AS teacher_payments
GROUP BY teacher_id;


--No data because there's no student who has enrolled in all the courses
SELECT student_id, first_name, last_name
FROM Students
WHERE (SELECT COUNT(DISTINCT course_id) FROM Courses) = (
    SELECT COUNT(DISTINCT course_id) 
    FROM Enrollments 
    WHERE Students.student_id = Enrollments.student_id
);

SELECT teacher_id, first_name, last_name
FROM Teacher
WHERE teacher_id NOT IN (
    SELECT DISTINCT teacher_id FROM Courses
);

SELECT AVG(age) AS average_age
FROM (
    SELECT student_id, DATEDIFF(YEAR, date_of_birth, GETDATE()) AS age
    FROM Students
) AS student_age;

SELECT course_id, course_name
FROM Courses
WHERE course_id NOT IN (
    SELECT DISTINCT course_id FROM Enrollments
);

SELECT E.student_id, E.course_id, ISNULL(SUM(P.amount), 0) AS total_payments
FROM Enrollments E
LEFT JOIN Payments P ON E.student_id = P.student_id
WHERE E.student_id IN (SELECT DISTINCT student_id FROM Enrollments)
GROUP BY E.student_id, E.course_id;

SELECT student_id, first_name, last_name
FROM Students
WHERE student_id IN (
    SELECT student_id
    FROM Payments
    GROUP BY student_id
    HAVING COUNT(payment_id) > 1
);

SELECT S.student_id, S.first_name, S.last_name, SUM(P.amount) AS total_payments
FROM Students S
LEFT JOIN Payments P ON S.student_id = P.student_id
GROUP BY S.student_id, S.first_name, S.last_name;

SELECT C.course_id, C.course_name, COUNT(E.student_id) AS enrolled_students_count
FROM Courses C
LEFT JOIN Enrollments E ON C.course_id = E.course_id
GROUP BY C.course_id, C.course_name;

SELECT AVG(P.amount) AS average_payment_amount
FROM Payments P
JOIN Students S ON P.student_id = S.student_id;