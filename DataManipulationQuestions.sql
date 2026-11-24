--Data Manipulation Questions:
--==============================================
--Q01. Select all columns from the "Employees" table
select *
from Employees
--==============================================
--Q02. Select only the "Name" and "Salary" columns from the "Employees" table.
-----------
--1. i dropped salary column before:)
alter table Employees
add salary decimal(10,2)
-----------
--2. i will modify the dummy data in Data/SampleData.sql after adding salary:)
truncate table Employees 
-----------
select [name] , salary
from Employees
--==============================================
--Q03. Select distinct values of the "DeptName" column from the "Employees" table.
select distinct DeptName
from Employees
--==============================================
--Q04. Select the top 5 records from the "Employees" table.
select top 5 *
from Employees
--==============================================
--Q05. Select all records from the "Employees" table, ordered by the "Salary" column in descending order.
select *
from Employees
order by salary desc
--==============================================
--Q06. Select the first 10 records from the "Employees" table, starting from the third record.
select * from Employees

select top 10 *
from Employees
where id != 1 and id !=2