CREATE TABLE Student (
    Enrollment_No VARCHAR(20),
    Name VARCHAR(25),
    CPI DECIMAL(5,2),
    Birthdate DATETIME
);


-- 1. Add two more columns City VARCHAR (20) NULL and Backlog INT NOT NULL.
ALTER TABLE Student ADD City VARCHAR(20) NULL, Backlog INT NOT NULL;

-- 2. Change the size of NAME column of student from VARCHAR (25) to VARCHAR (35).
ALTER TABLE Student ALTER COLUMN Name VARCHAR(35);

-- 3. Change the data type DECIMAL to INT in CPI Column.
ALTER TABLE Student ALTER COLUMN CPI INT;

-- 4. Rename Column Enrollment_No to ENO.
EXEC sp_rename 'Student.Enrollment_No', 'ENO', 'COLUMN';

-- 5. Delete Column City from the STUDENT table.
ALTER TABLE Student DROP COLUMN City;

-- 6. Change name of table STUDENT to STUDENT_MASTER.
EXEC sp_rename 'Student', 'Student_Master';

-- 7. Remove Column Backlog from the table.
ALTER TABLE Student_Master DROP COLUMN Backlog;

-- 8. Change Constraint of Name Column from NULL to NOT NULL.
ALTER TABLE Student_Master ALTER COLUMN Name VARCHAR(35) NOT NULL;

-- 9. Rename Column Birthdate to BDate.
EXEC sp_rename 'Student_Master.Birthdate', 'BDate', 'COLUMN';

-- 10. Change the datatype of ENO Column from VARCHAR (20) to VARCHAR (12).
ALTER TABLE Student_Master ALTER COLUMN ENO VARCHAR(12);
