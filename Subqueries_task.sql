CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE employees1 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT REFERENCES departments(dept_id)
);


-------------------------------------------------------------------------------------------------------------
-- >>>1.Write a query to display the name and salary of 
-- employees whose salary is greater than the average salary of all employees.



SELECT EMP_NAME,SALARY FROM EMPLOYEES1 WHERE 
SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES1);


-------------------------------------------------------------------------------------------------------------
-- >>>2.Find the departments where the average employee salary is more than 50,000.

SELECT D.DEPT_NAME FROM DEPARTMENTS AS D JOIN EMPLOYEES1 AS E ON D.DEPT_ID = E.DEPT_ID 
WHERE  (SELECT AVG(SALARY) FROM EMPLOYEES1)>50000;


-------------------------------------------------------------------------------------------------------------
-- >>>3.Using a CTE, list all employees along with the average salary of their department.

WITH AvgSalary AS (
    SELECT dept_id, AVG(salary) AS avg_salary
    FROM employees1
    GROUP BY dept_id
)
SELECT e.emp_id, e.emp_name, e.salary, e.dept_id, d.avg_salary
FROM employees1 e
JOIN AvgSalary d ON e.dept_id = d.dept_id;



-------------------------------------------------------------------------------------------------------------
-->>4.Using a subquery, show the names of employees who work in departments located in Delhi.
SELECT emp_name
FROM employees1
WHERE dept_id IN (
    SELECT dept_id
    FROM departments
    WHERE location = 'Delhi'
);




--Departments
INSERT INTO departments (dept_id, dept_name, location) VALUES
(1, 'HR', 'Delhi'),
(2, 'IT', 'Mumbai'),
(3, 'Finance', 'Delhi'),
(4, 'Legal', 'Chennai');  -- This one has no employees

-- Employees
INSERT INTO employees1 (emp_id, emp_name, salary, dept_id) VALUES
(101, 'Ravi', 50000, 1),
(102, 'Sneha', 60000, 2),
(103, 'Amit', 45000, 2),
(104, 'Zoya', 70000, 3),
(105, 'Vikram', 30000, 1),
(106, 'Tina', 80000, NULL); -- Employee with no department


