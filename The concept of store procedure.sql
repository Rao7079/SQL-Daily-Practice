''' -> Store procedure is a collection of sql statement that are  stored in the database not in your program.
    -> with the help of store procedure prepared the sql code that you can save so the code  can be reused over and over again
    '''
create database store_procedure;
 CREATE TABLE employee (
  emp_id INT AUTO_INCREMENT PRIMARY KEY,
  emp_name VARCHAR(50),
  department VARCHAR(50),
  salary DECIMAL(10,2)
);
INSERT INTO employee (emp_name, department, salary)
VALUES
('Amit Sharma', 'HR', 40000),
('Priya Verma', 'Finance', 55000),
('Ravi Kumar', 'IT', 60000),
('Sneha Patel', 'HR', 45000),
('John Smith', 'IT', 75000);

select * from employee;

#simple store procedure
delimiter $$
create procedure info()
begin
	select * from employee
    order by salary;
end $$
delimiter ;
call info();

#in proceudre
delimiter $$
create procedure emp_name (in p_id int)
begin
select  emp_name from employee
where emp_id=p_id;
end $$
delimiter ;

#in and out procedure
delimiter $$
create procedure emp_sa(in p_dept varchar(50) , out p_sum int)
Begin
select sum(salary) into p_sum from employee
where department =P_dept;
end $$
Delimiter ;