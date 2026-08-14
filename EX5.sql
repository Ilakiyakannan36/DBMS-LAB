-- Sample Table: employee

CREATE TABLE employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT
);

INSERT INTO employee VALUES
(1, 'John', 5000),
(2, 'Alice', 6000),
(3, 'Bob', 4500);

SELECT * FROM employee;
Expected Output

Employee Table

+----+-------+--------+
| id | name  | salary |
+----+-------+--------+
|  1 | John  |   5000 |
|  2 | Alice |   6000 |
|  3 | Bob   |   4500 |
+----+-------+--------+

-- Create Procedure

DELIMITER //

CREATE PROCEDURE SumProcedure(IN a INT, IN b INT)
BEGIN
    DECLARE c INT;

    SET c = a + b;

    SELECT CONCAT('Sum of two numbers = ', c) AS Result;
END//

DELIMITER ;

-- Call Procedure

CALL SumProcedure(10, 20);
Procedure Output

+-------------------------+
| Result                  |
+-------------------------+
| Sum of two numbers = 30 |
+-------------------------+

-- Create Function

DELIMITER //

CREATE FUNCTION SumFunction(a INT, b INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE c INT;

    SET c = a + b;

    RETURN c;
END//

DELIMITER ;

-- Call Function

SELECT SumFunction(5, 5) AS Result;
Function Output

+--------+
| Result |
+--------+
|     10 |
+--------+
