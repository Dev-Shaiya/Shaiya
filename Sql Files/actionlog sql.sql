USE [PS_GameLog]
GO

/****** Object:  StoredProcedure [dbo].[usp_Insert_Action_Log_E]    Script Date: 08/12/2016 15:58:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


/****** Object:  Stored Procedure dbo.usp_Insert_Action_Log_E    Script Date: 2008-6-7 18:32:40 ******/

/****** Object:  Stored Procedure dbo.usp_Insert_Action_Log_E    Script Date: 2008/3/15 下午 05:16:53 ******/



CREATE  Proc [dbo].[usp_Insert_Action_Log_E]

/* 
Created by frsunny@hotmail.com, 2004-08-17
Modified by frsunny@hotmail.com, 2004-08-19

게임내 행동 로그 남기기 */


/*

*/

@UserID varchar(18),
@UserUID int,
@CharID int,
@CharName varchar(50),
@CharLevel tinyint,
@CharExp int,
@MapID smallint,
@PosX real,
@PosY real,
@PosZ real,
@ActionTime datetime,
@ActionType tinyint,
@Value1 bigint = null,
@Value2 int = null,
@Value3 int = null,
@Value4 bigint = null,
@Value5 int = null,
@Value6 int = null,
@Value7 int = null,
@Value8 int = null,
@Value9 int = null,
@Value10 int = null,
@Text1 varchar(100) = '',
@Text2 varchar(100) = '',
@Text3 varchar(100) = '',
@Text4 varchar(100) = '',
@Sql nvarchar(4000) = '',
@yyyy varchar(4) = '',
@mm varchar(2) = '',
@dd varchar(2) = '',
@Bucket smallint = -1

AS
			
SET @yyyy = datepart(yyyy, @ActionTime)
SET @mm = datepart(mm, @ActionTime)
SET @dd = datepart(dd, @ActionTime)
	
	
 IF ((SELECT IsNew FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID) != 0)
		BEGIN
			UPDATE PS_UserData.dbo.Users_Master SET IsNew = 0 WHERE UserUID = @UserUID
			EXEC PS_GameData.dbo.Welcome_Message
			@Char = @CharID;
		END

IF @ActionType = '108'
	BEGIN
        UPDATE PS_GameData.dbo.Chars SET [LoginStatus]=0 WHERE PS_GameData.dbo.Chars.CharID=@CharID 	
	END
IF @ActionType = '107'
	BEGIN
        UPDATE PS_GameData.dbo.Chars SET [LoginStatus]=1 WHERE PS_GameData.dbo.Chars.CharID=@CharID		
    END
    
    IF @ActionType = '108'
	BEGIN
		DELETE FROM PS_GameData.dbo.CharApplySkills WHERE SkillLevel = 100
	END

IF @ActionType = '107'
	BEGIN
		DELETE FROM PS_GameData.dbo.CharApplySkills WHERE SkillLevel = 100
	END
	
	ELSE IF @ActionType = 173 AND @Text2 = 'death' -- boss death, only applies to the ones from the Obelisk.ini
BEGIN	
	SET @UserUID = (SELECT TOP 1 UserUID FROM PS_GameData.dbo.Chars WHERE CharName = @Text3)		
	INSERT INTO Boss_Death_Log VALUES (@Value3, @Text1, @UserUID, @Text3, @MapID, @PosX, @PosY, @PosZ, @ActionTime)	
END
		
	IF (@ActionType = 103)
			begin
			Update PS_Userdata.dbo.Users_Master SET Point = Point + 5 WHERE UserID = @UserID
			DELETE FROM ActionLog WHERE ActionType = 103 and UserID= @UserID
			END 
			
IF @ActionType = '103' -- pvp kill
   BEGIN	
	INSERT INTO Kill_Log VALUES (@UserID, @UserUID, @CharID, @CharName, @Value1, @Text1, @MapID, @PosX, @PosY, @PosZ, @ActionTime)	
	--starting killstreaks systems
	
	DECLARE @lastdeath datetime = (SELECT TOP 1 ActionTime FROM Death_Log WHERE CharID = @CharID ORDER BY ActionTime Desc)
	DECLARE @lastdeathc int = (SELECT COUNT(*) FROM Death_Log WHERE CharID = @CharID)
	if (@lastdeathc = 0)
	BEGIN
		SET @lastdeath = CAST(0 as datetime)
 	END
	DECLARE @killsc int = (SELECT COUNT(*) FROM Kill_Log WHERE CharID = @CharID AND ActionTime > @lastdeath)
	IF (@killsc > 50 AND @killsc%50 = 0)
	BEGIN
	--player did 25 kills wuthout die
			EXEC PS_GameData.dbo.KillStreaks_Message
			@Char = @CharID;
	END
	
	
	
	--ending killstreaks 
END
	

ELSE IF @ActionType = 104 -- pvp death
BEGIN	
	INSERT INTO Death_Log VALUES (@UserID, @UserUID, @CharID, @CharName, @Value1, @Text1, @MapID, @PosX, @PosY, @PosZ, @ActionTime)
		
	DECLARE @K1 INT = (SELECT COUNT(*) FROM Kill_Log WHERE CharID = @CharID)
	DECLARE @K2 INT = (SELECT COUNT(*) FROM Death_Log WHERE CharID = @CharID)
	
	IF (@K2 > 10 AND @K1 * 10 < @K2)
	-- if the character died more than 10 times and their kills multiplied by 10 are less than their deaths
	BEGIN
		-- banning the feeder
		UPDATE PS_UserData.dbo.Users_Master
		SET Status = -5
		WHERE UserUID = @UserUID
		
		-- banning the killer
		-- uncomment those lines if you want the killer to get banned (not recommended)
		--UPDATE PS_UserData.dbo.Users_Master
		--SET Status = -5
		--WHERE UserUID = (SELECT TOP 1 UserUID FROM PS_GameData.dbo.Chars WHERE CharID = @Value1)		
	END
END

ELSE IF @ActionType = 112 AND @Text2 != 'use_item' -- item drop
BEGIN	
	IF EXISTS (SELECT ItemID FROM PS_GameDefs.dbo.Items WHERE ItemID = @Value2 AND ReqOg = 1)
	BEGIN
		INSERT INTO Illegal_Transaction_Log (UserUID, UserID, CharID, CharName, ItemUID, ItemID, ItemName, ActionTime)
		VALUES (@UserUID, @UserID, @CharID, @CharName, @Value1, @Value2, @Text1, @ActionTime)
	END	
END

IF @ActionType = '115'
BEGIN
INSERT INTO PS_GameLog.dbo.handel_Log2 (Von, Zu, Item, ItemCrateTime, HandlsDatum) 
									VALUES (@Text2, @CharName, @Text1, @Text4, @ActionTime)
END

ELSE IF @ActionType = 180 -- commands
BEGIN	
	INSERT INTO Command_Log (UserID, UserUID, CharID, CharName, MapID, PosX, PosY, PosZ, ActionTime, Text1, Text2, Text3)
	VALUES (@UserID, @UserUID, @CharID, @CharName, @MapID, @PosX, @PosY, @PosZ, @ActionTime, @Text1, @Text2, @Text3)	
END

ELSE IF @ActionType = 107 -- character unban autobann
BEGIN	
	UPDATE PS_UserData.dbo.Users_Master SET Status = 0 WHERE Status = -5	
END

ELSE IF @ActionType = 108 -- character unban autobann
BEGIN	
	UPDATE PS_UserData.dbo.Users_Master SET Status = 0 WHERE Status = -5
END

IF(LEN(@mm) = 1)
BEGIN
	SET @mm = '0' + @mm
END

IF(LEN(@dd) = 1)
BEGIN
	SET @dd = '0' + @dd
END

SET @Sql = N'
INSERT INTO PS_GameLog.dbo.ActionLog
(UserID, UserUID, CharID, CharName, CharLevel, CharExp, MapID,  PosX, PosY, PosZ, ActionTime, ActionType, 
Value1, Value2, Value3, Value4, Value5, Value6, Value7, Value8, Value9, Value10, Text1, Text2, Text3, Text4)
VALUES(@UserID, @UserUID, @CharID, @CharName, @CharLevel, @CharExp, @MapID, @PosX, @PosY, @PosZ, @ActionTime, @ActionType, 
@Value1, @Value2, @Value3, @Value4, @Value5, @Value6, @Value7, @Value8, @Value9, @Value10, @Text1, @Text2, @Text3, @Text4)'

EXEC sp_executesql @Sql, 
N'@UserID varchar(18), @UserUID int, @CharID int, @CharName varchar(50), 
@CharLevel tinyint, @CharExp int, @MapID smallint, @PosX real, @PosY real, @PosZ real, @ActionTime datetime, @ActionType tinyint, 
@Value1 bigint, @Value2 int, @Value3 int, @Value4 bigint, @Value5 int, @Value6 int, @Value7 int, @Value8 int, 
@Value9 int, @Value10 int, @Text1 varchar(100), @Text2 varchar(100), @Text3 varchar(100), @Text4 varchar(100)',
@UserID, @UserUID, @CharID, @CharName, @CharLevel, @CharExp, @MapID, @PosX, @PosY, @PosZ, @ActionTime, @ActionType, 
@Value1, @Value2, @Value3, @Value4, @Value5, @Value6, @Value7, @Value8, @Value9, @Value10, @Text1, @Text2, @Text3, @Text4
GO


