create database Day4;
CREATE TABLE practice (
    emp_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(30),
    salary INT,
    join_date DATE
);
INSERT INTO practice (emp_id, employee_name, department, salary, join_date) VALUES
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


# 1 Display all data from the employees table
select * from practice;

# 2 Show only employee_name and salary columns. 
select employee_name ,salary from practice;

# 3 Show employees whose salary is greater than 50000
select * from practice
where salary >50000;

# 4 Show employees from department Sales. 
select * from practice
where department in ('sales');

select * from practice
where department ='sales';


# 5 Show all employees in ascending order of salary
select * from practice
order by salary asc;


