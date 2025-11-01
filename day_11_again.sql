CREATE DATABASE company_db;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2),
    joining_date DATE
);
INSERT INTO employees (employee_name, department, salary, joining_date)
VALUES
('Ravi Kumar', 'HR', 55000, '2021-02-10'),
('Priya Sharma', 'HR', 72000, '2022-05-13'),
('Amit Singh', 'IT', 85000, '2020-09-01'),
('Neha Patel', 'IT', 91000, '2021-04-19'),
('Arjun Mehta', 'IT', 72000, '2023-01-11'),
('Meena Joshi', 'Finance', 67000, '2019-11-20'),
('Suresh Reddy', 'Finance', 82000, '2022-02-10'),
('Kiran Das', 'Finance', 94000, '2023-05-30'),
('Anjali Verma', 'Sales', 61000, '2021-12-15'),
('Rahul Yadav', 'Sales', 75000, '2020-07-25'),
('Pooja Nair', 'Sales', 89000, '2023-03-12');
select * from employees;

# Find top 3 employees by salary per department (use RANK()). 
select * from (select *, rank() over(partition by department order by salary desc ) as top
from employees) as em
where top <=3;

#Find cumulative total salary of employees ordered by joining_date. 
select * ,sum(salary) over (order by joining_date ) as cs
from employees
order by joining_date;

#Create a view named high_salary_employees (salary > 70000). 
create view high_salary_employees as
select * from employees
where salary >70000;

#Write a query using CTE to find average salary per department. 
with baba as 
(select department,avg(salary) from employees 
group by department
)
select * from baba;



