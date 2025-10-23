create database joined;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT
);

INSERT INTO employees (emp_id, emp_name, department_id) VALUES
(1, 'Ravi', 101),
(2, 'Priya', 102),
(3, 'Aman', 101),
(4, 'Neha', NULL),
(5, 'Raj', 103),
(6, 'Sneha', 102);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments (department_id, department_name) VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Finance'),
(104, 'Sales');

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    emp_id INT
);

INSERT INTO projects (project_id, project_name, emp_id) VALUES
(201, 'Project A', 1),
(202, 'Project B', 2),
(203, 'Project C', 3),
(204, 'Project D', NULL),
(205, 'Project E', 5);

#lets start
select * from employees;
select * from departments;
select * from projects;

#Show employee names with their department names.
select e.emp_name , d.department_name from employees as e
inner join departments as d
on e.department_id=d.department_id;

#Show employees who are not assigned to any department. 
select e.emp_name  from employees as e
left join departments as d
on e.department_id=d.department_id
where d.department_id is null;

#Show all departments with their employee count. 
select d.department_name ,count(e.emp_id)from departments as d
left join employees as e
on d.department_id=e.department_id
group by d.department_id;

#. Show project name with employee assigned.
select p.project_name ,e.emp_name from projects as p
left join employees as e
on p.emp_id=e.emp_id;

#Show employees who work in same department as ‘Ravi’

SELECT e2.emp_name
FROM employees e1
JOIN employees e2
ON e1.department_id = e2.department_id
WHERE e1.emp_name = 'Ravi' 
  AND e2.emp_name != 'Ravi';
