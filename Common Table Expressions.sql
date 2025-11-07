create database cte;
CREATE TABLE employees (
  EmpID INT,
  EmpName VARCHAR(50),
  Department VARCHAR(30),
  Salary INT,
  ManagerID INT
);

INSERT INTO employees (EmpID, EmpName, Department, Salary, ManagerID) VALUES
(1, 'Rakesh Kumar', 'IT', 55000, 5),
(2, 'Aman Singh', 'HR', 40000, 6),
(3, 'Priya Sharma', 'Finance', 42000, 6),
(4, 'Rohit Verma', 'IT', 60000, 5),
(5, 'Sneha Patel', 'IT', 75000, NULL),
(6, 'Ankit Yadav', 'HR', 70000, NULL),
(7, 'Komal Gupta', 'Finance', 48000, 3),
(8, 'Suresh Das', 'IT', 45000, 5),
(9, 'Nisha Jain', 'HR', 37000, 6),
(10, 'Kunal Roy', 'Finance', 39000, 3);

/*
Q1. Write a CTE to display all employees whose salary is greater than 45000.
Q2. Create a CTE to find employees who work in the “IT” department.
Q3. Write a CTE that calculates the average salary of each department, then select all records from it.
Q4. Create a CTE to find employees whose salary is below the average salary of all employees.
Q6. Write a CTE to find the top 3 highest-paid employees overall.
Q5. Create a CTE (DeptSummary) that shows each department with total employees and average salary.
Then, select departments having an average salary greater than 45000.
Q7. Use a CTE to list all employees and include their manager names.
(Hint: self join using ManagerID and EmpID)
Q8. Create a CTE to find employees who earn more than the average salary of their department.
Q9. Using CTE, display department-wise maximum and minimum salary.
Q10. Create a CTE that lists employees with salary between 40000 and 60000, then from that CTE, filter only “IT” department employees.
*/

#Q1. Write a CTE to display all employees whose salary is greater than 45000.
with HighSalary as(
select * from employees
where Salary >45000
)
select * from HighSalary;

#Q2. Create a CTE to find employees who work in the “IT” department.
with ItEmployee as(
select * from employees
where Department ='IT'
)
select * from ItEmployee;

#Q3. Write a CTE that calculates the average salary of each department, then select all records from it.
with deptavg as(
select Department,avg(salary) from employees
group by Department
)
select * from deptavg;

#Q4. Create a CTE to find employees whose salary is below the average salary of all employees.
with BelowAvgSal as(
select avg(Salary) as average from employees
)
select e.EmpName,e.Department ,e.Salary from employees as e
 ,BelowAvgSal as B
 where  e.Salary < B.average;
 
 /*Q5. Create a CTE (DeptSummary) that shows each department with total employees and average salary.
Then, select departments having an average salary greater than 45000.
*/
with DeptSummary as(
select Department ,count(EmpID)as total  ,avg(Salary) as average from employees
group by Department)
select * from DeptSummary
where average >45000;

	