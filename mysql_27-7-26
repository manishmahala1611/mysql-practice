-- ============================================================
-- 1. DATABASE CREATION & SELECTION
-- ============================================================
CREATE DATABASE IF NOT EXISTS BrandDB;
USE BrandDB;

-- ============================================================
-- 2. TABLE CREATION
-- ============================================================
-- Creating Department Table
CREATE TABLE Department (
    DeptID INT PRIMARY KEY, 
    DeptName VARCHAR(30)
);

-- Creating Student Table
CREATE TABLE Student (
    StudID INT PRIMARY KEY, 
    Name VARCHAR(50), 
    DeptID INT
);

-- ============================================================
-- 3. DATA INSERTION & VIEW TABLES
-- ============================================================
-- Insert data into Department Table
INSERT INTO Department (DeptID, DeptName) VALUES
(101, 'CSE'),
(102, 'IT'),
(105, 'Finance'),
(106, 'ECE');

-- Insert data into Student Table
INSERT INTO Student (StudID, Name, DeptID) VALUES
(1, 'Manish', 101),
(2, 'Piyush', 102),
(3, 'Dhanuke', 103),
(4, 'Oman', 104),
(6, 'Rahul', 106),
(7, 'Ankit', 101);

-- Verify Department Table Content
SELECT * FROM Department;
/* 
OUTPUT:
+--------+----------+
| DeptID | DeptName |
+--------+----------+
|    101 | CSE      |
|    102 | IT       |
|    105 | Finance  |
|    106 | ECE      |
+--------+----------+
*/

-- Verify Student Table Content
SELECT * FROM Student;
/* 
OUTPUT:
+--------+-----------+--------+
| StudID | Name      | DeptID |
+--------+-----------+--------+
|      1 | Manish    |    101 |
|      2 | Piyush    |    102 |
|      3 | Dhanuke   |    103 |
|      4 | Oman      |    104 |
|      6 | Rahul     |    106 |
|      7 | Ankit     |    101 |
+--------+-----------+--------+
*/

-- ============================================================
-- 4. SQL JOINS IMPLEMENTATION & OUTPUTS
-- ============================================================

-- A. INNER JOIN (Dono tables ke matching records)
SELECT Student.Name, Department.DeptName
FROM Student
INNER JOIN Department 
ON Student.DeptID = Department.DeptID;
/* 
OUTPUT:
+--------+----------+
| Name   | DeptName |
+--------+----------+
| Manish | CSE      |
| Piyush | IT       |
| Rahul  | ECE      |
| Ankit  | CSE      |
+--------+----------+
*/

-- B. LEFT JOIN (Student table ke saare records + matching departments)
SELECT Student.Name, Department.DeptName 
FROM Student 
LEFT JOIN Department 
ON Student.DeptID = Department.DeptID;
/* 
OUTPUT:
+---------+----------+
| Name    | DeptName |
+---------+----------+
| Manish  | CSE      |
| Piyush  | IT       |
| Dhanuke | NULL     |
| Oman    | NULL     |
| Rahul   | ECE      |
| Ankit   | CSE      |
+---------+----------+
*/

-- C. RIGHT JOIN (Department table ke saare records + matching students)
SELECT Student.Name, Department.DeptName 
FROM Student 
RIGHT JOIN Department 
ON Student.DeptID = Department.DeptID;
/* 
OUTPUT:
+--------+----------+
| Name   | DeptName |
+--------+----------+
| Manish | CSE      |
| Ankit  | CSE      |
| Piyush | IT       |
| NULL   | Finance  |
| Rahul  | ECE      |
+--------+----------+
*/

-- D. FULL OUTER JOIN (LEFT JOIN aur RIGHT JOIN ka UNION)
SELECT Student.Name, Department.DeptName 
FROM Student 
LEFT JOIN Department ON Student.DeptID = Department.DeptID
UNION 
SELECT Student.Name, Department.DeptName 
FROM Student 
RIGHT JOIN Department ON Student.DeptID = Department.DeptID;
/* 
OUTPUT:
+---------+----------+
| Name    | DeptName |
+---------+----------+
| Manish  | CSE      |
| Piyush  | IT       |
| Dhanuke | NULL     |
| Oman    | NULL     |
| Rahul   | ECE      |
| Ankit   | CSE      |
| NULL    | Finance  |
+---------+----------+
*/

-- E. SELF JOIN (Same department wale students ki pairing)
SELECT S1.Name AS Student1, S2.Name AS Student2, S1.DeptID 
FROM Student S1 
INNER JOIN Student S2 
ON S1.DeptID = S2.DeptID AND S1.StudID < S2.StudID;
/* 
OUTPUT:
+----------+----------+--------+
| Student1 | Student2 | DeptID |
+----------+----------+--------+
| Manish   | Ankit    |    101 |
+----------+----------+--------+
*/
