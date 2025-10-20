
--Create a stored proc to get all appointments between Nov 1, 2024 and Mar 31, 2025?
-- Author:        [Agni Mishra]
-- Create Date:   [10/19/2025]
-- Procedure:     sp_GetAppointmentsByDateRange
-- Description:   Retrieves appointment records within a given date range from the Appointments table.
-- ==========================================================================================

CREATE OR ALTER PROCEDURE sp_GetAppointmentsByDateRange
    @StartDateKey INT,   -- Input parameter: Start of the date range (e.g., 20241101)
    @EndDateKey INT      -- Input parameter: End of the date range (e.g., 20250331)
AS
BEGIN
    -- Prevents extra result sets from interfering with SELECT statements
    SET NOCOUNT ON;

    ------------------------------------------------------------------------------------------
    -- MAIN QUERY SECTION
    -- The query retrieves all appointment records where the DateKey value 
    -- falls between the provided start and end date parameters.
    ------------------------------------------------------------------------------------------
    SELECT 
        AppointmentKey,           -- Unique identifier for each appointment
        PatientKey,                -- Foreign key referencing the patient
        PhysicianKey,              -- Foreign key referencing the physician
        DepartmentKey,             -- Department where the appointment occurred
        VisitTypeKey,              -- Type of visit (e.g., new, follow-up, urgent)
        AppointmentStatusKey,      -- Status (e.g., scheduled, completed, canceled)
        DateKey,                   -- Appointment date (formatted as INT YYYYMMDD)
        Wait_Time_Min,             -- Wait time in minutes
        Appointment_Duration_Min   -- Duration of the appointment in minutes
    FROM  dbo.FactAppointment          -- Replace this with your actual table name if different
    WHERE DateKey BETWEEN @StartDateKey AND @EndDateKey  -- Filters appointments within the range
    ORDER BY DateKey, AppointmentKey;   -- Orders results by date and appointment ID
END;

--Get all appointments between Nov 1, 2024 and Mar 31, 2025:

EXEC sp_GetAppointmentsByDateRange 
    @StartDateKey = 20241101, 
    @EndDateKey = 20250331;