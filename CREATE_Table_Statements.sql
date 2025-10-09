-- Dimension: Patient
CREATE TABLE DimPatient (
    PatientKey INT IDENTITY(1,1) PRIMARY KEY,
    Patient_ID INT,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Gender VARCHAR(10),
    Age INT
);

-- Dimension: Physician
CREATE TABLE DimPhysician (
    PhysicianKey INT IDENTITY(1,1) PRIMARY KEY,
    Physician_Name VARCHAR(100)
);

-- Dimension: Department
CREATE TABLE DimDepartment (
    DepartmentKey INT IDENTITY(1,1) PRIMARY KEY,
    Department_Name VARCHAR(100)
);

-- Dimension: Visit Type
CREATE TABLE DimVisitType (
    VisitTypeKey INT IDENTITY(1,1) PRIMARY KEY,
    Visit_Type VARCHAR(50)
);

-- Dimension: Appointment Status
CREATE TABLE DimAppointmentStatus (
    AppointmentStatusKey INT IDENTITY(1,1) PRIMARY KEY,
    Appointment_Status VARCHAR(50)
);

-- Dimension: Date
CREATE TABLE DimDate (
    DateKey INT PRIMARY KEY,
    Full_Date DATE,
    Day INT,
    Month INT,
    Year INT,
    Quarter INT
);

-- Fact: Appointment
CREATE TABLE FactAppointment (
    AppointmentKey INT IDENTITY(1,1) PRIMARY KEY,
    PatientKey INT,
    PhysicianKey INT,
    DepartmentKey INT,
    VisitTypeKey INT,
    AppointmentStatusKey INT,
    DateKey INT,
    Wait_Time_Min INT,
    Appointment_Duration_Min INT,
    FOREIGN KEY (PatientKey) REFERENCES DimPatient(PatientKey),
    FOREIGN KEY (PhysicianKey) REFERENCES DimPhysician(PhysicianKey),
    FOREIGN KEY (DepartmentKey) REFERENCES DimDepartment(DepartmentKey),
    FOREIGN KEY (VisitTypeKey) REFERENCES DimVisitType(VisitTypeKey),
    FOREIGN KEY (AppointmentStatusKey) REFERENCES DimAppointmentStatus(AppointmentStatusKey),
    FOREIGN KEY (DateKey) REFERENCES DimDate(DateKey)
);
