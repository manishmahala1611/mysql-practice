-- =======================================================
-- SQL JOINS PRACTICE SCRIPT & OUTPUTS
-- =======================================================

-- -------------------------------------------------------
-- STEP 1: DATABASE & TABLE CREATION
-- -------------------------------------------------------
USE BrandDB;

CREATE TABLE Student (
    StudID INT PRIMARY KEY,
    Name VARCHAR(50),
    DeptID INT
);

CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(30)
);

/* 
OUTPUT:
mysql> USE BrandDB;
Database changed

mysql> CREATE TABLE Student (StudID INT Primary key, Name VARCHAR(50) , DeptID INT);
Query OK, 0 rows affected (0.16 sec)

mysql> CREATE TABLE Department (DeptID INT Primary Key, DeptName VARCHAR(30));
Query OK, 0 rows affected (0.02 sec)
*/


-- -------------------------------------------------------
-- STEP 2: INITIAL DATA INSERTION & VERIFICATION
-- -------------------------------------------------------
INSERT INTO Student (StudID, Name, DeptID)
VALUES 
    (1, 'Manish', 101),
    (2, 'Piyush', 102);

INSERT INTO Department (DeptID, DeptName)
VALUES 
    (101, 'CSE'),
    (102, 'IT');

SELECT * FROM Department;
SELECT * FROM Student;

/* 
OUTPUT:
mysql> SELECT * FROM Department;
+--------+----------+
| DeptID | DeptName |
+--------+----------+
|    101 | CSE      |
|    102 | IT       |
+--------+----------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM Student;
+--------+--------+--------+
| StudID | Name   | DeptID |
+--------+--------+--------+
|      1 | Manish |    101 |
|      2 | Piyush |    102 |
+--------+--------+--------+
2 rows in set (0.00 sec)
*/


-- -------------------------------------------------------
-- STEP 3: INNER JOIN
-- -------------------------------------------------------
SELECT Student.Name, Department.DeptName
FROM Student
INNER JOIN Department ON Student.DeptID = Department.DeptID;

/* 
OUTPUT:
+--------+----------+
| Name   | DeptName |
+--------+----------+
| Manish | CSE      |
| Piyush | IT       |
+--------+----------+
2 rows in set (0.00 sec)
*/


-- -------------------------------------------------------
-- STEP 4: INSERTING ADDITIONAL DATA FOR OUTER JOINS
-- -------------------------------------------------------
INSERT INTO Student (StudID, Name, DeptID)
VALUES 
    (3, 'Dhanuke', 103),
    (4, 'Oman', 104);

INSERT INTO Department (DeptID, DeptName)
VALUES 
    (105, 'Finance'),
    (106, 'ECE');

/* 
OUTPUT:
Query OK, 2 rows affected (0.01 sec)
Query OK, 2 rows affected (0.01 sec)
*/


-- -------------------------------------------------------
-- STEP 5: LEFT OUTER JOIN
-- -------------------------------------------------------
SELECT Student.Name, Department.DeptName 
FROM Student 
LEFT JOIN Department ON Student.DeptID = Department.DeptID;

/* 
OUTPUT:
+---------+----------+
| Name    | DeptName |
+---------+----------+
| Manish  | CSE      |
| Piyush  | IT       |
| Dhanuke | NULL     |
| Oman    | NULL     |
+---------+----------+
4 rows in set (0.00 sec)
*/


-- -------------------------------------------------------
-- STEP 6: RIGHT OUTER JOIN
-- -------------------------------------------------------
SELECT Student.Name, Department.DeptName 
FROM Student 
RIGHT JOIN Department ON Student.DeptID = Department.DeptID;

/* 
OUTPUT:
+--------+----------+
| Name   | DeptName |
+--------+----------+
| Manish | CSE      |
| Piyush | IT       |
| NULL   | Finance  |
| NULL   | ECE      |
+--------+----------+
4 rows in set (0.00 sec)
*/


-- -------------------------------------------------------
-- STEP 7: FULL OUTER JOIN (Emulated via UNION)
-- -------------------------------------------------------
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
| NULL    | Finance  |
| NULL    | ECE      |
+---------+----------+
6 rows in set (0.00 sec)
*/


-- -------------------------------------------------------
-- STEP 8: SELF JOIN
-- -------------------------------------------------------
INSERT INTO Student VALUES (6, 'Rahul', 106);
INSERT INTO Student VALUES (7, 'Ankit', 101);

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
1 row in set (0.00 sec)
*/


-- -------------------------------------------------------
-- STEP 9: CROSS JOIN
-- -------------------------------------------------------
SELECT Student.Name, Department.DeptName
FROM Student
CROSS JOIN Department;

/* 
OUTPUT:
+---------+----------+
| Name    | DeptName |
+---------+----------+
| Manish  | ECE      |
| Manish  | Finance  |
| Manish  | IT       |
| Manish  | CSE      |
| Piyush  | ECE      |
| Piyush  | Finance  |
| Piyush  | IT       |
| Piyush  | CSE      |
| Dhanuke | ECE      |
| Dhanuke | Finance  |
| Dhanuke | IT       |
| Dhanuke | CSE      |
| Oman    | ECE      |
| Oman    | Finance  |
| Oman    | IT       |
| Oman    | CSE      |
| Rahul   | ECE      |
| Rahul   | Finance  |
| Rahul   | IT       |
| Rahul   | CSE      |
| Ankit   | ECE      |
| Ankit   | Finance  |
| Ankit   | IT       |
| Ankit   | CSE      |
+---------+----------+
24 rows in set (0.01 sec)
*/
