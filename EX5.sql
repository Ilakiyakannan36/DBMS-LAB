----------Sample table: employee(id, name,salary)----------

CREATE TABLE employee (
    ->     id INT PRIMARY KEY,
    ->     name VARCHAR(50),
    ->     salary INT
    -> );

INSERT INTO employee VALUES
    -> (1, 'John', 5000),
    -> (2, 'Alice', 6000),
    -> (3, 'Bob', 4500);

Records: 3  Duplicates: 0  Warnings: 0

SELECT * FROM employee;
+----+-------+--------+
| id | name  | salary |
+----+-------+--------+
|  1 | John  |   5000 |
|  2 | Alice |   6000 |
|  3 | Bob   |   4500 |
+----+-------+--------+
3 rows in set (0.00 sec)

---------Create PROCEDURE----------

DELIMITER //

CREATE PROCEDURE SumProcedure(IN a INT, IN b INT)
    -> BEGIN
    ->     DECLARE c INT;
    -> 
    ->     SET c = a + b;
    -> 
    ->     SELECT CONCAT('Sum of two numbers = ', c) AS Result;
    -> END//

DELIMITER ;

---------Calling the PROCEDURE----------

CALL SumProcedure(10,20);
+-------------------------+
| Result                  |
+-------------------------+
| Sum of two numbers = 30 |
+-------------------------+
1 row in set (0.00 sec)

---------Create FUNCTION----------

DELIMITER //

CREATE FUNCTION SumFunction(a INT, b INT)
    -> RETURNS INT
    -> DETERMINISTIC
    -> BEGIN
    ->     DECLARE c INT;
    -> 
    ->     SET c = a + b;
    -> 
    ->     RETURN c;
    -> END//

DELIMITER ;

---------Calling the FUNCTION----------

SELECT SumFunction(5,5) AS Result;
+--------+
| Result |
+--------+
|     10 |
+--------+
1 row in set (0.00 sec)

