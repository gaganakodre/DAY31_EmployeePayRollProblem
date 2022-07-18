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

----------------UC5 retrive according to the start date range-------------
----------CAST METHOD USED FOR CONVERTING VARIALBLE TO THE DATA TYPE-----------
SELECT * FROM  employee_payroll where StartDate between CAST('2019-04-01' as date) and GETDATE();

------------UC6-we have to add the other column as a gender tocexisting table------------
ALTER TABLE employee_payroll
ADD Gender char(1); 
UPDATE employee_payroll set Gender='F';
UPDATE employee_payroll set Salary=60000 where Name='Gowri';
UPDATE employee_payroll set Salary=60001,StartDate=getdate() where Name='Gowri';
UPDATE employee_payroll set Salary=60001 where Name='Gagana';
UPDATE employee_payroll set Salary=60001 where Name='ganu';
------------UC7-sum,avrage,min,max,count-------------------
SELECT * FROM  employee_payroll;
SELECT SUM(Salary) as TotalSalary from employee_payroll;
SELECT avg(Salary) as AvergeSalary from employee_payroll;
SELECT  MIN(Salary) as MINIMUMSalary from employee_payroll;
SELECT MAX(Salary) as MaximumSalary from employee_payroll;
SELECT COUNT(Salary) from employee_payroll;

------TO GET THE MINIMUM SALARY WITH MINIMUM SALARY------------
SELECT * FROM employee_payroll Salary where
 Salary=(select min(Salary)as MINIMUMSALARY FROM employee_payroll);

 SELECT * FROM employee_payroll Salary where
 Salary=(select MAX(Salary)as MAXIMUMSALARY FROM employee_payroll);

 SELECT Name,StartDate FROM employee_payroll Salary where
 Salary=(select MAX(Salary)as MAXIMUMSALARY FROM employee_payroll);

 --------TO count the male and female separetly to all the employee-------
 SELECT COUNT(Salary)  from employee_payroll group by gender;
 -----------we aslo displaying the gender column-------------
 SELECT COUNT(Salary) as generCount,gender from employee_payroll group by gender;
  --------TO count the male and female separetly to particular the employee-------
--------UC8-Extending the table bye by adding dept,phonr,address columns---------
ALTER TABLE employee_payroll
ADD PhoneNumber bigint;
 --while adding not null we have to pass default values because we are altering it----------
ALTER TABLE employee_payroll
ADD Department varchar(200)NOT NULL default'HR';
 
select * from employee_payroll;

ALTER TABLE employee_payroll
ADD Address varchar(200) default 'Bengaluru';

-------------UC9 Extend the employee table----------------
ALTER TABLE employee_payroll ADD BasicSalary float,Deductions float,TaxablePay float,IncomeTax float,NetPay float;
--------------UC10 ability to make same employee for the two different department-----------
SELECT* FROM  employee_payroll;
UPDATE employee_payroll set Department='Sales', Address ='Bengaluru',BasicSalary=456786, Deductions=200,TaxablePay=3000 where Name='Gowri';
UPDATE employee_payroll set Department='Marketing', Address ='Bengaluru',BasicSalary=456796, Deductions=300,TaxablePay=2000 where Name='Shree';
UPDATE employee_payroll set Department='HR',Address ='Bengaluru',BasicSalary=356786, Deductions=270,TaxablePay=3000 where Name='Gagana';
UPDATE employee_payroll set Department='Marketing',Address ='Bengaluru',BasicSalary=459786, Deductions=280,TaxablePay=3000 where Name='ganu';
UPDATE employee_payroll set Department='Sales', Address ='Bengaluru',BasicSalary=456786, Deductions=200,TaxablePay=3000 where Name='Ganesh';
UPDATE employee_payroll set Department='Sales', Address ='Bengaluru',BasicSalary=456786, Deductions=200,TaxablePay=3000 where Name='Srikantha';
-----INSERTING ONE MORE ROW WITH SAME EMPLOYEE DETAILS-----------------

INSERT INTO employee_payroll(Name,Salary,StartDate,Gender,PhoneNumber,Department,Address,BasicSalary,Deductions,TaxablePay,IncomeTax,NetPay)
VALUES('Ganesh',50002,'2008-02-02','M',5436787654,'Marketing','Mysore',4567860,200,3000,8765,600000);

-------UC11-creating the new tables for many to many relation-----------------
SELECT* FROM  EmployeeDept;
CREATE TABLE EmployeeDept(
DeptId int identity(1,1) PRIMARY KEY,

EmployeeID int FOREIGN KEY REFERENCES employee_payroll(Id));
SELECT* FROM  EmployeeDept;
INSERT INTO EmployeeDept(EmployeeID) values(1);
INSERT INTO EmployeeDept(EmployeeID) values(2);
INSERT INTO EmployeeDept(EmployeeID) values(3);
INSERT INTO EmployeeDept(EmployeeID) values(4);
INSERT INTO EmployeeDept(EmployeeID) values(5);
INSERT INTO EmployeeDept(EmployeeID) values(6);
INSERT INTO EmployeeDept(EmployeeID) values(7);
