--SELECT columnName1, columnName2, ...
--FROM tableName
--WHERE condition; =, >,<,>=,<=,!>, !<, <>
USE University;
SELECT * FROM STUDENTS;

SELECT LastName AS [Прізвище] FROM Students ;

--SELECT s.LastName AS [Прізвище] FROM Students as s;

--SELECT  'Студент '+isnull(FirstName, '')+' '+LastName + ' отримує ' + isnull(convert(nvarchar(10),Grants), ' 0') AS STUDENTSGRANTS
--  FROM  Students;


--SELECT LastName AS [Прізвище студента], Grants AS Стипендвя 
--  FROM Students 
-- WHERE LastName <> 'Ivanov' 
--   and Grants between 1000 and 1201;

--SELECT LastName AS [Прізвище], Grants AS Стипендвя 
--  FROM Students 
-- WHERE LastName IN ('Ivanov', 'Boyko', 'Samoylov') 
--   and Grants between 1000 and 1201;

--SELECT LastName AS [Прізвище], Grants AS Стипендвя 
--  FROM Students 
-- WHERE LastName IN (SELECT LastName FROM Students)  
--   and Grants not between 1000 and 1100;

 --  SELECT LastName AS [Прізвище], Grants AS Стипендвя 
 -- FROM Students 
 --WHERE LastName IN ('Ivanov', 'Boyko', 'Samiylov') 
 --  and Grants NOT between 1000 and 1100;

 --SELECT Id, LastName, FirstName, BirthDate, Grants, Email
 -- FROM Students
 --WHERE LEN(FirstName) !>5;

--SELECT LastName, FirstName, BirthDate
--  FROM Students
-- WHERE MONTH(BirthDate) >= 9 AND MONTH(BirthDate) <=11;

--SELECT LastName, FirstName, BirthDate
-- FROM Students
--WHERE YEAR(BirthDate) % 2 = 0 OR DAY(BirthDate) % 2 <>0;

--SELECT LastName, FirstName, Grants
--FROM Students
--WHERE FirstName IS NULL OR Grants IS NULL;

--SELECT LastName, FirstName, Grants
--  FROM Students
-- WHERE Grants IS NOT NULL;

--  SELECT LastName, FirstName, BirthDate
--    FROM Students
--ORDER BY LastName ASC,BirthDate DESC  

  --SELECT LastName, FirstName, BirthDate
  --  FROM Students
  -- WHERE LastName LIKE 'I%' 

--   SELECT 
--    CASE 
--        WHEN LastName IS NULL THEN 'No data'
--        WHEN LastName = 'Boyko' THEN N'Бойко'
--        ELSE LastName
--    END AS LastName,
--    FirstName, 
--    BirthDate
--FROM Students;
   
--SELECT
-- LastName,
-- ISNULL(
--    CASE 
--        WHEN FirstName = 'Oleg' THEN N'Олег'
--        ELSE FirstName
--    END,
--    'No data'
--) AS FirstName, 
--      DATEDIFF(YEAR, BirthDate, GETDATE()) AS Age
--FROM Students;


--SELECT LastName as Прізвище, IIF(Grants >1100, 'high', 'low') as [Стипендія]
--FROM Students;
