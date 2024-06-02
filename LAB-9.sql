-- Creating and inserting records into Computer and Electrical tables
CREATE TABLE Computer (
    RollNo INT,
    Name VARCHAR(50)
);

CREATE TABLE Electrical (
    RollNo INT,
    Name VARCHAR(50)
);

INSERT INTO Computer (RollNo, Name) VALUES
(101, 'Ajay'),
(109, 'Haresh'),
(115, 'Manish');

INSERT INTO Electrical (RollNo, Name) VALUES
(105, 'Ajay'),
(107, 'Mahesh'),
(115, 'Manish');

-- 1. Display name of students who are either in Computer or in Electrical.
SELECT Name FROM Computer
UNION
SELECT Name FROM Electrical;

-- 2. Display name of students who are either in Computer or in Electrical including duplicate data.
SELECT Name FROM Computer
UNION ALL
SELECT Name FROM Electrical;

-- 3. Display name of students who are in both Computer and Electrical.
SELECT Name 
FROM Computer 
INNER JOIN Electrical ON Computer.Name = Electrical.Name;

-- 4. Display name of students who are in Computer but not in Electrical.
SELECT Name FROM Computer
EXCEPT
SELECT Name FROM Electrical;

-- 5. Display name of students who are in Electrical but not in Computer.
SELECT Name FROM Electrical
EXCEPT
SELECT Name FROM Computer;

-- 6. Display all the details of students who are either in Computer or in Electrical.
SELECT * FROM Computer
UNION
SELECT * FROM Electrical;

-- 7. Display all the details of students who are in both Computer and Electrical.
SELECT C.RollNo, C.Name 
FROM Computer C
INNER JOIN Electrical E ON C.Name = E.Name;

-- Creating and inserting records into Cricket table
CREATE TABLE Cricket (
    Name VARCHAR(50),
    City VARCHAR(50),
    Age INT
);

INSERT INTO Cricket (Name, City, Age) VALUES
('Sachin Tendulkar', 'Mumbai', 30),
('Rahul Dravid', 'Bombay', 35),
('M. S. Dhoni', 'Jharkhand', 31),
('Suresh Raina', 'Gujarat', 30);

-- 1. Create table World cup from Cricket with all the columns.
SELECT * INTO WorldCup FROM Cricket;

-- 2. Create table T20 from Cricket with first two columns with no data.
SELECT Name, City INTO T20 FROM Cricket WHERE 1 = 2;

-- 3. Create table IPL From Cricket with No Data
SELECT Name, City, Age INTO IPL FROM Cricket WHERE 1 = 2;

-- 4. Insert the Data into IPL from Cricket Whose Second Character Should Be ‘A’ And String Should Have At least 7 Characters in Cricket Name Field.
INSERT INTO IPL (Name, City, Age)
SELECT Name, City, Age
FROM Cricket
WHERE Name LIKE '_a%';

-- 5. Delete All the Rows From IPL.
DELETE FROM IPL;

-- 6. Delete the Detail of Cricketer Whose City is Jharkhand.
DELETE FROM Cricket WHERE City = 'Jharkhand';

-- 7. Rename the Table IPL to IPL2018.
EXEC sp_rename 'IPL', 'IPL2018';

-- 8. Destroy Table T20 with All the Data.
DROP TABLE T20;