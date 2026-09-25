/* ==========================================
   RAILWAY RESERVATION SYSTEM
   ========================================== */

/* ==========================================
   TABLE 1 : TRAINS
   ========================================== */

CREATE TABLE Trains (
    TrainID NUMBER PRIMARY KEY,
    TrainName VARCHAR2(100),
    SourceStation VARCHAR2(50),
    DestinationStation VARCHAR2(50),
    TotalSeats NUMBER
);

/* ==========================================
   TABLE 2 : PASSENGERS
   ========================================== */

CREATE TABLE Passengers (
    PassengerID NUMBER PRIMARY KEY,
    PassengerName VARCHAR2(100),
    Age NUMBER,
    Gender VARCHAR2(10),
    Phone VARCHAR2(15)
);

/* ==========================================
   TABLE 3 : RESERVATIONS
   ========================================== */

CREATE TABLE Reservations (
    ReservationID NUMBER PRIMARY KEY,
    PassengerID NUMBER,
    TrainID NUMBER,
    JourneyDate DATE,
    SeatNumber VARCHAR2(10),
    TicketStatus VARCHAR2(20),

    CONSTRAINT fk_passenger
    FOREIGN KEY (PassengerID)
    REFERENCES Passengers(PassengerID),

    CONSTRAINT fk_train
    FOREIGN KEY (TrainID)
    REFERENCES Trains(TrainID)
);

/* ==========================================
   INSERT DATA INTO TRAINS
   ========================================== */

INSERT INTO Trains VALUES
(101,'Chennai Express','Chennai','Mumbai',500);

INSERT INTO Trains VALUES
(102,'Vaigai Express','Chennai','Madurai',400);

INSERT INTO Trains VALUES
(103,'Shatabdi Express','Bangalore','Chennai',300);

/* ==========================================
   INSERT DATA INTO PASSENGERS
   ========================================== */

INSERT INTO Passengers VALUES
(1,'Arun',25,'Male','9876543210');

INSERT INTO Passengers VALUES
(2,'Divya',30,'Female','9876543211');

INSERT INTO Passengers VALUES
(3,'Rahul',40,'Male','9876543212');

/* ==========================================
   INSERT DATA INTO RESERVATIONS
   ========================================== */

INSERT INTO Reservations VALUES
(1001,1,101,DATE '2026-10-10','S1-25','Confirmed');

INSERT INTO Reservations VALUES
(1002,2,102,DATE '2026-10-12','S2-18','Confirmed');

INSERT INTO Reservations VALUES
(1003,3,103,DATE '2026-10-15','S3-10','Waiting');

/* ==========================================
   VIEW
   ========================================== */

CREATE VIEW ReservationDetails AS
SELECT
    r.ReservationID,
    p.PassengerName,
    t.TrainName,
    r.JourneyDate,
    r.SeatNumber,
    r.TicketStatus
FROM Reservations r
JOIN Passengers p
ON r.PassengerID = p.PassengerID
JOIN Trains t
ON r.TrainID = t.TrainID;

/* ==========================================
   SIMPLE QUERIES
   ========================================== */

-- 1. Display all trains
SELECT * FROM Trains;

-- 2. Display all passengers
SELECT * FROM Passengers;

-- 3. Display all reservations
SELECT * FROM Reservations;

-- 4. Passenger reservation details
SELECT
    p.PassengerName,
    t.TrainName,
    r.JourneyDate,
    r.SeatNumber
FROM Passengers p
JOIN Reservations r
ON p.PassengerID = r.PassengerID
JOIN Trains t
ON r.TrainID = t.TrainID;

-- 5. Confirmed tickets
SELECT *
FROM Reservations
WHERE TicketStatus='Confirmed';

-- 6. Waiting list passengers
SELECT *
FROM Reservations
WHERE TicketStatus='Waiting';

-- 7. Count reservations per train
SELECT
    TrainID,
    COUNT(*) AS TotalReservations
FROM Reservations
GROUP BY TrainID;

-- 8. Train details for Chennai route
SELECT *
FROM Trains
WHERE SourceStation='Chennai';

-- 9. Reservation Details View
SELECT * FROM ReservationDetails;

-- 10. Passenger and Train Information
SELECT
    p.PassengerName,
    t.TrainName,
    t.SourceStation,
    t.DestinationStation
FROM Passengers p
JOIN Reservations r
ON p.PassengerID = r.PassengerID
JOIN Trains t
ON r.TrainID = t.TrainID;
