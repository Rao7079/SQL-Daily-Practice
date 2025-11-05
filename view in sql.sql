#View
#-> View is also known as Virtual Table
#-> it store in database but not in paramently when you drop the main table then view table automatically delete
#-> The main use of view is read purpose and easier to understand to complex query 


create database views;
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY AUTO_INCREMENT,
    EmpName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);
INSERT INTO Employees (EmpName, Department, Salary) VALUES
('Amit', 'HR', 48000),
('Neha', 'Finance', 55000),
('Ravi', 'IT', 72000),
('Pooja', 'Marketing', 45000),
('Rahul', 'IT', 60000),
('Sneha', 'Finance', 51000);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(50),
    City VARCHAR(50),
    Amount DECIMAL(10,2)
);	
INSERT INTO Sales (CustomerName, City, Amount) VALUES
('Riya', 'Delhi', 58000),
('Arjun', 'Mumbai', 40000),
('Sneha', 'Delhi', 67000),
('Karan', 'Kolkata', 30000),
('Priya', 'Delhi', 52000),
('Raj', 'Bangalore', 45000),
('Anjali', 'Delhi', 49000),
('Rohit', 'Pune', 55000),
('Tina', 'Delhi', 60000),
('Vikas', 'Chennai', 47000);

select * from employees;
select * from sales;

#TASKS
/*Create a view named HighSalary to show all employees with salary greater than 50000.
Display all records from the HighSalary view.
Drop the view HighSalary.Tasks:
Create a view Delhi_Sales for all customers from Delhi.
Create a view HighValue_Sales for sales above ₹50,000.
Use SELECT * FROM HighValue_Sales; to see the result.
Update the Amount for customer ‘Riya’ to 62000 using the view.
Drop the HighValue_Sales view. */

# 1 Create a view named HighSalary to show all employees with salary greater than 50000.
create view HighSalary as
select * from employees
where salary > 50000;


# 2 Display all records from the HighSalary view.
select * from highsalary;

# 3 Drop the view HighSalary.
drop  view highsalary;

# 4 Create a view Delhi_Sales for all customers from Delhi.
create view Delhi_sales as
select * from sales
where city in ('Delhi');

#5 Create a view HighValue_Sales for sales above ₹50,000.
create view HighValue_Sales as
select * from sales
where Amount > 50000;

# 6 Use SELECT * FROM HighValue_Sales; to see the result.

SELECT * FROM HighValue_Sales;

# 7 Update the Amount for customer ‘Riya’ to 62000 using the view.
SET SQL_SAFE_UPDATES = 0;
update highvalue_sales
set amount = 62000
where CustomerName ='Riya';

# 8 Drop the HighValue_Sales view. */
Drop view highvalue_sales;


#advance 
-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

-- Insert Data into Customers
INSERT INTO Customers (CustomerID, CustomerName, City)
VALUES
(101, 'Rahul', 'Delhi'),
(102, 'Priya', 'Mumbai'),
(103, 'Neha', 'Delhi'),
(104, 'Aman', 'Chennai');

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert Data into Orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(1, 101, '2024-01-05', 15000),
(2, 102, '2024-02-10', 20000),
(3, 101, '2024-03-15', 12000),
(4, 103, '2024-03-20', 18000),
(5, 104, '2024-04-01', 25000);

-- Create Products Table
CREATE TABLE Products (
    ProductID VARCHAR(10) PRIMARY KEY,
    ProductName VARCHAR(50),
    Price INT
);

-- Insert Data into Products
INSERT INTO Products (ProductID, ProductName, Price)
VALUES
('P1', 'Laptop', 60000),
('P2', 'Mobile', 20000),
('P3', 'Tablet', 30000);

select * from customers;
select * from products;
select * from orders;

/*Q1. Create a Complex View
Create a view named Customer_Orders_View that shows:
CustomerName ,City ,OrderID,OrderDate ,TotalAmount*/
create view Customer_orders_view as
select c. CustomerName , c.city , o.OrderID , o.OrderDate , o.TotalAmount from customers as c
join orders as o 
on c.CustomerID=o.CustomerID;
select * from Customer_orders_view;

/*Q2. Create a View with Aggregation

Create a view City_Sales_Summary that shows:
City,Total number of orders (COUNT),Total sales amount (SUM)*/

create  view City_Sales_Summary as
select c.city ,count( o.OrderID ) , sum(o.TotalAmount)  as  Total_Sales_Amount from customers as c
join orders as o
on c.CustomerID =o.CustomerID
group by c.city;

#From the view City_Sales_Summary, show only those cities whose total sales > 30000.
select * from  City_Sales_Summary 
where  Total_Sales_Amount  > 30000;



