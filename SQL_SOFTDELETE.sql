/****** Object:  StoredProcedure [dbo].[SoftDelete]    Script Date: 12/11/2024 3:58:34 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SoftDelete]
    @YearsAgo INT  -- Variable para indicar cuántos años atrás eliminar
AS
BEGIN
    -- Declare variables
    DECLARE @TargetYear INT;
    DECLARE @CutOffDate DATE;
    
    -- Calculate the target year based on input
    SET @TargetYear = YEAR(DATEADD(YEAR, -@YearsAgo, GETDATE())); -- Resta los años indicados a la fecha actual
    
    -- Set the cutoff date to the first day of the target year
    SET @CutOffDate = DATEFROMPARTS(@TargetYear, 1, 1);
    
    -- Delete transactions older than the cutoff date
    DELETE FROM Transactions_F
    WHERE Transaction_Date >= @CutOffDate;
    
    -- Delete appointments older than the cutoff date
    DELETE FROM Appointments_F
    WHERE Appointment_Date >= @CutOffDate;
END;

GO


