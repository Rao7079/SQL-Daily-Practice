 
 select * from orders;
 #Find the total sales per month.
 select month(order_date) ,sum(amount) from orders
 group by month(order_date);
 
 #Find employees earning more than dept average
 select emp_name,salary ,dept_id from employees as e
 where salary > ( select  avg(salary) from employees  where dept_id=e.dept_id);
 
 #Find departments with no employees
 
 select d.dept_id,d.dept_name from departments as d
 left join employees as e
 on e.dept_id=d.dept_id
 where e.emp_id IS NULL;
 
#Find employees with duplicate email IDs
SELECT emp_name, email FROM Employees
WHERE email IN (SELECT email FROM Employees GROUP BY email
HAVING COUNT(*) > 1 )
ORDER BY email;


 

 
 
 
 