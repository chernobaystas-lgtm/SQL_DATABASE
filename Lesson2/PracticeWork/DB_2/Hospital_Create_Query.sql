CREATE DATABASE Hospital;
GO

USE Hospital;
GO

CREATE TABLE Departments (
    Id INT IDENTITY(1,1) PRIMARY KEY,

    Building INT NOT NULL 
        CHECK (Building BETWEEN 1 AND 5),

    Financing MONEY NOT NULL 
        DEFAULT 0
        CHECK (Financing >= 0),

    Floor INT NOT NULL 
        CHECK (Floor >= 1),

    Name NVARCHAR(100) NOT NULL 
        UNIQUE
        CHECK (Name <> '')
);

CREATE TABLE Diseases (
    Id INT IDENTITY(1,1) PRIMARY KEY,

    Name NVARCHAR(100) NOT NULL 
        UNIQUE
        CHECK (Name <> ''),

    Severity INT NOT NULL 
        DEFAULT 1
        CHECK (Severity >= 1)
);

CREATE TABLE Doctors (
    Id INT IDENTITY(1,1) PRIMARY KEY,

    Name NVARCHAR(MAX) NOT NULL 
        CHECK (Name <> ''),

    Surname NVARCHAR(MAX) NOT NULL 
        CHECK (Surname <> ''),

    Phone CHAR(10) NOT NULL,

    Salary MONEY NOT NULL 
        CHECK (Salary > 0),

    Premium MONEY NOT NULL 
        DEFAULT 0
        CHECK (Premium >= 0)
);

CREATE TABLE Examinations (
    Id INT IDENTITY(1,1) PRIMARY KEY,

    Name NVARCHAR(100) NOT NULL 
        UNIQUE
        CHECK (Name <> ''),

    DayOfWeek INT NOT NULL 
        CHECK (DayOfWeek BETWEEN 1 AND 7),

    StartTime TIME NOT NULL 
        CHECK (StartTime BETWEEN '08:00' AND '18:00'),

    EndTime TIME NOT NULL,

    CHECK (EndTime > StartTime)
);

CREATE TABLE Wards (
    Id INT IDENTITY(1,1) PRIMARY KEY,

    Building INT NOT NULL 
        CHECK (Building BETWEEN 1 AND 5),

    Floor INT NOT NULL 
        CHECK (Floor >= 1),

    Name NVARCHAR(20) NOT NULL 
        UNIQUE
        CHECK (Name <> '')
);

INSERT INTO Departments (Building, Financing, Floor, Name)
VALUES
(1, 10000, 2, N'Терапія'),
(3, 12000, 3, N'Хірургія'),
(3, 15000, 4, N'Кардіологія'),
(5, 20000, 1, N'Неврологія'),
(5, 25000, 2, N'Онкологія'),
(4, 8000, 1, N'Педіатрія'),
(2, 30000, 3, N'Травматологія'),
(1, 5000, 2, N'Дерматологія');

INSERT INTO Diseases (Name, Severity)
VALUES
(N'Грип', 1),
(N'COVID-19', 3),
(N'Цукровий діабет', 2),
(N'Рак', 5),
(N'Туберкульоз', 4),
(N'Астма', 2),
(N'Пневмонія', 3),
(N'Гіпертонія', 2);

INSERT INTO Doctors (Name, Surname, Phone, Salary, Premium)
VALUES
(N'Іван', N'Петренко', '0501111111', 2000, 300),
(N'Олег', N'Іванов', '0502222222', 1800, 200),
(N'Анна', N'Коваль', '0503333333', 1500, 100),
(N'Марія', N'Назарова', '0504444444', 1200, 500),
(N'Микола', N'Бондар', '0505555555', 3000, 700),
(N'Ольга', N'Шевченко', '0506666666', 1100, 100),
(N'Андрій', N'Ковальчук', '0507777777', 1600, 400),
(N'Наталія', N'Мельник', '0508888888', 1400, 600),
(N'Назар', N'Сидоренко', '0509999999', 1700, 350);

INSERT INTO Examinations (Name, DayOfWeek, StartTime, EndTime)
VALUES
(N'Аналіз крові', 1, '08:30', '10:00'),
(N'МРТ', 2, '12:00', '14:00'),
(N'Рентген', 3, '13:00', '15:00'),
(N'УЗД', 4, '09:00', '10:30'),
(N'ЕКГ', 5, '11:00', '12:00'),
(N'Консультація', 6, '14:00', '16:00'),
(N'Підготовка до операції', 7, '10:00', '12:30'),
(N'Аналіз крові на COVID', 2, '09:00', '10:00');

INSERT INTO Wards (Building, Floor, Name)
VALUES
(1, 1, N'Палата А1'),
(1, 2, N'Палата А2'),
(3, 1, N'Палата Б1'),
(3, 2, N'Палата Б2'),
(4, 1, N'Палата В1'),
(4, 2, N'Палата В2'),
(5, 1, N'Палата Г1'),
(5, 2, N'Палата Г2'),
(5, 3, N'Палата Г3');