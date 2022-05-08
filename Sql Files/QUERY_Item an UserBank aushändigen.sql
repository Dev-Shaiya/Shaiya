DECLARE 
@UserID varchar(18),
@UserUID bigint, 
@Slot tinyint, 
@ItemID int, 
@ItemCount tinyint, 
@ProductCode varchar(20), 
@OrderNumber int, 
@BuyDate datetime,
@empty smallint

-- ****** SHAIYA SyFy / SHAIYA ALLIANCE / SHAIYA RELOADED  ****** --
-- Item zu User Bank 
-- By [Dev]HoaX (c)2011 - 2015
-- ************************************************************** --


-- -------- CONFIG HERE -----------------
-- UserID:
SET @UserID = 'Gesetz'

-- ItemID:
SET @ItemID = 100082

-- Item Anzahl:
SET @ItemCount = 1
-- --------------------------------------
-- Produkt Beschreibung (20 Zeichen max.)
SET @ProductCode = 'OP_Hammer'
-- --------------------------------------
-- Wird noch umgeschrieben...
SET @OrderNumber = 1
-- --------------------------------------
SET @BuyDate = GETDATE()
SET @UserUID = (SELECT UserUID FROM PS_UserData.dbo.Users_Master WHERE UserID = @UserID)


SET @empty = -1
SET @Slot = 0

WHILE (@Slot <= 239)
BEGIN 

	SET @empty = (SELECT COUNT(Slot) FROM PS_Billing.dbo.Users_Product WHERE UserUID = @UserUID AND Slot = @Slot)
	
	IF (@empty <= 0) BREAK
	ELSE 	
		SET @Slot = @Slot+1
END

PRINT 'Verwendeter Slot:'
PRINT @Slot
PRINT ''
IF @Slot = 239 PRINT 'ACHTUNG!!! ALLE 240 SLOTS in der Bank belegt!!!'

INSERT INTO PS_Billing.dbo.Users_Product 
	(UserUID, Slot, ItemID, ItemCount, ProductCode, OrderNumber, BuyDate)
VALUES (@UserUID, @Slot, @ItemID, @ItemCount, @ProductCode, @OrderNumber, @BuyDate)
IF @@ROWCOUNT = 1 PRINT 'Erfolgreich durchgeführt! '