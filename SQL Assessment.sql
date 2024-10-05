CREATE DATABASE EmpDB;
USE EmpDB;

SHOW TABLES;
CREATE TABLE EMP(
  empId int,
  firstname varchar(15),
  lastname varchar(15),
  dept varchar(10),
  salary int,
  hiredate varchar(15),
  active varchar(15)
);

INSERT INTO EMP(empId,firstname,lastname,dept,salary,hiredate,active) VALUES (1, 'John', 'Doe','HR',50000,'2020-01-15','true');
INSERT INTO EMP(empId,firstname,lastname,dept,salary,hiredate,active) VALUES  (2, 'Jane', 'Smit','IT',60000,'2019-03-10','true');
INSERT INTO EMP(empId,firstname,lastname,dept,salary,hiredate,active) VALUES  (3, 'Michal', 'Brown','Finance',70000,'2018-07-20','true');
INSERT INTO EMP(empId,firstname,lastname,dept,salary,hiredate,active) VALUES (4, 'Emily', 'Davis','IT',55000,'2021-05-30','false');
INSERT INTO EMP(empId,firstname,lastname,dept,salary,hiredate,active) VALUES  (5, 'James', 'Wilson','HR',48000,'2021-09-12','true');
INSERT INTO EMP(empId,firstname,lastname,dept,salary,hiredate,active) VALUES (6, 'Linda', 'Martinez','Finance',72000,'2020-11-05','false');
INSERT INTO EMP(empId,firstname,lastname,dept,salary,hiredate,active) VALUES (7, 'David', 'Andreson','IT',65000,'2019-06-25','true');
INSERT INTO EMP(empId,firstname,lastname,dept,salary,hiredate,active) VALUES (8, 'Jennifer', 'Lee','Finance',68000,'2017-02-18','true');
INSERT INTO EMP(empId,firstname,lastname,dept,salary,hiredate,active) VALUES (9, 'Robert', 'Clark','HR',53000,'2018-12-05','true');
INSERT INTO EMP(empId,firstname,lastname,dept,salary,hiredate,active) VALUES (10, 'Maria', 'Lewis','IT',62000,'2016-10-30','false');

SELECT * FROM EMP;


SELECT * FROM EMP WHERE dept = 'IT';

SELECT dept FROM EMP;

SELECT *  FROM EMP WHERE salary > 60000;

SELECT * FROM EMP order by hiredate desc;

SELECT * FROM EMP WHERE dept = 'Finance' and active = 'true';

SELECT * FROM EMP WHERE not dept = 'IT';

INSERT INTO EMP(empId,firstname,lastname,dept,salary,hiredate,active) VALUES(11,'Dines','Koppolu','HR',68000,'2024-08-7','true');
SELECT * FROM EMP;

update EMP SET salary = 55000 WHERE dept = 'HR';
SELECT * FROM EMP;

delete FROM EMP WHERE active = 'false';
SELECT * FROM EMP;

SELECT * FROM EMP WHERE FirstName LIKE 'M%';

SELECT * FROM EMP WHERE Salary BETWEEN 45000 AND 60000;

SELECT * FROM EMP WHERE dept IN ('HR', 'IT');

SELECT dept, COUNT(*) AS EmployeeCount FROM EMP GROUP BY dept;

SELECT SUM(Salary) AS TotalSalary FROM EMP WHERE dept = 'HR';

SELECT AVG(Salary) AS AverageSalary FROM EMP WHERE Active = 'false';

SELECT MIN(Salary) AS MinSalary, MAX(Salary) AS MaxSalary FROM EMP WHERE dept = 'IT';


CREATE TABLE Departments (
  DepartmentID int,
  deptName varchar(50)
);

INSERT INTO Departments (DepartmentID, deptName) VALUES (1, 'HR');
INSERT INTO Departments (DepartmentID, deptName) VALUES (2, 'IT');
INSERT INTO Departments (DepartmentID, deptName) VALUES (3, 'Finance');

ALTER TABLE EMP ADD DepartmentID int;

UPDATE EMP SET DepartmentID = 1 WHERE dept = 'HR';
UPDATE EMP SET DepartmentID = 2 WHERE dept = 'IT';
UPDATE EMP SET DepartmentID = 3 WHERE dept = 'Finance';

SELECT E.*, D.deptName 
FROM EMP E 
JOIN Departments D ON E.DepartmentID = D.DepartmentID;

SELECT * FROM EMP WHERE Salary > (SELECT AVG(Salary) FROM EMP WHERE dept = 'HR');

