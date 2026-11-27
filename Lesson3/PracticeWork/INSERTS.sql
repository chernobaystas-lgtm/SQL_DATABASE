USE Hospital;
GO

-- 1. Відділення (6 відділень; відділення №6 не матиме пожертвувань і палат для тесту LEFT JOIN)
INSERT INTO Departments (Name) VALUES
(N'Cardiology'),
(N'Neurology'),
(N'Surgery'),
(N'Pediatrics'),
(N'Oncology'),
(N'Intensive Care');

-- 2. Лікарі (8 лікарів: у частини надбавка = 0, у частини > 0; лікар №7 і №8 без відпусток/спеціалізацій)
INSERT INTO Doctors (Name, Premium, Salary, Surname) VALUES
(N'Gregory', 500.00, 3500.00, N'House'),
(N'James', 0.00, 2800.00, N'Wilson'),
(N'Lisa', 750.00, 4200.00, N'Cuddy'),
(N'Eric', 200.00, 2400.00, N'Foreman'),
(N'Allison', 0.00, 2100.00, N'Cameron'),
(N'Robert', 300.00, 2500.00, N'Chase'),
(N'Stephen', 0.00, 3100.00, N'Strange'),
(N'John', 150.00, 1900.00, N'Watson');

-- 3. Спеціалізації (6 спеціалізацій; №6 без лікарів)
INSERT INTO Specializations (Name) VALUES
(N'Diagnostician'),
(N'Oncologist'),
(N'Neurologist'),
(N'Surgeon'),
(N'Immunologist'),
(N'Psychiatrist');

-- 4. Спонсори (5 спонсорів; №5 без пожертвувань для тесту LEFT JOIN)
INSERT INTO Sponsors (Name) VALUES
(N'Umbrella Corporation'),
(N'Stark Industries'),
(N'Wayne Enterprises'),
(N'Red Cross Foundation'),
(N'Silent Donor LLC');

-- 5. Лікарі та спеціалізації (у House дві спеціалізації, у Strange і Watson — жодної)
INSERT INTO DoctorsSpecializations (DoctorId, SpecializationId) VALUES
(1, 1), -- House -> Diagnostician
(1, 3), -- House -> Neurologist
(2, 2), -- Wilson -> Oncologist
(3, 1), -- Cuddy -> Diagnostician
(4, 3), -- Foreman -> Neurologist
(5, 5), -- Cameron -> Immunologist
(6, 4); -- Chase -> Surgeon

-- 6. Пожертвування (різні суми, дати в межах <= GETDATE(), у одного запису спрацює DEFAULT GETDATE())
INSERT INTO Donations (Amount, [Date], DepartmentId, SponsorId) VALUES
(50000.00, '2025-02-15', 1, 2),
(12000.50, '2025-06-10', 2, 3),
(100000.00, '2026-01-20', 3, 1),
(7500.00, '2026-05-05', 4, 4),
(25000.00, '2026-10-12', 5, 2),
(15000.00, '2026-11-01', 1, 3);

-- Додатковий рядок із датою за замовчуванням (GETDATE())
INSERT INTO Donations (Amount, DepartmentId, SponsorId) VALUES
(8500.00, 3, 4);

-- 7. Відпустки (у частини лікарів є відпустки, у частини немає)
INSERT INTO Vacations (StartDate, EndDate, DoctorId) VALUES
('2026-06-01', '2026-06-15', 1),
('2026-07-10', '2026-07-24', 2),
('2026-08-01', '2026-08-21', 3),
('2026-09-05', '2026-09-12', 4),
('2026-11-10', '2026-11-20', 6);

-- 8. Палати (розподілені по відділеннях 1..5; у відділенні №6 палат немає)
INSERT INTO Wards (Name, DepartmentId) VALUES
(N'Cardio-101', 1),
(N'Cardio-102', 1),
(N'Neuro-201', 2),
(N'Surg-301', 3),
(N'Surg-302', 3),
(N'Ped-401', 4),
(N'Onco-501', 5);
