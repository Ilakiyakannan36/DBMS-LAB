use db;
Database changed

-------------Retrieve the name and address of a customer and handle exceptions------------

select* from customers;
+----+-------+-------------+---------+
| id | name  | address     | salary  |
+----+-------+-------------+---------+
|  1 | John  | New York    | 5500.00 |
|  2 | Alice | Los Angeles | 6500.00 |
|  3 | Bob   | Chicago     | 5000.00 |
|  4 | David | Houston     | 7500.00 |
|  5 | Emma  | Boston      | 6000.00 |
+----+-------+-------------+---------+
5 rows in set (0.00 sec)


------------------PREDEFINED EXCEPTION HANDLING--------------------
---------------Procedure 1: GetCustomer()------------------

DELIMITER //

CREATE PROCEDURE GetCustomer()
    -> BEGIN
    ->     DECLARE c_id INT DEFAULT 5;
    ->     DECLARE c_name VARCHAR(100);
    ->     DECLARE c_addr VARCHAR(255);
    -> 
    ->     DECLARE CONTINUE HANDLER FOR NOT FOUND
    ->     BEGIN
    ->         SELECT 'No such customer!' AS Message;
    ->     END;
    -> 
    ->     DECLARE EXIT HANDLER FOR SQLEXCEPTION
    ->     BEGIN
    ->         SELECT 'Error!' AS Message;
    ->     END;
    -> 
    ->     SELECT name, address 
    ->     INTO c_name, c_addr
    ->     FROM customer
    ->     WHERE id = c_id;
    -> 
    ->     SELECT CONCAT('Name: ', c_name) AS Output;
    ->     SELECT CONCAT('Address: ', c_addr) AS Output;
    -> 
    -> END //

-------------------Calling PROCEDURE 1---------------------

DELIMITER ;

CALL GetCustomer();
+---------+
| Message |
+---------+
| Error!  |
+---------+
1 row in set (0.00 sec)

DELIMITER //

------------------BOTH PREDEFINED EXCEPTION & USER-DEFINED EXCEPTION HANDLING--------------------
---------------Procedure 2: CheckCustomer()------------------

CREATE PROCEDURE CheckCustomer(IN cc_id INT)
    -> BEGIN
    ->     DECLARE c_name VARCHAR(100);
    ->     DECLARE c_addr VARCHAR(255);
    -> 
    ->     DECLARE invalid_id CONDITION FOR SQLSTATE '45000';
    -> 
    ->     DECLARE EXIT HANDLER FOR NOT FOUND
    ->     BEGIN
    ->         SELECT 'No such customer!' AS Message;
    ->     END;
    -> 
    ->     DECLARE EXIT HANDLER FOR SQLEXCEPTION
    ->     BEGIN
    ->         SELECT 'Error!' AS Message;
    ->     END;
    -> 
    ->     IF cc_id <= 0 THEN
    ->         SIGNAL invalid_id
    ->         SET MESSAGE_TEXT = 'ID must be greater than zero!';
    ->     ELSE
    -> 
    ->         SELECT name, address
    ->         INTO c_name, c_addr
    ->         FROM customers
    ->         WHERE id = cc_id;
    -> 
    ->         SELECT CONCAT('Name: ', c_name) AS Output;
    ->         SELECT CONCAT('Address: ', c_addr) AS Output;
    -> 
    ->     END IF;
    -> 
    -> END //


DELIMITER ;

-------------------Calling PROCEDURE 2---------------------

CALL CheckCustomer(5);
+------------+
| Output     |
+------------+
| Name: Emma |
+------------+
1 row in set (0.00 sec)

+-----------------+
| Output          |
+-----------------+
| Address: Boston |
+-----------------+
1 row in set (0.00 sec)



CALL CheckCustomer(5);
+------------+
| Output     |
+------------+
| Name: Emma |
+------------+
1 row in set (0.00 sec)

+-----------------+
| Output          |
+-----------------+
| Address: Boston |
+-----------------+
1 row in set (0.00 sec)


CALL GetCustomer();
+---------+
| Message |
+---------+
| Error!  |
+---------+
1 row in set (0.01 sec)



