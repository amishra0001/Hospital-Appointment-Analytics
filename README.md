# 🏥 **Hospital Appointment Analytics**
**Healthcare Data Warehouse – Star Schema Project**

---

## 📘 **Overview**
Welcome to the **Healthcare Data Warehouse Project**, a comprehensive example of designing and implementing a **Star Schema** for healthcare analytics.  

This project transforms **raw patient appointment data** into a clean, analytical data model ready for use in **SQL Server, Power BI, or Tableau**.  

**Goal:**  
Enable analysts and data engineers to understand how to **structure, load, and analyze healthcare appointment data efficiently**, from **data staging** to **insight generation**.

---

## 🧩 **Data Model – Star Schema Design**
The data warehouse uses a **Star Schema architecture**:  
- A central **Fact Table** connects to multiple **Dimension Tables**  
- Supports **fast and flexible analytical queries** for insights into appointments, physicians, departments, and patient demographics

---

## 🪙 **Fact Table**

### **FactAppointment**
Central table containing **appointment-level data** and measures such as:  
- ⏱️ **Wait Time (Minutes)**  
- 🕒 **Appointment Duration (Minutes)**  

---

## 🌐 **Dimension Tables**

| Dimension | Description |
|-----------|-------------|
| 🧍 **DimPatient** | Patient details — ID, Name, Gender, Age |
| 👨‍⚕️ **DimPhysician** | Physician information for provider-level analysis |
| 🏢 **DimDepartment** | Hospital or clinic departments |
| 📋 **DimVisitType** | Appointment types (Consultation, Follow-up, etc.) |
| 📅 **DimDate** | Date dimension for time-series analysis |
| 🔖 **DimAppointmentStatus** | Appointment outcome (Completed, Cancelled, No-Show) |

---

## 🗂️ **Database Schema (SQL Server)**
1️⃣ **Create Tables**  
- `CREATE_TABLES.sql` file uploaded in repository  

2️⃣ **Data Loading (ETL from Staging Table)**  
- Load raw CSV into **staging table**  
- Execute SQL scripts to populate **Dimension** and **Fact** tables (`INSERT_DATA.sql` uploaded)

---

## 📊 **What You Can Analyze**

### ✨ **Operational Insights**
- Average **wait time per department**  
- **Appointment completion vs. no-show rates**  
- Patient demographics by department  

### 📅 **Time-Based Trends**
- Appointment volume by **month, quarter, or year**  
- Doctor workload across different periods  

### 👩‍⚕️ **Performance Insights**
- Top-performing physicians or departments  
- Average **appointment duration** and **efficiency**

---

## ⚙️ **Tech Stack**
- 🧱 **Database:** Microsoft SQL Server  
- 🧮 **ETL:** SQL Scripts from Staging → Dimensions & Facts  
- 📊 **Visualization Tools:** Power BI / Tableau  
- 🧰 **Data Source:** Synthetic Healthcare Appointment Data  

---

## 🛠️ **Getting Started**

### 1️⃣ Load the Raw Data
- Import `HealthcareAppointments.csv` into a **staging table**  

### 2️⃣ Run the SQL Scripts
- Execute `CREATE_TABLES.sql`  
- Execute `INSERT_DATA.sql`  
