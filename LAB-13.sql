CREATE TABLE Student (
    RNo INT PRIMARY KEY,
    Name VARCHAR(50),
    Branch VARCHAR(50),
    SPI DECIMAL(4,2),
    Bklog INT
);

INSERT INTO Student (RNo, Name, Branch, SPI, Bklog) VALUES
(101, 'Raju', 'CE', 8.80, 0),
(102, 'Amit', 'CE', 2.20, 3),
(103, 'Sanjay', 'ME', 1.50, 6),
(104, 'Neha', 'EC', 7.65, 1),
(105, 'Meera', 'EE', 5.52, 2),
(106, 'Mahesh', 'EC', 4.50, 3);

-- 1. Personal view with all columns
CREATE VIEW Personal AS
SELECT * FROM Student;

-- 2. Student_Details view with columns Name, Branch & SPI
CREATE VIEW Student_Details AS
SELECT Name, Branch, SPI FROM Student;

-- 3. Academic view with columns RNo, Name, Branch
CREATE VIEW Academic AS
SELECT RNo, Name, Branch FROM Student;

-- 4. Student_Data view with all columns except students with bklog more than 2
CREATE VIEW Student_Data AS
SELECT * FROM Student WHERE Bklog <= 2;

-- 5. Student_Pattern view with RNo, Name & Branch columns where Name has four letters
CREATE VIEW Student_Pattern AS
SELECT RNo, Name, Branch
FROM Student
WHERE LEN(Name) = 4;

-- 9. View displaying information of students whose SPI is above 9.5
CREATE VIEW Students_Above_9_5 AS
SELECT * FROM Student WHERE SPI > 9.5;

-- 10. View displaying students with 0 backlog
CREATE VIEW Students_With_No_Backlog AS
SELECT * FROM Student WHERE Bklog = 0;