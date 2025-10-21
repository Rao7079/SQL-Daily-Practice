create database diwali;
CREATE TABLE day7 (
    emp_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(30),
    salary INT,
    join_date DATE
);
INSERT INTO day7(emp_id, employee_name, department, salary, join_date) VALUES
(101, 'Aman Gupta', 'Sales', 45000, '2023-11-10'),
(102, 'Raj Verma', 'IT', 52000, '2024-02-15'),
(103, 'Ravi Sharma', 'HR', 61000, '2022-09-01'),
(104, 'Priya Singh', 'Sales', 70000, '2024-05-12'),
(105, 'Neha Patel', 'Finance', 48000, '2023-03-20'),
(106, 'Arjun Mehta', 'IT', 75000, '2024-07-01'),
(107, 'Sneha Joshi', 'Marketing', 54000, '2024-01-20'),
(108, 'Ankit Kumar', 'Sales', 82000, '2024-08-10'),
(109, 'Deepak Jain', 'HR', 39000, '2022-12-05'),
(110, 'Akash Yadav', 'Finance', 63000, '2023-10-18');

select * from day7;

 #Find total salary of all employees. 
 select sum(salary) as total_salary from day7;
 
# Find average salary of each department. 
select department ,avg(salary) from day7
group by department;

# Find number of employees in each department. 
select department ,count(*) as number_of_emp from day7
group by department;

# Find departments having more than 2 employees. 
select department ,count(*) as number_of_emp from day7
group by department
having count(*)>2;

# Find employees whose salary is between 40000 and 80000. 
select * from day7
where salary between 40000 and 80000;
