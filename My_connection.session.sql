/* to create a databse */
 CREATE DATABASE MYASSIGNMENT;
/* to see our database is created or not */
 show databases;
/* To use an existed databases */
 USE MYASSIGNMENT;
/* to create a table Employeedetails */
 CREATE TABLE EmployeeDetails (
         EmpId INT PRIMARY KEY,
          FullName VARCHAR(255),
          ManagerId INT,
          DateOfJoining DATE,
          City VARCHAR(100)
     );
/* to see created table */
show tables;
/* to insert values into Employeedetails. */
 INSERT INTO EmployeeDetails (EmpId, FullName, ManagerId, DateOfJoining, City)
     VALUES
          (1, 'John Doe', NULL, '2022-01-10', 'New York'),
          (2, 'Jane Smith', 1, '2021-05-15', 'Los Angeles'),
          (3, 'Bob Johnson', 1, '2023-03-20', 'Chicago'),
          (4, 'Alice Williams', 2, '2020-11-05', 'San Francisco'),
          (5, 'Charlie Brown', 2, '2022-08-30', 'Seattle'),
          (6, 'Eva Davis', 3, '2021-02-18', 'Boston'),
          (7, 'Michael Lee', 3, '2023-01-25', 'Dallas'),
          (8, 'Emily White', 4, '2020-07-12', 'Miami'),
          (9, 'Samuel Clark', 4, '2022-04-08', 'Houston'),
          (10, 'Olivia Taylor', 5, '2021-09-14', 'Denver');

/* to create table Employeesalary */
  CREATE TABLE EmployeeSalary (
          EmpId INT PRIMARY KEY,
          Project VARCHAR(100),
          Salary DECIMAL(10, 2),
          Variable VARCHAR(50)
      );

/* to see Employeesalary table. */

show tables;

/* to insert values into Employeesalary. */

  INSERT INTO EmployeeSalary (EmpId, Project, Salary, Variable)
      VALUES
          (1, 'ProjectA', 75000.00, 'Bonus'),
          (2, 'ProjectB', 80000.00, 'Incentive'),
          (3, 'ProjectC', 70000.00, 'VariableA'),
          (4, 'ProjectA', 90000.00, 'Bonus'),
          (5, 'ProjectD', 85000.00, 'Incentive'),
          (6, 'ProjectB', 72000.00, 'VariableB'),
          (7, 'ProjectC', 95000.00, 'Bonus'),
          (8, 'ProjectD', 78000.00, 'VariableA'),
          (9, 'ProjectA', 85000.00, 'Incentive'),
          (10, 'ProjectB', 92000.00, 'VariableB');

/* to see inserted data in Employeedetails. */
 SELECT*FROM employeedetails;

/* to see inserted data in Employeesalary. */
 SELECT*FROM employeesalary;

/* SQL Query to fetch records that are present in 
one table but not in another table: */

  SELECT * FROM EmployeeDetails
     WHERE EmpId NOT IN (SELECT EmpId FROM EmployeeSalary);

/* SQL Query to fetch records that are present in 
one table AND ALSO in another table */   

 SELECT * FROM EmployeeDetails
      WHERE EmpId  IN (SELECT EmpId FROM EmployeeSalary);

/* SQL query to fetch all the employees who are not working on any project: */

-- SELECT * FROM EmployeeDetails
--      WHERE EmpId NOT IN (SELECT EmpId FROM EmployeeSalary WHERE Project IS NOT NULL);

/* SQL query to fetch all the employees who are  working on any project: */

 SELECT * FROM EmployeeDetails
      WHERE EmpId NOT IN (SELECT EmpId FROM EmployeeSalary WHERE Project IS  NULL);

/* SQL query to fetch all the Employees from EmployeeDetails who joined in the Year 2020 */

 SELECT * FROM EmployeeDetails
      WHERE YEAR(DateOfJoining) = 2020;

/* Fetch all employees from EmployeeDetails who have a salary record in EmployeeSalary: */

 SELECT * FROM EmployeeDetails
      WHERE EmpId IN (SELECT EmpId FROM EmployeeSalary);

/* Write an SQL query to fetch a project-wise count of employees: */

 SELECT Project, COUNT(EmpId) AS EmployeeCount
 FROM EmployeeSalary
 GROUP BY Project;


/* Fetch employee names and salaries even if the salary value is not present for the employee: */

 SELECT ED.FullName, ES.Salary
 FROM EmployeeDetails ED
 LEFT JOIN EmployeeSalary ES ON ED.EmpId = ES.EmpId;

/* Write an SQL query to fetch all the Employees who are also managers: */

 SELECT ED.*
 FROM EmployeeDetails ED
 JOIN EmployeeDetails M ON ED.EmpId = M.ManagerId;

/* Write an SQL query to fetch duplicate records from EmployeeDetails: */

 SELECT EmpId, COUNT(*)
 FROM EmployeeDetails
 GROUP BY EmpId
 HAVING COUNT(*) > 1;


/* Write an SQL query to fetch only odd rows from the table: */

SELECT * FROM EmployeeDetails
 WHERE EmpId % 2 <> 0;


/* Write a query to find the 3rd highest salary from a table without top or limit keyword: */

SELECT DISTINCT(Salary)
FROM EmployeeSalary e1
WHERE 3 = (SELECT COUNT(DISTINCT Salary) 
           FROM EmployeeSalary e2 
           WHERE e1.Salary <= e2.Salary);
