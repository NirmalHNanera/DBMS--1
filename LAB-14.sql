--Function to print numbers from 1 to 10 using a while loop:
CREATE FUNCTION PrintNumbers()
RETURNS @Numbers TABLE (Number INT)
AS
BEGIN
    DECLARE @i INT = 1;

    WHILE @i <= 10
    BEGIN
        INSERT INTO @Numbers (Number) VALUES (@i);
        SET @i = @i + 1;
    END

    RETURN;
END
--Function to check whether a given number is ODD or EVEN:
CREATE FUNCTION CheckOddEven(@num INT)
RETURNS VARCHAR(10)
AS
BEGIN
    IF @num % 2 = 0
    RETURN 'EVEN';
    ELSE
    RETURN 'ODD';
END
--Function to print ODD numbers between 1 and 10:
CREATE FUNCTION PrintOddNumbers()
RETURNS @OddNumbers TABLE (Number INT)
AS
BEGIN
    DECLARE @i INT = 1;

    WHILE @i <= 10
    BEGIN
        IF @i % 2 <> 0
        INSERT INTO @OddNumbers (Number) VALUES (@i);
        SET @i = @i + 1;
    END

    RETURN;
END
--Function to print the sum of numbers from 1 to 50:
CREATE FUNCTION CalculateSum()
RETURNS INT
AS
BEGIN
    DECLARE @sum INT = 0;
    DECLARE @i INT = 1;

    WHILE @i <= 50
    BEGIN
        SET @sum = @sum + @i;
        SET @i = @i + 1;
    END

    RETURN @sum;
END
--Function to print the sum of even numbers between 1 to 20:
CREATE FUNCTION CalculateSumOfEven()
RETURNS INT
AS
BEGIN
    DECLARE @sum INT = 0;
    DECLARE @i INT = 1;

    WHILE @i <= 20
    BEGIN
        IF @i % 2 = 0
        SET @sum = @sum + @i;
        SET @i = @i + 1;
    END

    RETURN @sum;
END
--Function to check whether a given number is prime or not:
CREATE FUNCTION CheckPrime(@num INT)
RETURNS VARCHAR(10)
AS
BEGIN
    DECLARE @i INT = 2;

    WHILE @i <= @num/2
    BEGIN
        IF @num % @i = 0
        RETURN 'NOT PRIME';
        SET @i = @i + 1;
    END

    RETURN 'PRIME';
END
--Function to insert even numbers into the even table & odd numbers into the odd table between 1 to 50:
CREATE FUNCTION InsertEvenOddTables()
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @i INT = 1;

    WHILE @i <= 50
    BEGIN
        IF @i % 2 = 0
        INSERT INTO even (Number) VALUES (@i);
        ELSE
        INSERT INTO odd (Number) VALUES (@i);
        SET @i = @i + 1;
    END

    RETURN 'Numbers inserted into even and odd tables successfully.';
END