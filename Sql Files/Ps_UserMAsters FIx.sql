USE [PS_UserData]
GO

/****** Object:  DdlTrigger [safety]    Script Date: 06.07.2015 18:24:23 ******/
DROP TRIGGER [safety] ON DATABASE
GO

/****** Object:  DdlTrigger [safety]    Script Date: 06.07.2015 18:24:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE TRIGGER [safety] 
ON DATABASE 
FOR DROP_TABLE, ALTER_TABLE 
AS 
   PRINT 'You must disable Trigger "safety" to drop or alter tables!' 
   ROLLBACK;



GO

SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER OFF
GO

ENABLE TRIGGER [safety] ON DATABASE
GO


