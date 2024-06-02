-- Math functions
-- 1. Display the result of 5 multiply by 30.
SELECT 5 * 30;

-- 2. Find out the absolute value of -25, 25, -50 and 50.
SELECT ABS(-25), ABS(25), ABS(-50), ABS(50);

-- 3. Find smallest integer value that is greater than or equal to 25.2, 25.7 and -25.2.
SELECT CEILING(25.2), CEILING(25.7), CEILING(-25.2);

-- 4. Find largest integer value that is smaller than or equal to 25.2, 25.7 and -25.2.
SELECT FLOOR(25.2), FLOOR(25.7), FLOOR(-25.2);

-- 5. Find out remainder of 5 divided 2 and 5 divided by 3.
SELECT 5 % 2, 5 % 3;

-- 6. Find out value of 3 raised to 2nd power and 4 raised 3rd power.
SELECT POWER(3, 2), POWER(4, 3);

-- 7. Find out the square root of 25, 30 and 50.
SELECT SQRT(25), SQRT(30), SQRT(50);

-- 8. Find out the square of 5, 15, and 25.
SELECT SQUARE(5), SQUARE(15), SQUARE(25);

-- 9. Find out the value of PI.
SELECT PI();

-- 10. Find out round value of 157.732 for 2, 0 and -2 decimal points.
SELECT ROUND(157.732, 2), ROUND(157.732, 0), ROUND(157.732, -2);

-- 11. Find out exponential value of 2 and 3.
SELECT EXP(2), EXP(3);

-- 12. Find out logarithm having base b having value 10 of 5 and 100.
SELECT LOG(10, 5), LOG(10, 100);

-- 13. Find sine, cosine and tangent of 3.1415.
SELECT SIN(3.1415), COS(3.1415), TAN(3.1415);

-- 14. Find sign of -25, 0 and 25.
SELECT SIGN(-25), SIGN(0), SIGN(25);

-- 15. Generate random number using function.
SELECT RAND();

-- String functions--------------------------------------
-- 1. Find the length of following. (I) NULL (II) ‘ hello ’ (III) Blank
SELECT LEN(NULL), LEN(' hello '), LEN('');

-- 2. Display your name In lower & upper case.
SELECT LOWER('your name'), UPPER('your name');

-- 3. Display first three characters of your name.
SELECT LEFT('your name', 3);

-- 4. Display 3rd to 10th character of your name.
SELECT SUBSTRING('your name', 3, 8);

-- 5. Write a query to convert ‘abc123efg’ to ‘abcXYZefg’ & ‘abcabcabc’ to ‘ab5ab5ab5’ using REPLACE.
SELECT REPLACE('abc123efg', '123', 'XYZ'), REPLACE('abcabcabc', 'abc', 'ab5');

-- 6. Write a query to display ASCII code for ‘a’,’A’,’z’,’Z’, 0, 9.
SELECT ASCII('a'), ASCII('A'), ASCII('z'), ASCII('Z'), ASCII('0'), ASCII('9');

-- 7. Write a query to display character based on number 97, 65,122,90,48,57.
SELECT CHAR(97), CHAR(65), CHAR(122), CHAR(90), CHAR(48), CHAR(57);

-- 8. Write a query to remove spaces from left of a given string ‘hello world ‘.
SELECT LTRIM(' hello world ');

-- 9. Write a query to remove spaces from right of a given string ‘ hello world ‘.
SELECT RTRIM(' hello world ');

-- 10. Write a query to display first 4 & Last 5 characters of ‘SQL Server’.
SELECT LEFT('SQL Server', 4), RIGHT('SQL Server', 5);

-- 11. Write a query to convert a string ‘1234.56’ to number (Use CAST()).
SELECT CAST('1234.56' AS FLOAT);

-- 12. Write a query to convert a float 10.58 to integer (Use CONVERT()).
SELECT CONVERT(INT, 10.58);

-- 13. Put 10 space before your name using function.
SELECT SPACE(10) + 'your name';

-- 14. Combine two strings (Your name & Surname) using + sign as well as CONCAT ().
SELECT 'Your name' + ' Surname', CONCAT('Your name', ' Surname');

-- 15. Find reverse of “Darshan”.
SELECT REVERSE('Darshan');

-- 16. Repeat your name 3 times.
SELECT REPLICATE('your name ', 3);

-- 17. Delete 3 characters from a string, starting in position 1, and then insert "HTML" in position 1. (Use STUFF())
SELECT STUFF('abcdef', 1, 3, 'HTML');

-- 18. From Data, returns the first non-null value in a list. (Use COALESCE())
SELECT COALESCE(NULL, 'value1', 'value2');

-- 19. Tests whether the expression is numeric. (Use ISNUMERIC())
SELECT ISNUMERIC('123'), ISNUMERIC('abc');

-- 20. Search for "t" in string "Customer", and return its position. (Use CHARINDEX())
SELECT CHARINDEX('t', 'Customer');

