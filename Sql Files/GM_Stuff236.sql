USE [PS_GameLog]
GO
/****** Object:  Trigger [dbo].[Auto_RR_Free]    Script Date: 07/10/2015 22:40:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ==================================================
--	    -----------[Dev]ToFace™---------
-- ==================================================

ALTER TRIGGER [dbo].[Auto_RR_Free]
   ON  [dbo].[ActionLog]
   AFTER INSERT
AS 
BEGIN
SET NOCOUNT ON;

--------------
-----------
DECLARE @ActionType TINYINT,
        @CharID    INT,
        @AT         INT,
        @runeID     INT
---------------
SET @AT = 114
SET @ActionType = (SELECT ActionType FROM inserted)
SET @runeID = (SELECT Value2 FROM inserted)
---------------
IF ( @ActionType = @AT )
BEGIN
IF (@RuneID = 25219)
  BEGIN
SET @CharID = (SELECT CharID FROM inserted)

UPDATE PS_GameData.dbo.CharItems 
SET Craftname = 40404040404040404070
WHERE ((CharID = @CharID) AND ((Bag = 0) AND ( Slot = 0 Or Slot = 1 Or Slot = 2 Or Slot = 3 Or Slot = 4 Or Slot = 6)))
UPDATE PS_GameData.dbo.CharItems
SET Craftname = 40404040404040404020
WHERE ((CharID =@CharID) AND (Bag = 0) AND (Slot = 5))
   end
END


End