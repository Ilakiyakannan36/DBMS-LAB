-- =========================================================
-- BANKING SYSTEM
-- =========================================================

-- =========================================================
-- STEP 1: DROP OLD TABLES
-- =========================================================

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Loan_Payment CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Bank_Transaction CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Loan CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Account CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Branch CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Customer CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

-- =========================================================
-- STEP 2: CREATE CUSTOMER TABLE
-- =========================================================

CREATE TABLE Customer (
    Customer_ID NUMBER PRIMARY KEY,
    Customer_Name VARCHAR2(100),
    Date_Of_Birth DATE,
    Gender VARCHAR2(10),
    Phone VARCHAR2(15),
    Email VARCHAR2(100),
    Address VARCHAR2(100)
);

-- =========================================================
-- STEP 3: CREATE BRANCH TABLE
-- =========================================================

CREATE TABLE Branch (
    Branch_ID NUMBER PRIMARY KEY,
    Branch_Name VARCHAR2(100),
    City VARCHAR2(50),
    IFSC_Code VARCHAR2(20)
);

-- =========================================================
-- STEP 4: CREATE ACCOUNT TABLE
-- =========================================================

CREATE TABLE Account (
    Account_ID NUMBER PRIMARY KEY,
    Customer_ID NUMBER,
    Branch_ID NUMBER,
    Account_Type VARCHAR2(30),
    Balance NUMBER(12,2)
);

-- =========================================================
-- STEP 5: CREATE BANK TRANSACTION TABLE
-- =========================================================

CREATE TABLE Bank_Transaction (
    Transaction_ID NUMBER PRIMARY KEY,
    Account_ID NUMBER,
    Transaction_Type VARCHAR2(20),
    Amount NUMBER(12,2),
    Transaction_Date DATE
);

-- =========================================================
-- STEP 6: CREATE LOAN TABLE
-- =========================================================

CREATE TABLE Loan (
    Loan_ID NUMBER PRIMARY KEY,
    Customer_ID NUMBER,
    Loan_Type VARCHAR2(30),
    Loan_Amount NUMBER(12,2),
    Interest_Rate NUMBER(5,2)
);

-- =========================================================
-- STEP 7: CREATE LOAN PAYMENT TABLE
-- =========================================================

CREATE TABLE Loan_Payment (
    Payment_ID NUMBER PRIMARY KEY,
    Loan_ID NUMBER,
    Payment_Amount NUMBER(12,2),
    Payment_Date DATE
);

-- =========================================================
-- STEP 8: INSERT CUSTOMER DATA
-- =========================================================

INSERT INTO Customer VALUES
(1, 'Deepika', DATE '2004-05-15', 'Female',
 '9876543210', 'deepika@gmail.com', 'Chennai');

INSERT INTO Customer VALUES
(2, 'Priya', DATE '2003-08-20', 'Female',
 '9876543211', 'priya@gmail.com', 'Madurai');

INSERT INTO Customer VALUES
(3, 'Arun', DATE '1998-02-10', 'Male',
 '9876543212', 'arun@gmail.com', 'Coimbatore');

INSERT INTO Customer VALUES
(4, 'Karthik', DATE '1995-11-25', 'Male',
 '9876543213', 'karthik@gmail.com', 'Trichy');

INSERT INTO Customer VALUES
(5, 'Meena', DATE '1997-07-12', 'Female',
 '9876543214', 'meena@gmail.com', 'Chennai');

-- =========================================================
-- STEP 9: INSERT BRANCH DATA
-- =========================================================

INSERT INTO Branch VALUES
(1, 'Chennai Main Branch', 'Chennai', 'BANK000001');

INSERT INTO Branch VALUES
(2, 'Coimbatore Branch', 'Coimbatore', 'BANK000002');

INSERT INTO Branch VALUES
(3, 'Madurai Branch', 'Madurai', 'BANK000003');

INSERT INTO Branch VALUES
(4, 'Trichy Branch', 'Trichy', 'BANK000004');

-- =========================================================
-- STEP 10: INSERT ACCOUNT DATA
-- =========================================================

INSERT INTO Account VALUES
(1001, 1, 1, 'Savings', 50000);

INSERT INTO Account VALUES
(1002, 2, 3, 'Savings', 75000);

INSERT INTO Account VALUES
(1003, 3, 2, 'Current', 120000);

INSERT INTO Account VALUES
(1004, 4, 4, 'Savings', 65000);

INSERT INTO Account VALUES
(1005, 5, 1, 'Savings', 55000);

-- =========================================================
-- STEP 11: INSERT BANK TRANSACTION DATA
-- =========================================================

INSERT INTO Bank_Transaction VALUES
(2001, 1001, 'Deposit', 10000, DATE '2026-09-01');

INSERT INTO Bank_Transaction VALUES
(2002, 1001, 'Withdrawal', 5000, DATE '2026-09-03');

INSERT INTO Bank_Transaction VALUES
(2003, 1002, 'Deposit', 15000, DATE '2026-09-05');

INSERT INTO Bank_Transaction VALUES
(2004, 1003, 'Withdrawal', 20000, DATE '2026-09-07');

INSERT INTO Bank_Transaction VALUES
(2005, 1004, 'Deposit', 5000, DATE '2026-09-10');

INSERT INTO Bank_Transaction VALUES
(2006, 1005, 'Deposit', 8000, DATE '2026-09-12');

-- =========================================================
-- STEP 12: INSERT LOAN DATA
-- =========================================================

INSERT INTO Loan VALUES
(3001, 1, 'Home Loan', 500000, 7.50);

INSERT INTO Loan VALUES
(3002, 2, 'Education Loan', 200000, 6.50);

INSERT INTO Loan VALUES
(3003, 3, 'Vehicle Loan', 300000, 8.00);

INSERT INTO Loan VALUES
(3004, 4, 'Personal Loan', 150000, 9.00);

-- =========================================================
-- STEP 13: INSERT LOAN PAYMENT DATA
-- =========================================================

INSERT INTO Loan_Payment VALUES
(4001, 3001, 25000, DATE '2026-09-15');

INSERT INTO Loan_Payment VALUES
(4002, 3002, 10000, DATE '2026-09-16');

INSERT INTO Loan_Payment VALUES
(4003, 3003, 15000, DATE '2026-09-17');

INSERT INTO Loan_Payment VALUES
(4004, 3004, 8000, DATE '2026-09-18');

COMMIT;

-- =========================================================
-- STEP 14: DISPLAY CUSTOMERS
-- =========================================================

SELECT *
FROM Customer;

-- =========================================================
-- STEP 15: DISPLAY BRANCHES
-- =========================================================

SELECT *
FROM Branch;

-- =========================================================
-- STEP 16: DISPLAY ACCOUNTS
-- =========================================================

SELECT *
FROM Account;

-- =========================================================
-- STEP 17: DISPLAY CUSTOMER ACCOUNT DETAILS
-- =========================================================

SELECT
    c.Customer_ID,
    c.Customer_Name,
    a.Account_ID,
    a.Account_Type,
    a.Balance
FROM Customer c
JOIN Account a
ON c.Customer_ID = a.Customer_ID
ORDER BY c.Customer_ID;

-- =========================================================
-- STEP 18: CUSTOMERS FROM CHENNAI
-- =========================================================

SELECT
    Customer_ID,
    Customer_Name,
    Phone,
    Email
FROM Customer
WHERE Address = 'Chennai';

-- =========================================================
-- STEP 19: ACCOUNTS WITH BALANCE GREATER THAN 60000
-- =========================================================

SELECT
    Account_ID,
    Customer_ID,
    Account_Type,
    Balance
FROM Account
WHERE Balance > 60000;

-- =========================================================
-- STEP 20: AVERAGE ACCOUNT BALANCE
-- =========================================================

SELECT
    ROUND(AVG(Balance), 2) AS Average_Balance
FROM Account;

-- =========================================================
-- STEP 21: HIGHEST ACCOUNT BALANCE
-- =========================================================

SELECT
    Account_ID,
    Customer_ID,
    Account_Type,
    Balance
FROM Account
WHERE Balance = (
    SELECT MAX(Balance)
    FROM Account
);

-- =========================================================
-- STEP 22: TRANSACTION DETAILS
-- =========================================================

SELECT
    Transaction_ID,
    Account_ID,
    Transaction_Type,
    Amount,
    Transaction_Date
FROM Bank_Transaction
ORDER BY Transaction_ID;

-- =========================================================
-- STEP 23: TRANSACTION DETAILS WITH CUSTOMER NAME
-- =========================================================

SELECT
    c.Customer_Name,
    a.Account_ID,
    bt.Transaction_Type,
    bt.Amount,
    bt.Transaction_Date
FROM Bank_Transaction bt
JOIN Account a
ON bt.Account_ID = a.Account_ID
JOIN Customer c
ON a.Customer_ID = c.Customer_ID
ORDER BY bt.Transaction_ID;

-- =========================================================
-- STEP 24: TOTAL DEPOSITS
-- =========================================================

SELECT
    SUM(Amount) AS Total_Deposits
FROM Bank_Transaction
WHERE Transaction_Type = 'Deposit';

-- =========================================================
-- STEP 25: TOTAL WITHDRAWALS
-- =========================================================

SELECT
    SUM(Amount) AS Total_Withdrawals
FROM Bank_Transaction
WHERE Transaction_Type = 'Withdrawal';

-- =========================================================
-- STEP 26: LOAN DETAILS
-- =========================================================

SELECT
    l.Loan_ID,
    c.Customer_Name,
    l.Loan_Type,
    l.Loan_Amount,
    l.Interest_Rate
FROM Loan l
JOIN Customer c
ON l.Customer_ID = c.Customer_ID
ORDER BY l.Loan_ID;

-- =========================================================
-- STEP 27: LOANS GREATER THAN 250000
-- =========================================================

SELECT
    l.Loan_ID,
    c.Customer_Name,
    l.Loan_Type,
    l.Loan_Amount
FROM Loan l
JOIN Customer c
ON l.Customer_ID = c.Customer_ID
WHERE l.Loan_Amount > 250000;

-- =========================================================
-- STEP 28: LOAN PAYMENT DETAILS
-- =========================================================

SELECT
    lp.Payment_ID,
    l.Loan_ID,
    c.Customer_Name,
    lp.Payment_Amount,
    lp.Payment_Date
FROM Loan_Payment lp
JOIN Loan l
ON lp.Loan_ID = l.Loan_ID
JOIN Customer c
ON l.Customer_ID = c.Customer_ID
ORDER BY lp.Payment_ID;

-- =========================================================
-- STEP 29: UPDATE ACCOUNT BALANCE
-- =========================================================

UPDATE Account
SET Balance = Balance + 5000
WHERE Account_ID = 1001;

COMMIT;

SELECT *
FROM Account
WHERE Account_ID = 1001;

-- =========================================================
-- STEP 30: UPDATE LOAN INTEREST RATE
-- =========================================================

UPDATE Loan
SET Interest_Rate = 7.25
WHERE Loan_ID = 3001;

COMMIT;

SELECT *
FROM Loan
WHERE Loan_ID = 3001;

-- =========================================================
-- STEP 31: DELETE A LOAN PAYMENT
-- =========================================================

DELETE FROM Loan_Payment
WHERE Payment_ID = 4004;

COMMIT;

SELECT *
FROM Loan_Payment;
