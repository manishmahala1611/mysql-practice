-- ============================================================
-- MYSQL PRACTICE SESSION LOG (Exact Execution & Outputs)
-- ============================================================

-- 1. DATABASE CREATION & SELECTION
CREATE DATABASE IF NOT EXISTS CompanyDB;
-- Query OK, 1 row affected (0.01 sec)

USE CompanyDB;
-- Database changed

-- 2. TABLE CREATION WITH FOREIGN KEY (ON DELETE CASCADE)
CREATE TABLE Department (
DeptID INT PRIMARY KEY,
DeptName VARCHAR(50) NOT NULL
);
-- Query OK, 0 rows affected (0.02 sec)

CREATE TABLE Employee (
EmpID INT PRIMARY KEY,
EmpName VARCHAR(50) NOT NULL,
DeptID INT,
Salary INT,
Age INT,
City VARCHAR(40),
Joining_Date DATE,
FOREIGN KEY (DeptID) REFERENCES Department(DeptID) ON DELETE CASCADE
);
-- Query OK, 0 rows affected (0.03 sec)

-- 3. DATA INSERTION
INSERT INTO Department (DeptID, DeptName) VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Finance'),
(104, 'Marketing'),
(105, 'Sales');
-- Query OK, 5 rows affected (0.01 sec)

INSERT INTO Employee (EmpID, EmpName, DeptID, Salary, Age, City, Joining_Date) VALUES
(1, 'Amit', 101, 50000, 25, 'Jaipur', '2023-01-15'),
(2, 'Priya', 102, 45000, 28, 'Delhi', '2023-02-01'),
(3, 'Rohan', 103, 62000, 32, 'Mumbai', '2022-11-10'),
(4, 'Neha', 101, 58000, 26, 'Bangalore', '2023-03-20'),
(5, 'Vikram', 104, 48000, 29, 'Jaipur', '2022-08-05'),
(6, 'Ananya', 103, 70000, 35, 'Pune', '2021-06-12'),
(7, 'Suresh', 102, 42000, 30, 'Ahmedabad', '2023-04-18'),
(8, 'Kavita', 101, 65000, 27, 'Hyderabad', '2022-12-01'),
(9, 'Rahul', 104, 51000, 31, 'Delhi', '2023-05-25'),
(10, 'Sneha', NULL, 49000, 24, 'Mumbai', '2023-02-14');
-- Query OK, 10 rows affected (0.02 sec)

-- 4. DISPLAY ALL RECORDS
SELECT * FROM Department;
/*
+--------+-----------+
| DeptID | DeptName  |
+--------+-----------+
|    101 | IT        |
|    102 | HR        |
|    103 | Finance   |
|    104 | Marketing |
|    105 | Sales     |
+--------+-----------+
5 rows in set (0.00 sec)
*/

SELECT * FROM Employee;
/*
+-------+---------+--------+--------+------+-----------+--------------+
| EmpID | EmpName | DeptID | Salary | Age  | City      | Joining_Date |
+-------+---------+--------+--------+------+-----------+--------------+
|     1 | Amit    |    101 |  50000 |   25 | Jaipur    | 2023-01-15   |
|     2 | Priya   |    102 |  45000 |   28 | Delhi     | 2023-02-01   |
|     3 | Rohan   |    103 |  62000 |   32 | Mumbai    | 2022-11-10   |
|     4 | Neha    |    101 |  58000 |   26 | Bangalore | 2023-03-20   |
|     5 | Vikram  |    104 |  48000 |   29 | Jaipur    | 2022-08-05   |
|     6 | Ananya  |    103 |  70000 |   35 | Pune      | 2021-06-12   |
|     7 | Suresh  |    102 |  42000 |   30 | Ahmedabad | 2023-04-18   |
|     8 | Kavita  |    101 |  65000 |   27 | Hyderabad | 2022-12-01   |
|     9 | Rahul   |    104 |  51000 |   31 | Delhi     | 2023-05-25   |
|    10 | Sneha   |   NULL |  49000 |   24 | Mumbai    | 2023-02-14   |
+-------+---------+--------+--------+------+-----------+--------------+
10 rows in set (0.00 sec)
*/

-- 5. UPDATE COMMAND
UPDATE Employee
SET Salary = Salary + 3000
WHERE DeptID = 101;
-- Query OK, 3 rows affected (0.01 sec)
-- Rows matched: 3  Changed: 3  Warnings: 0

-- Verification after Update
SELECT EmpID, EmpName, DeptID, Salary FROM Employee WHERE DeptID = 101;
/*
+-------+---------+--------+--------+
| EmpID | EmpName | DeptID | Salary |
+-------+---------+--------+--------+
|     1 | Amit    |    101 |  53000 |
|     4 | Neha    |    101 |  61000 |
|     8 | Kavita  |    101 |  68000 |
+-------+---------+--------+--------+
3 rows in set (0.00 sec)
*/

-- 6. FILTERING COMMANDS

-- Basic Filter (Age > 28)
SELECT * FROM Employee WHERE Age > 28;
/*
+-------+---------+--------+--------+------+-----------+--------------+
| EmpID | EmpName | DeptID | Salary | Age  | City      | Joining_Date |
+-------+---------+--------+--------+------+-----------+--------------+
|     3 | Rohan   |    103 |  62000 |   32 | Mumbai    | 2022-11-10   |
|     5 | Vikram  |    104 |  48000 |   29 | Jaipur    | 2022-08-05   |
|     6 | Ananya  |    103 |  70000 |   35 | Pune      | 2021-06-12   |
|     7 | Suresh  |    102 |  42000 |   30 | Ahmedabad | 2023-04-18   |
|     9 | Rahul   |    104 |  51000 |   31 | Delhi     | 2023-05-25   |
+-------+---------+--------+--------+------+-----------+--------------+
5 rows in set (0.00 sec)
*/

-- Filtering using BETWEEN (Salary 50000 to 65000)
SELECT * FROM Employee WHERE Salary BETWEEN 50000 AND 65000;
/*
+-------+---------+--------+--------+------+-----------+--------------+
| EmpID | EmpName | DeptID | Salary | Age  | City      | Joining_Date |
+-------+---------+--------+--------+------+-----------+--------------+
|     1 | Amit    |    101 |  53000 |   25 | Jaipur    | 2023-01-15   |
|     3 | Rohan   |    103 |  62000 |   32 | Mumbai    | 2022-11-10   |
|     4 | Neha    |    101 |  61000 |   26 | Bangalore | 2023-03-20   |
|     9 | Rahul   |    104 |  51000 |   31 | Delhi     | 2023-05-25   |
+-------+---------+--------+--------+------+-----------+--------------+
4 rows in set (0.00 sec)
*/

-- Filtering for Multiple Cities (OR Operator)
SELECT * FROM Employee WHERE City = 'Jaipur' OR City = 'Delhi' OR City = 'Mumbai';
/*
+-------+---------+--------+--------+------+--------+--------------+
| EmpID | EmpName | DeptID | Salary | Age  | City   | Joining_Date |
+-------+---------+--------+--------+------+--------+--------------+
|     1 | Amit    |    101 |  53000 |   25 | Jaipur | 2023-01-15   |
|     2 | Priya   |    102 |  45000 |   28 | Delhi  | 2023-02-01   |
|     3 | Rohan   |    103 |  62000 |   32 | Mumbai | 2022-11-10   |
|     5 | Vikram  |    104 |  48000 |   29 | Jaipur | 2022-08-05   |
|     9 | Rahul   |    104 |  51000 |   31 | Delhi  | 2023-05-25   |
|    10 | Sneha   |   NULL |  49000 |   24 | Mumbai | 2023-02-14   |
+-------+---------+--------+--------+------+--------+--------------+
6 rows in set (0.01 sec)
*/

-- 7. AGGREGATE FUNCTIONS & GROUP BY / HAVING CLAUSE

-- Total Row Count
SELECT COUNT(*) AS Total_Employees FROM Employee;
/*
+-----------------+
| Total_Employees |
+-----------------+
|              10 |
+-----------------+
1 row in set (0.00 sec)
*/

-- Minimum Salary
SELECT MIN(Salary) AS Minimum_Salary FROM Employee;
/*
+----------------+
| Minimum_Salary |
+----------------+
|          42000 |
+----------------+
1 row in set (0.00 sec)
*/

-- Maximum Salary
SELECT MAX(Salary) AS Maximum_Salary FROM Employee;
/*
+----------------+
| Maximum_Salary |
+----------------+
|          70000 |
+----------------+
1 row in set (0.00 sec)
*/

-- Sum of Salaries
SELECT SUM(Salary) AS Total_Salary_Expense FROM Employee;
/*
+----------------------+
| Total_Salary_Expense |
+----------------------+
|               549000 |
+----------------------+
1 row in set (0.00 sec)
*/

-- Average Salary
SELECT AVG(Salary) AS Average_Salary FROM Employee;
/*
+----------------+
| Average_Salary |
+----------------+
|     54900.0000 |
+----------------+
1 row in set (0.00 sec)
*/

-- GROUP BY & HAVING Clause
SELECT DeptID, COUNT(*) AS Total_Staff, ROUND(AVG(Salary), 2) AS Avg_Salary
FROM Employee
WHERE DeptID IS NOT NULL
GROUP BY DeptID
HAVING AVG(Salary) > 50000;
/*
+--------+-------------+------------+
| DeptID | Total_Staff | Avg_Salary |
+--------+-------------+------------+
|    101 |           3 |   60666.67 |
|    103 |           2 |   66000.00 |
+--------+-------------+------------+
2 rows in set (0.01 sec)
*/

-- 8. SQL JOINS IMPLEMENTATION

-- A. INNER JOIN using 'ON'
SELECT E.EmpName, D.DeptName, E.Salary
FROM Employee E
INNER JOIN Department D ON E.DeptID = D.DeptID;
/*
+---------+-----------+--------+
| EmpName | DeptName  | Salary |
+---------+-----------+--------+
| Amit    | IT        |  53000 |
| Priya   | HR        |  45000 |
| Rohan   | Finance   |  62000 |
| Neha    | IT        |  61000 |
| Vikram  | Marketing |  48000 |
| Ananya  | Finance   |  70000 |
| Suresh  | HR        |  42000 |
| Kavita  | IT        |  68000 |
| Rahul   | Marketing |  51000 |
+---------+-----------+--------+
9 rows in set (0.00 sec)
*/

-- B. INNER JOIN using 'WHERE'
SELECT E.EmpName, D.DeptName, E.Salary
FROM Employee E, Department D
WHERE E.DeptID = D.DeptID;
/*
+---------+-----------+--------+
| EmpName | DeptName  | Salary |
+---------+-----------+--------+
| Amit    | IT        |  53000 |
| Priya   | HR        |  45000 |
| Rohan   | Finance   |  62000 |
| Neha    | IT        |  61000 |
| Vikram  | Marketing |  48000 |
| Ananya  | Finance   |  70000 |
| Suresh  | HR        |  42000 |
| Kavita  | IT        |  68000 |
| Rahul   | Marketing |  51000 |
+---------+-----------+--------+
9 rows in set (0.00 sec)
*/

-- C. LEFT OUTER JOIN
SELECT E.EmpName, D.DeptName
FROM Employee E
LEFT JOIN Department D ON E.DeptID = D.DeptID;
/*
+---------+-----------+
| EmpName | DeptName  |
+---------+-----------+
| Amit    | IT        |
| Priya   | HR        |
| Rohan   | Finance   |
| Neha    | IT        |
| Vikram  | Marketing |
| Ananya  | Finance   |
| Suresh  | HR        |
| Kavita  | IT        |
| Rahul   | Marketing |
| Sneha   | NULL      |
+---------+-----------+
10 rows in set (0.00 sec)
*/

-- D. RIGHT OUTER JOIN
SELECT E.EmpName, D.DeptName
FROM Employee E
RIGHT JOIN Department D ON E.DeptID = D.DeptID;
/*
+---------+-----------+
| EmpName | DeptName  |
+---------+-----------+
| Amit    | IT        |
| Neha    | IT        |
| Kavita  | IT        |
| Priya   | HR        |
| Suresh  | HR        |
| Rohan   | Finance   |
| Ananya  | Finance   |
| Vikram  | Marketing |
| Rahul   | Marketing |
| NULL    | Sales     |
+---------+-----------+
10 rows in set (0.00 sec)
*/

-- E. FULL OUTER JOIN (Emulated via UNION)
SELECT E.EmpName, D.DeptName
FROM Employee E
LEFT JOIN Department D ON E.DeptID = D.DeptID
UNION
SELECT E.EmpName, D.DeptName
FROM Employee E
RIGHT JOIN Department D ON E.DeptID = D.DeptID;
/*
+---------+-----------+
| EmpName | DeptName  |
+---------+-----------+
| Amit    | IT        |
| Priya   | HR        |
| Rohan   | Finance   |
| Neha    | IT        |
| Vikram  | Marketing |
| Ananya  | Finance   |
| Suresh  | HR        |
| Kavita  | IT        |
| Rahul   | Marketing |
| Sneha   | NULL      |
| NULL    | Sales     |
+---------+-----------+
11 rows in set (0.01 sec)
*/

-- F. SELF JOIN (Same Department pairing)
SELECT E1.EmpName AS Employee_1, E2.EmpName AS Employee_2, E1.DeptID
FROM Employee E1
INNER JOIN Employee E2 ON E1.DeptID = E2.DeptID AND E1.EmpID < E2.EmpID;
/*
+------------+------------+--------+
| Employee_1 | Employee_2 | DeptID |
+------------+------------+--------+
| Amit       | Neha       |    101 |
| Amit       | Kavita     |    101 |
| Priya      | Suresh     |    102 |
| Rohan      | Ananya     |    103 |
| Neha       | Kavita     |    101 |
| Vikram     | Rahul      |    104 |
+------------+------------+--------+
6 rows in set (0.00 sec)
*/

-- 9. DELETE & ON DELETE CASCADE OPERATIONS

-- Delete a row directly from Child Table (Employee)
DELETE FROM Employee WHERE EmpID = 10;
-- Query OK, 1 row affected (0.01 sec)

-- Delete a Row from Parent Table (Department ID 104 - Marketing)
-- ON DELETE CASCADE will automatically delete Vikram (EmpID 5) and Rahul (EmpID 9) from Employee table
DELETE FROM Department WHERE DeptID = 104;
-- Query OK, 1 row affected (0.02 sec)

-- 10. DISPLAY UPDATED TABLES TO VERIFY CASCADE DELETE

SELECT * FROM Department;
/*
+--------+----------+
| DeptID | DeptName |
+--------+----------+
|    101 | IT       |
|    102 | HR       |
|    103 | Finance  |
|    105 | Sales    |
+--------+----------+
4 rows in set (0.00 sec)
*/

SELECT * FROM Employee;
/*
+-------+---------+--------+--------+------+-----------+--------------+
| EmpID | EmpName | DeptID | Salary | Age  | City      | Joining_Date |
+-------+---------+--------+--------+------+-----------+--------------+
|     1 | Amit    |    101 |  53000 |   25 | Jaipur    | 2023-01-15   |
|     2 | Priya   |    102 |  45000 |   28 | Delhi     | 2023-02-01   |
|     3 | Rohan   |    103 |  62000 |   32 | Mumbai    | 2022-11-10   |
|     4 | Neha    |    101 |  61000 |   26 | Bangalore | 2023-03-20   |
|     6 | Ananya  |    103 |  70000 |   35 | Pune      | 2021-06-12   |
|     7 | Suresh  |    102 |  42000 |   30 | Ahmedabad | 2023-04-18   |
|     8 | Kavita  |    101 |  68000 |   27 | Hyderabad | 2022-12-01   |
+-------+---------+--------+--------+------+-----------+--------------+
7 rows in set (0.00 sec)
*/
