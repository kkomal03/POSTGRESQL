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

----------------------------------------------------------------------------------------------------------------
--->>>1.Show all employees along with their department name. Include those without a department.
select e.emp_id ,e.emp_name,d.dept_name from employees1 as e left join 
departments as d on e.dept_id = d.dept_id;



----------------------------------------------------------------------------------------------------------------
--->>>2.List all departments and the employees in them. Include departments with no employees.
select e.emp_name,d.dept_name from employees1 as e  right join 
departments as d on e.dept_id = d.dept_id;



----------------------------------------------------------------------------------------------------------------
--->>>3.Get a list of employees and their managers using a self join.
SELECT 
    e.employee_id AS employee_id,
    e.employee_name AS employee_name,
    m.employee_id AS manager_id,
    m.employee_name AS manager_name
FROM 
    employees e
self JOIN 
    employees m
ON 
    e.manager_id = m.employee_id;



----------------------------------------------------------------------------------------------------------------
--->>>Show all possible combinations of employee and department names (cross join)

select * from employees1 as e cross join 
departments as d ;
