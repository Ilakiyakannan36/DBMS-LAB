/* ============================================================
   DBMS MINI PROJECT
   BANKING SYSTEM
   ============================================================ */


/* ============================================================
   1. CREATE CUSTOMER TABLE
   ============================================================ */

CREATE TABLE Customer (
    Customer_ID NUMBER PRIMARY KEY,
    Customer_Name VARCHAR2(100) NOT NULL,
    Date_Of_Birth DATE,
    Gender VARCHAR2(10),
    Phone VARCHAR2(15),
    Email VARCHAR2(100),
    Address VARCHAR2(200)
);


/* ============================================================
   2. CREATE BRANCH TABLE
   ============================================================ */

CREATE TABLE Branch (
    Branch_ID NUMBER PRIMARY KEY,
    Branch_Name VARCHAR2(100) NOT NULL,
    City VARCHAR2(50),
    IFSC_Code VARCHAR2(20) UNIQUE
);


/* ============================================================
   3. CREATE ACCOUNT TABLE
   ============================================================ */

CREATE TABLE Account (
    Account_No NUMBER PRIMARY KEY,
    Customer_ID NUMBER,
    Branch_ID NUMBER,
    Account_Type VARCHAR2(30),
    Opening_Date DATE,
    Balance NUMBER(12,2),
    Account_Status VARCHAR2(20),

    CONSTRAINT fk_account_customer
    FOREIGN KEY (Customer_ID)
    REFERENCES Customer(Customer_ID),

    CONSTRAINT fk_account_branch
    FOREIGN KEY (Branch_ID)
    REFERENCES Branch(Branch_ID)
);


/* ============================================================
   4. CREATE TRANSACTION TABLE
   ============================================================ */

CREATE TABLE Bank_Transaction (
    Transaction_ID NUMBER PRIMARY KEY,
    Account_No NUMBER,
    Transaction_Date DATE,
    Transaction_Type VARCHAR2(20),
    Amount NUMBER(12,2),
    Description VARCHAR2(200),

    CONSTRAINT fk_transaction_account
    FOREIGN KEY (Account_No)
    REFERENCES Account(Account_No)
);


/* ============================================================
   5. CREATE LOAN TABLE
   ============================================================ */

CREATE TABLE Loan (
    Loan_ID NUMBER PRIMARY KEY,
    Customer_ID NUMBER,
    Loan_Type VARCHAR2(50),
    Loan_Amount NUMBER(12,2),
    Interest_Rate NUMBER(5,2),
    Loan_Date DATE,
    Loan_Status VARCHAR2(20),

    CONSTRAINT fk_loan_customer
    FOREIGN KEY (Customer_ID)
    REFERENCES Customer(Customer_ID)
);


/* ============================================================
   6. CREATE LOAN PAYMENT TABLE
   ============================================================ */

CREATE TABLE Loan_Payment (
    Payment_ID NUMBER PRIMARY KEY,
    Loan_ID NUMBER,
    Payment_Date DATE,
    Payment_Amount NUMBER(12,2),
    Payment_Mode VARCHAR2(30),

    CONSTRAINT fk_loan_payment
    FOREIGN KEY (Loan_ID)
    REFERENCES Loan(Loan_ID)
);


/* ============================================================
   7. INSERT BRANCH DATA
   ============================================================ */

INSERT INTO Branch
VALUES (
    1,
    'Chennai Main Branch',
    'Chennai',
    'BANK000001'
);

INSERT INTO Branch
VALUES (
    2,
    'Coimbatore Branch',
    'Coimbatore',
    'BANK000002'
);

INSERT INTO Branch
VALUES (
    3,
    'Madurai Branch',
    'Madurai',
    'BANK000003'
);

INSERT INTO Branch
VALUES (
    4,
    'Trichy Branch',
    'Trichy',
    'BANK000004'
);


/* ============================================================
   8. INSERT CUSTOMER DATA
   ============================================================ */

INSERT INTO Customer
VALUES (
    1,
    'Deepika',
    DATE '2004-05-15',
    'Female',
    '9876543210',
    'deepika@gmail.com',
    'Chennai'
);

INSERT INTO Customer
VALUES (
    2,
    'Priya',
    DATE '2003-08-20',
    'Female',
    '9876543211',
    'priya@gmail.com',
    'Madurai'
);

INSERT INTO Customer
VALUES (
    3,
    'Arun',
    DATE '1998-02-10',
    'Male',
    '9876543212',
    'arun@gmail.com',
    'Coimbatore'
);

INSERT INTO Customer
VALUES (
    4,
    'Karthik',
    DATE '1995-11-25',
    'Male',
    '9876543213',
    'karthik@gmail.com',
    'Trichy'
);

INSERT INTO Customer
VALUES (
    5,
    'Meena',
    DATE '1997-07-12',
    'Female',
    '9876543214',
    'meena@gmail.com',
    'Chennai'
);


/* ============================================================
   9. INSERT ACCOUNT DATA
   ============================================================ */

INSERT INTO Account
VALUES (
    100001,
    1,
    1,
    'Savings',
    DATE '2024-01-10',
    50000.00,
    'Active'
);

INSERT INTO Account
VALUES (
    100002,
    2,
    3,
    'Savings',
    DATE '2023-06-15',
    75000.00,
    'Active'
);

INSERT INTO Account
VALUES (
    100003,
    3,
    2,
    'Current',
    DATE '2022-03-20',
    150000.00,
    'Active'
);

INSERT INTO Account
VALUES (
    100004,
    4,
    4,
    'Savings',
    DATE '2024-08-05',
    30000.00,
    'Active'
);

INSERT INTO Account
VALUES (
    100005,
    5,
    1,
    'Savings',
    DATE '2025-01-15',
    90000.00,
    'Active'
);


/* ============================================================
   10. INSERT TRANSACTION DATA
   ============================================================ */

INSERT INTO Bank_Transaction
VALUES (
    5001,
    100001,
    DATE '2026-09-01',
    'Deposit',
    10000.00,
    'Cash deposit'
);

INSERT INTO Bank_Transaction
VALUES (
    5002,
    100001,
    DATE '2026-09-05',
    'Withdrawal',
    5000.00,
    'ATM withdrawal'
);

INSERT INTO Bank_Transaction
VALUES (
    5003,
    100002,
    DATE '2026-09-02',
    'Deposit',
    20000.00,
    'Salary credit'
);

INSERT INTO Bank_Transaction
VALUES (
    5004,
    100003,
    DATE '2026-09-03',
    'Withdrawal',
    15000.00,
    'Business payment'
);

INSERT INTO Bank_Transaction
VALUES (
    5005,
    100004,
    DATE '2026-09-04',
    'Deposit',
    5000.00,
    'Cash deposit'
);

INSERT INTO Bank_Transaction
VALUES (
    5006,
    100005,
    DATE '2026-09-05',
    'Deposit',
    25000.00,
    'Salary credit'
);


/* ============================================================
   11. INSERT LOAN DATA
   ============================================================ */

INSERT INTO Loan
VALUES (
    7001,
    1,
    'Education Loan',
    200000.00,
    7.50,
    DATE '2025-06-10',
    'Active'
);

INSERT INTO Loan
VALUES (
    7002,
    2,
    'Home Loan',
    1500000.00,
    8.25,
    DATE '2024-04-15',
    'Active'
);

INSERT INTO Loan
VALUES (
    7003,
    3,
    'Business Loan',
    500000.00,
    9.00,
    DATE '2023-08-20',
    'Active'
);

INSERT INTO Loan
VALUES (
    7004,
    4,
    'Personal Loan',
    300000.00,
    10.50,
    DATE '2025-01-20',
    'Closed'
);


/* ============================================================
   12. INSERT LOAN PAYMENT DATA
   ============================================================ */

INSERT INTO Loan_Payment
VALUES (
    8001,
    7001,
    DATE '2026-08-10',
    10000.00,
    'UPI'
);

INSERT INTO Loan_Payment
VALUES (
    8002,
    7002,
    DATE '2026-08-15',
    25000.00,
    'Bank Transfer'
);

INSERT INTO Loan_Payment
VALUES (
    8003,
    7003,
    DATE '2026-08-20',
    20000.00,
    'Cheque'
);

INSERT INTO Loan_Payment
VALUES (
    8004,
    7004,
    DATE '2026-08-25',
    30000.00,
    'UPI'
);


/* ============================================================
   13. DISPLAY ALL CUSTOMERS
   ============================================================ */

SELECT *
FROM Customer;


/* ============================================================
   14. DISPLAY ALL BRANCHES
   ============================================================ */

SELECT *
FROM Branch;


/* ============================================================
   15. DISPLAY ALL ACCOUNTS
   ============================================================ */

SELECT *
FROM Account;


/* ============================================================
   16. DISPLAY CUSTOMER ACCOUNT DETAILS
   ============================================================ */

SELECT
    c.Customer_ID,
    c.Customer_Name,
    a.Account_No,
    a.Account_Type,
    a.Balance,
    a.Account_Status
FROM Customer c
JOIN Account a
    ON c.Customer_ID = a.Customer_ID;


/* ============================================================
   17. DISPLAY CUSTOMER AND BRANCH DETAILS
   ============================================================ */

SELECT
    c.Customer_Name,
    a.Account_No,
    b.Branch_Name,
    b.City,
    b.IFSC_Code
FROM Customer c
JOIN Account a
    ON c.Customer_ID = a.Customer_ID
JOIN Branch b
    ON a.Branch_ID = b.Branch_ID;


/* ============================================================
   18. DISPLAY SAVINGS ACCOUNTS
   ============================================================ */

SELECT
    Account_No,
    Customer_ID,
    Balance
FROM Account
WHERE Account_Type = 'Savings';


/* ============================================================
   19. DISPLAY ACCOUNTS WITH BALANCE GREATER THAN 50000
   ============================================================ */

SELECT
    Account_No,
    Customer_ID,
    Account_Type,
    Balance
FROM Account
WHERE Balance > 50000;


/* ============================================================
   20. DISPLAY BANK TRANSACTIONS
   ============================================================ */

SELECT *
FROM Bank_Transaction;


/* ============================================================
   21. DISPLAY TRANSACTIONS WITH CUSTOMER NAME
   ============================================================ */

SELECT
    c.Customer_Name,
    a.Account_No,
    t.Transaction_Date,
    t.Transaction_Type,
    t.Amount,
    t.Description
FROM Bank_Transaction t
JOIN Account a
    ON t.Account_No = a.Account_No
JOIN Customer c
    ON a.Customer_ID = c.Customer_ID;


/* ============================================================
   22. FIND TOTAL DEPOSIT AMOUNT
   ============================================================ */

SELECT
    SUM(Amount) AS Total_Deposits
FROM Bank_Transaction
WHERE Transaction_Type = 'Deposit';


/* ============================================================
   23. FIND TOTAL WITHDRAWAL AMOUNT
   ============================================================ */

SELECT
    SUM(Amount) AS Total_Withdrawals
FROM Bank_Transaction
WHERE Transaction_Type = 'Withdrawal';


/* ============================================================
   24. FIND HIGHEST ACCOUNT BALANCE
   ============================================================ */

SELECT
    Account_No,
    Customer_ID,
    Balance
FROM Account
WHERE Balance =
(
    SELECT MAX(Balance)
    FROM Account
);


/* ============================================================
   25. FIND LOWEST ACCOUNT BALANCE
   ============================================================ */

SELECT
    Account_No,
    Customer_ID,
    Balance
FROM Account
WHERE Balance =
(
    SELECT MIN(Balance)
    FROM Account
);


/* ============================================================
   26. COUNT ACCOUNTS BY ACCOUNT TYPE
   ============================================================ */

SELECT
    Account_Type,
    COUNT(*) AS Number_Of_Accounts
FROM Account
GROUP BY Account_Type;


/* ============================================================
   27. FIND AVERAGE ACCOUNT BALANCE
   ============================================================ */

SELECT
    AVG(Balance) AS Average_Balance
FROM Account;


/* ============================================================
   28. DISPLAY ALL LOANS
   ============================================================ */

SELECT *
FROM Loan;


/* ============================================================
   29. DISPLAY ACTIVE LOANS
   ============================================================ */

SELECT
    Loan_ID,
    Customer_ID,
    Loan_Type,
    Loan_Amount,
    Interest_Rate,
    Loan_Status
FROM Loan
WHERE Loan_Status = 'Active';


/* ============================================================
   30. DISPLAY CUSTOMER LOAN DETAILS
   ============================================================ */

SELECT
    c.Customer_Name,
    l.Loan_ID,
    l.Loan_Type,
    l.Loan_Amount,
    l.Interest_Rate,
    l.Loan_Status
FROM Customer c
JOIN Loan l
    ON c.Customer_ID = l.Customer_ID;


/* ============================================================
   31. FIND TOTAL LOAN AMOUNT
   ============================================================ */

SELECT
    SUM(Loan_Amount) AS Total_Loan_Amount
FROM Loan;


/* ============================================================
   32. FIND HIGHEST LOAN
   ============================================================ */

SELECT
    Loan_ID,
    Customer_ID,
    Loan_Type,
    Loan_Amount
FROM Loan
WHERE Loan_Amount =
(
    SELECT MAX(Loan_Amount)
    FROM Loan
);


/* ============================================================
   33. DISPLAY LOAN PAYMENTS
   ============================================================ */

SELECT *
FROM Loan_Payment;


/* ============================================================
   34. DISPLAY LOAN PAYMENT DETAILS
   ============================================================ */

SELECT
    c.Customer_Name,
    l.Loan_Type,
    lp.Payment_Date,
    lp.Payment_Amount,
    lp.Payment_Mode
FROM Loan_Payment lp
JOIN Loan l
    ON lp.Loan_ID = l.Loan_ID
JOIN Customer c
    ON l.Customer_ID = c.Customer_ID;


/* ============================================================
   35. FIND TOTAL LOAN PAYMENTS
   ============================================================ */

SELECT
    SUM(Payment_Amount) AS Total_Loan_Payments
FROM Loan_Payment;


/* ============================================================
   36. UPDATE ACCOUNT BALANCE
   ============================================================ */

UPDATE Account
SET Balance = Balance + 5000
WHERE Account_No = 100001;


/* ============================================================
   37. UPDATE CUSTOMER PHONE NUMBER
   ============================================================ */

UPDATE Customer
SET Phone = '9999999999'
WHERE Customer_ID = 1;


/* ============================================================
   38. UPDATE LOAN STATUS
   ============================================================ */

UPDATE Loan
SET Loan_Status = 'Closed'
WHERE Loan_ID = 7004;


/* ============================================================
   39. DELETE A LOAN PAYMENT
   ============================================================ */

DELETE FROM Loan_Payment
WHERE Payment_ID = 8004;


/* ============================================================
   40. COMMIT ALL CHANGES
   ============================================================ */

COMMIT;
