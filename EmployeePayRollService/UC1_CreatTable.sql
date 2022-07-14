-------create database--------
create database Payroll_Service;
------delete the database--------
-----drop database AddressBookDataBase;-------
-------to get into the db-----
use Payroll_Service;


----to create a table UC2---
create Table employee_payroll(
      Id int identity(1,1) PRIMARY KEY,--first 1=it should be start with  first  row and second indicate 1=increment by 1---
	  Name varchar(200),
	  Salary float,
	  StartDate datetime 

);