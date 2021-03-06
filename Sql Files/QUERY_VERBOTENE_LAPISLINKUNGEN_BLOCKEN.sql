set ANSI_NULLS ON
set QUOTED_IDENTIFIER OFF
GO




ALTER   Proc [dbo].[usp_Save_Char_Item_Mod_E]

@CharID int,
@ItemUID bigint = Null, -- 일반 작업시

-- 삭제만 필요한 경우 여기까지만 사용
-- 나머지는 기본값 Null 적용
@Bag tinyint = Null, 
@Slot tinyint = Null, 
@Quality smallint = Null, 
@Gem1 tinyint = Null, 
@Gem2 tinyint = Null, 
@Gem3 tinyint = Null, 
@Gem4 tinyint = Null,  
@Gem5 tinyint = Null, 
@Gem6 tinyint = Null, 
@Craftname varchar(20) = '',
@Count tinyint = Null,
@Qry varchar(8000) = ''

AS



/*
	VERBOTENE LAPISLINKUNGEN BLOCKEN
	Shaiya-SyFy 2013 - by [Dev]HoaX 
*/

SET NOCOUNT ON
DECLARE @Lapishack tinyint, @aktive tinyint


-- [!!!]Hier Skript aktivieren (1 = aktiv) 0 = deaktiviert
SET @aktive = 1
-- -------------------------------------------


SET @lapishack = 0

-- Erster Item Check
IF (@Quality = 0 AND @aktive = 1) 
BEGIN
	DECLARE @Type int
	SET @Type = (SELECT [Type] FROM PS_GameData.dbo.CharItems WHERE ItemUID = @ItemUID AND CharID = @CharID)
END

-- Wenn Lapis...
IF (@Type = 30)
BEGIN
	DECLARE @ItemID int, @LvItem tinyint, @LvLapis tinyint

	SET @ItemID = (SELECT ItemID FROM PS_GameData.dbo.CharItems WHERE ItemUID = @ItemUID AND CharID = @CharID)
	SET @LvItem = (SELECT ReqLevel FROM PS_GameDefs.dbo.Items WHERE ItemID = @ItemID)
	SET @LvLapis = (SELECT ReqInt FROM PS_GameDefs.dbo.Items WHERE ItemID = @ItemID)

	-- Wenn Lapis Link Level kleiner ist als des zu Linkenden Gegenstandes dann fehler (DC)
	IF (@LvLapis < @LvItem)
	BEGIN
		SET @lapishack = 1
	END
END

SET NOCOUNT OFF
-- Ende LAPIS LINK CHECK --






UPDATE CharItems
SET Bag=@Bag, Slot=@Slot, Quality=@Quality, Gem1=@Gem1, Gem2=@Gem2, Gem3=@Gem3, Gem4=@Gem4, Gem5=@Gem5, Gem6=@Gem6, 
[Count]=@Count, Craftname=@Craftname
WHERE CharID=@CharID AND ItemUID = @ItemUID

IF(@@ERROR = 0 AND @lapishack = 0)
BEGIN
	RETURN 1
END
ELSE
BEGIN	
	RETURN -1
END

--SET NOCOUNT OFF




