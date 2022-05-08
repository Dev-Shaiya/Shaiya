USE [PS_UserData]
GO

CREATE PROCEDURE [dbo].[usp_trn_table](
@dbname varchar(500),
@TableName Varchar(500) )
WITH EXECUTE AS OWNER
AS
BEGIN

Declare @TruncateSQL nvarchar(500)

IF @dbname IS NULL
  SET @dbname = 'PS_UserData'

IF @TableName IS NULL
  SET @TableName = 'Users_Master'

IF @dbname = 'PS_UserData'
  BEGIN
     RAISERROR('Database Name cannot be NULL',16,1)
     RETURN -1
  END

IF  (DB_ID(@dbname) IS NULL) OR (@dbname in ('master','msdb','model'))
  BEGIN
     RAISERROR('Invalid Database.Cannot truncate tables in system databases Master, msdb and model',16,1)
     RETURN -1
  END  

IF @TableName = ''
  BEGIN
     RAISERROR('Table Name cannot be NULL',16,1)
  END
ELSE
  BEGIN
  SET @TruncateSQL = 'TRUNCATE TABLE  ' + @dbname + '..' + @TableName
  END

BEGIN TRY
SELECT SUSER_SNAME()
TRUNCATE TABLE  Testdb..a
--   EXEC sp_executesql @TruncateSQL
END TRY

BEGIN CATCH

    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    SELECT 
        @ErrorMessage = ERROR_MESSAGE(),
        @ErrorSeverity = ERROR_SEVERITY(),
        @ErrorState = ERROR_STATE();
        
    SET @ErrorMessage = @TruncateSQL + ' : ' + @ErrorMessage

    RAISERROR (@ErrorMessage, -- Message text.
               @ErrorSeverity, -- Severity.
               @ErrorState -- State.
               );

    RETURN -1
END CATCH

  RETURN 0

END
GO

GRANT EXECUTE ON [usp_trn_table] TO public
go