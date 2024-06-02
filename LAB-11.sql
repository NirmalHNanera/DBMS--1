Create Table Student2
(
	Rno int,
	Name Varchar(50),
	City Varchar(50),
	Did int
);

Create Table Academic .
(
	Rno int,
	SPI Decimal(4,2),
	Bklog int
);

Create Table Department
(
	Did int,
	DName Varchar(50)
);



insert into Student2 values(101,'raju','rajkot',10)
insert into Student2 values(102,'amit','ahmedabad',20)
insert into Student2 values(103,'sanjay','baroda',40)
insert into Student2 values(104,'neha','rajkot',20)
insert into Student2 values(105,'meera','ahmedabad',30)
insert into Student2 values(106,'mahesh','baroda',10)

insert into Academic values(101,'8.8',0)
insert into Academic values(102,'9.2',2)
insert into Academic values(103,'7.6',1)
insert into Academic values(104,'8.2',4)
insert into Academic values(105,'7.0',2)
insert into Academic values(106,'8.9',3)

insert into Department values(10,'computer')
insert into Department values(20,'electrical')
insert into Department values(30,'mechanical')
insert into Department values(40,'civil')

-- 1. Display details of students who are from computer department.
SELECT *
FROM Student
WHERE DID = (SELECT DID FROM Department WHERE DName = 'Computer');

-- 2. Display name of students whose SPI is more than 8.
SELECT Name
FROM Student
WHERE Rno IN (SELECT Rno FROM Academic WHERE SPI > 8);

-- 3. Display details of students of computer department who belong to Rajkot city.
SELECT *
FROM Student
WHERE DID = (SELECT DID FROM Department WHERE DName = 'Computer')
AND City = 'Rajkot';

-- 4. Find the total number of students of the electrical department.
SELECT COUNT(*)
FROM Student
WHERE DID = (SELECT DID FROM Department WHERE DName = 'Electrical');

-- 5. Display the name of the student who has the maximum SPI.
SELECT Name
FROM Student
WHERE Rno = (SELECT TOP 1 Rno FROM Academic ORDER BY SPI DESC);

-- 6. Display details of students having more than 1 backlog.
SELECT *
FROM Student
WHERE Rno IN (SELECT Rno FROM Academic WHERE Bklog > 1);

-- 7. Display name of the student who has the second-highest SPI.
SELECT Name
FROM Student
WHERE Rno = (SELECT Rno FROM Academic ORDER BY SPI DESC OFFSET 1 ROW FETCH NEXT 1 ROW ONLY);

-- 8. Display the name of students who are either from the computer department or from the mechanical department.
SELECT Name
FROM Student
WHERE DID IN (SELECT DID FROM Department WHERE DName IN ('Computer', 'Mechanical'));

-- 9. Display the name of students who are in the same department as RNo 102 studying in.
SELECT Name
FROM Student
WHERE DID = (SELECT DID FROM Student WHERE Rno = 102);

-- 10. Display the name of students whose SPI is more than 9 and who are from the electrical department.
SELECT Name
FROM Student
WHERE DID = (SELECT DID FROM Department WHERE DName = 'Electrical')
AND Rno IN (SELECT Rno FROM Academic WHERE SPI > 9);