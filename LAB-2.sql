-- Create the BANK_INFO database
CREATE DATABASE BANK_INFO;

-- Use the BANK_INFO database
USE BANK_INFO;

-- Create the DEPOSIT table
CREATE TABLE DEPOSIT (
    ACTNO INT,
    CNAME VARCHAR(50),
    BNAME VARCHAR(50),
    AMOUNT DECIMAL(8,2),
    ADATE DATETIME
);

-- Create the BRANCH table
CREATE TABLE BRANCH (
    BNAME VARCHAR(50),
    CITY VARCHAR(50)
);

-- Create the CUSTOMERS table
CREATE TABLE CUSTOMERS (
    CNAME VARCHAR(50),
    CITY VARCHAR(50)
);

-- Create the BORROW table
CREATE TABLE BORROW (
    LOANNO INT,
    CNAME VARCHAR(50),
    BNAME VARCHAR(50),
    AMOUNT DECIMAL(8,2)
);


-- Insert data into DEPOSIT table
INSERT INTO DEPOSIT (ACTNO, CNAME, BNAME, AMOUNT, ADATE) VALUES
(101, 'ANIL', 'VRCE', 1000.00, '1995-03-01'),
(102, 'SUNIL', 'AJNI', 5000.00, '1996-04-01'),
(103, 'MEHUL', 'KAROLBAGH', 3500.00, '1995-11-17'),
(104, 'MADHURI', 'CHANDI', 1200.00, '1995-12-17'),
(105, 'PRMOD', 'M.G. ROAD', 3000.00, '1996-03-27'),
(106, 'SANDIP', 'ANDHERI', 2000.00, '1996-03-31'),
(107, 'SHIVANI', 'VIRAR', 1000.00, '1995-09-05'),
(108, 'KRANTI', 'NEHRU PLACE', 5000.00, '1995-07-02'),
(109, 'MINU', 'POWAI', 7000.00, '1995-08-10');

-- Insert data into BRANCH table
INSERT INTO BRANCH (BNAME, CITY) VALUES
('VRCE', 'NAGPUR'),
('AJNI', 'NAGPUR'),
('KAROLBAGH', 'DELHI'),
('CHANDI', 'DELHI'),
('DHARAMPETH', 'NAGPUR'),
('M.G. ROAD', 'BANGLORE'),
('ANDHERI', 'BOMBAY'),
('VIRAR', 'BOMBAY'),
('NEHRU PLACE', 'DELHI'),
('POWAI', 'BOMBAY');

-- Insert data into CUSTOMERS table
INSERT INTO CUSTOMERS (CNAME, CITY) VALUES
('ANIL', 'CALCUTTA'),
('SUNIL', 'DELHI'),
('MEHUL', 'BARODA'),
('MANDAR', 'PATNA'),
('MADHURI', 'NAGPUR'),
('PRAMOD', 'NAGPUR'),
('SANDIP', 'SURAT'),
('SHIVANI', 'BOMBAY'),
('KRANTI', 'BOMBAY'),
('NAREN', 'BOMBAY');

-- Insert data into BORROW table
INSERT INTO BORROW (LOANNO, CNAME, BNAME, AMOUNT) VALUES
(201, 'ANIL', 'VRCE', 1000.00),
(206, 'MEHUL', 'AJNI', 5000.00),
(311, 'SUNIL', 'DHARAMPETH', 3000.00),
(321, 'MADHURI', 'ANDHERI', 2000.00),
(375, 'PRMOD', 'VIRAR', 8000.00),
(481, 'KRANTI', 'NEHRU PLACE', 3000.00);

-- 1. Retrieve all data from table DEPOSIT.
SELECT * FROM DEPOSIT;

-- 2. Retrieve all data from table BORROW.
SELECT * FROM BORROW;

-- 3. Retrieve all data from table CUSTOMERS.
SELECT * FROM CUSTOMERS;

-- 4. Display Account No, Customer Name & Amount from DEPOSIT.
SELECT ACTNO, CNAME, AMOUNT FROM DEPOSIT;

-- 5. Display Loan No, Amount from BORROW.
SELECT LOANNO, AMOUNT FROM BORROW;

-- 6. Display loan details of all customers who belong to ‘ANDHERI’ branch.
SELECT * FROM BORROW WHERE BNAME = 'ANDHERI';

-- 7. Give account no and amount of depositor, whose account no is equals to 106.
SELECT ACTNO, AMOUNT FROM DEPOSIT WHERE ACTNO = 106;

-- 8. Give name of borrowers having amount greater than 5000.
SELECT CNAME FROM BORROW WHERE AMOUNT > 5000;

-- 9. Give name of customers who opened account after date '1-12-96'.
SELECT CNAME FROM DEPOSIT WHERE ADATE > '1996-12-01';

-- 10. Display name of customers whose account no is less than 105.
SELECT CNAME FROM DEPOSIT WHERE ACTNO < 105;

-- 11. Display name of customer who belongs to either ‘NAGPUR’ Or ‘DELHI’. (OR & IN)
SELECT CNAME FROM CUSTOMERS WHERE CITY = 'NAGPUR' OR CITY = 'DELHI';
SELECT CNAME FROM CUSTOMERS WHERE CITY IN ('NAGPUR', 'DELHI');

-- 12. Display name of customers with branch whose amount is greater than 4000 and account no is less than 105.
SELECT CNAME, BNAME FROM DEPOSIT WHERE AMOUNT > 4000 AND ACTNO < 105;

-- 13. Find all borrowers whose amount is greater than equals to 3000 & less than equals to 8000. (AND & BETWEEN)
SELECT * FROM BORROW WHERE AMOUNT BETWEEN 3000 AND 8000;

-- 14. Find all depositors who do not belong to ‘ANDHERI’ branch.
SELECT * FROM DEPOSIT WHERE BNAME <> 'ANDHERI';

-- 15. Display the name of borrowers whose amount is NULL.
SELECT CNAME FROM BORROW WHERE AMOUNT IS NULL;

-- 16. Display Account No, Customer Name & Amount of such customers who belong to ‘AJNI’, ‘KAROLBAGH’ Or ‘M.G. ROAD’ and Account No is less than 104.
SELECT ACTNO, CNAME, AMOUNT FROM DEPOSIT WHERE BNAME IN ('AJNI', 'KAROLBAGH', 'M.G. ROAD') AND ACTNO < 104;

-- 17. Display all the details of first five customers.
SELECT TOP 5 * FROM CUSTOMERS;

-- 18. Display all the details of first three depositors whose amount is greater than 1000.
SELECT TOP 3 * FROM DEPOSIT WHERE AMOUNT > 1000;

-- 19. Display Loan No, Customer Name of first five borrowers whose branch name does not belong to ‘ANDHERI’.
SELECT TOP 5 LOANNO, CNAME FROM BORROW WHERE BNAME <> 'ANDHERI';

-- 20. Retrieve all unique cities using DISTINCT. (Use Customers Table)
SELECT DISTINCT CITY FROM CUSTOMERS;

-- 21. Retrieve all unique branches using DISTINCT. (Use Branch Table)
SELECT DISTINCT BNAME FROM BRANCH;

-- 22. Retrieve all the records of customer table as per their city name in ascending order.
SELECT * FROM CUSTOMERS ORDER BY CITY ASC;

-- 23. Retrieve all the records of deposit table as per their amount column in descending order.
SELECT * FROM DEPOSIT ORDER BY AMOUNT DESC;

-- 24. Retrieve all the details of customers in descending order of their city name.
SELECT * FROM CUSTOMERS ORDER BY CITY DESC;

-- 25. Show all unique borrowers & label the column UNI_Borrowers. (Display only Names)
SELECT DISTINCT CNAME AS UNI_Borrowers FROM BORROW;


-- 1. Update deposit amount of all customers from 3000 to 5000.
UPDATE DEPOSIT SET AMOUNT = 5000 WHERE AMOUNT = 3000;

-- 2. Change branch name of ANIL from VRCE to C.G. ROAD. (Use Borrow Table)
UPDATE BORROW SET BNAME = 'C.G. ROAD' WHERE CNAME = 'ANIL' AND BNAME = 'VRCE';

-- 3. Update Account No of SANDIP to 111 & Amount to 5000.
UPDATE DEPOSIT SET ACTNO = 111, AMOUNT = 5000 WHERE CNAME = 'SANDIP';

-- 4. Give 10% Increment in Loan Amount.
UPDATE BORROW SET AMOUNT = AMOUNT * 1.1;

-- 5. Update deposit amount of all depositors to 5000 whose account no between 103 & 107.
UPDATE DEPOSIT SET AMOUNT = 5000 WHERE ACTNO BETWEEN 103 AND 107;

-- 6. Update amount of loan no 321 to NULL.
UPDATE BORROW SET AMOUNT = NULL WHERE LOANNO = 321;

-- 7. Change Loan number from 201 to 401 & also change branch name from VRCE to AJNI.
UPDATE BORROW SET LOANNO = 401, BNAME = 'AJNI' WHERE LOANNO = 201 AND BNAME = 'VRCE';

-- 8. Modify customer name ANIL to ANIL JAIN.
UPDATE CUSTOMERS SET CNAME = 'ANIL JAIN' WHERE CNAME = 'ANIL';

-- 9. Change Name to Ramesh, Branch Name VRCE & Amount 5500, Whose Account Number is 102.
UPDATE DEPOSIT SET CNAME = 'Ramesh', BNAME = 'VRCE', AMOUNT = 5500 WHERE ACTNO = 102;

-- 10. Make Branch Name & Amount NULL, Whose Loan Number is 481 & Name is KRANTI.
UPDATE BORROW SET BNAME = NULL, AMOUNT = NULL WHERE LOANNO = 481 AND CNAME = 'KRANTI';


-- 1. Delete records of Customer table who belongs to BOMBAY City.
DELETE FROM CUSTOMERS WHERE CITY = 'BOMBAY';

-- 2. Delete all account numbers whose amount less than equals to 1000.
DELETE FROM DEPOSIT WHERE AMOUNT <= 1000;

-- 3. Delete borrowers whose branch name is ‘AJNI’.
DELETE FROM BORROW WHERE BNAME = 'AJNI';

-- 4. Delete all the borrowers whose loan number between 201 to 210.
DELETE FROM BORROW WHERE LOANNO BETWEEN 201 AND 210;

-- 5. Delete customers who opened account after date '1-12-96'. (Use DEPOSIT table)
DELETE FROM DEPOSIT WHERE ADATE > '1996-12-01';

-- 6. Delete all the records of Customers table. (Use TRUNCATE)
TRUNCATE TABLE CUSTOMERS;

-- 7. Remove all customers whose name is ANIL & Account Number is 101.
DELETE FROM DEPOSIT WHERE CNAME = 'ANIL' AND ACTNO = 101;

-- 8. Delete all the depositors who do not belong to ‘ANDHERI’ branch.
DELETE FROM DEPOSIT WHERE BNAME <> 'ANDHERI';

-- 9. Delete all the borrowers whose loan amount is less than 2000 and does not belong to VRCE branch.
DELETE FROM BORROW WHERE AMOUNT < 2000 AND BNAME <> 'VRCE';

-- 10. Remove Branch table. (Use DROP)
DROP TABLE BRANCH;
