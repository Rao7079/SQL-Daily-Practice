-- 1️⃣ Create employees table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT
);

-- 2️⃣ Insert sample data
INSERT INTO employees (emp_id, emp_name, department_id) VALUES
(1, 'Aman', 101),
(2, 'Priya', 102),
(3, 'Raj', 103),
(4, 'Sneha', NULL),
(5, 'Arjun', 101);

-- 1️⃣ Create departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

-- 2️⃣ Insert sample data
INSERT INTO departments (department_id, department_name) VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Finance'),
(104, 'Sales');


#lets practice join

#start with inner join
select e.emp_name ,d.department_name from employees as e
inner join departments as d
on e.department_id =d.department_id;

#left join
select e.emp_name ,d.department_name from employees as e
left join departments as d
on e.department_id =d.department_id;

#right join'
select e.emp_name ,d.department_name from employees as e
right join departments as d
on e.department_id =d.department_id;

#full outer join 
SELECT e.emp_name, d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id

UNION

SELECT e.emp_name, d.department_name
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id;


