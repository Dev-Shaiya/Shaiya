DECLARE @ItemID int

SET @ItemID = '';/* Edit this to contain the ItemID of the Item you wish to remove */

IF (@ItemID != NULL)
BEGIN
DELETE FROM PS_GameData.dbo.CharItems WHERE ItemID = @ItemID;
DELETE FROM PS_GameData.dbo.UserStoredItems WHERE ItemID = @ItemID;
DELETE FROM PS_GameData.dbo.GuildStoredItems WHERE ItemID = @ItemID;
END
ELSE
BEGIN
PRINT 'Please provide an ItemID';
END