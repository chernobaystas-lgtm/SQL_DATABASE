--INSERT INTO tableName(columnName1, columnName2, ...)
--VALUES (value1, value2,...);

--INSERT INTO Students 
--       VALUES (N'Грищенко',N'Володимир', '2000-05-10', 1250, 'il@gmail.com'),
--              (N'Сидоренко', NULL, '2000-05-10', 1250, 'sid@gmail.com');

--INSERT INTO Students (LastName,FirstName,BirthDate, Grants,Email)
--       VALUES (N'Матвеєв',N'Денис', '2013-05-10', 1250, 'ma@gmail.com');

--INSERT INTO Students (BirthDate, Grants,Email)
--       VALUES ( '2010-05-10', 1750, 'un@gmail.com');   
       

--UPDATE tableName
--SET columnName1 = value1, columnName2 = value2, ...
--WHERE condition;

--UPDATE Students
--   SET LastName = N'Студент ', FirstName=N'Студент'
-- WHERE LastName LIKE 'No%';

--DELETE FROM tableName
--WHERE condition;

--DELETE FROM Students
-- WHERE Id>=21;

--BACKUP DATABASE University
--TO DISK = 'C:\Temp\University1.bak'
--WITH INIT;

--RESTORE DATABASE University
--FROM DISK = 'C:\Temp\University1.bak'
--WITH REPLACE;

--USE master;

--RESTORE FILELISTONLY
--FROM DISK = 'C:\Temp\University1.bak';

--RESTORE DATABASE University_Student
--FROM DISK = 'C:\Temp\University1.bak'
--WITH 
--    MOVE 'University' TO 'C:\Temp\University_Student.mdf',
--    MOVE 'University_log' TO 'C:\Temp\University_Student_log.ldf',
--    REPLACE;



