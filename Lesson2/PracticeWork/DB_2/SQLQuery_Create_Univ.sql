CREATE DATABASE University;
GO

USE University;
GO

IF OBJECT_ID(N'dbo.Students') IS NULL
BEGIN
CREATE TABLE Students (
    Id INT IDENTITY(1,1)
        CONSTRAINT PK_Students PRIMARY KEY,

    LastName NVARCHAR(100)
        CONSTRAINT DF_Students_LastName DEFAULT 'NoName'
        NOT NULL,

    FirstName NVARCHAR(100) NULL,

    BirthDate DATE
        CONSTRAINT CK_Students_BirthDate
        CHECK (BirthDate BETWEEN '1998-01-01' AND '2013-12-31'),

    Grants MONEY NULL,

    Email NVARCHAR(255)
        CONSTRAINT UQ_Students_Email UNIQUE
);
END;


IF NOT EXISTS (SELECT 1 FROM dbo.Students)
INSERT INTO dbo.Students (LastName, FirstName, BirthDate, Grants, Email) VALUES
('Ivanov', 'Ivan', '2000-05-10', 1000.00, 'ivan1@mail.com'),
('Petrenko', 'Oleg', '2001-03-15', 1200.50, 'oleg@mail.com'),
('Shevchenko', 'Taras', '1999-07-20', 1000.00, 'taras@mail.com'),
('Ivanov', 'Petr', '2002-11-01', NULL, 'petr@mail.com'),
('Koval', 'Anna', '2003-09-09', 1500.75, 'anna@mail.com'),
('Bondar', 'Olga', '2004-01-25', NULL, 'olga@mail.com'),
('Tkachenko', 'Ivan', '2005-02-14', 1000.00, 'ivan2@mail.com'),
('Melnyk', NULL, '2000-06-30', 900.00, 'melnyk@mail.com'),
('Boyko', 'Andriy', '2001-12-12', 1200.50, 'andriy@mail.com'),
('Koval', 'Maria', '2002-08-08', 1500.75, 'maria@mail.com'),
('Ivanov', 'Serhii', '1998-04-04', NULL, 'serhii@mail.com'),
('Petrenko', NULL, '2003-10-10', 1100.00, 'petrenko2@mail.com'),
('Shevchenko', 'Oksana', '2004-05-05', 1000.00, 'oksana@mail.com'),
('Bondar', 'Iryna', '2005-07-07', NULL, 'iryna@mail.com'),
('Tkachenko', 'Oleg', '2006-03-03', 900.00, 'oleg2@mail.com'),
('Melnyk', 'Stepan', '2007-09-19', 900.00, 'stepan@mail.com'),
('Boyko', 'Ivan', '2008-11-11', 1200.50, 'ivan3@mail.com'),
('Koval', NULL, '2009-01-01', 1500.75, 'koval@mail.com'),
('Ivanov', 'Dmytro', '2010-02-02', NULL, 'dmytro@mail.com'),
('Petrenko', 'Anna', '2011-06-06', 1100.00, 'anna2@mail.com');