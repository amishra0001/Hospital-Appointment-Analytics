# Hospital_Appointment_Analytics
Healthcare Data Warehouse – Star Schema Project

Overview

Welcome to the Healthcare Data Warehouse Project, a comprehensive example of how to design and implement a Star Schema for healthcare analytics.
This project transforms raw patient appointment data into a clean, analytical data model ready for use in SQL Server, Power BI, or Tableau.

The goal is to help analysts and data engineers understand how to structure, load, and analyze healthcare appointment data efficiently — from data staging to insight generation.

🧩 Data Model – Star Schema Design

The data warehouse follows a Star Schema architecture where a central Fact Table connects to multiple Dimension Tables.
This structure supports fast and flexible analytical queries, enabling insights into appointments, physicians, departments, and patient demographics.

🪙 Fact Table

FactAppointment

Central table containing appointment-level data and measures such as:

⏱️ Wait Time (Minutes)

🕒 Appointment Duration (Minutes)

🌐 Dimension Tables
Dimension	Description
🧍 DimPatient	Stores patient details — ID, name, gender, and age.
👨‍⚕️ DimPhysician	Contains physician information for analysis by provider.
🏢 DimDepartment	Represents hospital or clinic departments.
📋 DimVisitType	Categorizes appointment types (Consultation, Follow-up, etc.).
📅 DimDate	Provides a detailed date dimension for time-series analysis.
🔖 DimAppointmentStatus	Tracks the appointment outcome (Completed, Cancelled, or No-Show).
🗂️ Database Schema (SQL Server)


1️⃣ Create Tables

Below is the structure of the Fact and Dimension tables in SQL Server:

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

2️⃣ Data Loading (ETL from Staging Table)

Once your raw CSV data is loaded into a staging table , use these SQL scripts to populate your dimensions and fact table:

-- Insert into DimPatient
INSERT INTO DimPatient (Patient_ID, First_Name, Last_Name, Gender, Age)
SELECT DISTINCT Patient_ID, First_Name, Last_Name, Gender, Age
FROM stg_HealthcareAppointments;

-- Insert into DimPhysician
INSERT INTO DimPhysician (Physician_Name)
SELECT DISTINCT Physician
FROM stg_HealthcareAppointments;

-- Insert into DimDepartment
INSERT INTO DimDepartment (Department_Name)
SELECT DISTINCT Department
FROM stg_HealthcareAppointments;

-- Insert into DimVisitType
INSERT INTO DimVisitType (Visit_Type)
SELECT DISTINCT Visit_Type
FROM stg_HealthcareAppointments;

-- Insert into DimAppointmentStatus
INSERT INTO DimAppointmentStatus (Appointment_Status)
SELECT DISTINCT Appointment_Status
FROM stg_HealthcareAppointments;

-- Insert into DimDate
INSERT INTO DimDate (DateKey, Full_Date, Day, Month, Year, Quarter)
SELECT DISTINCT 
    CAST(CONVERT(CHAR(8), Appointment_Date, 112) AS INT) AS DateKey,
    Appointment_Date,
    DAY(Appointment_Date),
    MONTH(Appointment_Date),
    YEAR(Appointment_Date),
    DATEPART(QUARTER, Appointment_Date)
FROM stg_HealthcareAppointments;

-- Insert into FactAppointment
INSERT INTO FactAppointment (
    PatientKey, PhysicianKey, DepartmentKey, VisitTypeKey, AppointmentStatusKey, DateKey,
    Wait_Time_Min, Appointment_Duration_Min
)
SELECT 
  DISTINCT  p.PatientKey,
    ph.PhysicianKey,
    d.DepartmentKey,
    vt.VisitTypeKey,
    s.AppointmentStatusKey,
    CAST(CONVERT(CHAR(8), a.Appointment_Date, 112) AS INT) AS DateKey,
    a.Wait_Time_Min,
    a.Appointment_Duration_Min
FROM stg_HealthcareAppointments a
JOIN DimPatient p ON a.Patient_ID = p.Patient_ID
JOIN DimPhysician ph ON a.Physician = ph.Physician_Name
JOIN DimDepartment d ON a.Department = d.Department_Name
JOIN DimVisitType vt ON a.Visit_Type = vt.Visit_Type
JOIN DimAppointmentStatus s ON a.Appointment_Status = s.Appointment_Status;

📊 What You Can Analyze

Once your schema is populated, you can easily explore insights like:

✨ Operational Insights

-->  Average wait time per department
-->  Appointment completion vs. no-show rate

Patient demographics by department

📅 Time-Based Trends

Appointment volume by month, quarter, or year

Doctor workload across different periods

👩‍⚕️ Performance Insights

Top-performing physicians or departments

Average appointment duration and efficiency

⚙️ Tech Stack

🧱 Database: Microsoft SQL Server

🧮 ETL: SQL Scripts from Staging to Dimensions & Facts

This start schema is good for creating data visualization.
📊 Visualization Tools: Power BI / Tableau

🧰 Data Source: Synthetic Healthcare Appointment Data

Load the Raw Data
Import your healthcare dataset (HealthcareAppointments.csv) into a staging table.

Run the SQL Scripts
Execute the CREATE_TABLES.sql and INSERT_DATA.sql scripts in SQL Server.


