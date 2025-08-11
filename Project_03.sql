CREATE TABLE PROJECT02.TABLE03
(
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(50) UNIQUE,
    PhoneNumber BIGINT,
    HireDate DATE,
    JobTitle VARCHAR(50),
    Salary NUMERIC(10,2) CHECK (SALARY >= 0),
    Department VARCHAR(50)
);
DROP TABLE PROJECT02.TABLE03;

INSERT INTO PROJECT02.TABLE03 (EmployeeID, FirstName, LastName, Email, PhoneNumber, HireDate, JobTitle, Salary, Department)
VALUES
(101, 'Aarav', 'Sharma', 'aarav.sharma@example.com', 9876543210, '2022-01-15', 'Data Analyst', 65000.00, 'Analytics'),
(102, 'Meera', 'Patel', 'meera.patel@example.com', 9123456789, '2021-07-10', 'Software Engineer', 85000.00, 'Engineering'),
(103, 'Rohan', 'Verma', 'rohan.verma@example.com', 9988776655, '2023-03-20', 'Data Analyst', 72000.00, 'Analytics'),
(104, 'Sneha', 'Kumar', 'sneha.kumar@example.com', 9871234567, '2020-11-05', 'Software Engineer', 78000.00, 'Engineering'),
(105, 'Vikram', 'Singh', 'vikram.singh@example.com', 9812345678, '2019-06-25', 'Product Manager', 95000.00, 'Product'),
(106, 'Ananya', 'Joshi', 'ananya.joshi@example.com', 9765432109, '2022-09-01', 'Business Analyst', 70000.00, 'Strategy'),
(107, 'Kunal', 'Reddy', 'kunal.reddy@example.com', 9654321098, '2023-01-10', 'QA Engineer', 60000.00, 'Quality Assurance'),
(108, 'Priya', 'Desai', 'priya.desai@example.com', 9543210987, '2021-04-18', 'Data Analyst', 68000.00, 'Analytics'),
(109, 'Aditya', 'Chopra', 'aditya.chopra@example.com', 9432109876, '2020-08-30', 'Business Analyst', 82000.00, 'Strategy'),
(110, 'Neha', 'Mehta', 'neha.mehta@example.com', 9321098765, '2022-12-12', 'Product Manager', 75000.00, 'Product');

SELECT * FROM PROJECT02.TABLE03;



--How many employees are in the company?

SELECT COUNT(EmployeeID) FROM PROJECT02.TABLE03;

--How many employees work in each department?

SELECT Department, COUNT(EmployeeID) AS NO_OF_EMPLOYEE
FROM PROJECT02.TABLE03
GROUP BY Department;

--What is the total salary paid to all employees?

SELECT SUM(Salary) AS TOTAL_SALARY_PAID
FROM PROJECT02.TABLE03;


--What is the total salary for each department?

SELECT Department, SUM(Salary) AS TOTAL_SALARY_PAID
FROM PROJECT02.TABLE03
GROUP BY Department;


--What is the average salary across all employees?

SELECT  AVG(Salary) AS AVG_SALARY_PAID
FROM PROJECT02.TABLE03;


--What is the average salary for each job title?

SELECT JobTitle, AVG(Salary) AS AVG_SALARY_PAID
FROM PROJECT02.TABLE03
GROUP BY JobTitle;


What is the highest salary in the company?

SELECT MAX(Salary) AS HIGHEST_SALARY_PAID
FROM PROJECT02.TABLE03;


--Which department has the lowest-paid employee?

SELECT Department
FROM PROJECT02.TABLE03
WHERE Salary = (SELECT MIN(Salary) FROM PROJECT02.TABLE03)
;



--Find the highest, lowest, and average salary in each department.

SELECT Department, MAX(Salary) AS HIGHEST_SALARY_PAID,
MIN(Salary) AS LOWEST_SALARY_PAID,AVG(Salary) AS AVG_SALARY_PAID
FROM PROJECT02.TABLE03
GROUP BY Department;


--Show total employees, highest salary, and total salary by job title.

SELECT JobTitle, count(*) AS Total_no_of_emp,
max(Salary) AS highest_SALARY_PAID,
sum(Salary) AS total_SALARY_PAID
FROM PROJECT02.TABLE03
GROUP BY JobTitle;