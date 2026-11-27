CREATE DATABASE Hospital;
GO

USE Hospital;
GO

-- 1. Відділення (Departments)
CREATE TABLE Departments (
    Id INT IDENTITY(1,1) NOT NULL
        CONSTRAINT PK_Departments PRIMARY KEY,

    Name NVARCHAR(100) NOT NULL
        CONSTRAINT CK_Departments_Name CHECK (Name <> '')
        CONSTRAINT UQ_Departments_Name UNIQUE
);

-- 2. Лікарі (Doctors)
CREATE TABLE Doctors (
    Id INT IDENTITY(1,1) NOT NULL
        CONSTRAINT PK_Doctors PRIMARY KEY,

    Name NVARCHAR(MAX) NOT NULL
        CONSTRAINT CK_Doctors_Name CHECK (Name <> ''),

    Premium MONEY NOT NULL
        CONSTRAINT CK_Doctors_Premium CHECK (Premium >= 0)
        CONSTRAINT DF_Doctors_Premium DEFAULT (0),

    Salary MONEY NOT NULL
        CONSTRAINT CK_Doctors_Salary CHECK (Salary > 0),

    Surname NVARCHAR(MAX) NOT NULL
        CONSTRAINT CK_Doctors_Surname CHECK (Surname <> '')
);

-- 5. Спеціалізації (Specializations)
CREATE TABLE Specializations (
    Id INT IDENTITY(1,1) NOT NULL
        CONSTRAINT PK_Specializations PRIMARY KEY,

    Name NVARCHAR(100) NOT NULL
        CONSTRAINT CK_Specializations_Name CHECK (Name <> '')
        CONSTRAINT UQ_Specializations_Name UNIQUE
);

-- 6. Спонсори (Sponsors)
CREATE TABLE Sponsors (
    Id INT IDENTITY(1,1) NOT NULL
        CONSTRAINT PK_Sponsors PRIMARY KEY,

    Name NVARCHAR(100) NOT NULL
        CONSTRAINT CK_Sponsors_Name CHECK (Name <> '')
        CONSTRAINT UQ_Sponsors_Name UNIQUE
);

-- 3. Лікарі та спеціалізації (DoctorsSpecializations)
CREATE TABLE DoctorsSpecializations (
    Id INT IDENTITY(1,1) NOT NULL
        CONSTRAINT PK_DoctorsSpecializations PRIMARY KEY,

    DoctorId INT NOT NULL
        CONSTRAINT FK_DoctorsSpecializations_DoctorId FOREIGN KEY REFERENCES Doctors(Id),

    SpecializationId INT NOT NULL
        CONSTRAINT FK_DoctorsSpecializations_SpecializationId FOREIGN KEY REFERENCES Specializations(Id)
);

-- 4. Пожертвування (Donations)
CREATE TABLE Donations (
    Id INT IDENTITY(1,1) NOT NULL
        CONSTRAINT PK_Donations PRIMARY KEY,

    Amount MONEY NOT NULL
        CONSTRAINT CK_Donations_Amount CHECK (Amount > 0),

    [Date] DATE NOT NULL
        CONSTRAINT CK_Donations_Date CHECK ([Date] <= GETDATE())
        CONSTRAINT DF_Donations_Date DEFAULT (GETDATE()),

    DepartmentId INT NOT NULL
        CONSTRAINT FK_Donations_DepartmentId FOREIGN KEY REFERENCES Departments(Id),

    SponsorId INT NOT NULL
        CONSTRAINT FK_Donations_SponsorId FOREIGN KEY REFERENCES Sponsors(Id)
);

-- 7. Відпустки (Vacations)
CREATE TABLE Vacations (
    Id INT IDENTITY(1,1) NOT NULL
        CONSTRAINT PK_Vacations PRIMARY KEY,

    EndDate DATE NOT NULL,

    StartDate DATE NOT NULL,

    DoctorId INT NOT NULL
        CONSTRAINT FK_Vacations_DoctorId FOREIGN KEY REFERENCES Doctors(Id),

    CONSTRAINT CK_Vacations_EndDate CHECK (EndDate > StartDate)
);

-- 8. Палати (Wards)
CREATE TABLE Wards (
    Id INT IDENTITY(1,1) NOT NULL
        CONSTRAINT PK_Wards PRIMARY KEY,

    Name NVARCHAR(20) NOT NULL
        CONSTRAINT CK_Wards_Name CHECK (Name <> '')
        CONSTRAINT UQ_Wards_Name UNIQUE,

    DepartmentId INT NOT NULL
        CONSTRAINT FK_Wards_DepartmentId FOREIGN KEY REFERENCES Departments(Id)
);
