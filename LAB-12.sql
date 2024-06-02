-- Create Student table
CREATE TABLE Student (
    RNo INT,
    Name VARCHAR(50),
    Branch VARCHAR(50)
);

-- Create Result table
CREATE TABLE Result (
    RNo INT,
    SPI DECIMAL(4,2)
);

-- Insert data into Student table
INSERT INTO Student (Rno, Name, Branch) VALUES
(101, 'Raju', 'CE'),
(102, 'Amit', 'CE'),
(103, 'Sanjay', 'ME'),
(104, 'Neha', 'EC'),
(105, 'Meera', 'EE'),
(106, 'Mahesh', 'ME');

-- Insert data into Result table
INSERT INTO Result (Rno, SPI) VALUES
(101, 8.8),
(102, 9.2),
(103, 7.6),
(104, 8.2),
(105, 7.0),
(107, 8.9);

-- Create stored procedure to display all records (Rno, Name, Branch, SPI)
CREATE PROCEDURE DisplayAllRecords
AS
BEGIN
    SELECT S.RNo, S.Name, S.Branch, R.SPI
    FROM Student S
    JOIN Result R ON S.RNo = R.RNo;
END;

-- Create stored procedure to get details by Roll Number
CREATE PROCEDURE DisplayDetailsByRollNumber
    @RollNumber INT
AS
BEGIN
    SELECT S.RNo, S.Name, S.Branch, R.SPI
    FROM Student S
    JOIN Result R ON S.RNo = R.RNo
    WHERE S.RNo = @RollNumber;
END;

-- Create stored procedure to insert a record into Student table
CREATE PROCEDURE InsertStudentRecord
AS
BEGIN
    INSERT INTO Student (RNo, Name, Branch)
    VALUES (107, 'Raj', 'EE');
END;

-- Create stored procedure to update Branch of roll number 105 to EC in Student table
CREATE PROCEDURE UpdateStudentBranch
AS
BEGIN
    UPDATE Student
    SET Branch = 'EC'
    WHERE RNo = 105;
END;

-- Create stored procedure to delete a record in Student table by roll number
CREATE PROCEDURE DeleteStudentRecord
AS
BEGIN
    DELETE FROM Student
    WHERE RNo = 103;
END;