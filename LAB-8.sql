-- Create EMPLOYEE table
CREATE TABLE Employee (
    EID INT NOT NULL,
    EName VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(8,2) NOT NULL,
    JoiningDate DATETIME NOT NULL,
    City VARCHAR(50) NOT NULL
);

-- Insert records into EMPLOYEE table
INSERT INTO Employee (EID, EName, Department, Salary, JoiningDate, City)
VALUES
(101, 'Rahul', 'Admin', 56000, '1990-01-01', 'Rajkot'),
(102, 'Hardik', 'IT', 18000, '1990-09-25', 'Ahmedabad'),
(103, 'Bhavin', 'HR', 25000, '1991-05-14', 'Baroda'),
(104, 'Bhoomi', 'Admin', 39000, '1991-02-08', 'Rajkot'),
(105, 'Rohit', 'IT', 17000, '1990-07-23', 'Jamnagar'),
(106, 'Priya', 'IT', 9000, '1990-10-18', 'Ahmedabad'),
(107, 'Neha', 'HR', 34000, '1991-12-25', 'Rajkot');

-- 1. Display the Highest, Lowest, Total, and Average salary of all employees
SELECT 
    MAX(Salary) AS Maximum, 
    MIN(Salary) AS Minimum, 
    SUM(Salary) AS Total_Sal, 
    AVG(Salary) AS Average_Sal 
FROM Employee;

-- 2. Find total number of employees of EMPLOYEE table
SELECT COUNT(*) AS Total_Employees FROM Employee;

-- 3. Retrieve maximum salary from IT department
SELECT MAX(Salary) AS Max_Salary_IT FROM Employee WHERE Department = 'IT';

-- 4. Count total number of cities of employees without duplication
SELECT COUNT(DISTINCT City) AS Total_Cities FROM Employee;

-- 5. Display city with the total number of employees belonging to each city
SELECT City, COUNT(*) AS Total_Employees FROM Employee GROUP BY City;

-- 6. Display city having more than one employee
SELECT City FROM Employee GROUP BY City HAVING COUNT(*) > 1;

-- 7. Give total salary of each department of EMPLOYEE table
SELECT Department, SUM(Salary) AS Total_Salary FROM Employee GROUP BY Department;

-- 8. Give average salary of each department of EMPLOYEE table without displaying the respective department name
SELECT AVG(Salary) AS Average_Salary FROM Employee GROUP BY Department;

-- 9. Give minimum salary of an employee who belongs to Ahmedabad
SELECT MIN(Salary) AS Min_Salary_Ahmedabad FROM Employee WHERE City = 'Ahmedabad';

-- 10. List the departments having total salaries more than 50000 and located in city Rajkot
SELECT Department, SUM(Salary) AS Total_Salary FROM Employee WHERE City = 'Rajkot' GROUP BY Department HAVING SUM(Salary) > 50000;

-- 11. Count the number of employees living in Rajkot
SELECT COUNT(*) AS Employees_In_Rajkot FROM Employee WHERE City = 'Rajkot';

-- 12. Display the difference between the highest and lowest salaries
SELECT (MAX(Salary) - MIN(Salary)) AS SAL_DIFFERENCE FROM Employee;

-- 13. Display the total number of employees hired before 1st January, 1991
SELECT COUNT(*) AS Employees_Hired_Before_1991 FROM Employee WHERE JoiningDate < '1991-01-01';

-- 14. Display total salary of each department with total salary exceeding 35000 and sort the list by total salary
SELECT Department, SUM(Salary) AS Total_Salary FROM Employee GROUP BY Department HAVING SUM(Salary) > 35000 ORDER BY Total_Salary;

-- 15. List out department names in which more than two employees
SELECT Department FROM Employee GROUP BY Department HAVING COUNT(*) > 2;

-- 16. Display Minimum salary of Rajkot City
SELECT MIN(Salary) AS Min_Salary_Rajkot FROM Employee WHERE City = 'Rajkot';

-- 17. Display City wise total employees count
SELECT City, COUNT(*) AS Total_Employees FROM Employee GROUP BY City;

-- 18. List all departments with minimum salaries
SELECT Department, MIN(Salary) AS Min_Salary FROM Employee GROUP BY Department;

-- 19. Give Total salaries of each city without displaying the respective city name
SELECT SUM(Salary) AS Total_Salary FROM Employee GROUP BY City;

-- 20. Find department wise Minimum, Maximum & Total Salaries
SELECT Department, MIN(Salary) AS Min_Salary, MAX(Salary) AS Max_Salary, SUM(Salary) AS Total_Salary FROM Employee GROUP BY Department;