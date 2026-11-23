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



