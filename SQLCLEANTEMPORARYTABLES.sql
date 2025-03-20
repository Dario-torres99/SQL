/****** Object:  StoredProcedure [dbo].[sp_CleanTemporaryTables]    Script Date: 12/11/2024 3:59:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_CleanTemporaryTables]
AS
BEGIN
    -- Clean the tt_Appointments_F table
    DELETE FROM dbo.tt_Appointments_F;
    
    -- Clean the tt_budget table
    DELETE FROM dbo.tt_budget;
    
    -- Clean the tt_Facilities_D table
    DELETE FROM dbo.tt_Facilities_D;
    
    -- Clean the tt_Patients_D table
    DELETE FROM dbo.tt_Patients_D;
    
    -- Clean the tt_Payers_D table
    DELETE FROM dbo.tt_Payers_D;
    
    -- Clean the tt_Providers_D table
    DELETE FROM dbo.tt_Providers_D;
    
    -- Clean the tt_Transactions_F table
    DELETE FROM dbo.tt_Transactions_F;

    -- Indicate success
    PRINT 'All temporary tables have been successfully cleaned';
END;
GO


