/*=========================================================
   HOTEL MANAGEMENT SYSTEM
=========================================================*/

SET SERVEROUTPUT ON;
SET LINESIZE 120;
SET PAGESIZE 50;


/*=========================================================
   1. DROP OLD TABLES
=========================================================*/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Service_Usage CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Payment CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Booking CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Hotel_Service CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Employee CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Guest CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Room CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/


/*=========================================================
   2. CREATE TABLES
=========================================================*/

CREATE TABLE Room (
    Room_ID NUMBER PRIMARY KEY,
    Room_Number NUMBER,
    Room_Type VARCHAR2(30),
    Floor_Number NUMBER,
    Capacity NUMBER,
    Room_Rate NUMBER,
    Room_Status VARCHAR2(20)
);

CREATE TABLE Guest (
    Guest_ID NUMBER PRIMARY KEY,
    Guest_Name VARCHAR2(50),
    Gender VARCHAR2(10),
    Age NUMBER,
    Phone VARCHAR2(15),
    Email VARCHAR2(50),
    Address VARCHAR2(100)
);

CREATE TABLE Employee (
    Employee_ID NUMBER PRIMARY KEY,
    Employee_Name VARCHAR2(50),
    Job_Role VARCHAR2(30),
    Phone VARCHAR2(15),
    Salary NUMBER
);

CREATE TABLE Hotel_Service (
    Service_ID NUMBER PRIMARY KEY,
    Service_Name VARCHAR2(50),
    Service_Charge NUMBER
);

CREATE TABLE Booking (
    Booking_ID NUMBER PRIMARY KEY,
    Guest_ID NUMBER REFERENCES Guest(Guest_ID),
    Room_ID NUMBER REFERENCES Room(Room_ID),
    Check_In DATE,
    Check_Out DATE,
    Booking_Status VARCHAR2(20)
);

CREATE TABLE Payment (
    Payment_ID NUMBER PRIMARY KEY,
    Booking_ID NUMBER REFERENCES Booking(Booking_ID),
    Amount NUMBER,
    Payment_Date DATE,
    Payment_Method VARCHAR2(20)
);

CREATE TABLE Service_Usage (
    Usage_ID NUMBER PRIMARY KEY,
    Booking_ID NUMBER REFERENCES Booking(Booking_ID),
    Service_ID NUMBER REFERENCES Hotel_Service(Service_ID),
    Quantity NUMBER
);


/*=========================================================
   3. INSERT ROOM DATA
=========================================================*/

INSERT INTO Room VALUES
(101,101,'Single',1,1,1500,'Available');

INSERT INTO Room VALUES
(102,102,'Double',1,2,2500,'Available');

INSERT INTO Room VALUES
(103,103,'Deluxe',1,3,3500,'Occupied');

INSERT INTO Room VALUES
(201,201,'Single',2,1,1600,'Available');

INSERT INTO Room VALUES
(202,202,'Double',2,2,2800,'Occupied');

INSERT INTO Room VALUES
(203,203,'Suite',2,4,5000,'Available');

INSERT INTO Room VALUES
(301,301,'Deluxe',3,3,4000,'Available');

INSERT INTO Room VALUES
(302,302,'Suite',3,4,5500,'Available');


/*=========================================================
   4. INSERT GUEST DATA
=========================================================*/

INSERT INTO Guest VALUES
(1,'Deepika','Female',21,'9876543210',
'deepika@gmail.com','Chennai');

INSERT INTO Guest VALUES
(2,'Priya','Female',22,'9876543211',
'priya@gmail.com','Madurai');

INSERT INTO Guest VALUES
(3,'Arun','Male',25,'9876543212',
'arun@gmail.com','Coimbatore');

INSERT INTO Guest VALUES
(4,'Karthik','Male',28,'9876543213',
'karthik@gmail.com','Bangalore');

INSERT INTO Guest VALUES
(5,'Meena','Female',30,'9876543214',
'meena@gmail.com','Trichy');


/*=========================================================
   5. INSERT EMPLOYEE DATA
=========================================================*/

INSERT INTO Employee VALUES
(1,'Ramesh Kumar','Manager','9876500001',45000);

INSERT INTO Employee VALUES
(2,'Anitha','Receptionist','9876500002',25000);

INSERT INTO Employee VALUES
(3,'Suresh','Housekeeping','9876500003',20000);

INSERT INTO Employee VALUES
(4,'Lakshmi','Receptionist','9876500004',25000);


/*=========================================================
   6. INSERT HOTEL SERVICE DATA
=========================================================*/

INSERT INTO Hotel_Service VALUES
(1,'Room Service',500);

INSERT INTO Hotel_Service VALUES
(2,'Laundry',300);

INSERT INTO Hotel_Service VALUES
(3,'Breakfast',250);

INSERT INTO Hotel_Service VALUES
(4,'Airport Pickup',1000);

INSERT INTO Hotel_Service VALUES
(5,'Extra Bed',700);


/*=========================================================
   7. INSERT BOOKING DATA
=========================================================*/

INSERT INTO Booking VALUES
(5001,1,102,DATE '2026-09-20',
DATE '2026-09-22','Completed');

INSERT INTO Booking VALUES
(5002,2,202,DATE '2026-09-24',
DATE '2026-09-27','Active');

INSERT INTO Booking VALUES
(5003,3,101,DATE '2026-09-21',
DATE '2026-09-23','Completed');

INSERT INTO Booking VALUES
(5004,4,103,DATE '2026-09-25',
DATE '2026-09-28','Active');


/*=========================================================
   8. INSERT PAYMENT DATA
=========================================================*/

INSERT INTO Payment VALUES
(7001,5001,5000,DATE '2026-09-20','Cash');

INSERT INTO Payment VALUES
(7002,5002,8400,DATE '2026-09-24','Card');

INSERT INTO Payment VALUES
(7003,5003,3000,DATE '2026-09-21','UPI');

INSERT INTO Payment VALUES
(7004,5004,10500,DATE '2026-09-25','Card');


/*=========================================================
   9. INSERT SERVICE USAGE DATA
=========================================================*/

INSERT INTO Service_Usage VALUES
(1,5001,1,2);

INSERT INTO Service_Usage VALUES
(2,5002,2,3);

INSERT INTO Service_Usage VALUES
(3,5002,3,2);

INSERT INTO Service_Usage VALUES
(4,5004,4,1);

COMMIT;


/*=========================================================
   10. DISPLAY ALL ROOMS
=========================================================*/

SELECT * FROM Room;

/*
OUTPUT:

ROOM_ID  ROOM_NUMBER  ROOM_TYPE  FLOOR_NUMBER  CAPACITY  ROOM_RATE  ROOM_STATUS
-------  -----------  ---------  ------------  --------  ---------  ------------
101      101          Single     1             1         1500       Available
102      102          Double     1             2         2500       Available
103      103          Deluxe     1             3         3500       Occupied
201      201          Single     2             1         1600       Available
202      202          Double     2             2         2800       Occupied
203      203          Suite      2             4         5000       Available
301      301          Deluxe     3             3         4000       Available
302      302          Suite      3             4         5500       Available
*/


/*=========================================================
   11. DISPLAY AVAILABLE ROOMS
=========================================================*/

SELECT Room_Number, Room_Type, Room_Rate
FROM Room
WHERE Room_Status = 'Available';

/*
OUTPUT:

ROOM_NUMBER  ROOM_TYPE   ROOM_RATE
-----------  ---------   ---------
101          Single      1500
102          Double      2500
201          Single      1600
203          Suite       5000
301          Deluxe      4000
302          Suite       5500
*/


/*=========================================================
   12. DISPLAY ALL GUESTS
=========================================================*/

SELECT * FROM Guest;

/*
OUTPUT:

GUEST_ID  GUEST_NAME   GENDER   AGE  PHONE        EMAIL
--------  -----------  -------  ---  -----------  --------------------
1         Deepika      Female   21   9876543210   deepika@gmail.com
2         Priya        Female   22   9876543211   priya@gmail.com
3         Arun         Male     25   9876543212   arun@gmail.com
4         Karthik      Male     28   9876543213   karthik@gmail.com
5         Meena        Female   30   9876543214   meena@gmail.com

ADDRESS
----------------
Chennai
Madurai
Coimbatore
Bangalore
Trichy
*/


/*=========================================================
   13. DISPLAY ALL EMPLOYEES
=========================================================*/

SELECT * FROM Employee;

/*
OUTPUT:

EMPLOYEE_ID  EMPLOYEE_NAME  JOB_ROLE       PHONE        SALARY
-----------  -------------  -------------  -----------  ------
1            Ramesh Kumar   Manager        9876500001   45000
2            Anitha         Receptionist   9876500002   25000
3            Suresh         Housekeeping   9876500003   20000
4            Lakshmi        Receptionist   9876500004   25000
*/


/*=========================================================
   14. DISPLAY ALL SERVICES
=========================================================*/

SELECT * FROM Hotel_Service;

/*
OUTPUT:

SERVICE_ID  SERVICE_NAME       SERVICE_CHARGE
----------  -----------------  --------------
1           Room Service       500
2           Laundry            300
3           Breakfast          250
4           Airport Pickup     1000
5           Extra Bed          700
*/


/*=========================================================
   15. DISPLAY BOOKING DETAILS
=========================================================*/

SELECT
    b.Booking_ID,
    g.Guest_Name,
    r.Room_Number,
    r.Room_Type,
    b.Check_In,
    b.Check_Out,
    b.Booking_Status
FROM Booking b
JOIN Guest g
    ON b.Guest_ID = g.Guest_ID
JOIN Room r
    ON b.Room_ID = r.Room_ID;

/*
OUTPUT:

BOOKING_ID  GUEST_NAME  ROOM_NUMBER  ROOM_TYPE  CHECK_IN    CHECK_OUT   STATUS
----------  ----------  -----------  ---------  ----------  ----------  ---------
5001        Deepika     102          Double     20-SEP-26   22-SEP-26   Completed
5002        Priya       202          Double     24-SEP-26   27-SEP-26   Active
5003        Arun        101          Single     21-SEP-26   23-SEP-26   Completed
5004        Karthik     103          Deluxe     25-SEP-26   28-SEP-26   Active
*/


/*=========================================================
   16. DISPLAY PAYMENT DETAILS
=========================================================*/

SELECT
    p.Payment_ID,
    b.Booking_ID,
    g.Guest_Name,
    p.Amount,
    p.Payment_Date,
    p.Payment_Method
FROM Payment p
JOIN Booking b
    ON p.Booking_ID = b.Booking_ID
JOIN Guest g
    ON b.Guest_ID = g.Guest_ID;

/*
OUTPUT:

PAYMENT_ID  BOOKING_ID  GUEST_NAME  AMOUNT  PAYMENT_DATE  PAYMENT_METHOD
----------  ----------  ----------  ------  ------------  --------------
7001        5001        Deepika     5000    20-SEP-26     Cash
7002        5002        Priya       8400    24-SEP-26     Card
7003        5003        Arun        3000    21-SEP-26     UPI
7004        5004        Karthik     10500   25-SEP-26     Card
*/


/*=========================================================
   17. TOTAL REVENUE
=========================================================*/

SELECT SUM(Amount) AS Total_Revenue
FROM Payment;

/*
OUTPUT:

TOTAL_REVENUE
-------------
26900
*/


/*=========================================================
   18. AVERAGE ROOM RATE
=========================================================*/

SELECT ROUND(AVG(Room_Rate),2) AS Average_Room_Rate
FROM Room;

/*
OUTPUT:

AVERAGE_ROOM_RATE
-----------------
3300
*/


/*=========================================================
   19. MOST EXPENSIVE ROOM
=========================================================*/

SELECT Room_Number, Room_Type, Room_Rate
FROM Room
WHERE Room_Rate = (
    SELECT MAX(Room_Rate)
    FROM Room
);

/*
OUTPUT:

ROOM_NUMBER  ROOM_TYPE  ROOM_RATE
-----------  ---------  ---------
302          Suite      5500
*/


/*=========================================================
   20. NUMBER OF ROOMS BY TYPE
=========================================================*/

SELECT
    Room_Type,
    COUNT(*) AS Number_Of_Rooms
FROM Room
GROUP BY Room_Type;

/*
OUTPUT:

ROOM_TYPE   NUMBER_OF_ROOMS
---------   ---------------
Single      2
Double      2
Deluxe      2
Suite       2
*/


/*=========================================================
   21. ACTIVE BOOKINGS
=========================================================*/

SELECT
    b.Booking_ID,
    g.Guest_Name,
    r.Room_Number,
    b.Check_In,
    b.Check_Out
FROM Booking b
JOIN Guest g
    ON b.Guest_ID = g.Guest_ID
JOIN Room r
    ON b.Room_ID = r.Room_ID
WHERE b.Booking_Status = 'Active';

/*
OUTPUT:

BOOKING_ID  GUEST_NAME  ROOM_NUMBER  CHECK_IN    CHECK_OUT
----------  ----------  -----------  ----------  ----------
5002        Priya       202          24-SEP-26   27-SEP-26
5004        Karthik     103          25-SEP-26   28-SEP-26
*/


/*=========================================================
   22. SERVICE USAGE COST
=========================================================*/

SELECT
    su.Usage_ID,
    hs.Service_Name,
    su.Quantity,
    hs.Service_Charge,
    su.Quantity * hs.Service_Charge AS Total_Cost
FROM Service_Usage su
JOIN Hotel_Service hs
    ON su.Service_ID = hs.Service_ID;

/*
OUTPUT:

USAGE_ID  SERVICE_NAME    QUANTITY  SERVICE_CHARGE  TOTAL_COST
--------  --------------  --------  ---------------  ----------
1         Room Service    2         500              1000
2         Laundry         3         300               900
3         Breakfast       2         250               500
4         Airport Pickup  1         1000             1000
*/


/*=========================================================
   23. HIGHEST PAID EMPLOYEE
=========================================================*/

SELECT
    Employee_Name,
    Job_Role,
    Salary
FROM Employee
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Employee
);

/*
OUTPUT:

EMPLOYEE_NAME  JOB_ROLE  SALARY
-------------  --------  ------
Ramesh Kumar   Manager   45000
*/


/*=========================================================
   24. UPDATE ROOM STATUS
=========================================================*/

UPDATE Room
SET Room_Status = 'Occupied'
WHERE Room_ID = 101;

COMMIT;


/*=========================================================
   25. DISPLAY UPDATED ROOM
=========================================================*/

SELECT *
FROM Room
WHERE Room_ID = 101;

/*
OUTPUT:

ROOM_ID  ROOM_NUMBER  ROOM_TYPE  FLOOR_NUMBER  CAPACITY
-------  -----------  ---------  ------------  --------
101      101          Single     1             1

ROOM_RATE  ROOM_STATUS
---------  -----------
1500       Occupied
*/


/*=========================================================
   26. DELETE A SERVICE
=========================================================*/

DELETE FROM Hotel_Service
WHERE Service_ID = 5;

COMMIT;


/*=========================================================
   27. VERIFY DELETED SERVICE
=========================================================*/

SELECT *
FROM Hotel_Service;

/*
OUTPUT:

SERVICE_ID  SERVICE_NAME       SERVICE_CHARGE
----------  -----------------  --------------
1           Room Service       500
2           Laundry            300
3           Breakfast          250
4           Airport Pickup     1000

Service ID 5 - Extra Bed has been deleted.
*/


/*=========================================================
   END OF HOTEL MANAGEMENT SYSTEM
=========================================================*/
