SELECT @@VERSION AS SQL_SERVER_INFO, GETDATE() AS CURRENT_SERVER_TIME;

CREATE DATABASE Academy;
GO

USE Academy;
GO


CREATE TABLE Departments (
    Id INT IDENTITY(1,1) NOT NULL
        CONSTRAINT PK_Departments PRIMARY KEY,

    Financing MONEY NOT NULL
        CONSTRAINT DF_Departments_Financing DEFAULT (0)
        CONSTRAINT CK_Departments_Financing CHECK (Financing >= 0),

    Name NVARCHAR(100) NOT NULL
        CONSTRAINT CK_Departments_Name CHECK (Name <> '')
        CONSTRAINT UQ_Departments_Name UNIQUE
);


CREATE TABLE Faculties (
    Id INT IDENTITY(1,1) NOT NULL
        CONSTRAINT PK_Faculties PRIMARY KEY,

    Dean NVARCHAR(MAX) NOT NULL
        CONSTRAINT CK_Faculties_Dean CHECK (Dean <> ''),

    Name NVARCHAR(100) NOT NULL
        CONSTRAINT CK_Faculties_Name CHECK (Name <> '')
        CONSTRAINT UQ_Faculties_Name UNIQUE
);

CREATE TABLE Groups (
    Id INT IDENTITY(1,1) NOT NULL
        CONSTRAINT PK_Groups PRIMARY KEY,

    Name NVARCHAR(10) NOT NULL
        CONSTRAINT CK_Groups_Name CHECK (Name <> '')
        CONSTRAINT UQ_Groups_Name UNIQUE,

    Rating INT NOT NULL
        CONSTRAINT CK_Groups_Rating CHECK (Rating BETWEEN 0 AND 5),

    Year INT NOT NULL
        CONSTRAINT CK_Groups_Year CHECK (Year BETWEEN 1 AND 5)
);

CREATE TABLE Teachers (
    Id INT IDENTITY(1,1) NOT NULL
        CONSTRAINT PK_Teachers PRIMARY KEY,

    EmploymentDate DATE NOT NULL
        CONSTRAINT CK_Teachers_EmploymentDate CHECK (EmploymentDate >= '1990-01-01'),

    IsAssistant BIT NOT NULL
        CONSTRAINT DF_Teachers_IsAssistant DEFAULT (0),

    IsProfessor BIT NOT NULL
        CONSTRAINT DF_Teachers_IsProfessor DEFAULT (0),

    Name NVARCHAR(MAX) NOT NULL
        CONSTRAINT CK_Teachers_Name CHECK (Name <> ''),

    Position NVARCHAR(MAX) NOT NULL
        CONSTRAINT CK_Teachers_Position CHECK (Position <> ''),

    Premium MONEY NOT NULL
        CONSTRAINT DF_Teachers_Premium DEFAULT (0)
        CONSTRAINT CK_Teachers_Premium CHECK (Premium >= 0),

    Salary MONEY NOT NULL
        CONSTRAINT CK_Teachers_Salary CHECK (Salary > 0),

    Surname NVARCHAR(MAX) NOT NULL
        CONSTRAINT CK_Teachers_Surname CHECK (Surname <> '')
);

USE Academy;
GO

INSERT INTO Faculties (Dean, Name) VALUES
(N'Dr. Alan Turing', N'Computer Science'),
(N'Prof. Ada Lovelace', N'Software Engineering'),
(N'Dr. Nikola Tesla', N'Electrical Engineering'),
(N'Prof. Marie Curie', N'Physics and Mathematics'),
(N'Dr. Isaac Newton', N'Applied Mechanics'),
(N'Prof. Grace Hopper', N'Information Systems'),
(N'Dr. Tim Berners-Lee', N'Web Technologies'),
(N'Prof. Linus Torvalds', N'Operating Systems'),
(N'Dr. Guido van Rossum', N'Data Science'),
(N'Prof. Bjarne Stroustrup', N'Cybersecurity');

INSERT INTO Departments (Financing, Name) VALUES
(8500.00, N'Algorithms and Logic'),
(15000.00, N'Artificial Intelligence'),
(30000.00, N'Computer Networks'),
(9500.00, N'Databases'),
(22000.00, N'Hardware Design'),
(18000.00, N'Mathematics'),
(27500.00, N'Robotics'),
(20000.00, N'Software Development'),
(12000.00, N'System Administration'),
(5000.00, N'Web Design');

INSERT INTO Groups (Name, Rating, Year) VALUES
(N'CS-101', 4, 1),
(N'CS-202', 5, 2),
(N'SE-301', 3, 3),
(N'SE-404', 1, 4),
(N'CS-501', 3, 5), -- 5 курс, рейтинг 3 (підходить під #14)
(N'CS-502', 2, 5), -- 5 курс, рейтинг 2 (підходить під #14)
(N'CS-503', 5, 5), -- 5 курс, рейтинг 5 (не підходить під #14)
(N'IT-504', 4, 5), -- 5 курс, рейтинг 4 (підходить під #14)
(N'DS-201', 0, 2),
(N'CY-305', 4, 3);

INSERT INTO Teachers (EmploymentDate, IsAssistant, IsProfessor, Name, Position, Premium, Salary, Surname) VALUES
('1995-09-01', 0, 1, N'John', N'Head of Department', 500.00, 1500.00, N'Smith'),       -- Професор > 1050, до 2000 р.
('1998-03-15', 0, 1, N'Robert', N'Senior Professor', 400.00, 1200.00, N'Johnson'),     -- Професор > 1050, до 2000 р.
('2005-10-10', 0, 1, N'Emily', N'Professor', 300.00, 950.00, N'Williams'),             -- Професор, але ставка <= 1050
('2015-09-01', 1, 0, N'Michael', N'Junior Assistant', 200.00, 500.00, N'Brown'),       -- Асистент, надбавка 200 (160..550), ставка < 550
('2018-02-20', 1, 0, N'Sarah', N'Lab Assistant', 450.00, 700.00, N'Jones'),            -- Асистент, надбавка 450 (160..550), зарплата 1150 <= 1200
('2020-09-01', 1, 0, N'David', N'Teaching Assistant', 100.00, 800.00, N'Garcia'),      -- Асистент, надбавка 100 (< 200), зарплата 900 <= 1200
('2012-11-11', 1, 0, N'Anna', N'Senior Assistant', 600.00, 900.00, N'Miller'),         -- Асистент, надбавка 600 (> 550), зарплата 1500
('1999-05-05', 0, 0, N'James', N'Senior Lecturer', 250.00, 1100.00, N'Davis'),         -- Не професор, прийнятий до 2000 р.
('2010-08-25', 0, 0, N'Laura', N'Associate Professor', 350.00, 1300.00, N'Rodriguez'), -- Не професор
('2022-01-15', 1, 0, N'Daniel', N'Assistant', 0.00, 600.00, N'Martinez');              -- Асистент з нульовою надбавкою (перевірка ділення на 0)
