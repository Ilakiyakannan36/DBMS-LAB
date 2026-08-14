-- Create Authors table
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

-- Create Books table
CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100),
    Genre VARCHAR(50),
    PublicationYear INT
);

-- Create BookAuthors table
CREATE TABLE BookAuthors (
    BookID INT,
    AuthorID INT,
    PRIMARY KEY (BookID, AuthorID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Create Borrowers table
CREATE TABLE Borrowers (
    BorrowerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    MembershipDate DATE
);

-- Create BorrowedBooks table
CREATE TABLE BorrowedBooks (
    BorrowerID INT,
    BookID INT,
    BorrowedDate DATE,
    ReturnDate DATE,
    PRIMARY KEY (BorrowerID, BookID),
    FOREIGN KEY (BorrowerID) REFERENCES Borrowers(BorrowerID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Insert values into Authors
INSERT INTO Authors (FirstName, LastName)
VALUES
('George', 'Orwell'),
('Aldous', 'Huxley'),
('J.K.', 'Rowling');

-- Insert values into Books
INSERT INTO Books (Title, Genre, PublicationYear)
VALUES
('1984', 'Dystopian', 1949),
('Brave New World', 'Dystopian', 1932),
('Harry Potter and the Sorcerer''s Stone', 'Fantasy', 1997);

-- Insert values into BookAuthors
INSERT INTO BookAuthors (BookID, AuthorID)
VALUES
(1, 1),
(2, 2),
(3, 3);

-- Insert values into Borrowers
INSERT INTO Borrowers (FirstName, LastName, MembershipDate)
VALUES
('John', 'Doe', '2023-01-01'),
('Jane', 'Smith', '2023-02-15');

-- Insert values into BorrowedBooks
INSERT INTO BorrowedBooks (BorrowerID, BookID, BorrowedDate, ReturnDate)
VALUES
(1, 1, '2023-03-01', '2023-03-15'),
(2, 3, '2023-03-05', '2023-03-20');

-- Retrieve information
SELECT
    B.Title AS BookName,
    CONCAT(A.FirstName, ' ', A.LastName) AS AuthorName,
    CONCAT(BR.FirstName, ' ', BR.LastName) AS BorrowerName,
    BB.BorrowedDate,
    BB.ReturnDate
FROM Books B
JOIN BookAuthors BA
    ON B.BookID = BA.BookID
JOIN Authors A
    ON BA.AuthorID = A.AuthorID
LEFT JOIN BorrowedBooks BB
    ON B.BookID = BB.BookID
LEFT JOIN Borrowers BR
    ON BB.BorrowerID = BR.BorrowerID;


Expected Output

| BookName                              | AuthorName    | BorrowerName | BorrowedDate | ReturnDate |
| ------------------------------------- | ------------- | ------------ | ------------ | ---------- |
| 1984                                  | George Orwell | John Doe     | 2023-03-01   | 2023-03-15 |
| Brave New World                       | Aldous Huxley | NULL         | NULL         | NULL       |
| Harry Potter and the Sorcerer's Stone | J.K. Rowling  | Jane Smith   | 2023-03-05   | 2023-03-20 |
