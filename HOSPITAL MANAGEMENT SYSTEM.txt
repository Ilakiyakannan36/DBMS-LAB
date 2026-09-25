
/*====================================================
   HOSPITAL MANAGEMENT SYSTEM

====================================================*/

/*---------------------------
  TABLE : DOCTORS
---------------------------*/

CREATE TABLE Doctors (
    DoctorID NUMBER PRIMARY KEY,
    DoctorName VARCHAR2(100),
    Specialization VARCHAR2(100),
    Phone VARCHAR2(15)
);

/*---------------------------
  TABLE : PATIENTS
---------------------------*/

CREATE TABLE Patients (
    PatientID NUMBER PRIMARY KEY,
    PatientName VARCHAR2(100),
    Age NUMBER,
    Gender VARCHAR2(10),
    Address VARCHAR2(200)
);

/*---------------------------
  TABLE : APPOINTMENTS
---------------------------*/

CREATE TABLE Appointments (
    AppointmentID NUMBER PRIMARY KEY,
    PatientID NUMBER,
    DoctorID NUMBER,
    AppointmentDate DATE,
    Diagnosis VARCHAR2(200),
    CONSTRAINT fk_patient
        FOREIGN KEY (PatientID)
        REFERENCES Patients(PatientID),
    CONSTRAINT fk_doctor
        FOREIGN KEY (DoctorID)
        REFERENCES Doctors(DoctorID)
);

/*---------------------------
  TABLE : BILLS
---------------------------*/

CREATE TABLE Bills (
    BillID NUMBER PRIMARY KEY,
    PatientID NUMBER,
    Amount NUMBER(10,2),
    BillDate DATE,
    CONSTRAINT fk_bill_patient
        FOREIGN KEY (PatientID)
        REFERENCES Patients(PatientID)
);

/*====================================================
   INSERT RECORDS
====================================================*/

INSERT INTO Doctors VALUES
(101,'Dr. Rajesh','Cardiology','9876543210');

INSERT INTO Doctors VALUES
(102,'Dr. Priya','Neurology','9876543211');

INSERT INTO Doctors VALUES
(103,'Dr. Kumar','Orthopedics','9876543212');

INSERT INTO Patients VALUES
(1,'Arun',25,'Male','Chennai');

INSERT INTO Patients VALUES
(2,'Divya',30,'Female','Coimbatore');

INSERT INTO Patients VALUES
(3,'Karthik',40,'Male','Madurai');

INSERT INTO Appointments VALUES
(1001,1,101,TO_DATE('10-09-2026','DD-MM-YYYY'),'Heart Checkup');

INSERT INTO Appointments VALUES
(1002,2,102,TO_DATE('12-09-2026','DD-MM-YYYY'),'Migraine');

INSERT INTO Appointments VALUES
(1003,3,103,TO_DATE('15-09-2026','DD-MM-YYYY'),'Fracture');

INSERT INTO Bills VALUES
(501,1,2500,SYSDATE);

INSERT INTO Bills VALUES
(502,2,1800,SYSDATE);

INSERT INTO Bills VALUES
(503,3,3200,SYSDATE);

COMMIT;

/*====================================================
   VIEW
====================================================*/

CREATE OR REPLACE VIEW PatientDoctorView AS
SELECT
    p.PatientName,
    d.DoctorName,
    d.Specialization,
    a.AppointmentDate
FROM Patients p
JOIN Appointments a
ON p.PatientID = a.PatientID
JOIN Doctors d
ON a.DoctorID = d.DoctorID;

/*====================================================
   PROCEDURE
====================================================*/

CREATE OR REPLACE PROCEDURE ShowPatientCount
IS
    total_patients NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO total_patients
    FROM Patients;

    DBMS_OUTPUT.PUT_LINE(
        'Total Patients = ' || total_patients
    );
END;
/

/*====================================================
   FUNCTION
====================================================*/

CREATE OR REPLACE FUNCTION GetBillAmount
(
    p_billid NUMBER
)
RETURN NUMBER
IS
    v_amount NUMBER;
BEGIN
    SELECT Amount
    INTO v_amount
    FROM Bills
    WHERE BillID = p_billid;

    RETURN v_amount;
END;
/

/*====================================================
   TRIGGER
====================================================*/

CREATE OR REPLACE TRIGGER Patient_Insert_Trigger
AFTER INSERT ON Patients
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE(
        'New Patient Added: ' || :NEW.PatientName
    );
END;
/

/*====================================================
   QUERIES
====================================================*/

-- Display Doctors
SELECT * FROM Doctors;

-- Display Patients
SELECT * FROM Patients;

-- Display Appointments
SELECT * FROM Appointments;

-- Patient and Doctor Details
SELECT
    p.PatientName,
    d.DoctorName,
    d.Specialization
FROM Patients p
JOIN Appointments a
ON p.PatientID = a.PatientID
JOIN Doctors d
ON a.DoctorID = d.DoctorID;

-- Bill Details
SELECT * FROM Bills;

-- View
SELECT * FROM PatientDoctorView;

-- Function
SELECT GetBillAmount(501)
FROM Dual;

-- Procedure
EXEC ShowPatientCount;
```
