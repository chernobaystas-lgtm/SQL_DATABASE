USE Academy;
Go


-- SELECT * FROM Departments;

-- SELECT * FROM Faculties;

-- SELECT * FROM Groups;

-- SELECT * FROM Teachers;




-- #1. Вивести таблицю кафедр у зворотному порядку полів

/* SELECT Name, Financing, Id
FROM Departments; */

-- #2. Вивести назви груп та їх рейтинги з псевдонімами «Group Name» та «Group Rating»

/* SELECT
    Name AS [Group Name],
    Rating AS [Group Rating]
FROM Groups; */

-- #3. Прізвище викладача, відсоток ставки до надбавки та відсоток ставки до зарплати
-- (NULLIF захищає від ділення на 0, якщо надбавка дорівнює 0)

/* SELECT
    Surname,
    (Salary / NULLIF(Premium, 0)) * 100 AS [Salary to Premium %],
    (Salary / (Salary + Premium)) * 100 AS [Salary to Total %]
FROM Teachers; */

-- #4. Таблиця факультетів у форматі «The dean of faculty [faculty] is [dean].»

/* SELECT
    'The dean of faculty ' + Name + ' is ' + Dean + '.' AS [Faculty Info]
FROM Faculties; */

-- #5. Прізвища професорів зі ставкою більше 1050

/* SELECT Surname
FROM Teachers
WHERE IsProfessor = 1 AND Salary > 1050; */

-- #6. Назви кафедр з фінансуванням менше 11000 або більше 25000

/* SELECT Name
FROM Departments
WHERE Financing < 11000 OR Financing > 25000; */

-- #7. Назви факультетів, окрім «Computer Science»

/*
SELECT Name
FROM Faculties
WHERE Name <> N'Computer Science';
 */

-- #8. Прізвища та посади викладачів, які не є професорами

/*
SELECT Surname, Position
FROM Teachers
WHERE IsProfessor = 0; */


-- #9. Прізвища, посади, ставки та надбавки асистентів з надбавкою від 160 до 550

/* SELECT Surname, Position, Salary, Premium
FROM Teachers
WHERE IsAssistant = 1 AND Premium BETWEEN 160 AND 550; */

-- #10. Прізвища та ставки асистентів

/*
SELECT Surname, Salary
FROM Teachers
WHERE IsAssistant = 1; */

-- #11. Прізвища та посади викладачів, прийнятих до 01.01.2000


/* SELECT Surname, Position
FROM Teachers
WHERE EmploymentDate < '2000-01-01'; */

-- #12. Назви кафедр, які за алфавітом йдуть до «Software Development»

/* SELECT Name AS [Name of Department]
FROM Departments
WHERE Name < N'Software Development';
 */

-- #13. Прізвища асистентів із зарплатою (ставка + надбавка) не більше 1200

/* SELECT Surname
FROM Teachers
WHERE IsAssistant = 1 AND (Salary + Premium) <= 1200; */

-- #14. Назви груп 5-го курсу з рейтингом від 2 до 4

/* SELECT Name
FROM Groups
WHERE Year = 5 AND Rating BETWEEN 2 AND 4; */

-- #15. Прізвища асистентів зі ставкою менше 550 або надбавкою менше 200

/* SELECT Surname
FROM Teachers
WHERE IsAssistant = 1 AND (Salary < 550 OR Premium < 200);
 */