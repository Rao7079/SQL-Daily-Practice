select * from employees;

#11. Find the Nth highest salary from the Employee table.
 SELECT DISTINCT salary AS nth_highest_salary FROM employees
 ORDER BY salary DESC
 LIMIT 1 OFFSET 2;
 
# 12. Find employees who have the same salary. 
select emp_name, salary from employees
where salary in (select salary from employees 
					group by salary 
					having count(*) >1
                    order by salary desc);
			
#13. Find the highest salary in each department. 
select e. dept_id, max(salary) from employees as e
group by dept_id ;

#14. Find the top 3 salaries in each department.
select * from ( select emp_name ,dept_id,salary,
dense_rank() over(partition by dept_id order by salary desc )as drk
from employees) t
where drk<=3;

#15. Find customers who placed more than 5 orders.
select * from orders;

select customer_id from orders
group by customer_id
having count(*)>5;

#16. Find customers who ordered in January but not in February.
select customer_id from orders
where month(order_date) =1 and customer_id not in (select customer_id from  orders where month (order_date)=2)
group by customer_id;


