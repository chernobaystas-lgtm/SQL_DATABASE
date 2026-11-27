/* SELECT * FROM Doctors;

SELECT * FROM Donations; */


-- №1 Вивести повні імена лікарів та їх спеціалізації.

/* SELECT
    D.Name + ' ' + D.Surname AS [Full Name],
    S.Name AS Specialization
FROM Doctors AS D
JOIN DoctorsSpecializations AS DS ON D.Id = DS.DoctorId
JOIN Specializations AS S ON DS.SpecializationId = S.Id; */


-- №2 Вивести прізвища та зарплати (сума ставки та надбавки) лікарів, які не перебувають у відпустці.

/* SELECT
    D.Surname,
    D.Salary + D.Premium AS [Total Salary]
FROM Doctors AS D
LEFT JOIN Vacations AS V
    ON D.Id = V.DoctorId
    AND GETDATE() BETWEEN V.StartDate AND V.EndDate
WHERE V.Id IS NULL; */



-- №3 Вивести назви палат, що знаходяться у відділенні «Intensive Treatment».

/* SELECT W.Name AS [Ward Name]
FROM Wards AS W
JOIN Departments AS D ON W.DepartmentId = D.Id
WHERE D.Name = N'Intensive Treatment'; */

-- №4 Вивести назви відділень без повторень, що спонсоруються компанією «Umbrella Corporation».

/* SELECT DISTINCT D.Name AS [Departments Name]
FROM Departments AS D
JOIN Donations AS Don ON D.Id = Don.DepartmentId
JOIN Sponsors AS S ON Don.SponsorId = S.Id
WHERE S.Name = N'Umbrella Corporation'; */


-- №5 Вивести всі пожертвування за останній місяць у вигляді: відділення, спонсор, сума пожертвування, дата пожертвування.

/* SELECT
    D.Name AS [Department],
    S.Name AS [Sponsor],
    Don.Amount AS [Donation Amount],
    Don.[Date] AS [Donation Date]
FROM Donations AS Don
JOIN Departments AS D ON Don.DepartmentId = D.Id
JOIN Sponsors AS S ON Don.SponsorId = S.Id
WHERE Don.[Date] >= DATEADD(MONTH, -1, GETDATE());
 */

-- №6 -- 12 Вивести прізвища лікарів із зазначенням відділень, у яких вони проводять обстеження. Необхідно враховувати обстеження, що проводяться лише у будні дні.
