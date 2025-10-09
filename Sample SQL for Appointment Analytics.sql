---Total Appointments by Month
SELECT 
    d.Month AS Month,
    d.Year AS Year,
    COUNT(f.AppointmentKey) AS Total_Appointments
FROM FactAppointment f
JOIN DimDate d ON f.DateKey = d.DateKey
GROUP BY d.Year, d.Month
ORDER BY d.Year, d.Month;


--Appointment Count by Department
SELECT 
    dept.Department_Name,
    COUNT(f.AppointmentKey) AS Total_Appointments
FROM FactAppointment f
JOIN DimDepartment dept ON f.DepartmentKey = dept.DepartmentKey
GROUP BY dept.Department_Name
ORDER BY Total_Appointments DESC;

--No-Show Rate by Month
SELECT 
    d.Month AS Month,
    d.Year AS Year,
    COUNT(CASE WHEN s.Appointment_Status = 'No-Show' THEN 1 END) * 100.0 / COUNT(*) AS NoShow_Percentage
FROM FactAppointment f
JOIN DimDate d ON f.DateKey = d.DateKey
JOIN DimAppointmentStatus s ON f.AppointmentStatusKey = s.AppointmentStatusKey
GROUP BY d.Year, d.Month
ORDER BY d.Year, d.Month;

--Average Wait Time by Department
SELECT 
    dept.Department_Name,
    AVG(f.Wait_Time_Min) AS Avg_Wait_Time
FROM FactAppointment f
JOIN DimDepartment dept ON f.DepartmentKey = dept.DepartmentKey
GROUP BY dept.Department_Name
ORDER BY Avg_Wait_Time DESC;


--No-Show Rate by Physician
SELECT 
    doc.Physician_Name,
    COUNT(CASE WHEN s.Appointment_Status = 'No-Show' THEN 1 END) * 100.0 / COUNT(*) AS NoShow_Rate
FROM FactAppointment f
JOIN DimPhysician doc ON f.PhysicianKey = doc.PhysicianKey
JOIN DimAppointmentStatus s ON f.AppointmentStatusKey = s.AppointmentStatusKey
GROUP BY doc.Physician_Name
ORDER BY NoShow_Rate DESC;

--Appointment Trends by Visit Type
SELECT 
    vt.Visit_Type,
    COUNT(f.AppointmentKey) AS Total_Appointments
FROM FactAppointment f
JOIN DimVisitType vt ON f.VisitTypeKey = vt.VisitTypeKey
GROUP BY vt.Visit_Type
ORDER BY Total_Appointments DESC;

--Average Appointment Duration by Department
SELECT 
    dept.Department_Name,
    AVG(f.Appointment_Duration_Min) AS Avg_Duration
FROM FactAppointment f
JOIN DimDepartment dept ON f.DepartmentKey = dept.DepartmentKey
GROUP BY dept.Department_Name
ORDER BY Avg_Duration DESC;

--Top 10 Patients by Number of Appointments
SELECT 
    p.First_Name + ' ' + p.Last_Name AS Patient_Name,
    COUNT(f.AppointmentKey) AS Total_Appointments
FROM FactAppointment f
JOIN DimPatient p ON f.PatientKey = p.PatientKey
GROUP BY p.First_Name, p.Last_Name
ORDER BY Total_Appointments DESC

--Cancelled Appointments Trend Over Time
SELECT 
    d.Month AS Month,
    d.Year AS Year,
    COUNT(CASE WHEN s.Appointment_Status = 'Cancelled' THEN 1 END) AS Cancelled_Appointments
FROM FactAppointment f
JOIN DimDate d ON f.DateKey = d.DateKey
JOIN DimAppointmentStatus s ON f.AppointmentStatusKey = s.AppointmentStatusKey
GROUP BY d.Year, d.Month
ORDER BY d.Year, d.Month;
