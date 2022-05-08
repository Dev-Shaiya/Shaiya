USE [PS_ChatLog]
GO
/****** Object:  Trigger [dbo].[Commands]    Script Date: 09/01/2011 17:48:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Commands]
ON [PS_ChatLog].[dbo].[ChatLog]
FOR INSERT
AS



DECLARE
@ChatData varchar(128),
@Char varchar(60),
@row int,
@ChatTime datetime, 
@UserUID int,
@UserID varchar(30),
@Admin bit,
@AdminLevel int,
@Status smallint,
@CharID int,
@CharName varchar(30),
@Family tinyint,
@GM tinyint,
@GS tinyint,
@TargetUserUID int,
@TargetUserID varchar(30),
@T_CharID int,
@T_GS tinyint,
@TargetFamily tinyint,
@TargetStatus smallint,
@TargetAdmin bit,
@TargetAdminLevel int,
@dead bit,
@PosX real,
@PosY real,
@PosZ real,
@MapID tinyint,
@user varchar(20),
@IP varchar(17),
@BlockENDDate datetime,
@bantime smallint,
@mhd char(1),
@point int

SELECT @ChatData = ChatData FROM inserted WHERE ChatType = 1


-- Adde AP zu allen Accounts...
IF (@ChatData like 'addapall %')
BEGIN
    SET @UserUID =       (SELECT TOP 1 UserUID     FROM inserted WHERE ChatData like 'addapall %')
    SET @Admin =        (SELECT TOP 1 [Admin]     FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)
    SET @AdminLevel =    (SELECT TOP 1 AdminLevel FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)
    
    IF ((@Admin = 1) AND (@AdminLevel >= 10))
    BEGIN
        SET @ChatData = substring(@ChatData,10,20)
        SET @point = CONVERT(INT,@ChatData)
        UPDATE PS_UserData.dbo.Users_Master
        SET point = point+@point
    END
END


-- Full ban command für Admins. Ban für alle Accounts mit gleicher IP + IP Range ban.
IF (@ChatData like 'fullban %')
BEGIN
    SET @UserUID =        (SELECT TOP 1 UserUID    FROM inserted)
    SET @UserID =        (SELECT UserID            FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)
    SET @Admin =        (SELECT [Admin]            FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)
    SET @AdminLevel =    (SELECT AdminLevel        FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)
    
    IF ((@Admin = 1) AND (@AdminLevel >= 10))
    BEGIN
        SET @Char = substring(@ChatData,9,25)
        SET @TargetUserUID =    (SELECT TOP 1 UserUID    FROM PS_GameData.dbo.Chars            WHERE Charname = @Char)
        SET @TargetUserID =        (SELECT UserID            FROM PS_UserData.dbo.Users_Master    WHERE UserUID = @TargetUserUID)
        SET @IP =                (SELECT UserIP            FROM PS_UserData.dbo.Users_Master    WHERE UserUID = @TargetUserUID)
        
        UPDATE PS_UserData.dbo.Users_Master
        SET Status = -5 
        WHERE UserIP = @IP
        
        INSERT INTO [PS_UserData].[dbo].[Users_BlockIpRange]
                (IP,[Time],Reason)
        VALUES    (@IP,getdate(),'Banned by Admin Account: '+@UserID)
        
                INSERT INTO [PS_UserData].[dbo].[Users_BlockLog]
                (UserUID,[Status],BlockENDDate,GmID,InsertDate)
         VALUES    (@TargetUserUID , -9 , '' , @UserID, getdate() )
    END
END



-- unban command
IF (@ChatData like 'unban %')
BEGIN
    SET @UserUID =        (SELECT TOP 1 UserUID     FROM inserted)
    SET @Admin =        (SELECT TOP 1 [Admin]     FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)
    SET @AdminLevel=    (SELECT TOP 1 AdminLevel FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)
            
    IF ((@Admin = 1) AND (@AdminLevel >= 9))
    BEGIN
        SET @Char = substring(@ChatData,7,25)
        SET @TargetUserUID = (SELECT TOP 1 UserUID FROM PS_GameData.dbo.Chars WHERE CharName = @Char)
            
        DELETE FROM PS_UserData.dbo.Users_Block WHERE UserUID = @TargetUserUID 
        UPDATE PS_UserData.dbo.Users_Master
        SET status = 0
        WHERE UserUID = @TargetUserUID
    END
END




-- Reschar
IF (@ChatData like 'reschar %')
BEGIN
    SET @UserUID =        (SELECT UserUID        FROM inserted WHERE ChatData like 'reschar %')
    SET @Admin =        (SELECT [Admin]        FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)
    SET @AdminLevel =    (SELECT AdminLevel    FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)
    
    IF ((@Admin = 1) AND (@AdminLevel >= 2))
    BEGIN
        SET @Char = substring(@ChatData,9,25)
        SET @dead = (SELECT TOP 1 Del FROM PS_GameData.dbo.Chars WHERE CharName = @Char) 
        IF (@dead = 1)
        BEGIN
            UPDATE PS_GameData.dbo.Chars SET Del = 0    WHERE CharName = @Char
            UPDATE PS_GameData.dbo.Chars SET Map = 42    WHERE CharName = @Char
            UPDATE PS_GameData.dbo.Chars SET PosX = 50    WHERE CharName = @Char
            UPDATE PS_GameData.dbo.Chars SET PosY = 2    WHERE CharName = @Char            
            UPDATE PS_GameData.dbo.Chars SET Posz = 54    WHERE CharName = @Char
        END
    END
END



-- Ban command für GM
IF (@ChatData like 'ban %')
BEGIN
    SET @UserUID =    (SELECT TOP 1 UserUID    FROM inserted)
    SET @Status =    (SELECT [Status]        FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)
    
    IF ((@Status = 16) OR (@Status = 32))
    BEGIN
        SET @Char = substring(@ChatData,5,25)
        SET @TargetUserUID = (SELECT TOP 1 UserUID FROM PS_GameData.dbo.Chars WHERE CharName = @Char)
        UPDATE PS_UserData.dbo.Users_Master
        SET status = -9
        WHERE UserUID = @TargetUserUID
            
        INSERT INTO [PS_UserData].[dbo].[Users_BlockLog]
                (UserUID,Status,BlockENDDate,GmID,InsertDate)
         VALUES    (@TargetUserUID , -9 , '' , @CharName, getdate() )
    END
END


-- tempBan command für GM
IF (@ChatData like 'tempban %')
BEGIN
    SET @Char = substring(@ChatData,9,30)
    
    SET @bantime = substring(@Char,CHARINDEX(' ', @Char)+1,1) 
    SET @mhd = substring(@ChatData,len(@ChatData),1)
    SET @Char = substring(@Char,1,CHARINDEX(' ', @Char)-1) 
    
    SET @UserUID =    (SELECT TOP 1 UserUID    FROM inserted)
    SET @Status =    (SELECT [Status]        FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)
    
    IF ((@Status = 16) OR (@Status = 32))
    BEGIN
        SET @CharID =            (SELECT TOP 1 CharID    FROM inserted)
        SET @CharName =            (SELECT CharName        FROM PS_GameData.dbo.Chars WHERE CharID = @CharID)
        SET @TargetUserUID =    (SELECT TOP 1 UserUID    FROM PS_GameData.dbo.Chars WHERE CharName = @Char AND del = 0)

        -- Default ban by day.
        SET @BlockENDDate = DateAdd("d", @bantime, getdate())
        IF @mhd = 'm' SET @BlockENDDate = DateAdd("n", @bantime, getdate())
         IF @mhd = 'h' SET @BlockENDDate = DateAdd("hh", @bantime, getdate())
         IF @mhd = 'd' SET @BlockENDDate = DateAdd("d",    @bantime, getdate())
                        
        INSERT INTO [PS_UserData].[dbo].[Users_Block]
                (UserUID, BlockENDDate)
        VALUES    (@TargetUserUID, @BlockENDDate)
        INSERT INTO [PS_UserData].[dbo].[Users_BlockLog]
                (UserUID,[Status],BlockENDDate,GmID,InsertDate)
        VALUES    (@TargetUserUID , 5 , @BlockENDDate , @CharName, getdate() )

        UPDATE PS_UserData.dbo.Users_Master
        SET status = 5
        WHERE UserUID = @TargetUserUID
    END
END


-- Give AP to player 
IF (@ChatData like 'addpoints %')
BEGIN
    -- Parameter von command entfernen.
    SET @Char = substring(@ChatData,11,40)
    -- Alle vorderen parameter entfernen.
    SET @point = substring(@Char,CHARINDEX(' ', @Char)+1,9) 
    -- hintere parameter entfernen dass nur noch Character übrig bleibt.
    SET @Char = substring(@Char,1,CHARINDEX(' ', @Char)-1) 
    
    SET @UserUID =        (SELECT TOP 1 UserUID    FROM inserted)
    SET @Admin =        (SELECT [Admin]            FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)
    SET @AdminLevel =    (SELECT AdminLevel        FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)
    
    IF ((@Admin = 1) AND (@AdminLevel >= 9))
    BEGIN
        SET @TargetUserUID = (SELECT UserUID FROM PS_GameData.dbo.Chars WHERE CharName = @Char)
        UPDATE PS_UserData.dbo.Users_Master
        SET point = point+@point
        WHERE UserUID = @TargetUserUID
    END
END



