USE [PS_GameLog]
GO
/****** Object: Trigger [dbo].[Action] Script Date: 07/24/2011 18:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[Action]
on [PS_GameLog].[dbo].[ActionLog]
for insert
as


DECLARE
@ActionType tinyint,
@AT int,
@UserUID int,
@ItemID int,
@count tinyint


/* 
Action_Trigger_v2.sql RELEASE: 2011-07-14

Scripted by [Dev]HoaX 
Made for: ShaiyaAlliance / Shaiya-Reloaded / Shaiya-SyFy / Elitepvpers
*/

-- ActionType: 114 = Get AP by Selling Item to NPC
-- ActionType: 112 = Get AP by using it
SET @AT = 114

SET @ItemID = (SELECT Value2 FROM inserted)
SET @count = (SELECT Value4 FROM inserted)
SET @ActionType = (SELECT ActionType FROM inserted)
-- -------------------------------------------------

IF ( @ActionType = @AT )
BEGIN
-- -----------------------------------------

-- 25 AP Card

IF (@ItemID = 25219)
BEGIN 
SET @UserUID = (SELECT UserUID FROM inserted)

UPDATE PS_UserData.dbo.Users_Master 
SET Point = (Point + @count * 25) 
WHERE UserUID = @UserUID
END


-- 100 AP Card

IF (@ItemID = 25042)
BEGIN 
SET @UserUID = (SELECT UserUID FROM inserted)

UPDATE PS_UserData.dbo.Users_Master 
SET Point = (Point + @count * 100) 
WHERE UserUID = @UserUID
END


-- 1000 AP Card

IF (@ItemID = 44129)
BEGIN 
SET @UserUID = (SELECT UserUID FROM inserted)

UPDATE PS_UserData.dbo.Users_Master 
SET Point = (Point + @count * 1000) 
WHERE UserUID = @UserUID
END
-- -----------------------------------------
End