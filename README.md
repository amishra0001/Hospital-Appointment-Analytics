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


1️⃣ Create Tables sql file has been uploaded in the file upload sections.

2️⃣ Data Loading (ETL from Staging Table)

Once your raw CSV data is loaded into a staging table , use these SQL scripts to populate your dimensions and fact table: The SQL files have beeb uploaded.


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


