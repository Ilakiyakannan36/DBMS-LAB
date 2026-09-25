/* ============================================================
   DBMS MINI PROJECT
   HOTEL MANAGEMENT SYSTEM
   ============================================================ */


/* ============================================================
   1. CREATE ROOM TABLE
   ============================================================ */

CREATE TABLE Room (
    Room_ID NUMBER PRIMARY KEY,
    Room_Number VARCHAR2(10) UNIQUE NOT NULL,
    Room_Type VARCHAR2(50),
    Floor_Number NUMBER,
    Capacity NUMBER,
    Room_Rate NUMBER(10,2),
    Room_Status VARCHAR2(20)
);


/* ============================================================
   2. CREATE GUEST TABLE
   ============================================================ */

CREATE TABLE Guest (
    Guest_ID NUMBER PRIMARY KEY,
    Guest_Name VARCHAR2(100) NOT NULL,
    Gender VARCHAR2(10),
    Age NUMBER,
    Phone VARCHAR2(15),
    Email VARCHAR2(100),
    Address VARCHAR2(200)
);


/* ============================================================
   3. CREATE EMPLOYEE TABLE
   ============================================================ */

CREATE TABLE Employee (
    Employee_ID NUMBER PRIMARY KEY,
    Employee_Name VARCHAR2(100) NOT NULL,
    Job_Role VARCHAR2(50),
    Phone VARCHAR2(15),
    Salary NUMBER(10,2)
);


/* ============================================================
   4. CREATE BOOKING TABLE
   ============================================================ */

CREATE TABLE Booking (
    Booking_ID NUMBER PRIMARY KEY,
    Guest_ID NUMBER,
    Room_ID NUMBER,
    Check_In DATE,
    Check_Out DATE,
    Number_Of_Guests NUMBER,
    Booking_Status VARCHAR2(20),

    CONSTRAINT fk_booking_guest
    FOREIGN KEY (Guest_ID)
    REFERENCES Guest(Guest_ID),

    CONSTRAINT fk_booking_room
    FOREIGN KEY (Room_ID)
    REFERENCES Room(Room_ID)
);


/* ============================================================
   5. CREATE PAYMENT TABLE
   ============================================================ */

CREATE TABLE Payment (
    Payment_ID NUMBER PRIMARY KEY,
    Booking_ID NUMBER,
    Payment_Date DATE,
    Amount NUMBER(10,2),
    Payment_Method VARCHAR2(30),
    Payment_Status VARCHAR2(20),

    CONSTRAINT fk_payment_booking
    FOREIGN KEY (Booking_ID)
    REFERENCES Booking(Booking_ID)
);


/* ============================================================
   6. CREATE SERVICE TABLE
   ============================================================ */

CREATE TABLE Hotel_Service (
    Service_ID NUMBER PRIMARY KEY,
    Service_Name VARCHAR2(100),
    Service_Charge NUMBER(10,2)
);


/* ============================================================
   7. CREATE SERVICE_USAGE TABLE
   ============================================================ */

CREATE TABLE Service_Usage (
    Usage_ID NUMBER PRIMARY KEY,
    Booking_ID NUMBER,
    Service_ID NUMBER,
    Service_Date DATE,
    Quantity NUMBER,

    CONSTRAINT fk_usage_booking
    FOREIGN KEY (Booking_ID)
    REFERENCES Booking(Booking_ID),

    CONSTRAINT fk_usage_service
    FOREIGN KEY (Service_ID)
    REFERENCES Hotel_Service(Service_ID)
);


/* ============================================================
   8. INSERT ROOM DATA
   ============================================================ */

INSERT INTO Room
VALUES (101, '101', 'Single', 1, 1, 1500.00, 'Available');

INSERT INTO Room
VALUES (102, '102', 'Double', 1, 2, 2500.00, 'Available');

INSERT INTO Room
VALUES (103, '103', 'Deluxe', 1, 3, 3500.00, 'Occupied');

INSERT INTO Room
VALUES (201, '201', 'Single', 2, 1, 1600.00, 'Available');

INSERT INTO Room
VALUES (202, '202', 'Double', 2, 2, 2800.00, 'Occupied');

INSERT INTO Room
VALUES (203, '203', 'Suite', 2, 4, 5000.00, 'Available');

INSERT INTO Room
VALUES (301, '301', 'Deluxe', 3, 3, 4000.00, 'Available');

INSERT INTO Room
VALUES (302, '302', 'Suite', 3, 4, 5500.00, 'Available');


/* ============================================================
   9. INSERT GUEST DATA
   ============================================================ */

INSERT INTO Guest
VALUES (
    1,
    'Deepika',
    'Female',
    21,
    '9876543210',
    'deepika@gmail.com',
    'Chennai'
);

INSERT INTO Guest
VALUES (
    2,
    'Priya',
    'Female',
    22,
    '9876543211',
    'priya@gmail.com',
    'Madurai'
);

INSERT INTO Guest
VALUES (
    3,
    'Arun',
    'Male',
    25,
    '9876543212',
    'arun@gmail.com',
    'Coimbatore'
);

INSERT INTO Guest
VALUES (
    4,
    'Karthik',
    'Male',
    28,
    '9876543213',
    'karthik@gmail.com',
    'Bangalore'
);

INSERT INTO Guest
VALUES (
    5,
    'Meena',
    'Female',
    30,
    '9876543214',
    'meena@gmail.com',
    'Trichy'
);


/* ============================================================
   10. INSERT EMPLOYEE DATA
   ============================================================ */

INSERT INTO Employee
VALUES (
    1,
    'Ramesh Kumar',
    'Manager',
    '9876500001',
    45000.00
);

INSERT INTO Employee
VALUES (
    2,
    'Anitha',
    'Receptionist',
    '9876500002',
    25000.00
);

INSERT INTO Employee
VALUES (
    3,
    'Suresh',
    'Housekeeping',
    '9876500003',
    20000.00
);

INSERT INTO Employee
VALUES (
    4,
    'Lakshmi',
    'Receptionist',
    '9876500004',
    25000.00
);


/* ============================================================
   11. INSERT BOOKING DATA
   ============================================================ */

INSERT INTO Booking
VALUES (
    1001,
    1,
    103,
    DATE '2026-09-20',
    DATE '2026-09-23',
    2,
    'Completed'
);

INSERT INTO Booking
VALUES (
    1002,
    2,
    202,
    DATE '2026-09-22',
    DATE '2026-09-25',
    2,
    'Active'
);

INSERT INTO Booking
VALUES (
    1003,
    3,
    101,
    DATE '2026-09-24',
    DATE '2026-09-26',
    1,
    'Active'
);

INSERT INTO Booking
VALUES (
    1004,
    4,
    203,
    DATE '2026-09-10',
    DATE '2026-09-12',
    4,
    'Completed'
);


/* ============================================================
   12. INSERT PAYMENT DATA
   ============================================================ */

INSERT INTO Payment
VALUES (
    5001,
    1001,
    DATE '2026-09-20',
    10500.00,
    'Credit Card',
    'Paid'
);

INSERT INTO Payment
VALUES (
    5002,
    1002,
    DATE '2026-09-22',
    8400.00,
    'UPI',
    'Paid'
);

INSERT INTO Payment
VALUES (
    5003,
    1003,
    DATE '2026-09-24',
    3000.00,
    'Cash',
    'Paid'
);

INSERT INTO Payment
VALUES (
    5004,
    1004,
    DATE '2026-09-10',
    10000.00,
    'Debit Card',
    'Paid'
);


/* ============================================================
   13. INSERT HOTEL SERVICE DATA
   ============================================================ */

INSERT INTO Hotel_Service
VALUES (1, 'Room Service', 500.00);

INSERT INTO Hotel_Service
VALUES (2, 'Laundry', 300.00);

INSERT INTO Hotel_Service
VALUES (3, 'Breakfast', 250.00);

INSERT INTO Hotel_Service
VALUES (4, 'Airport Pickup', 1000.00);

INSERT INTO Hotel_Service
VALUES (5, 'Extra Bed', 700.00);


/* ============================================================
   14. INSERT SERVICE USAGE DATA
   ============================================================ */

INSERT INTO Service_Usage
VALUES (
    1,
    1001,
    1,
    DATE '2026-09-21',
    2
);

INSERT INTO Service_Usage
VALUES (
    2,
    1001,
    3,
    DATE '2026-09-21',
    2
);

INSERT INTO Service_Usage
VALUES (
    3,
    1002,
    4,
    DATE '2026-09-22',
    1
);

INSERT INTO Service_Usage
VALUES (
    4,
    1003,
    2,
    DATE '2026-09-25',
    2
);


/* ============================================================
   15. DISPLAY ALL ROOMS
   ============================================================ */

SELECT *
FROM Room;


/* ============================================================
   16. DISPLAY AVAILABLE ROOMS
   ============================================================ */

SELECT
    Room_ID,
    Room_Number,
    Room_Type,
    Floor_Number,
    Capacity,
    Room_Rate
FROM Room
WHERE Room_Status = 'Available';


/* ============================================================
   17. DISPLAY OCCUPIED ROOMS
   ============================================================ */

SELECT
    Room_ID,
    Room_Number,
    Room_Type,
    Room_Rate
FROM Room
WHERE Room_Status = 'Occupied';


/* ============================================================
   18. DISPLAY ALL GUESTS
   ============================================================ */

SELECT *
FROM Guest;


/* ============================================================
   19. DISPLAY ACTIVE BOOKINGS
   ============================================================ */

SELECT
    Booking_ID,
    Guest_ID,
    Room_ID,
    Check_In,
    Check_Out,
    Number_Of_Guests
FROM Booking
WHERE Booking_Status = 'Active';


/* ============================================================
   20. DISPLAY COMPLETE BOOKING DETAILS
   ============================================================ */

SELECT
    b.Booking_ID,
    g.Guest_Name,
    r.Room_Number,
    r.Room_Type,
    b.Check_In,
    b.Check_Out,
    b.Number_Of_Guests,
    b.Booking_Status
FROM Booking b
JOIN Guest g
    ON b.Guest_ID = g.Guest_ID
JOIN Room r
    ON b.Room_ID = r.Room_ID;


/* ============================================================
   21. DISPLAY GUEST AND PAYMENT DETAILS
   ============================================================ */

SELECT
    g.Guest_Name,
    b.Booking_ID,
    p.Payment_Date,
    p.Amount,
    p.Payment_Method,
    p.Payment_Status
FROM Payment p
JOIN Booking b
    ON p.Booking_ID = b.Booking_ID
JOIN Guest g
    ON b.Guest_ID = g.Guest_ID;


/* ============================================================
   22. FIND TOTAL PAYMENT COLLECTED
   ============================================================ */

SELECT
    SUM(Amount) AS Total_Payment
FROM Payment
WHERE Payment_Status = 'Paid';


/* ============================================================
   23. FIND AVERAGE ROOM RATE
   ============================================================ */

SELECT
    AVG(Room_Rate) AS Average_Room_Rate
FROM Room;


/* ============================================================
   24. FIND MOST EXPENSIVE ROOM
   ============================================================ */

SELECT
    Room_Number,
    Room_Type,
    Room_Rate
FROM Room
WHERE Room_Rate =
(
    SELECT MAX(Room_Rate)
    FROM Room
);


/* ============================================================
   25. COUNT ROOMS BY ROOM TYPE
   ============================================================ */

SELECT
    Room_Type,
    COUNT(*) AS Number_Of_Rooms
FROM Room
GROUP BY Room_Type;


/* ============================================================
   26. DISPLAY GUESTS WHO BOOKED ROOMS
   ============================================================ */

SELECT
    g.Guest_ID,
    g.Guest_Name,
    r.Room_Number,
    r.Room_Type
FROM Guest g
JOIN Booking b
    ON g.Guest_ID = b.Guest_ID
JOIN Room r
    ON b.Room_ID = r.Room_ID;


/* ============================================================
   27. DISPLAY HOTEL SERVICES
   ============================================================ */

SELECT *
FROM Hotel_Service;


/* ============================================================
   28. DISPLAY SERVICES USED BY GUESTS
   ============================================================ */

SELECT
    g.Guest_Name,
    hs.Service_Name,
    hs.Service_Charge,
    su.Quantity,
    hs.Service_Charge * su.Quantity AS Total_Service_Cost
FROM Service_Usage su
JOIN Booking b
    ON su.Booking_ID = b.Booking_ID
JOIN Guest g
    ON b.Guest_ID = g.Guest_ID
JOIN Hotel_Service hs
    ON su.Service_ID = hs.Service_ID;


/* ============================================================
   29. FIND TOTAL SERVICE REVENUE
   ============================================================ */

SELECT
    SUM(hs.Service_Charge * su.Quantity)
    AS Total_Service_Revenue
FROM Service_Usage su
JOIN Hotel_Service hs
    ON su.Service_ID = hs.Service_ID;


/* ============================================================
   30. DISPLAY EMPLOYEES
   ============================================================ */

SELECT *
FROM Employee;


/* ============================================================
   31. FIND EMPLOYEES WITH SALARY GREATER THAN 25000
   ============================================================ */

SELECT
    Employee_ID,
    Employee_Name,
    Job_Role,
    Salary
FROM Employee
WHERE Salary > 25000;


/* ============================================================
   32. COUNT EMPLOYEES BY JOB ROLE
   ============================================================ */

SELECT
    Job_Role,
    COUNT(*) AS Number_Of_Employees
FROM Employee
GROUP BY Job_Role;


/* ============================================================
   33. UPDATE ROOM STATUS
   ============================================================ */

UPDATE Room
SET Room_Status = 'Occupied'
WHERE Room_ID = 101;


/* ============================================================
   34. UPDATE BOOKING STATUS
   ============================================================ */

UPDATE Booking
SET Booking_Status = 'Completed'
WHERE Booking_ID = 1003;


/* ============================================================
   35. UPDATE ROOM RATE
   ============================================================ */

UPDATE Room
SET Room_Rate = 3000.00
WHERE Room_ID = 102;


/* ============================================================
   36. DELETE A SERVICE USAGE RECORD
   ============================================================ */

DELETE FROM Service_Usage
WHERE Usage_ID = 4;


/* ============================================================
   37. COMMIT ALL CHANGES
   ============================================================ */

COMMIT;
