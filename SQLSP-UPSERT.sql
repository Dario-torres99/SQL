/****** Object:  StoredProcedure [dbo].[Appointments_upsert]    Script Date: 12/11/2024 3:57:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Appointments_upsert]
AS
BEGIN
    MERGE INTO Appointments_F AS Target
    USING tt_Appointments_F AS Source
    ON Target.Appointments_ID = Source.Appointments_ID
    WHEN MATCHED THEN 
        UPDATE SET 
            Target.Appointments_ID = Source.Appointments_ID, 
            Target.Patient_Name_Key = Source.Patient_Name_Key,
            Target.Appointment_Start_Time = Source.Appointment_Start_Time, 
            Target.Appointment_Date = Source.Appointment_Date, 
            Target.Previous_Appointment_Date = Source.Previous_Appointment_Date, 
            Target.Next_Appointment_Date = Source.Next_Appointment_Date,
            Target.Visit_Type_Code = Source.Visit_Type_Code, 
            Target.Visit_Type_Name = Source.Visit_Type_Name, 
            Target.Visit_Status_Code = Source.Visit_Status_Code, 
            Target.Visit_Status_Name = Source.Visit_Status_Name
    WHEN NOT MATCHED THEN   
        INSERT (
            Appointments_ID, Patient_Name_Key, Appointment_Start_Time, Appointment_Date, Previous_Appointment_Date, Next_Appointment_Date,
            Visit_Type_Code, Visit_Type_Name, Visit_Status_Code, Visit_Status_Name
        ) VALUES (
            Source.Appointments_ID, Source.Patient_Name_Key, Source.Appointment_Start_Time, Source.Appointment_Date,
            Source.Previous_Appointment_Date, Source.Next_Appointment_Date, Source.Visit_Type_Code, Source.Visit_Type_Name,
            Source.Visit_Status_Code, Source.Visit_Status_Name
        );
    TRUNCATE TABLE tt_Appointments_F;
END;
GO


