--Trade Fix
CREATE TABLE [dbo].[Trade_Log] (
[UserUID] int NOT NULL ,
[UserID] varchar(20) NOT NULL ,
[CharID] int NOT NULL ,
[CharName] varchar(20) NOT NULL ,
[ItemID] int NOT NULL ,
[ItemName] varchar(50) NOT NULL ,
[Anzahl] int NOT NULL ,
[Handelspartner] varchar(50) NOT NULL ,
[ActionTime] datetime NOT NULL ,
[ItemUID] bigint NULL ,
[ItemDel] bit NOT NULL 
)

CREATE TRIGGER [dbo].[TradeCheat]
ON [dbo].[Trade_Log]
AFTER INSERT
AS
DECLARE @UserUID int
DECLARE @ItemUID bigint
DECLARE @ItemDel bit


SET @UserUID = (Select UserUID from dbo.Trade_Log where ItemDel = 0)
SET @ItemUID = (Select ItemUID from dbo.Trade_Log where ItemDel = 0 and UserUID = @UserUID)
SET @ItemDel = (Select ItemDel from dbo.Trade_Log where ItemDel = 0)
 
UPDATE PS_UserData.dbo.Users_Master SET Status = -5 WHERE UserUID = @UserUID
UPDATE PS_UserData.dbo.Users_Master SET BannGrund = 'TradeHack' where UserUID = @UserUID
UPDATE PS_UserData.dbo.Users_Master SET WerHatGebannt = 'DatenBank' where UserUID =@UserUID
IF (@ItemDel = 0)
Begin
		DELETE FROM PS_GameData.dbo.CharItems WHERE ItemUID = @ItemUID
		DELETE From PS_GameData.dbo.UserStoredItems Where ItemUID = @ItemUID
		DELETE from PS_GameData.dbo.GuildStoredItems Where ItemUID = @ItemUID
UPDATE PS_GameLog.dbo.Trade_Log SET ItemDel = 1 where UserUID = @UserUID
end
GO

-- PremReco

CREATE TABLE [dbo].[PremReco] (
[UserUID] int NULL ,
[UserID] varchar(999) NULL ,
[CharID] int NULL ,
[CharName] varchar(999) NULL ,
[ActionTime] datetime NULL ,
[ItemID] int NULL ,
[ItemName] varchar(999) NULL ,
[Anzahl] int NULL ,
[Erledigt] bit NOT NULL DEFAULT ((0)) 
)


CREATE INDEX [Order] ON [dbo].[PremReco]
([ActionTime] DESC) 
GO

-- ----------------------------
-- Triggers structure for table [dbo].[PremReco]
-- ----------------------------
DROP TRIGGER [dbo].[Rec]
GO
CREATE TRIGGER [dbo].[Rec]
ON [dbo].[PremReco]
AFTER INSERT
AS
DECLARE @PrCharID int
DECLARE @Str varchar(2)
DECLARE @Dex varchar(2)
DECLARE @Rec varchar(2)
DECLARE @Int varchar(2)
DECLARE @Wis varchar(2)
DECLARE @Luc varchar(2)
DECLARE @HP varchar(2)
DECLARE @MP varchar(2)
DECLARE @SP varchar(2)
DECLARE @Enchant varchar(2)
DECLARE @NewCraftname varchar(20)
DECLARE @PrItemID int
DECLARE @CraftName varchar (20)
DECLARE @ItemID int
Declare @ReqWis varchar(2)

SET @ItemID = (Select top 1 ItemID from PS_GameLog.dbo.PremReco where Erledigt = 0)
IF (@ItemID = 100212)
BEGIN
SET @PrCharID = (Select top 1 CharID from PS_GameLog.dbo.PremReco where Erledigt = 0)
SET @PrItemID = (Select top 1 ItemID from PS_GameData.dbo.CharItems where CharID = @PrCharID AND Bag = 5 And Slot = 0)
SET @ReqWis = (Select ReqWis from PS_GameDefs.dbo.Items where ItemID = @PrItemID)
SET @Craftname = (SELECT Craftname FROM PS_GameData.dbo.CharItems where CharID = @PrCharID AND Bag = 5 AND Slot = 0)
			SET @Str = @ReqWis
			SET @Dex = CAST(SUBSTRING(@Craftname,3,2) AS Varchar(2))
			SET @Rec = CAST(SUBSTRING(@Craftname,5,2) AS Varchar(2))
			SET @Int = CAST(SUBSTRING(@Craftname,7,2) AS Varchar(2))
			SET @Wis = CAST(SUBSTRING(@Craftname,9,2) AS Varchar(2))
			SET @Luc = CAST(SUBSTRING(@Craftname,11,2) AS Varchar(2))
			SET @HP = CAST(SUBSTRING(@Craftname,13,2) AS Varchar(2))
			SET @MP = CAST(SUBSTRING(@Craftname,15,2) AS Varchar(2))
			SET @SP = CAST(SUBSTRING(@Craftname,17,2) AS Varchar(2))
			SET @Enchant = CAST(SUBSTRING(@Craftname,19,2) AS Varchar(2))

SET @NewCraftname = @Str + @Dex + @Rec + @Int + @Wis + @Luc + @HP + @MP + @SP + @Enchant

UPDATE PS_GameData.dbo.CharItems
SET Craftname = @NewCraftname
WHERE CharID = @PrCharID AND Bag = 5 AND Slot = 0
IF @@rowcount = 1
BEGIN
UPDATE PS_GameLog.dbo.PremReco
SET Erledigt = 1
Where CharID = @PrCharID
END
END

SET @ItemID = (Select top 1 ItemID from PS_GameLog.dbo.PremReco where Erledigt = 0)
IF (@ItemID = 100213)
BEGIN
SET @PrCharID = (Select top 1 CharID from PS_GameLog.dbo.PremReco where Erledigt = 0)
SET @PrItemID = (Select top 1 ItemID from PS_GameData.dbo.CharItems where CharID = @PrCharID AND Bag = 5 And Slot = 0)
SET @ReqWis = (Select ReqWis from PS_GameDefs.dbo.Items where ItemID = @PrItemID)
SET @Craftname = (SELECT Craftname FROM PS_GameData.dbo.CharItems where CharID = @PrCharID AND Bag = 5 AND Slot = 0)
			SET @Str = CAST(SUBSTRING(@Craftname,1,2) AS Varchar(2))
			SET @Dex = @ReqWis
			SET @Rec = CAST(SUBSTRING(@Craftname,5,2) AS Varchar(2))
			SET @Int = CAST(SUBSTRING(@Craftname,7,2) AS Varchar(2))
			SET @Wis = CAST(SUBSTRING(@Craftname,9,2) AS Varchar(2))
			SET @Luc = CAST(SUBSTRING(@Craftname,11,2) AS Varchar(2))
			SET @HP = CAST(SUBSTRING(@Craftname,13,2) AS Varchar(2))
			SET @MP = CAST(SUBSTRING(@Craftname,15,2) AS Varchar(2))
			SET @SP = CAST(SUBSTRING(@Craftname,17,2) AS Varchar(2))
			SET @Enchant = CAST(SUBSTRING(@Craftname,19,2) AS Varchar(2))

SET @NewCraftname = @Str + @Dex + @Rec + @Int + @Wis + @Luc + @HP + @MP + @SP + @Enchant

UPDATE PS_GameData.dbo.CharItems
SET Craftname = @NewCraftname
WHERE CharID = @PrCharID AND Bag = 5 AND Slot = 0
IF @@rowcount = 1
BEGIN
UPDATE PS_GameLog.dbo.PremReco
SET Erledigt = 1
Where CharID = @PrCharID
END
END

SET @ItemID = (Select top 1 ItemID from PS_GameLog.dbo.PremReco where Erledigt = 0)
IF (@ItemID = 100214)
BEGIN
SET @PrCharID = (Select top 1 CharID from PS_GameLog.dbo.PremReco where Erledigt = 0)
SET @PrItemID = (Select top 1 ItemID from PS_GameData.dbo.CharItems where CharID = @PrCharID AND Bag = 5 And Slot = 0)
SET @ReqWis = (Select ReqWis from PS_GameDefs.dbo.Items where ItemID = @PrItemID)
SET @Craftname = (SELECT Craftname FROM PS_GameData.dbo.CharItems where CharID = @PrCharID AND Bag = 5 AND Slot = 0)
			SET @Str = CAST(SUBSTRING(@Craftname,1,2) AS Varchar(2))
			SET @Dex = CAST(SUBSTRING(@Craftname,3,2) AS Varchar(2))
			SET @Rec = @ReqWis
			SET @Int = CAST(SUBSTRING(@Craftname,7,2) AS Varchar(2))
			SET @Wis = CAST(SUBSTRING(@Craftname,9,2) AS Varchar(2))
			SET @Luc = CAST(SUBSTRING(@Craftname,11,2) AS Varchar(2))
			SET @HP = CAST(SUBSTRING(@Craftname,13,2) AS Varchar(2))
			SET @MP = CAST(SUBSTRING(@Craftname,15,2) AS Varchar(2))
			SET @SP = CAST(SUBSTRING(@Craftname,17,2) AS Varchar(2))
			SET @Enchant = CAST(SUBSTRING(@Craftname,19,2) AS Varchar(2))

SET @NewCraftname = @Str + @Dex + @Rec + @Int + @Wis + @Luc + @HP + @MP + @SP + @Enchant

UPDATE PS_GameData.dbo.CharItems
SET Craftname = @NewCraftname
WHERE CharID = @PrCharID AND Bag = 5 AND Slot = 0
IF @@rowcount = 1
BEGIN
UPDATE PS_GameLog.dbo.PremReco
SET Erledigt = 1
Where CharID = @PrCharID
END
END

SET @ItemID = (Select top 1 ItemID from PS_GameLog.dbo.PremReco where Erledigt = 0)
IF (@ItemID = 100215)
BEGIN
SET @PrCharID = (Select top 1 CharID from PS_GameLog.dbo.PremReco where Erledigt = 0)
SET @PrItemID = (Select top 1  ItemID from PS_GameData.dbo.CharItems where CharID = @PrCharID AND Bag = 5 And Slot = 0)
SET @ReqWis = (Select ReqWis from PS_GameDefs.dbo.Items where ItemID = @PrItemID)
SET @Craftname = (SELECT Craftname FROM PS_GameData.dbo.CharItems where CharID = @PrCharID AND Bag = 5 AND Slot = 0)
			SET @Str = CAST(SUBSTRING(@Craftname,1,2) AS Varchar(2))
			SET @Dex = CAST(SUBSTRING(@Craftname,3,2) AS Varchar(2))
			SET @Rec = CAST(SUBSTRING(@Craftname,5,2) AS Varchar(2))
			SET @Int = CAST(SUBSTRING(@Craftname,7,2) AS Varchar(2))
			SET @Wis = @ReqWis
			SET @Luc = CAST(SUBSTRING(@Craftname,11,2) AS Varchar(2))
			SET @HP = CAST(SUBSTRING(@Craftname,13,2) AS Varchar(2))
			SET @MP = CAST(SUBSTRING(@Craftname,15,2) AS Varchar(2))
			SET @SP = CAST(SUBSTRING(@Craftname,17,2) AS Varchar(2))
			SET @Enchant = CAST(SUBSTRING(@Craftname,19,2) AS Varchar(2))

SET @NewCraftname = @Str + @Dex + @Rec + @Int + @Wis + @Luc + @HP + @MP + @SP + @Enchant

UPDATE PS_GameData.dbo.CharItems
SET Craftname = @NewCraftname
WHERE CharID = @PrCharID AND Bag = 5 AND Slot = 0
IF @@rowcount = 1
BEGIN
UPDATE PS_GameLog.dbo.PremReco
SET Erledigt = 1
Where CharID = @PrCharID
END
END

SET @ItemID = (Select top 1 ItemID from PS_GameLog.dbo.PremReco where Erledigt = 0)
IF (@ItemID = 100216)
BEGIN
SET @PrCharID = (Select top 1 CharID from PS_GameLog.dbo.PremReco where Erledigt = 0)
SET @PrItemID = (Select top 1 ItemID from PS_GameData.dbo.CharItems where CharID = @PrCharID AND Bag = 5 And Slot = 0)
SET @ReqWis = (Select ReqWis from PS_GameDefs.dbo.Items where ItemID = @PrItemID)
SET @Craftname = (SELECT Craftname FROM PS_GameData.dbo.CharItems where CharID = @PrCharID AND Bag = 5 AND Slot = 0)
			SET @Str = CAST(SUBSTRING(@Craftname,1,2) AS Varchar(2))
			SET @Dex = CAST(SUBSTRING(@Craftname,3,2) AS Varchar(2))
			SET @Rec = CAST(SUBSTRING(@Craftname,5,2) AS Varchar(2))
			SET @Int = @ReqWis
			SET @Wis = CAST(SUBSTRING(@Craftname,9,2) AS Varchar(2))
			SET @Luc = CAST(SUBSTRING(@Craftname,11,2) AS Varchar(2))
			SET @HP = CAST(SUBSTRING(@Craftname,13,2) AS Varchar(2))
			SET @MP = CAST(SUBSTRING(@Craftname,15,2) AS Varchar(2))
			SET @SP = CAST(SUBSTRING(@Craftname,17,2) AS Varchar(2))
			SET @Enchant = CAST(SUBSTRING(@Craftname,19,2) AS Varchar(2))

SET @NewCraftname = @Str + @Dex + @Rec + @Int + @Wis + @Luc + @HP + @MP + @SP + @Enchant

UPDATE PS_GameData.dbo.CharItems
SET Craftname = @NewCraftname
WHERE CharID = @PrCharID AND Bag = 5 AND Slot = 0
IF @@rowcount = 1
BEGIN
UPDATE PS_GameLog.dbo.PremReco
SET Erledigt = 1
Where CharID = @PrCharID
END
END

SET @ItemID = (Select top 1 ItemID from PS_GameLog.dbo.PremReco where Erledigt = 0)
IF (@ItemID = 100217)
BEGIN
SET @PrCharID = (Select top 1 CharID from PS_GameLog.dbo.PremReco where Erledigt = 0)
SET @PrItemID = (Select top 1 ItemID from PS_GameData.dbo.CharItems where CharID = @PrCharID AND Bag = 5 And Slot = 0)
SET @ReqWis = (Select ReqWis from PS_GameDefs.dbo.Items where ItemID = @PrItemID)
SET @Craftname = (SELECT Craftname FROM PS_GameData.dbo.CharItems where CharID = @PrCharID AND Bag = 5 AND Slot = 0)
			SET @Str = CAST(SUBSTRING(@Craftname,1,2) AS Varchar(2))
			SET @Dex = CAST(SUBSTRING(@Craftname,3,2) AS Varchar(2))
			SET @Rec = CAST(SUBSTRING(@Craftname,5,2) AS Varchar(2))
			SET @Int = CAST(SUBSTRING(@Craftname,7,2) AS Varchar(2))
			SET @Wis = CAST(SUBSTRING(@Craftname,9,2) AS Varchar(2))
			SET @Luc = @ReqWis
			SET @HP = CAST(SUBSTRING(@Craftname,13,2) AS Varchar(2))
			SET @MP = CAST(SUBSTRING(@Craftname,15,2) AS Varchar(2))
			SET @SP = CAST(SUBSTRING(@Craftname,17,2) AS Varchar(2))
			SET @Enchant = CAST(SUBSTRING(@Craftname,19,2) AS Varchar(2))

SET @NewCraftname = @Str + @Dex + @Rec + @Int + @Wis + @Luc + @HP + @MP + @SP + @Enchant

UPDATE PS_GameData.dbo.CharItems
SET Craftname = @NewCraftname
WHERE CharID = @PrCharID AND Bag = 5 AND Slot = 0
IF @@rowcount = 1
BEGIN
UPDATE PS_GameLog.dbo.PremReco
SET Erledigt = 1
Where CharID = @PrCharID
END
END

SET @ItemID = (Select top 1 ItemID from PS_GameLog.dbo.PremReco where Erledigt = 0)
IF (@ItemID = 100218)
BEGIN
SET @PrCharID = (Select top 1 CharID from PS_GameLog.dbo.PremReco where Erledigt = 0)
SET @PrItemID = (Select top 1 ItemID from PS_GameData.dbo.CharItems where CharID = @PrCharID AND Bag = 5 And Slot = 0)
SET @ReqWis = (Select ReqWis from PS_GameDefs.dbo.Items where ItemID = @PrItemID)
SET @Craftname = (SELECT Craftname FROM PS_GameData.dbo.CharItems where CharID = @PrCharID AND Bag = 5 AND Slot = 0)
			SET @Str = CAST(SUBSTRING(@Craftname,1,2) AS Varchar(2))
			SET @Dex = CAST(SUBSTRING(@Craftname,3,2) AS Varchar(2))
			SET @Rec = CAST(SUBSTRING(@Craftname,5,2) AS Varchar(2))
			SET @Int = CAST(SUBSTRING(@Craftname,7,2) AS Varchar(2))
			SET @Wis = CAST(SUBSTRING(@Craftname,9,2) AS Varchar(2))
			SET @Luc = CAST(SUBSTRING(@Craftname,11,2) AS Varchar(2))
			SET @HP = @ReqWis
			SET @MP = CAST(SUBSTRING(@Craftname,15,2) AS Varchar(2))
			SET @SP = CAST(SUBSTRING(@Craftname,17,2) AS Varchar(2))
			SET @Enchant = CAST(SUBSTRING(@Craftname,19,2) AS Varchar(2))

SET @NewCraftname = @Str + @Dex + @Rec + @Int + @Wis + @Luc + @HP + @MP + @SP + @Enchant

UPDATE PS_GameData.dbo.CharItems
SET Craftname = @NewCraftname
WHERE CharID = @PrCharID AND Bag = 5 AND Slot = 0
IF @@rowcount = 1
BEGIN
UPDATE PS_GameLog.dbo.PremReco
SET Erledigt = 1
Where CharID = @PrCharID
END
END

SET @ItemID = (Select top 1 ItemID from PS_GameLog.dbo.PremReco where Erledigt = 0)
IF (@ItemID = 100219)
BEGIN
SET @PrCharID = (Select top 1 CharID from PS_GameLog.dbo.PremReco where Erledigt = 0)
SET @PrItemID = (Select top 1 ItemID from PS_GameData.dbo.CharItems where CharID = @PrCharID AND Bag = 5 And Slot = 0)
SET @ReqWis = (Select ReqWis from PS_GameDefs.dbo.Items where ItemID = @PrItemID)
SET @Craftname = (SELECT Craftname FROM PS_GameData.dbo.CharItems where CharID = @PrCharID AND Bag = 5 AND Slot = 0)
			SET @Str = CAST(SUBSTRING(@Craftname,1,2) AS Varchar(2))
			SET @Dex = CAST(SUBSTRING(@Craftname,3,2) AS Varchar(2))
			SET @Rec = CAST(SUBSTRING(@Craftname,5,2) AS Varchar(2))
			SET @Int = CAST(SUBSTRING(@Craftname,7,2) AS Varchar(2))
			SET @Wis = CAST(SUBSTRING(@Craftname,9,2) AS Varchar(2))
			SET @Luc = CAST(SUBSTRING(@Craftname,11,2) AS Varchar(2))
			SET @HP = CAST(SUBSTRING(@Craftname,13,2) AS Varchar(2))
			SET @MP = @ReqWis
			SET @SP = CAST(SUBSTRING(@Craftname,17,2) AS Varchar(2))
			SET @Enchant = CAST(SUBSTRING(@Craftname,19,2) AS Varchar(2))

SET @NewCraftname = @Str + @Dex + @Rec + @Int + @Wis + @Luc + @HP + @MP + @SP + @Enchant

UPDATE PS_GameData.dbo.CharItems
SET Craftname = @NewCraftname
WHERE CharID = @PrCharID AND Bag = 5 AND Slot = 0
IF @@rowcount = 1
BEGIN
UPDATE PS_GameLog.dbo.PremReco
SET Erledigt = 1
Where CharID = @PrCharID
END
END

SET @ItemID = (Select top 1 ItemID from PS_GameLog.dbo.PremReco where Erledigt = 0)
IF (@ItemID = 100220)
BEGIN
SET @PrCharID = (Select top 1 CharID from PS_GameLog.dbo.PremReco where Erledigt = 0)
SET @PrItemID = (Select top 1 ItemID from PS_GameData.dbo.CharItems where CharID = @PrCharID AND Bag = 5 And Slot = 0)
SET @ReqWis = (Select ReqWis from PS_GameDefs.dbo.Items where ItemID = @PrItemID)
SET @Craftname = (SELECT Craftname FROM PS_GameData.dbo.CharItems where CharID = @PrCharID AND Bag = 5 AND Slot = 0)
			SET @Str = CAST(SUBSTRING(@Craftname,1,2) AS Varchar(2))
			SET @Dex = CAST(SUBSTRING(@Craftname,3,2) AS Varchar(2))
			SET @Rec = CAST(SUBSTRING(@Craftname,5,2) AS Varchar(2))
			SET @Int = CAST(SUBSTRING(@Craftname,7,2) AS Varchar(2))
			SET @Wis = CAST(SUBSTRING(@Craftname,9,2) AS Varchar(2))
			SET @Luc = CAST(SUBSTRING(@Craftname,11,2) AS Varchar(2))
			SET @HP = CAST(SUBSTRING(@Craftname,13,2) AS Varchar(2))
			SET @MP = CAST(SUBSTRING(@Craftname,15,2) AS Varchar(2))
			SET @SP = @ReqWis
			SET @Enchant = CAST(SUBSTRING(@Craftname,19,2) AS Varchar(2))

SET @NewCraftname = @Str + @Dex + @Rec + @Int + @Wis + @Luc + @HP + @MP + @SP + @Enchant

UPDATE PS_GameData.dbo.CharItems
SET Craftname = @NewCraftname
WHERE CharID = @PrCharID AND Bag = 5 AND Slot = 0
IF @@rowcount = 1
BEGIN
UPDATE PS_GameLog.dbo.PremReco
SET Erledigt = 1
Where CharID = @PrCharID
END
END

SET @ItemID = (Select top 1 ItemID from PS_GameLog.dbo.PremReco where Erledigt = 0)
IF (@ItemID = 100221)
BEGIN
SET @PrCharID = (Select top 1 CharID from PS_GameLog.dbo.PremReco where Erledigt = 0)
SET @PrItemID = (Select top 1 ItemID from PS_GameData.dbo.CharItems where CharID = @PrCharID AND Bag = 5 And Slot = 0)
SET @ReqWis = (Select ReqWis from PS_GameDefs.dbo.Items where ItemID = @PrItemID)
SET @Craftname = (SELECT Craftname FROM PS_GameData.dbo.CharItems where CharID = @PrCharID AND Bag = 5 AND Slot = 0)
			SET @Str = @ReqWis
			SET @Dex = @ReqWis
			SET @Rec = @ReqWis
			SET @Int = @ReqWis
			SET @Wis = @ReqWis
			SET @Luc = @ReqWis
			SET @HP = @ReqWis
			SET @MP = @ReqWis
			SET @SP = @ReqWis
			SET @Enchant = CAST(SUBSTRING(@Craftname,19,2) AS Varchar(2))

SET @NewCraftname = @Str + @Dex + @Rec + @Int + @Wis + @Luc + @HP + @MP + @SP + @Enchant

UPDATE PS_GameData.dbo.CharItems
SET Craftname = @NewCraftname
WHERE CharID = @PrCharID AND Bag = 5 AND Slot = 0
IF @@rowcount = 1
BEGIN
UPDATE PS_GameLog.dbo.PremReco
SET Erledigt = 1
Where CharID = @PrCharID
END
END
GO