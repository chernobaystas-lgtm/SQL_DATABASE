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

