--Data Definition Questions: (using SQL NOT GUI)
--==============================================
create database CompanyTest
go
use CompanyTest
go
--==============================================
--Q01. Create a table named "Employees" with columns for ID (integer),Name (varchar), and Salary (decimal).
create table Employees
(
	id int,
	[name] varchar(20),
	salary decimal(10,2)
)
--==============================================
--Q02. Add a new column named "Department" to the "Employees" table with data type varchar(50).

alter table Employees
add Department varchar(50)
--==============================================
--Q03. Remove the "Salary" column from the "Employees" table.
alter table Employees
drop column Salary
--==============================================
--Q04. Rename the "Department" column in the "Employees" table to "DeptName".
exec sp_rename '[dbo].[Employees].Department' , 'DeptName' , 'column'
--==============================================
--Q05. Create a new table called "Projects" with columns for ProjectID (integer) and ProjectName (varchar).
create table Projects
(
	project_id int,
	project_name varchar(20)
)
--==============================================
--Q06. Add a primary key constraint to the "Employees" table for the "ID" column.
alter table Employees
add constraint PK_Employees
primary key (id)

-- give me error [Cannot define PRIMARY KEY constraint on nullable column in table 'Employees'.]
--so i will make the column "not null" first :)
alter table Employees
alter column id int not null
--==============================================
--Q07. Create a foreign key relationship between the
--     "Employees" table (referencing "ID") and the
--     "Projects" table (referencing "ProjectID").

-- i assume :- 
-- Employee -- M:1 -- Project    and the relationship (work_on)

--1. make "project_id" not null -> to be PK in [Projects]
alter table Projects
alter column project_id int not null 
-------
--2. project_id  -> PK
alter table Projects
add constraint PK_Projects
primary key(project_id)
-------
--3. now i can add fK in Employees -> refereneces Projects(project_id) 

/*-- in this case SSMS -> will name the constraint itself :)
alter table Employees
add project_id int references Projects(project_id)

exec sp_help 'Employees' --FK__Employees__proje__3A81B327

alter table Employees
drop FK__Employees__proje__3A81B327

alter table Employees
drop column project_id

*/

-- i need to add & name by myself at the same time :)
-------
alter table Employees
add project_id int,
constraint work_on
foreign key(project_id) references Projects(project_id)
--==============================================
--Q07. Create a foreign key relationship between the
--     "Employees" table (referencing "ID") and the
--     "Projects" table (referencing "ProjectID").

-- the second assumtion :-     but i will not exec it :)
-- Employee -- M:M -- Project   -> third table "Employees_Projects"

create table Employees_Projects
(
	emp_id  int foreign key references Employees(id),
	proj_id int foreign key references Projects(project_id),
	primary key(emp_id , proj_id)

)
--==============================================
--Q08. Remove the foreign key relationship between "Employees" and "Projects."
exec sp_help 'Employees'

alter table Employees
drop work_on
--==============================================
--Q09. Add a unique constraint to the "Name" column in the "Employees" table.
alter table Employees
add constraint unique_Employees_name
unique ([name])

exec sp_help 'Employees'
--==============================================
--Q10. Create a table named "Customers" with columns for 
--     CustomerID (integer), FirstName (varchar),
--     LastName (varchar), and Email (varchar), and Status (varchar).
create table Customers
(
	customer_id int ,
	first_name varchar(20),
	last_name varchar(20),
	email varchar(100),
	[status] varchar(10)
)
--==============================================
--Q11. Add a unique constraint to the combination of "FirstName" and "LastName" columns in the "Customers" table.
alter table Customers
add constraint unique_Customers_first_name_Plus_last_name
unique(first_name,last_name)

/*
--test
insert into Customers(first_name , last_name)
values
('nora','azab'),
('fareda','azab')
*/
--==============================================
--Q12. Add a default value of 'Active' for the "Status" column in the "Customers" table, where the default value should be applied when a new record is inserted.
alter table Customers
add constraint default_Customers_status 
default 'Active' for [status]

/*
--test
insert into Customers(first_name)
values('nour')
select * 
from Customers
*/
--==============================================
--Q13. Create a table named "Orders" with columns for 
--      OrderID (integer), CustomerID (integer), 
--      OrderDate (datetime), and TotalAmount (decimal).
create table Orders
(
	order_id int,
	customer_id int,
	order_date datetime2,
	total_amount decimal(10,2)
)
--==============================================
--Q14. Add a check constraint to the "TotalAmount" column in the "Orders" table to ensure that it is greater than zero.
alter table Orders
add constraint chk_Orders_TotalAmount
check (total_amount>0)

/*
--test
insert into Orders(total_amount)
values(-100)

select * from Orders
*/
--==============================================

