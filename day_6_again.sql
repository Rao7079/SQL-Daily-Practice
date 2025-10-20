create database diwali;
CREATE TABLE day6 (
    emp_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(30),
    salary INT,
    join_date DATE
);
INSERT INTO day6 (emp_id, employee_name, department, salary, join_date) VALUES
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

select * from day6;

# Show top 5 highest paid employees. 
select * from day6
order by salary desc
limit 5;

#Show all unique department names. 
select  distinct(department) from day6;

# Show employees whose name starts with ‘A’. 
select * from day6
where employee_name like'A%';

# Show employees who joined after 2024-01-01. 
select * from day6
where join_date > '2024-01-01';

# Find total number of employees
select count(*) from day6;
