/* ============================================================
   DBMS MINI PROJECT
    INVENTORY CONTROL SYSTEM MATERIAL REQUIREMENT PROCESSING
   ============================================================ */


/* ============================================================
   1. CREATE TABLE: SUPPLIER
   ============================================================ */

CREATE TABLE Supplier (
    Supplier_ID NUMBER PRIMARY KEY,
    Supplier_Name VARCHAR2(100) NOT NULL,
    Contact_No VARCHAR2(15),
    Email VARCHAR2(100),
    Address VARCHAR2(200)
);


/* ============================================================
   2. CREATE TABLE: MATERIAL
   ============================================================ */

CREATE TABLE Material (
    Material_ID NUMBER PRIMARY KEY,
    Material_Name VARCHAR2(100) NOT NULL,
    Category VARCHAR2(50),
    Unit_Price NUMBER(10,2),
    Stock_Quantity NUMBER,
    Reorder_Level NUMBER,
    Supplier_ID NUMBER,

    CONSTRAINT fk_material_supplier
    FOREIGN KEY (Supplier_ID)
    REFERENCES Supplier(Supplier_ID)
);


/* ============================================================
   3. CREATE TABLE: DEPARTMENT
   ============================================================ */

CREATE TABLE Department (
    Department_ID NUMBER PRIMARY KEY,
    Department_Name VARCHAR2(100) NOT NULL
);


/* ============================================================
   4. CREATE TABLE: MATERIAL_REQUIREMENT
   ============================================================ */

CREATE TABLE Material_Requirement (
    Requirement_ID NUMBER PRIMARY KEY,
    Department_ID NUMBER,
    Requirement_Date DATE,
    Status VARCHAR2(30),

    CONSTRAINT fk_requirement_department
    FOREIGN KEY (Department_ID)
    REFERENCES Department(Department_ID)
);


/* ============================================================
   5. CREATE TABLE: REQUIREMENT_DETAILS
   ============================================================ */

CREATE TABLE Requirement_Details (
    Requirement_ID NUMBER,
    Material_ID NUMBER,
    Required_Quantity NUMBER,

    PRIMARY KEY (Requirement_ID, Material_ID),

    CONSTRAINT fk_details_requirement
    FOREIGN KEY (Requirement_ID)
    REFERENCES Material_Requirement(Requirement_ID),

    CONSTRAINT fk_details_material
    FOREIGN KEY (Material_ID)
    REFERENCES Material(Material_ID)
);


/* ============================================================
   6. CREATE TABLE: PURCHASE_ORDER
   ============================================================ */

CREATE TABLE Purchase_Order (
    Purchase_Order_ID NUMBER PRIMARY KEY,
    Supplier_ID NUMBER,
    Order_Date DATE,
    Total_Amount NUMBER(12,2),
    Order_Status VARCHAR2(30),

    CONSTRAINT fk_purchase_supplier
    FOREIGN KEY (Supplier_ID)
    REFERENCES Supplier(Supplier_ID)
);


/* ============================================================
   7. CREATE TABLE: PURCHASE_ORDER_DETAILS
   ============================================================ */

CREATE TABLE Purchase_Order_Details (
    Purchase_Order_ID NUMBER,
    Material_ID NUMBER,
    Quantity NUMBER,
    Unit_Price NUMBER(10,2),

    PRIMARY KEY (Purchase_Order_ID, Material_ID),

    CONSTRAINT fk_pod_order
    FOREIGN KEY (Purchase_Order_ID)
    REFERENCES Purchase_Order(Purchase_Order_ID),

    CONSTRAINT fk_pod_material
    FOREIGN KEY (Material_ID)
    REFERENCES Material(Material_ID)
);


/* ============================================================
   8. INSERT SUPPLIER DATA
   ============================================================ */

INSERT INTO Supplier
VALUES (1, 'ABC Suppliers', '9876543210',
        'abc@gmail.com', 'Chennai');

INSERT INTO Supplier
VALUES (2, 'Global Materials', '9876501234',
        'global@gmail.com', 'Coimbatore');

INSERT INTO Supplier
VALUES (3, 'Tech Materials Ltd', '9845012345',
        'tech@gmail.com', 'Bangalore');

INSERT INTO Supplier
VALUES (4, 'Prime Industries', '9898012345',
        'prime@gmail.com', 'Madurai');


/* ============================================================
   9. INSERT MATERIAL DATA
   ============================================================ */

INSERT INTO Material
VALUES (101, 'Steel Sheet', 'Metal',
        2500.00, 100, 30, 1);

INSERT INTO Material
VALUES (102, 'Copper Wire', 'Electrical',
        850.00, 200, 50, 2);

INSERT INTO Material
VALUES (103, 'Plastic Cover', 'Plastic',
        120.00, 500, 100, 3);

INSERT INTO Material
VALUES (104, 'Aluminium Rod', 'Metal',
        450.00, 150, 40, 1);

INSERT INTO Material
VALUES (105, 'Electric Motor', 'Electrical',
        5500.00, 25, 10, 2);

INSERT INTO Material
VALUES (106, 'Rubber Sheet', 'Rubber',
        300.00, 80, 20, 4);


/* ============================================================
   10. INSERT DEPARTMENT DATA
   ============================================================ */

INSERT INTO Department
VALUES (1, 'Production');

INSERT INTO Department
VALUES (2, 'Maintenance');

INSERT INTO Department
VALUES (3, 'Electrical');

INSERT INTO Department
VALUES (4, 'Quality Control');


/* ============================================================
   11. INSERT MATERIAL REQUIREMENT DATA
   ============================================================ */

INSERT INTO Material_Requirement
VALUES (1001, 1, DATE '2026-09-01', 'Pending');

INSERT INTO Material_Requirement
VALUES (1002, 2, DATE '2026-09-03', 'Approved');

INSERT INTO Material_Requirement
VALUES (1003, 3, DATE '2026-09-05', 'Completed');


/* ============================================================
   12. INSERT REQUIREMENT DETAILS
   ============================================================ */

INSERT INTO Requirement_Details
VALUES (1001, 101, 50);

INSERT INTO Requirement_Details
VALUES (1001, 103, 100);

INSERT INTO Requirement_Details
VALUES (1002, 104, 30);

INSERT INTO Requirement_Details
VALUES (1002, 106, 20);

INSERT INTO Requirement_Details
VALUES (1003, 102, 75);

INSERT INTO Requirement_Details
VALUES (1003, 105, 10);


/* ============================================================
   13. INSERT PURCHASE ORDER DATA
   ============================================================ */

INSERT INTO Purchase_Order
VALUES (5001, 1, DATE '2026-09-06',
        125000.00, 'Pending');

INSERT INTO Purchase_Order
VALUES (5002, 2, DATE '2026-09-07',
        68500.00, 'Approved');

INSERT INTO Purchase_Order
VALUES (5003, 3, DATE '2026-09-08',
        60000.00, 'Completed');


/* ============================================================
   14. INSERT PURCHASE ORDER DETAILS
   ============================================================ */

INSERT INTO Purchase_Order_Details
VALUES (5001, 101, 50, 2500.00);

INSERT INTO Purchase_Order_Details
VALUES (5001, 103, 100, 120.00);

INSERT INTO Purchase_Order_Details
VALUES (5002, 102, 50, 850.00);

INSERT INTO Purchase_Order_Details
VALUES (5002, 105, 10, 5500.00);

INSERT INTO Purchase_Order_Details
VALUES (5003, 104, 100, 450.00);


/* ============================================================
   15. DISPLAY ALL MATERIALS
   ============================================================ */

SELECT *
FROM Material;


/* ============================================================
   16. DISPLAY MATERIALS WITH LOW STOCK
   ============================================================ */

SELECT Material_ID,
       Material_Name,
       Stock_Quantity,
       Reorder_Level
FROM Material
WHERE Stock_Quantity <= Reorder_Level;


/* ============================================================
   17. DISPLAY MATERIAL AND SUPPLIER DETAILS
   ============================================================ */

SELECT m.Material_ID,
       m.Material_Name,
       m.Category,
       m.Unit_Price,
       s.Supplier_Name
FROM Material m
JOIN Supplier s
ON m.Supplier_ID = s.Supplier_ID;


/* ============================================================
   18. DISPLAY MATERIAL REQUIREMENTS
   ============================================================ */

SELECT mr.Requirement_ID,
       d.Department_Name,
       mr.Requirement_Date,
       mr.Status
FROM Material_Requirement mr
JOIN Department d
ON mr.Department_ID = d.Department_ID;


/* ============================================================
   19. DISPLAY REQUIREMENT DETAILS
   ============================================================ */

SELECT mr.Requirement_ID,
       d.Department_Name,
       m.Material_Name,
       rd.Required_Quantity
FROM Material_Requirement mr
JOIN Department d
ON mr.Department_ID = d.Department_ID
JOIN Requirement_Details rd
ON mr.Requirement_ID = rd.Requirement_ID
JOIN Material m
ON rd.Material_ID = m.Material_ID;


/* ============================================================
   20. DISPLAY PURCHASE ORDERS
   ============================================================ */

SELECT po.Purchase_Order_ID,
       s.Supplier_Name,
       po.Order_Date,
       po.Total_Amount,
       po.Order_Status
FROM Purchase_Order po
JOIN Supplier s
ON po.Supplier_ID = s.Supplier_ID;


/* ============================================================
   21. CALCULATE TOTAL STOCK VALUE
   ============================================================ */

SELECT SUM(Unit_Price * Stock_Quantity) AS Total_Stock_Value
FROM Material;


/* ============================================================
   22. FIND MOST EXPENSIVE MATERIAL
   ============================================================ */

SELECT Material_Name,
       Unit_Price
FROM Material
WHERE Unit_Price =
      (SELECT MAX(Unit_Price)
       FROM Material);


/* ============================================================
   23. COUNT MATERIALS BY CATEGORY
   ============================================================ */

SELECT Category,
       COUNT(*) AS Number_Of_Materials
FROM Material
GROUP BY Category;


/* ============================================================
   24. FIND TOTAL REQUIRED QUANTITY
   ============================================================ */

SELECT m.Material_Name,
       SUM(rd.Required_Quantity) AS Total_Required
FROM Requirement_Details rd
JOIN Material m
ON rd.Material_ID = m.Material_ID
GROUP BY m.Material_Name;


/* ============================================================
   25. COMMIT TRANSACTION
   ============================================================ */

COMMIT;
