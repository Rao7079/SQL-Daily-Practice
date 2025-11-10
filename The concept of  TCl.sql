/* TCL stands for Transaction Control Language.
It is used to manage transactions in a database and works together with DML (Data Manipulation Language) commands like INSERT, UPDATE, and DELETE.
Main TCL Commands:
Commit :- Save all change permanently
Rollback:- Undo all changes since the last commit
*/
create database tcl;
CREATE TABLE accounts (
  account_id INT PRIMARY KEY,
  name VARCHAR(50),
  balance DECIMAL(10,2)
);

INSERT INTO accounts (account_id, name, balance) VALUES
(1, 'Ravi Kumar', 5000.00),
(2, 'Sita Verma', 3000.00),
(3, 'Aman Singh', 4500.00),
(4, 'Priya Sharma', 6000.00),
(5, 'Rohit Mehta', 7500.00),
(6, 'Neha Patel', 5200.00),
(7, 'Ankit Yadav', 4700.00),
(8, 'Komal Gupta', 6800.00),
(9, 'Vikas Jain', 3900.00),
(10, 'Pooja Rani', 8100.00);

select * from accounts;
#Now suppose Ravi transfers ₹1000 to Sita.
start transaction;
update accounts
set balance= balance -1000  
where account_id =1; #Ravi pays 1000
update accounts
set balance=balance+1000
where account_id =2; # Sita receives 1000

commit ;# here u save the transaction permamently

start transaction;
update accounts
set balance = balance -1000
where account_id=1; #-- Ravi pays 500

update accounts
set balance =balance +1000
where account_id=3; #-- Aman receives 500

#You’ll see Ravi’s balance ↓1000 and Aman’s balance ↑1000.
#But it’s not permanent yet.

#You realize the transfer was a mistake
rollback;
select * from accounts;

/*task 1
Transfer ₹1000 from Pooja Rani to Vikas Jain.
*/
/*Task 2
Basic Transaction with ROLLBACK
Goal: Try transferring ₹500 from Ravi (id=1) to Sita (id=2), then cancel it.
*/
/*
Task 3 — Using SAVEPOINT and ROLLBACK TO
Goal: Try a multi-step transaction but rollback partially.
*/
/*
Task 4 — Mistaken Commit Fix
Goal: Suppose you transferred ₹700 from Vikas (id=9) to Pooja (id=10) and committed it.
But you realize it was a mistake — how will you correct it?
Perform a reverse transaction (Pooja → Vikas ₹700) and COMMIT.
*/

#Perfrom Task 1
start Transaction;
update accounts
set balance=balance-1000
where account_id=9;
update accounts
set balance=balance+1000
where account_id=10;
select * from accounts;

#perform Task 2
start transaction;
update accounts
set balance = balance-500
where account_id=1;
update accounts
set balance = balance+500
where account_id=2;
rollback;

# Perform Task 3 
start transaction;
update accounts set balance = balance-500 where account_id=1;
update accounts set balance = balance+500 where account_id=2;
savepoint first_transfer;
select * from accounts;
update accounts set balance = balance-1000 where account_id=3;
update accounts set balance = balance+1000 where account_id=4;
savepoint second_transfer;
rollback to first_transfer;

/* Perform Task 4*/
start Transaction;
update accounts set balance =balance-500 where account_id =5;
update accounts set balance =balance+500 where account_id =6;
commit;
start Transaction;
update accounts set balance =balance-500 where account_id =6;
update accounts set balance =balance+500 where account_id =5;
commit;
select * from accounts;



