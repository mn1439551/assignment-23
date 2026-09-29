CREATE DATABASE company_db;

CREATE TABLE employees(
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    manager_id INT,
    city VARCHAR(50)
);


INSERT INTO employees(emp_name, department, salary, manager_id, city) VALUES
( 'Noor', 'HR', 50000, 3, 'Beirut'),
('Hassan', 'IT', 60000, 4, 'Baalback'),
('Hady', 'HR', 70000, NULL, 'Beirut'),
('Ali', 'IT', 80000, NULL, 'Tripoli'),
( 'Mouhammad', 'Sales', 45000, 6, 'Saida'),
('Zayn', 'Sales', 65000, NULL, 'Beqaa');


SELECT DISTINCT department
FROM employees;

SELECT emp_name, salary
FROM employees
WHERE salary > 50000 AND(department = 'IT' OR department = 'HR');

SELECT emp_name
FROM employees
WHERE emp_name LIKE 'H%';

SELECT emp_name, salary
FROM employees
ORDER BY salary DESC LIMIT 3;

SELECT department, SUM(salary) AS "total_salary_paid_department"
FROM employees
GROUP BY department;

SELECT department, SUM(salary) AS "total_salary"
FROM employees
GROUP BY department WITH ROLLUP;


SELECT *
FROM employees
WHERE city = ' Beirut'
UNION
SELECT *
FROM employees
WHERE city = 'Beqaa';

SELECT CONCAT(e.emp_name) AS "employee_name", CONCAT(m.emp_name) AS "manager_name"
FROM employees AS e INNER JOIN employees AS m
ON e.emp_id = m.manager_id;

CREATE VIEW IT_Employees AS
SELECT emp_name, department, salary
FROM employees;

SELECT *
FROM it_employees

DELIMITER $$
CREATE PROCEDURE GetAllEmployees()
BEGIN
SELECT * FROM employees;
END $$
DELIMITER ;
CALL GetAllEmployees()

DELIMITER $$
CREATE PROCEDURE GetEmployeesByDepartment(IN dept_name VARCHAR(50))
BEGIN
SELECT *
FROM employees
WHERE department = dept_name;
END $$
DELIMITER ;

CALL GetEmployeesByDepartment('Nour', 'Ali');


DELIMITER $$
CREATE PROCEDURE GetEmployeesBySalary(IN salary_amount INT)
BEGIN
SELECT *
FROM employees
WHERE salary > salary_amount;
END $$
DELIMITER ;
CALL GetEmployeesBySalary(80000);




