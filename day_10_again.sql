CREATE TABLE employes (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    manager_id INT
);
INSERT INTO employes (emp_id, emp_name, department, salary, manager_id) VALUES
(1, 'Aman',   'Sales',    40000, 5),
(2, 'Mark',   'HR',       35000, 6),
(3, 'Raj',    'Sales',    45000, 5),
(4, 'Anjali', 'Sales',    42000, 5),
(5, 'Rohit',  'Finance',  38000, NULL),
(6, 'Neha',   'HR',       50000, NULL),
(7, 'Pooja',  'Finance',  30000, 5),
(8, 'Vivek',  'IT',       60000, 9),
(9, 'Karan',  'IT',       65000, NULL);


select* from employes;

#. Find employees who earn more than the average salary. 
select * from employes
where salary>(select avg(salary) from employes);

#  Find employees who work in the same department as employee ID 3.
SELECT *
FROM employes
WHERE department = (
    SELECT department FROM employes WHERE emp_id = 3
)
AND emp_id <> 3;   -- exclude employee 3 himself

# Find department with highest average salary.
select department,avg(salary)as avg_sl from employes
group by department
order by avg_sl desc
limit 1;

# Find second highest salary.
select* from employes;
select salary from employes
order by salary desc
limit 1 offset 1;

#2nd method
select max(salary) from employes
where salary <(select max(salary)from employes)



