USE db;

-- Retrieve the name and address of a customer and handle exceptions

SELECT * FROM customers;
Expected Output
Customers Table
+----+-------+-------------+---------+
| id | name  | address     | salary  |
+----+-------+-------------+---------+
|  1 | John  | New York    | 5500.00 |
|  2 | Alice | Los Angeles | 6500.00 |
|  3 | Bob   | Chicago     | 5000.00 |
|  4 | David | Houston     | 7500.00 |
|  5 | Emma  | Boston      | 6000.00 |
+----+-------+-------------+---------+

-- PREDEFINED EXCEPTION HANDLING
-- Procedure 1: GetCustomer()

DELIMITER //

CREATE PROCEDURE GetCustomer()
BEGIN
    DECLARE c_id INT DEFAULT 5;
    DECLARE c_name VARCHAR(100);
    DECLARE c_addr VARCHAR(255);

    DECLARE CONTINUE HANDLER FOR NOT FOUND
    BEGIN
        SELECT 'No such customer!' AS Message;
    END;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SELECT 'Error!' AS Message;
    END;

    SELECT name, address
    INTO c_name, c_addr
    FROM customer
    WHERE id = c_id;

    SELECT CONCAT('Name: ', c_name) AS Output;
    SELECT CONCAT('Address: ', c_addr) AS Output;
END//

DELIMITER ;

-- Call Procedure 1

CALL GetCustomer();
Expected Output
+---------+
| Message |
+---------+
| Error!  |
+---------+

-- USER-DEFINED EXCEPTION HANDLING
-- Procedure 2: CheckSalary()

DELIMITER //

CREATE PROCEDURE CheckSalary(IN emp_salary DECIMAL(10,2))
BEGIN
    DECLARE invalid_salary CONDITION FOR SQLSTATE '45000';

    IF emp_salary < 0 THEN
        SIGNAL invalid_salary
        SET MESSAGE_TEXT = 'Salary cannot be negative!';
    ELSE
        SELECT 'Valid Salary' AS Message;
    END IF;
END//

DELIMITER ;

-- Call Procedure 2

CALL CheckSalary(5000);
Expected Output
+--------------+
| Message      |
+--------------+
| Valid Salary |
+--------------+

-- BOTH PREDEFINED AND USER-DEFINED EXCEPTION HANDLING
-- Procedure 3: CheckCustomer()

DELIMITER //

CREATE PROCEDURE CheckCustomer(IN cc_id INT)
BEGIN
    DECLARE c_name VARCHAR(100);
    DECLARE c_addr VARCHAR(255);

    DECLARE invalid_id CONDITION FOR SQLSTATE '45000';

    DECLARE EXIT HANDLER FOR NOT FOUND
    BEGIN
        SELECT 'No such customer!' AS Message;
    END;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SELECT 'Error!' AS Message;
    END;

    IF cc_id <= 0 THEN
        SIGNAL invalid_id
        SET MESSAGE_TEXT = 'ID must be greater than zero!';
    ELSE

        SELECT name, address
        INTO c_name, c_addr
        FROM customers
        WHERE id = cc_id;

        SELECT CONCAT('Name: ', c_name) AS Output;
        SELECT CONCAT('Address: ', c_addr) AS Output;

    END IF;
END//

DELIMITER ;

-- Call Procedure 3

CALL CheckCustomer(5);
+------------+
| Output     |
+------------+
| Name: Emma |
+------------+

CALL CheckCustomer(5);
+-----------------+
| Output          |
+-----------------+
| Address: Boston |
+-----------------+

CALL GetCustomer();
+---------+
| Message |
+---------+
| Error!  |
+---------+
