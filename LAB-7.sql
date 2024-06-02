--Date Functions--
--Current date & time
SELECT GETDATE() AS Today_Date;

--New date after 365 days from today
SELECT DATEADD(DAY, 365, GETDATE()) AS New_Date_After_365_Days;

--Current date in the format "may 5 1994 12:00AM"
SELECT CONVERT(VARCHAR, GETDATE(), 107) AS Current_Date_Formatted;

--Current date in the format "03 Jan 1995"
SELECT FORMAT(GETDATE(), 'dd MMM yyyy') AS Current_Date_Formatted;

--Current date in the format "Jan 04, 96"
SELECT FORMAT(GETDATE(), 'MMM dd, yy') AS Current_Date_Formatted;

--Total number of months between '31-Dec-08' and '31-Mar-09'
SELECT DATEDIFF(MONTH, '2008-12-31', '2009-03-31') AS Total_Months;

--Total number of years between '25-Jan-12' and '14-Sep-10'
SELECT DATEDIFF(YEAR, '2010-09-14', '2012-01-25') AS Total_Years;

--Total number of hours between '25-Jan-12 7:00' and '26-Jan-12 10:30'
SELECT DATEDIFF(HOUR, '2012-01-25 07:00', '2012-01-26 10:30') AS Total_Hours;

--Extract Day, Month, Year from the given date '12-May-16'
SELECT DAY('2016-05-12') AS Day, MONTH('2016-05-12') AS Month, YEAR('2016-05-12') AS Year;

--Add 5 years to the current date
SELECT DATEADD(YEAR, 5, GETDATE()) AS Date_Plus_5_Years;

--Subtract 2 months from the current date
SELECT DATEADD(MONTH, -2, GETDATE()) AS Date_Minus_2_Months;

--Extract month from the current date using datename() and datepart() function
SELECT DATENAME(MONTH, GETDATE()) AS Month_Name, DATEPART(MONTH, GETDATE()) AS Month_Number;

--Last date of the current month
SELECT DATEADD(DAY, -1, DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()) + 1, 0)) AS Last_Date_Of_Current_Month;

--Date & time after 30 days from today
SELECT DATEADD(DAY, 30, GETDATE()) AS Date_Time_After_30_Days;

--Calculate age in years and months
SELECT DATEDIFF(YEAR, 'YYYY-MM-DD', GETDATE()) AS Years, DATEDIFF(MONTH, 'YYYY-MM-DD', GETDATE()) % 12 AS Months;

--Aggregate Functions--
--Create table Student_Marks
CREATE TABLE Student_Marks (
    Sid INT NOT NULL,
    SName VARCHAR(50) NOT NULL,
    Marks INT NOT NULL
);

--Insert data into Student_Marks table
INSERT INTO Student_Marks (Sid, SName, Marks)
VALUES (1, 'John', 90),
       (2, 'Martin', 80),
       (3, 'Carol', 89),
       (4, 'Jack', 99),
       (5, 'Rose', 88),
       (6, 'Mary', 90);

--Find total number of students
SELECT COUNT(*) AS Total_Students FROM Student_Marks;

--Total marks scored by all students
SELECT SUM(Marks) AS Total_Marks FROM Student_Marks;

--Average marks of all students
SELECT AVG(Marks) AS Average_Marks FROM Student_Marks;

--Minimum marks scored from all students
SELECT MIN(Marks) AS Minimum_Marks FROM Student_Marks;

--Maximum marks scored from all students
SELECT MAX(Marks) AS Maximum_Marks FROM Student_Marks;