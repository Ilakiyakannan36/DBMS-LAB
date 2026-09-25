/* ============================================================
   DBMS MINI PROJECT
   E. TIME TABLE MANAGEMENT SYSTEM
   ============================================================ */


/* ============================================================
   1. CREATE DEPARTMENT TABLE
   ============================================================ */

CREATE TABLE Department (
    Department_ID NUMBER PRIMARY KEY,
    Department_Name VARCHAR2(100) NOT NULL
);


/* ============================================================
   2. CREATE FACULTY TABLE
   ============================================================ */

CREATE TABLE Faculty (
    Faculty_ID NUMBER PRIMARY KEY,
    Faculty_Name VARCHAR2(100) NOT NULL,
    Department_ID NUMBER,
    Email VARCHAR2(100),
    Phone VARCHAR2(15),

    CONSTRAINT fk_faculty_department
    FOREIGN KEY (Department_ID)
    REFERENCES Department(Department_ID)
);


/* ============================================================
   3. CREATE SUBJECT TABLE
   ============================================================ */

CREATE TABLE Subject (
    Subject_ID NUMBER PRIMARY KEY,
    Subject_Name VARCHAR2(100) NOT NULL,
    Subject_Code VARCHAR2(20),
    Department_ID NUMBER,
    Semester NUMBER,
    Credits NUMBER,

    CONSTRAINT fk_subject_department
    FOREIGN KEY (Department_ID)
    REFERENCES Department(Department_ID)
);


/* ============================================================
   4. CREATE CLASSROOM TABLE
   ============================================================ */

CREATE TABLE Classroom (
    Room_ID NUMBER PRIMARY KEY,
    Room_Number VARCHAR2(20) NOT NULL,
    Building VARCHAR2(100),
    Capacity NUMBER
);


/* ============================================================
   5. CREATE STUDENT TABLE
   ============================================================ */

CREATE TABLE Student (
    Student_ID NUMBER PRIMARY KEY,
    Student_Name VARCHAR2(100) NOT NULL,
    Department_ID NUMBER,
    Semester NUMBER,
    Section VARCHAR2(10),

    CONSTRAINT fk_student_department
    FOREIGN KEY (Department_ID)
    REFERENCES Department(Department_ID)
);


/* ============================================================
   6. CREATE TIMETABLE TABLE
   ============================================================ */

CREATE TABLE Timetable (
    Timetable_ID NUMBER PRIMARY KEY,
    Department_ID NUMBER,
    Subject_ID NUMBER,
    Faculty_ID NUMBER,
    Room_ID NUMBER,
    Day_Name VARCHAR2(20),
    Period_Number NUMBER,
    Start_Time VARCHAR2(10),
    End_Time VARCHAR2(10),

    CONSTRAINT fk_tt_department
    FOREIGN KEY (Department_ID)
    REFERENCES Department(Department_ID),

    CONSTRAINT fk_tt_subject
    FOREIGN KEY (Subject_ID)
    REFERENCES Subject(Subject_ID),

    CONSTRAINT fk_tt_faculty
    FOREIGN KEY (Faculty_ID)
    REFERENCES Faculty(Faculty_ID),

    CONSTRAINT fk_tt_room
    FOREIGN KEY (Room_ID)
    REFERENCES Classroom(Room_ID)
);


/* ============================================================
   7. INSERT DEPARTMENT DATA
   ============================================================ */

INSERT INTO Department
VALUES (1, 'Computer Science');

INSERT INTO Department
VALUES (2, 'Information Technology');

INSERT INTO Department
VALUES (3, 'Electronics and Communication');

INSERT INTO Department
VALUES (4, 'Mechanical Engineering');

INSERT INTO Department
VALUES (5, 'Electrical Engineering');


/* ============================================================
   8. INSERT FACULTY DATA
   ============================================================ */

INSERT INTO Faculty
VALUES (101, 'Dr. Arun Kumar', 1,
        'arun@college.edu', '9876543210');

INSERT INTO Faculty
VALUES (102, 'Mrs. Priya Sharma', 1,
        'priya@college.edu', '9876543211');

INSERT INTO Faculty
VALUES (103, 'Mr. Rajesh Kumar', 2,
        'rajesh@college.edu', '9876543212');

INSERT INTO Faculty
VALUES (104, 'Dr. Meena Devi', 3,
        'meena@college.edu', '9876543213');

INSERT INTO Faculty
VALUES (105, 'Mr. Karthik Raj', 4,
        'karthik@college.edu', '9876543214');

INSERT INTO Faculty
VALUES (106, 'Mrs. Anitha Rao', 5,
        'anitha@college.edu', '9876543215');


/* ============================================================
   9. INSERT SUBJECT DATA
   ============================================================ */

INSERT INTO Subject
VALUES (201, 'Database Management Systems',
        'CS301', 1, 3, 4);

INSERT INTO Subject
VALUES (202, 'Operating Systems',
        'CS302', 1, 3, 4);

INSERT INTO Subject
VALUES (203, 'Computer Networks',
        'CS303', 1, 3, 3);

INSERT INTO Subject
VALUES (204, 'Web Technology',
        'IT301', 2, 3, 3);

INSERT INTO Subject
VALUES (205, 'Software Engineering',
        'IT302', 2, 3, 4);

INSERT INTO Subject
VALUES (206, 'Digital Electronics',
        'EC301', 3, 3, 4);

INSERT INTO Subject
VALUES (207, 'Engineering Mechanics',
        'ME301', 4, 3, 4);

INSERT INTO Subject
VALUES (208, 'Electrical Machines',
        'EE301', 5, 3, 4);


/* ============================================================
   10. INSERT CLASSROOM DATA
   ============================================================ */

INSERT INTO Classroom
VALUES (301, 'CSE-101', 'Main Block', 60);

INSERT INTO Classroom
VALUES (302, 'CSE-102', 'Main Block', 60);

INSERT INTO Classroom
VALUES (303, 'IT-201', 'IT Block', 50);

INSERT INTO Classroom
VALUES (304, 'ECE-301', 'ECE Block', 60);

INSERT INTO Classroom
VALUES (305, 'ME-401', 'Mechanical Block', 50);


/* ============================================================
   11. INSERT STUDENT DATA
   ============================================================ */

INSERT INTO Student
VALUES (1001, 'Deepika', 1, 3, 'A');

INSERT INTO Student
VALUES (1002, 'Priya', 1, 3, 'A');

INSERT INTO Student
VALUES (1003, 'Karthik', 1, 3, 'A');

INSERT INTO Student
VALUES (1004, 'Arun', 2, 3, 'A');

INSERT INTO Student
VALUES (1005, 'Meena', 2, 3, 'A');

INSERT INTO Student
VALUES (1006, 'Rahul', 3, 3, 'A');


/* ============================================================
   12. INSERT TIMETABLE DATA
   ============================================================ */

/* MONDAY */

INSERT INTO Timetable
VALUES (1, 1, 201, 101, 301,
        'Monday', 1, '09:00', '10:00');

INSERT INTO Timetable
VALUES (2, 1, 202, 102, 302,
        'Monday', 2, '10:00', '11:00');

INSERT INTO Timetable
VALUES (3, 1, 203, 101, 301,
        'Monday', 3, '11:15', '12:15');


/* TUESDAY */

INSERT INTO Timetable
VALUES (4, 1, 202, 102, 302,
        'Tuesday', 1, '09:00', '10:00');

INSERT INTO Timetable
VALUES (5, 1, 201, 101, 301,
        'Tuesday', 2, '10:00', '11:00');

INSERT INTO Timetable
VALUES (6, 1, 203, 101, 301,
        'Tuesday', 4, '01:30', '02:30');


/* WEDNESDAY */

INSERT INTO Timetable
VALUES (7, 1, 203, 101, 301,
        'Wednesday', 1, '09:00', '10:00');

INSERT INTO Timetable
VALUES (8, 1, 201, 101, 301,
        'Wednesday', 2, '10:00', '11:00');

INSERT INTO Timetable
VALUES (9, 1, 202, 102, 302,
        'Wednesday', 3, '11:15', '12:15');


/* THURSDAY */

INSERT INTO Timetable
VALUES (10, 1, 201, 101, 301,
        'Thursday', 1, '09:00', '10:00');

INSERT INTO Timetable
VALUES (11, 1, 202, 102, 302,
        'Thursday', 2, '10:00', '11:00');


/* FRIDAY */

INSERT INTO Timetable
VALUES (12, 1, 202, 102, 302,
        'Friday', 1, '09:00', '10:00');

INSERT INTO Timetable
VALUES (13, 1, 203, 101, 301,
        'Friday', 2, '10:00', '11:00');

INSERT INTO Timetable
VALUES (14, 1, 201, 101, 301,
        'Friday', 3, '11:15', '12:15');


/* ============================================================
   13. DISPLAY ALL DEPARTMENTS
   ============================================================ */

SELECT *
FROM Department;


/* ============================================================
   14. DISPLAY ALL FACULTY
   ============================================================ */

SELECT *
FROM Faculty;


/* ============================================================
   15. DISPLAY ALL SUBJECTS
   ============================================================ */

SELECT *
FROM Subject;


/* ============================================================
   16. DISPLAY ALL CLASSROOMS
   ============================================================ */

SELECT *
FROM Classroom;


/* ============================================================
   17. DISPLAY ALL STUDENTS
   ============================================================ */

SELECT *
FROM Student;


/* ============================================================
   18. DISPLAY COMPLETE TIMETABLE
   ============================================================ */

SELECT
    t.Timetable_ID,
    d.Department_Name,
    s.Subject_Name,
    f.Faculty_Name,
    c.Room_Number,
    t.Day_Name,
    t.Period_Number,
    t.Start_Time,
    t.End_Time
FROM Timetable t
JOIN Department d
    ON t.Department_ID = d.Department_ID
JOIN Subject s
    ON t.Subject_ID = s.Subject_ID
JOIN Faculty f
    ON t.Faculty_ID = f.Faculty_ID
JOIN Classroom c
    ON t.Room_ID = c.Room_ID
ORDER BY t.Day_Name, t.Period_Number;


/* ============================================================
   19. DISPLAY MONDAY TIMETABLE
   ============================================================ */

SELECT
    s.Subject_Name,
    f.Faculty_Name,
    c.Room_Number,
    t.Start_Time,
    t.End_Time
FROM Timetable t
JOIN Subject s
    ON t.Subject_ID = s.Subject_ID
JOIN Faculty f
    ON t.Faculty_ID = f.Faculty_ID
JOIN Classroom c
    ON t.Room_ID = c.Room_ID
WHERE t.Day_Name = 'Monday'
ORDER BY t.Period_Number;


/* ============================================================
   20. DISPLAY TIMETABLE FOR COMPUTER SCIENCE
   ============================================================ */

SELECT
    d.Department_Name,
    s.Subject_Name,
    f.Faculty_Name,
    t.Day_Name,
    t.Period_Number,
    c.Room_Number
FROM Timetable t
JOIN Department d
    ON t.Department_ID = d.Department_ID
JOIN Subject s
    ON t.Subject_ID = s.Subject_ID
JOIN Faculty f
    ON t.Faculty_ID = f.Faculty_ID
JOIN Classroom c
    ON t.Room_ID = c.Room_ID
WHERE d.Department_Name = 'Computer Science'
ORDER BY t.Day_Name, t.Period_Number;


/* ============================================================
   21. DISPLAY SUBJECTS WITH FACULTY
   ============================================================ */

SELECT
    s.Subject_Code,
    s.Subject_Name,
    f.Faculty_Name
FROM Subject s
JOIN Faculty f
    ON s.Department_ID = f.Department_ID;


/* ============================================================
   22. COUNT SUBJECTS IN EACH DEPARTMENT
   ============================================================ */

SELECT
    d.Department_Name,
    COUNT(s.Subject_ID) AS Total_Subjects
FROM Department d
LEFT JOIN Subject s
    ON d.Department_ID = s.Department_ID
GROUP BY d.Department_Name;


/* ============================================================
   23. COUNT STUDENTS IN EACH DEPARTMENT
   ============================================================ */

SELECT
    d.Department_Name,
    COUNT(st.Student_ID) AS Total_Students
FROM Department d
LEFT JOIN Student st
    ON d.Department_ID = st.Department_ID
GROUP BY d.Department_Name;


/* ============================================================
   24. DISPLAY FACULTY FROM COMPUTER SCIENCE
   ============================================================ */

SELECT
    Faculty_ID,
    Faculty_Name,
    Email,
    Phone
FROM Faculty
WHERE Department_ID = 1;


/* ============================================================
   25. DISPLAY SUBJECTS FOR SEMESTER 3
   ============================================================ */

SELECT
    Subject_Code,
    Subject_Name,
    Credits
FROM Subject
WHERE Semester = 3;


/* ============================================================
   26. FIND NUMBER OF PERIODS FOR EACH FACULTY
   ============================================================ */

SELECT
    f.Faculty_Name,
    COUNT(t.Timetable_ID) AS Total_Periods
FROM Faculty f
LEFT JOIN Timetable t
    ON f.Faculty_ID = t.Faculty_ID
GROUP BY f.Faculty_Name;


/* ============================================================
   27. FIND CLASSROOM USAGE
   ============================================================ */

SELECT
    c.Room_Number,
    COUNT(t.Timetable_ID) AS Total_Classes
FROM Classroom c
LEFT JOIN Timetable t
    ON c.Room_ID = t.Room_ID
GROUP BY c.Room_Number;


/* ============================================================
   28. DISPLAY STUDENTS FROM COMPUTER SCIENCE
   ============================================================ */

SELECT
    Student_ID,
    Student_Name,
    Semester,
    Section
FROM Student
WHERE Department_ID = 1;


/* ============================================================
   29. UPDATE FACULTY PHONE NUMBER
   ============================================================ */

UPDATE Faculty
SET Phone = '9999999999'
WHERE Faculty_ID = 101;


/* ============================================================
   30. UPDATE TIMETABLE STATUS BY CHANGING PERIOD
   ============================================================ */

UPDATE Timetable
SET Period_Number = 5
WHERE Timetable_ID = 14;


/* ============================================================
   31. DELETE A STUDENT
   ============================================================ */

DELETE FROM Student
WHERE Student_ID = 1006;


/* ============================================================
   32. COMMIT ALL CHANGES
   ============================================================ */

COMMIT;
