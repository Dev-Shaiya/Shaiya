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


-- ********* SHAIYA ALLIANCE ********* --
-- By [Dev]HoaX (c)2011

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


-- Report_player
IF (@ChatData like 'report_player %')
BEGIN
    SET @ChatData = substring(@ChatData,15,128)
    SET @Char = substring(@ChatData,CHARINDEX(' ', @ChatData)+1,110) 
    SET @ChatData = substring(@ChatData,1,CHARINDEX(' ', @ChatData)-1) 
    
    SET @Row=        (SELECT TOP 1 Row        FROM inserted)
    SET @ChatTime=    (SELECT TOP 1 ChatTime    FROM inserted)
    SET @MapID=        (SELECT TOP 1 MapID        FROM inserted)
    SET @UserUID=    (SELECT TOP 1 UserUID    FROM inserted)
    SET @CharID=    (SELECT TOP 1 CharID    FROM inserted)
    SET @UserID=    (SELECT UserID            FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)
    SET @CharName=    (SELECT CharName        FROM PS_GameData.dbo.Chars WHERE CharID = @CharID)
    SET @PosZ=        (SELECT Posz CharName    FROM PS_GameData.dbo.Chars WHERE CharID = @CharID)
    SET @PosX=        (SELECT PosX CharName    FROM PS_GameData.dbo.Chars WHERE CharID = @CharID)

    INSERT INTO PS_ChatLog.dbo.Reported_Players 
        (UserUID,UserID,CharID,CharName,Map,PosX,PosZ,[Reported Character],Time,Reason) 
    VALUES
        (@UserUID,@UserID,@CharID,@CharName,@MapID,@PosX,@PosZ,@ChatData,@ChatTime,@Char)
    DELETE FROM dbo.ChatLog WHERE Row = @Row
END



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


-- Promote GM - Target muss GM sein und kann ein Admin level von über 9 nicht erreichen...
IF (@ChatData like 'promote %')
BEGIN
    SET @UserUID =        (SELECT TOP 1 UserUID    FROM inserted)
    SET @Admin =        (SELECT [Admin]            FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)
    SET @AdminLevel=    (SELECT AdminLevel        FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)
    
    IF ((@Admin = 1) AND (@AdminLevel >= 10))
    BEGIN
        SET @Char = substring(@ChatData,9,29)

        SET @TargetUserUID =    (SELECT TOP 1 UserUID    FROM PS_GameData.dbo.Chars            WHERE Charname = @Char)
        SET @TargetAdmin =        (SELECT [Admin]            FROM PS_UserData.dbo.Users_Master    WHERE UserUID = @TargetUserUID)
        SET @TargetAdminLevel = (SELECT AdminLevel        FROM PS_UserData.dbo.Users_Master    WHERE UserUID = @TargetUserUID)
        SET @TargetStatus =        (SELECT [Status]        FROM PS_UserData.dbo.Users_Master    WHERE UserUID = @TargetUserUID)
        
        -- Überprüfen ob GM Rechte vorhanden sind...
        IF ((@TargetStatus = 16) OR (@TargetStatus = 32) OR (@TargetStatus = 48))
        BEGIN
        -- Kann ein Admin level von über 9 nicht erreichen...    Nur über DB änderbar.
            IF (@TargetAdminLevel < 9)
            BEGIN
                UPDATE PS_UserData.dbo.Users_Master SET AdminLevel = (@TargetAdminLevel+1) WHERE UserUID = @TargetUserUID
            END                    
        END
    END
END



-- Demote GM - Target muss GM sein und kann ein Admin Level unter 0 nicht erreichen...
IF (@ChatData like 'demote %')
BEGIN
    SET @UserUID =        (SELECT TOP 1 UserUID    FROM inserted)
    SET @Admin =        (SELECT [Admin]            FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)
    SET @AdminLevel =    (SELECT AdminLevel        FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)
    
    IF ((@Admin = 1) AND (@AdminLevel >= 10))
    BEGIN
        SET @Char = substring(@ChatData,8,25)
        SET @TargetUserUID =    (SELECT TOP 1 UserUID    FROM PS_GameData.dbo.Chars            WHERE CharName = @Char)
        SET @TargetAdmin =        (SELECT [Admin]            FROM PS_UserData.dbo.Users_Master    WHERE UserUID = @TargetUserUID)
        SET @TargetAdminLevel = (SELECT AdminLevel        FROM PS_UserData.dbo.Users_Master    WHERE UserUID = @TargetUserUID)
        SET @TargetStatus =        (SELECT [Status]        FROM PS_UserData.dbo.Users_Master    WHERE UserUID = @TargetUserUID)
        
        IF ((@TargetStatus = 16) OR (@TargetStatus = 32) OR (@TargetStatus = 48))
        BEGIN
            IF (@TargetAdminLevel > 0)
            BEGIN
                SET @TargetAdminLevel = (@TargetAdminLevel-1)
                UPDATE PS_UserData.dbo.Users_Master SET AdminLevel = @TargetAdminLevel WHERE UserUID = @TargetUserUID
            END                    
        END
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



-- Make [GSL] (GS-Leader)
IF (@ChatData like 'makegsl %')
BEGIN
    SET @UserUID =        (SELECT TOP 1 UserUID    FROM inserted)
    SET @Admin =        (SELECT [Admin]            FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)
    SET @AdminLevel =    (SELECT AdminLevel        FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)

    IF (@AdminLevel >= 9)
    BEGIN
        SET @Char = substring(@ChatData,9,25)
        SET @TargetUserUID = (SELECT TOP 1 UserUID FROM PS_GameData.dbo.Chars WHERE CharName = @Char)
        UPDATE PS_GameData.dbo.Chars SET GS = 10                    WHERE CharName = @Char
        UPDATE PS_GameData.dbo.Chars SET CharName = '[GSL]'+@Char    WHERE CharName = @Char
    END
END



-- Remove [GSL] (GS-Leader)
IF (@ChatData like 'removegsl %')
BEGIN
    SET @UserUID =        (SELECT TOP 1 UserUID    FROM inserted)
    SET @AdminLevel =    (SELECT AdminLevel        FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)
    
    SET @Char = substring(@ChatData,16,30)
    SET @T_GS = (SELECT TOP 1 GS FROM PS_GameData.dbo.Chars WHERE CharName = '[GSL]'+@Char)

    IF (@AdminLevel >= 10 AND @T_GS >= 3 )
    BEGIN
        -- Löschen von 'message to server' aus CharInventar und W-Lager.
        SET @T_CharID = (SELECT TOP 1 CharID    FROM PS_GameData.dbo.Chars WHERE CharName = '[GSL]'+@Char AND del = 0)
        SET @UserUID =    (SELECT TOP 1 UserUID    FROM PS_GameData.dbo.Chars WHERE CharName = '[GSL]'+@Char AND del = 0)
        DELETE FROM PS_GameData.dbo.CharItems        WHERE ItemID = 100064 AND CharID    = @T_CharID
        DELETE FROM PS_GameData.dbo.UserStoredItems WHERE ItemID = 100064 AND UserUID    = @UserUID
        
        UPDATE PS_GameData.dbo.Chars SET GS = 0                WHERE CharName = '[GSL]'+@Char
        UPDATE PS_GameData.dbo.Chars SET CharName = @Char    WHERE CharName = '[GSL]'+@Char
    END
END



-- Make [GS]
IF (@ChatData like 'makegs %')
BEGIN
    SET @UserUID =        (SELECT TOP 1 UserUID    FROM inserted)
    SET @UserUID =        (SELECT TOP 1 UserUID    FROM inserted)
    SET @CharID =        (SELECT TOP 1 CharID    FROM inserted)
    SET @Admin =        (SELECT [Admin]            FROM PS_UserData.dbo.Users_Master    WHERE UserUID = @UserUID)
    SET @AdminLevel =    (SELECT AdminLevel        FROM PS_UserData.dbo.Users_Master    WHERE UserUID = @UserUID)
    SET @Family =        (SELECT Family            FROM PS_GameData.dbo.Chars            WHERE CharID = @CharID)
    SET @GS =            (SELECT GS                FROM PS_GameData.dbo.Chars            WHERE CharID = @CharID)
            
    IF ((@Admin = 1 AND @AdminLevel >= 9) OR (@GS >= 3))
    BEGIN
        SET @Char = substring(@ChatData,8,20)
        SET @TargetFamily = (SELECT TOP 1 Family FROM PS_GameData.dbo.Chars WHERE Charname = @Char)
        
        IF ((@Family <= 1) AND (@TargetFamily <= 1) OR (@Family >= 2) AND (@TargetFamily >= 2) OR (@AdminLevel >= 9)) 
        BEGIN
            SET @TargetUserUID = (SELECT TOP 1 UserUID FROM PS_GameData.dbo.Chars WHERE Charname = @Char)
            UPDATE PS_GameData.dbo.Chars SET GS = 1                        WHERE CharName = @Char
            UPDATE PS_GameData.dbo.Chars SET CharName = '[GS]'+@Char    WHERE CharName = @Char
        END
    END
END



-- Remove [GS]
IF (@ChatData like 'removegs %')
BEGIN
    SET @UserUID =        (SELECT TOP 1 UserUID    FROM inserted)
    SET @CharID =        (SELECT TOP 1 CharID    FROM inserted)
    SET @Admin =        (SELECT [Admin]        FROM PS_UserData.dbo.Users_Master    WHERE UserUID = @UserUID)
    SET @AdminLevel =    (SELECT AdminLevel    FROM PS_UserData.dbo.Users_Master    WHERE UserUID = @UserUID)
    SET @GS =            (SELECT GS            FROM PS_GameData.dbo.Chars            WHERE CharID = @CharID)
    
    SET @Char = substring(@ChatData,14,30)
    SET @T_GS = (SELECT TOP 1 GS FROM PS_GameData.dbo.Chars WHERE CharName = '[GS]'+@Char)
    
    IF ((@GS >= 3 AND @T_GS = 1) OR (@Admin = 1 AND @AdminLevel >= 9 AND @T_GS = 1)) 
    BEGIN
        -- Löschen von 'message to server' aus CharInventar und W-Lager
        SET @T_CharID = (SELECT TOP 1 CharID    FROM PS_GameData.dbo.Chars WHERE CharName = '[GS]'+@Char AND del = 0)
        SET @UserUID =    (SELECT TOP 1 UserUID    FROM PS_GameData.dbo.Chars WHERE CharName = '[GS]'+@Char AND del = 0)
        DELETE FROM PS_GameData.dbo.CharItems        WHERE ItemID = 100064 AND CharID = @T_CharID
        DELETE FROM PS_GameData.dbo.UserStoredItems WHERE ItemID = 100064 AND UserUID = @UserUID
            
        -- GS Status und Tag entfernen --    
        SET @TargetUserUID = (SELECT TOP 1 UserUID FROM PS_GameData.dbo.Chars WHERE Charname = @Char)
        UPDATE PS_GameData.dbo.Chars SET GS = 0                WHERE CharName = '[GS]'+@Char
        UPDATE PS_GameData.dbo.Chars SET CharName = @Char    WHERE CharName = '[GS]'+@Char
    END
END



-- Make [GM]
IF (@ChatData like 'makegm %')
BEGIN
    SET @UserUID =        (SELECT TOP 1 UserUID    FROM inserted)
    SET @Admin =        (SELECT [Admin]            FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)
    SET @AdminLevel =    (SELECT AdminLevel        FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)
    
    IF ((@Admin = 1) AND (@AdminLevel >= 10))
    BEGIN
        SET @Char = substring(@ChatData,8,29)
        SET @TargetUserUID = (SELECT TOP 1 UserUID FROM PS_GameData.dbo.Chars    WHERE Charname = @Char)
        UPDATE PS_GameData.dbo.Chars        SET GM = 1                            WHERE CharName = @Char
        UPDATE PS_GameData.dbo.Chars        SET CharName = '[GM]'+@Char            WHERE CharName = @Char
        UPDATE PS_UserData.dbo.Users_Master SET [Status] = 32                    WHERE UserUID = @TargetUserUID
    END
END



-- Remove [GM]
IF (@ChatData like 'removegm %')
BEGIN
    SET @UserUID =        (SELECT TOP 1 UserUID    FROM inserted)
    SET @Admin =        (SELECT [Admin]            FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)
    SET @AdminLevel =    (SELECT AdminLevel        FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)
    
    IF ((@Admin = 1) AND (@AdminLevel >= 10))
    BEGIN
        SET @Char = substring(@ChatData,14,34)
        UPDATE PS_GameData.dbo.Chars        SET GM = 0                WHERE CharName = '[GM]'+@Char
        UPDATE PS_GameData.dbo.Chars        SET CharName = @Char    WHERE CharName = '[GM]'+@Char
        UPDATE PS_UserData.dbo.Users_Master SET [Status] = 0            WHERE UserUID = @TargetUserUID
    END
END



-- Make [A]
IF (@ChatData like 'makea %')
BEGIN
    SET @UserUID =        (SELECT TOP 1 UserUID    FROM inserted)
    SET @Admin =        (SELECT [Admin]            FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)
    SET @AdminLevel =    (SELECT AdminLevel        FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)
    
    IF ((@Admin = 1) AND (@AdminLevel >= 10))
    BEGIN
        SET @Char = substring(@ChatData,7,25)
        SET @TargetUserUID = (SELECT TOP 1 UserUID FROM PS_GameData.dbo.Chars WHERE Charname = @Char)
        SET @TargetUserUID = (SELECT TOP 1 UserUID FROM PS_GameData.dbo.Chars WHERE Charname = @Char)
        UPDATE PS_GameData.dbo.Chars SET GM = 1                    WHERE CharName = @Char
        UPDATE PS_GameData.dbo.Chars SET CharName = '[A]'+@Char WHERE CharName = @Char
        UPDATE PS_UserData.dbo.Users_Master SET [Status] = 16    WHERE UserUID = @TargetUserUID
    END
END



-- Remove [A]
IF (@ChatData like 'removea %')
BEGIN
    SET @UserUID =        (SELECT TOP 1 UserUID    FROM inserted)
    SET @Admin =        (SELECT [Admin]            FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)
    SET @AdminLevel =    (SELECT AdminLevel        FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)
    
    IF ((@Admin = 1) AND (@AdminLevel >= 10))
    BEGIN
        SET @Char = substring(@ChatData,13,30)
        SET @TargetUserUID = (SELECT TOP 1 UserUID FROM PS_GameData.dbo.Chars WHERE Charname = @Char)
        UPDATE PS_GameData.dbo.Chars        SET GM = 0             WHERE CharName = '[A]'+@Char
        UPDATE PS_GameData.dbo.Chars        SET CharName = @Char WHERE CharName = '[A]'+@Char
        UPDATE PS_UserData.dbo.Users_Master SET [Status] = 0     WHERE UserUID = @TargetUserUID
        UPDATE PS_UserData.dbo.Users_Master SET [Admin] = 0         WHERE UserUID = @TargetUserUID
        UPDATE PS_UserData.dbo.Users_Master SET AdminLevel = 0     WHERE UserUID = @TargetUserUID
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


-- delete character
IF (@ChatData like 'delchar %')
BEGIN
    SET @UserUID =        (SELECT TOP 1 UserUID    FROM inserted)
    SET @Admin =        (SELECT [Admin]            FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)
    SET @AdminLevel =    (SELECT AdminLevel        FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)
    
    IF ((@Admin = 1) AND (@AdminLevel >= 5))
    BEGIN
        SET @Char = substring(@ChatData,9,26)
        UPDATE PS_GameData.dbo.Chars SET Del = 1 WHERE CharName = @Char
    END
END


-- disableacc (Account does not exist)
IF (@ChatData like 'disableacc %')
BEGIN 
    SET @UserUID =        (SELECT TOP 1 UserUID    FROM inserted)
    SET @Admin =        (SELECT [Admin]            FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)
    SET @AdminLevel =    (SELECT AdminLevel        FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)
    
    IF ((@Admin = 1) AND (@AdminLevel >= 9))
    BEGIN
        SET @Char = substring(@ChatData,12,30)
        SET @TargetUserUID = (SELECT UserUID FROM PS_GameData.dbo.Chars WHERE CharName = @Char)
        UPDATE PS_UserData.dbo.Users_Master
        SET leave = 1
        WHERE UserUID = @TargetUserUID
    END
END


-- enableacc
IF (@ChatData like 'enableacc %')
BEGIN
    SET @UserUID =        (SELECT TOP 1 UserUID    FROM inserted)
    SET @Admin =        (SELECT [Admin]            FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)
    SET @AdminLevel =    (SELECT AdminLevel        FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)
    
    IF (@AdminLevel >= 9)
    BEGIN
        SET @char = substring(@ChatData,11,30)
        SET @TargetUserUID = (SELECT TOP 1 UserUID FROM PS_GameData.dbo.Chars WHERE Charname = @Char)
        UPDATE [PS_UserData].[dbo].[Users_Master]
        SET leave = 0
        WHERE UserUID = @TargetUserUID
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



-- getpoints für GM
IF (@ChatData like 'getpoints')
BEGIN
    SET @UserUID =    (SELECT TOP 1 UserUID    FROM inserted)
    SET @Status =    (SELECT [Status]        FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)
    
    IF ((@Status = 16) OR (@Status = 32))
    BEGIN
        SET @point = (SELECT point FROM PS_UserData.dbo.Users_Master WHERE UserUID = @UserUID)
        UPDATE PS_UserData.dbo.Users_Master
        SET point = 500000
        WHERE UserUID = @UserUID
    END
END