USE [PS_UserData]
GO

CREATE PROCEDURE [dbo].[usp_truncate](
@dbname varchar(500),
@TableName Varchar(500) )
WITH EXECUTE AS 'Shaiya'
AS
BEGIN

Declare @TruncateSQL nvarchar(500)

SELECT SUSER_SNAME()

EXEC('TRUNCATE TABLE ' + @dbname + '..' + @TableName)
SET @TruncateSQL = 'TRUNCATE TABLE ' + @dbname + '..' + @TableName
--EXEC(@TruncateSQL)

  RETURN 0

END
GO