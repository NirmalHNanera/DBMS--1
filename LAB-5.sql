-- Create Students table
CREATE TABLE Students (
    StuID INT,
    FirstName VARCHAR(25),
    LastName VARCHAR(25),
    Website VARCHAR(50),
    City VARCHAR(25),
    Division VARCHAR(20)
);

-- Insert records
INSERT INTO Students (StuID, FirstName, LastName, Website, City, Division)
VALUES 
(1011, 'Keyur', 'Patel', 'techonthenet.com', 'Rajkot', 'II-BCX'),
(1022, 'Hardik', 'Shah', 'digminecraft.com', 'Ahmedabad', 'I-BCY'),
(1033, 'Kajal', 'Trivedi', 'bigactivities.com', 'Baroda', 'IV-DCX'),
(1044, 'Bhoomi', 'Gajera', 'checkyourmath.com', 'Ahmedabad', 'III-DCW'),
(1055, 'Harmit', 'Mite1', NULL, 'Rajkot', 'II-BCY'),
(1066, 'Ashok', 'Jani', NULL, 'Baroda', 'II-BCZ');

-- Queries using LIKE operator
-- 1. Display the name of students whose name starts with ‘k’.
SELECT * FROM Students WHERE FirstName LIKE 'K%';

-- 2. Display the name of students whose name consists of five characters.
SELECT * FROM Students WHERE LEN(FirstName) + LEN(LastName) = 5;

-- 3. Retrieve the first name & last name of students whose city name ends with a & contains six characters.
SELECT FirstName, LastName FROM Students WHERE City LIKE '____a';

-- 4. Display all the students whose last name ends with ‘tel’.
SELECT * FROM Students WHERE LastName LIKE '%tel';

-- 5. Display all the students whose first name starts with ‘ha’ & ends with ‘t’.
SELECT * FROM Students WHERE FirstName LIKE 'Ha%t';

-- 6. Display all the students whose first name starts with ‘k’ and third character is ‘y’.
SELECT * FROM Students WHERE FirstName LIKE 'K_y%';

-- 7. Display the name of students having no website and name consists of five characters.
SELECT * FROM Students WHERE Website IS NULL AND LEN(FirstName) + LEN(LastName) = 5;

-- 8. Display all the students whose last name consist of ‘jer’.
SELECT * FROM Students WHERE LastName LIKE '%jer%';

-- 9. Display all the students whose city name starts with either ‘r’ or ‘b’.
SELECT * FROM Students WHERE City LIKE 'R%' OR City LIKE 'B%';

-- 10. Display all the name students having websites.
SELECT FirstName, LastName FROM Students WHERE Website IS NOT NULL;

-- 11. Display all the students whose name starts from alphabet A to H.
SELECT * FROM Students WHERE FirstName LIKE '[A-H]%';

-- 12. Display all the students whose name’s second character is vowel.
SELECT * FROM Students WHERE FirstName LIKE '_[aeiou]%';

-- 13. Display student’s name whose city name consist of ‘rod’.
SELECT * FROM Students WHERE City LIKE '%rod%';

-- 14. Retrieve the First & Last Name of students whose website name starts with ‘bi’.
SELECT FirstName, LastName FROM Students WHERE Website LIKE 'bi%';

-- 15. Display student’s city whose last name consists of six characters.
SELECT City FROM Students WHERE LEN(LastName) = 6;

-- 16. Display all the students whose city name consist of five characters & not starts with ‘ba’.
SELECT * FROM Students WHERE City LIKE '_____' AND City NOT LIKE 'Ba%';

-- 17. Show all the student’s whose division starts with ‘II’.
SELECT * FROM Students WHERE Division LIKE 'II%';

-- 18. Find out student’s first name whose division contains ‘bc’ anywhere in division name.
SELECT FirstName FROM Students WHERE Division LIKE '%bc%';

-- 19. Show student id and city name in which division consist of six characters and having website name.
SELECT StuID, City FROM Students WHERE LEN(Division) = 6 AND Website IS NOT NULL;

-- 20. Display all the students whose name’s third character is consonant.
SELECT * FROM Students WHERE FirstName LIKE '__[^aeiou]%';
