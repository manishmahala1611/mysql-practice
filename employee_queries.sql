-- ============================================================
-- MYSQL PRACTICE SESSION LOG (Exact Sequence & Outputs)
-- ============================================================

-- 1. Database Creation & Selection
CREATE DATABASE CompanyDB;
-- ERROR 1007 (HY000): Can't create database 'companydb'; database exists

CREATE DATABASE COMpanyyDB;
-- Query OK, 1 row affected (0.01 sec)

USE DATABASE COMpanyyDB;
-- ERROR 1049 (42000): Unknown database 'database'

USE COMpanyyDB;
-- Database changed


-- 2. Table Creation
CREATE TABLE Employee(EmpID INT Primary key, EmpName VARCHAR(50), Department VARCHAR(30), Salary INT, Age INT, City VARCHAR(40));
-- Query OK, 0 rows affected (0.12 sec)


-- 3. Data Insertion
INSERT INTO Employee (EmpID, EmpName, Department, Salary, Age, City) VALUES 
(101, 'Amit', 'IT', 50000, 25, 'Jaipur'),
(102, 'Priya', 'HR', 45000, 28, 'Delhi'),
(103, 'Rohan', 'Finance', 62000, 32, 'Mumbai'),
(104, 'Neha', 'IT', 58000, 26, 'Bangalore'),
(105, 'Vikram', 'Marketing', 48000, 29, 'Jaipur'),
(106, 'Ananya', 'Finance', 70000, 35, 'Pune'),
(107, 'Suresh', 'HR', 42000, 30, 'Ahmedabad'),
(108, 'Kavita', 'IT', 65000, 27, 'Hyderabad'),
(109, 'Rahul', 'Marketing', 51000, 31, 'Delhi'),
(110, 'Sneha', 'Sales', 49000, 24, 'Mumbai');
-- Query OK, 10 rows affected (0.03 sec)


-- 4. View All Records
SELECT*FROM Employee;
/*
+-------+---------+------------+--------+------+-----------+
| EmpID | EmpName | Department | Salary | Age  | City      |
+-------+---------+------------+--------+------+-----------+
|   101 | Amit    | IT         |  50000 |   25 | Jaipur    |
|   102 | Priya   | HR         |  45000 |   28 | Delhi     |
|   103 | Rohan   | Finance    |  62000 |   32 | Mumbai    |
|   104 | Neha    | IT         |  58000 |   26 | Bangalore |
|   105 | Vikram  | Marketing  |  48000 |   29 | Jaipur    |
|   106 | Ananya  | Finance    |  70000 |   35 | Pune      |
|   107 | Suresh  | HR         |  42000 |   30 | Ahmedabad |
|   108 | Kavita  | IT         |  65000 |   27 | Hyderabad |
|   109 | Rahul   | Marketing  |  51000 |   31 | Delhi     |
|   110 | Sneha   | Sales      |  49000 |   24 | Mumbai    |
+-------+---------+------------+--------+------+-----------+
10 rows in set (0.01 sec)
*/


-- 5. Filtering (WHERE Clause Practice)

-- Salary > 50000
SELECT*FROM Employee WHERE Salary > 50000;
/*
+-------+---------+------------+--------+------+-----------+
| EmpID | EmpName | Department | Salary | Age  | City      |
+-------+---------+------------+--------+------+-----------+
|   103 | Rohan   | Finance    |  62000 |   32 | Mumbai    |
|   104 | Neha    | IT         |  58000 |   26 | Bangalore |
|   106 | Ananya  | Finance    |  70000 |   35 | Pune      |
|   108 | Kavita  | IT         |  65000 |   27 | Hyderabad |
|   109 | Rahul   | Marketing  |  51000 |   31 | Delhi     |
+-------+---------+------------+--------+------+-----------+
5 rows in set (0.01 sec)
*/

-- Age > 30
SELECT*FROM Employee WHERE Age > 30;
/*
+-------+---------+------------+--------+------+--------+
| EmpID | EmpName | Department | Salary | Age  | City   |
+-------+---------+------------+--------+------+--------+
|   103 | Rohan   | Finance    |  62000 |   32 | Mumbai |
|   106 | Ananya  | Finance    |  70000 |   35 | Pune   |
|   109 | Rahul   | Marketing  |  51000 |   31 | Delhi  |
+-------+---------+------------+--------+------+--------+
3 rows in set (0.00 sec)
*/

-- Age = 26
SELECT*FROM Employee WHERE Age = 26;
/*
+-------+---------+------------+--------+------+-----------+
| EmpID | EmpName | Department | Salary | Age  | City      |
+-------+---------+------------+--------+------+-----------+
|   104 | Neha    | IT         |  58000 |   26 | Bangalore |
+-------+---------+------------+--------+------+-----------+
1 row in set (0.00 sec)
*/

-- City = 'Bangalore'
SELECT*FROM Employee WHERE City = 'Bangalore';
/*
+-------+---------+------------+--------+------+-----------+
| EmpID | EmpName | Department | Salary | Age  | City      |
+-------+---------+------------+--------+------+-----------+
|   104 | Neha    | IT         |  58000 |   26 | Bangalore |
+-------+---------+------------+--------+------+-----------+
1 row in set (0.01 sec)
*/

-- Salary BETWEEN 50000 AND 65000
SELECT * FROM Employee WHERE Salary BETWEEN 50000 AND 65000;
/*
+-------+---------+------------+--------+------+-----------+
| EmpID | EmpName | Department | Salary | Age  | City      |
+-------+---------+------------+--------+------+-----------+
|   101 | Amit    | IT         |  50000 |   25 | Jaipur    |
|   103 | Rohan   | Finance    |  62000 |   32 | Mumbai    |
|   104 | Neha    | IT         |  58000 |   26 | Bangalore |
|   108 | Kavita  | IT         |  65000 |   27 | Hyderabad |
|   109 | Rahul   | Marketing  |  51000 |   31 | Delhi     |
+-------+---------+------------+--------+------+-----------+
5 rows in set (0.00 sec)
*/

-- Salary >= 50000 AND Salary <= 65000
SELECT * FROM Employee WHERE Salary >= 50000 AND Salary <= 65000;
/*
+-------+---------+------------+--------+------+-----------+
| EmpID | EmpName | Department | Salary | Age  | City      |
+-------+---------+------------+--------+------+-----------+
|   101 | Amit    | IT         |  50000 |   25 | Jaipur    |
|   103 | Rohan   | Finance    |  62000 |   32 | Mumbai    |
|   104 | Neha    | IT         |  58000 |   26 | Bangalore |
|   108 | Kavita  | IT         |  65000 |   27 | Hyderabad |
|   109 | Rahul   | Marketing  |  51000 |   31 | Delhi     |
+-------+---------+------------+--------+------+-----------+
5 rows in set (0.00 sec)
*/

-- Multiple Cities (OR Operator)
SELECT*FROM Employee WHERE City = 'Jaipur' OR City = 'Delhi' OR City = 'Mumbai';
/*
+-------+---------+------------+--------+------+--------+
| EmpID | EmpName | Department | Salary | Age  | City   |
+-------+---------+------------+--------+------+--------+
|   101 | Amit    | IT         |  50000 |   25 | Jaipur |
|   102 | Priya   | HR         |  45000 |   28 | Delhi  |
|   103 | Rohan   | Finance    |  62000 |   32 | Mumbai |
|   105 | Vikram  | Marketing  |  48000 |   29 | Jaipur |
|   109 | Rahul   | Marketing  |  51000 |   31 | Delhi  |
|   110 | Sneha   | Sales      |  49000 |   24 | Mumbai |
+-------+---------+------------+--------+------+--------+
6 rows in set (0.01 sec)
*/


-- 6. Aggregate Functions Practice

-- Total Rows Count
SELECT COUNT(*) AS Total_Salary FROM Employee;
/*
+--------------+
| Total_Salary |
+--------------+
|           10 |
+--------------+
1 row in set (0.04 sec)
*/

-- Minimum Salary
SELECT min(Salary) AS Minimum_Salary FROM Employee;
/*
+----------------+
| Minimum_Salary |
+----------------+
|          42000 |
+----------------+
1 row in set (0.01 sec)
*/

-- Maximum Salary
SELECT max(Salary) AS Maximum_Salary FROM Employee;
/*
+----------------+
| Maximum_Salary |
+----------------+
|          70000 |
+----------------+
1 row in set (0.00 sec)
*/

-- Sum of Salaries
SELECT SUM(Salary) AS Total_Salary FROM Employee;
/*
+--------------+
| Total_Salary |
+--------------+
|       540000 |
+--------------+
1 row in set (0.00 sec)
*/

-- Overall Average Salary
SELECT AVG(Salary) AS Average_Salary FROM Employee;
/*
+----------------+
| Average_Salary |
+----------------+
|     54000.0000 |
+----------------+
1 row in set (0.01 sec)
*/


-- 7. GROUP BY & HAVING Clause Practice

-- Group By Department with Rounded Average
SELECT Department, ROUND(AVG(Salary), 2) AS Avg_Salary
FROM Employee
GROUP BY Department;
/*
+------------+------------+
| Department | Avg_Salary |
+------------+------------+
| IT         |   57666.67 |
| HR         |   43500.00 |
| Finance    |   66000.00 |
| Marketing  |   49500.00 |
| Sales      |   49000.00 |
+------------+------------+
5 rows in set (0.02 sec)
*/

-- Department Avg Salary > 50000 (HAVING Clause)
SELECT Department, AVG(Salary) AS Average_Salary
FROM Employee
GROUP BY Department
HAVING AVG(Salary)>50000;
/*
+------------+----------------+
| Department | Average_Salary |
+------------+----------------+
| IT         |     57666.6667 |
| Finance    |     66000.0000 |
+------------+----------------+
2 rows in set (0.01 sec)
*/

-- Employee Count per Department
SELECT Department, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Department;
/*
+------------+-----------------+
| Department | Total_Employees |
+------------+-----------------+
| IT         |               3 |
| HR         |               2 |
| Finance    |               2 |
| Marketing  |               2 |
| Sales      |               1 |
+------------+-----------------+
5 rows in set (0.00 sec)
*/


-- 8. Table Alteration (Adding Column)
ALTER TABLE Employee
ADD Joining_Date VARCHAR(100);
-- Query OK, 0 rows affected (0.13 sec)

SELECT*FROM Employee;
/*
+-------+---------+------------+--------+------+-----------+--------------+
| EmpID | EmpName | Department | Salary | Age  | City      | Joining_Date |
+-------+---------+------------+--------+------+-----------+--------------+
|   101 | Amit    | IT         |  50000 |   25 | Jaipur    | NULL         |
|   102 | Priya   | HR         |  45000 |   28 | Delhi     | NULL         |
|   103 | Rohan   | Finance    |  62000 |   32 | Mumbai    | NULL         |
|   104 | Neha    | IT         |  58000 |   26 | Bangalore | NULL         |
|   105 | Vikram  | Marketing  |  48000 |   29 | Jaipur    | NULL         |
|   106 | Ananya  | Finance    |  70000 |   35 | Pune      | NULL         |
|   107 | Suresh  | HR         |  42000 |   30 | Ahmedabad | NULL         |
|   108 | Kavita  | IT         |  65000 |   27 | Hyderabad | NULL         |
|   109 | Rahul   | Marketing  |  51000 |   31 | Delhi     | NULL         |
|   110 | Sneha   | Sales      |  49000 |   24 | Mumbai    | NULL         |
+-------+---------+------------+--------+------+-----------+--------------+
10 rows in set (0.00 sec)
*/


-- 9. Updating Data (Updating Joining_Date for All Rows)
UPDATE Employee SET Joining_Date = CASE EmpID 
    WHEN 101 THEN '2023-01-15' 
    WHEN 102 THEN '2023-02-01' 
    WHEN 103 THEN '2022-11-10' 
    WHEN 104 THEN '2023-03-20' 
    WHEN 105 THEN '2022-08-05' 
    WHEN 106 THEN '2021-06-12' 
    WHEN 107 THEN '2023-04-18' 
    WHEN 108 THEN '2022-12-01' 
    WHEN 109 THEN '2023-05-25' 
    WHEN 110 THEN '2023-02-14' 
END 
WHERE EmpID IN (101, 102, 103, 104, 105, 106, 107, 108, 109, 110);
-- Query OK, 10 rows affected (0.02 sec)
-- Rows matched: 10  Changed: 10  Warnings: 0


-- 10. View Updated Table
SELECT*FROM Employee;
/*
+-------+---------+------------+--------+------+-----------+--------------+
| EmpID | EmpName | Department | Salary | Age  | City      | Joining_Date |
+-------+---------+------------+--------+------+-----------+--------------+
|   101 | Amit    | IT         |  50000 |   25 | Jaipur    | 2023-01-15   |
|   102 | Priya   | HR         |  45000 |   28 | Delhi     | 2023-02-01   |
|   103 | Rohan   | Finance    |  62000 |   32 | Mumbai    | 2022-11-10   |
|   104 | Neha    | IT         |  58000 |   26 | Bangalore | 2023-03-20   |
|   105 | Vikram  | Marketing  |  48000 |   29 | Jaipur    | 2022-08-05   |
|   106 | Ananya  | Finance    |  70000 |   35 | Pune      | 2021-06-12   |
|   107 | Suresh  | HR         |  42000 |   30 | Ahmedabad | 2023-04-18   |
|   108 | Kavita  | IT         |  65000 |   27 | Hyderabad | 2022-12-01   |
|   109 | Rahul   | Marketing  |  51000 |   31 | Delhi     | 2023-05-25   |
|   110 | Sneha   | Sales      |  49000 |   24 | Mumbai    | 2023-02-14   |
+-------+---------+------------+--------+------+-----------+--------------+
10 rows in set (0.00 sec)
*/


-- 11. Group By Joining Year Count
SELECT YEAR(Joining_Date) AS Joining_Year, COUNT(*) AS Total_Employees 
FROM Employee 
GROUP BY YEAR(Joining_Date) 
ORDER BY Joining_Year ASC;
/*
+--------------+-----------------+
| Joining_Year | Total_Employees |
+--------------+-----------------+
|         2021 |               1 |
|         2022 |               3 |
|         2023 |               6 |
+--------------+-----------------+
3 rows in set (0.01 sec)
*/
