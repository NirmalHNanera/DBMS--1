-- Creating tables and inserting records
CREATE TABLE Student (
    Rno INT,
    Name VARCHAR(50),
    Branch VARCHAR(50)
);

CREATE TABLE Result (
    RNo INT,
    SPI DECIMAL(4,2)
);

CREATE TABLE Employee (
    EmployeeNo VARCHAR(50),
    Name VARCHAR(50),
    ManagerNo VARCHAR(50)
);

INSERT INTO Student (Rno, Name, Branch) VALUES
(101, 'Raju', 'CE'),
(102, 'Amit', 'CE'),
(103, 'Sanjay', 'ME'),
(104, 'Neha', 'EC'),
(105, 'Meera', 'EE'),
(106, 'Mahesh', 'ME');

INSERT INTO Result (RNo, SPI) VALUES
(101, 8.8),
(102, 9.2),
(103, 7.6),
(104, 8.2),
(105, 7.0),
(106, 8.9);

INSERT INTO Employee (EmployeeNo, Name, ManagerNo) VALUES
('E01', 'Tarun', NULL),
('E02', 'Rohan', 'E02'),
('E03', 'Priya', 'E01'),
('E04', 'Milan', 'E03'),
('E05', 'Jay', 'E01'),
('E06', 'Anjana', 'E04');

-- 1. Combine information from student and result table using cross join or Cartesian product.
SELECT * 
FROM Student, Result;

-- 2. Display Rno, Name, Branch and SPI of CE branch’s student only.
SELECT S.Rno, S.Name, S.Branch, R.SPI
FROM Student S
INNER JOIN Result R ON S.Rno = R.Rno
WHERE S.Branch = 'CE';

-- 3. Display Rno, Name, Branch and SPI of other than EC branch’s student only.
SELECT S.Rno, S.Name, S.Branch, R.SPI
FROM Student S
INNER JOIN Result R ON S.Rno = R.Rno
WHERE S.Branch <> 'EC';

-- 4. Display average result of each branch.
SELECT S.Branch, AVG(R.SPI) as AverageResult
FROM Student S
INNER JOIN Result R ON S.Rno = R.Rno
GROUP BY S.Branch;

-- 5. Display average result of each branch and sort them in ascending order by SPI.
SELECT S.Branch, AVG(R.SPI) as AverageResult
FROM Student S
INNER JOIN Result R ON S.Rno = R.Rno
GROUP BY S.Branch
ORDER BY AverageResult;

-- 6. Display average result of CE and ME branch.
SELECT S.Branch, AVG(R.SPI) as AverageResult
FROM Student S
INNER JOIN Result R ON S.Rno = R.Rno
WHERE S.Branch IN ('CE', 'ME')
GROUP BY S.Branch;

-- 7. Perform the left outer join on Student and Result tables.
SELECT *
FROM Student
LEFT JOIN Result ON Student.Rno = Result.RNo;

-- 8. Perform the right outer join on Student and Result tables.
SELECT *
FROM Student
RIGHT JOIN Result ON Student.Rno = Result.RNo;

-- 9. Perform the full outer join on Student and Result tables.
SELECT *
FROM Student
FULL OUTER JOIN Result ON Student.Rno = Result.RNo;

-- 10. Retrieve the names of employee along with their manager’s name from the Employee table.
SELECT E.Name as EmployeeName, M.Name as ManagerName
FROM Employee E
LEFT JOIN Employee M ON E.ManagerNo = M.EmployeeNo;

-- Creating tables for Village and City
CREATE TABLE City (
    CityID INT PRIMARY KEY,
    CityName VARCHAR(50) UNIQUE,
    Pincode VARCHAR(6),
    Remarks VARCHAR(250)
);

CREATE TABLE Village (
    VillageID INT PRIMARY KEY,
    VillageName VARCHAR(50),
    CityID INT,
    FOREIGN KEY (CityID) REFERENCES City(CityID)
);

INSERT INTO City (CityID, CityName, Pincode, Remarks) VALUES
(1, 'Rajkot', '360005', 'Good'),
(2, 'Surat', '335009', 'Very Good'),
(3, 'Baroda', '390001', 'Awesome'),
(4, 'Jamnagar', '361003', 'Smart'),
(5, 'Junagadh', '362229', 'Historic'),
(6, 'Morvi', '363641', 'Ceramic');

INSERT INTO Village (VillageID, VillageName, CityID) VALUES
(101, 'Raiya', 1),
(102, 'Madhapar', 1),
(103, 'Dodka', 3),
(104, 'Falla', 4),
(105, 'Bhesan', 5),
(106, 'Dhoraji', 5);

-- 1. Display all the villages of Rajkot city.
SELECT VillageName
FROM Village
WHERE CityID = (SELECT CityID FROM City WHERE CityName = 'Rajkot');

-- 2. Display city along with their villages & pin code.
SELECT C.CityName, V.VillageName, C.Pincode
FROM City C
JOIN Village V ON C.CityID = V.CityID;

-- 3. Display the city having more than one village.
SELECT C.CityName
FROM City C
JOIN Village V ON C.CityID = V.CityID
GROUP BY C.CityName
HAVING COUNT(V.VillageID) > 1;

-- 4. Display the city having no village.
SELECT C.CityName
FROM City C
LEFT JOIN Village V ON C.CityID = V.CityID
WHERE V.VillageID IS NULL;

-- 5. Count the total number of villages in each city.
SELECT C.CityName, COUNT(V.VillageID) as TotalVillages
FROM City C
LEFT JOIN Village V ON C.CityID = V.CityID
GROUP BY C.CityName;

-- 6. Count the number of cities having more than one village.
SELECT COUNT(DISTINCT C.CityID)
FROM City C
JOIN Village V ON C.CityID = V.CityID
GROUP BY C.CityID
HAVING COUNT(V.VillageID) > 1;