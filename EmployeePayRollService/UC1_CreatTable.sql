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

---------to insert data into the table UC3--------------
INSERT INTO employee_payroll
VALUES('Ganesh',50002,'2008-02-02','M'),('Srikantha',50003,'2011-04-01','M');

INSERT INTO employee_payroll(Name,StartDate)
VALUES('Gagana','2020-02-02'),('ganu','2019-07-01');

-----retrive data UC4---------
SELECT * FROM  employee_payroll;--to retrive all the data---------
SELECT Id,Name FROM  employee_payroll;------to retrive id and name-----------

------------UC6-we have to add the other column as a gender tocexisting table------------
ALTER TABLE employee_payroll
ADD Gender char(1); 
UPDATE employee_payroll set Gender='F';
UPDATE employee_payroll set Salary=60000 where Name='Gowri';
UPDATE employee_payroll set Salary=60001,StartDate=getdate() where Name='Gowri';