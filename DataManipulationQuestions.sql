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


