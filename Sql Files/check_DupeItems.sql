USE PS_GameData
SELECT ItemUID, CharID, Craftname, Count 

FROM dbo.CharItems 
WHERE Exists (
SELECT ItemUID FROM dbo.Charitems dub WHERE dbo.Charitems.ItemUID = dub.ItemUID and dbo.Charitems.CharID <> dub.CharID )
ORDER BY CharId;

----Warenlager--Items--Überprüfen----

USE PS_GameData
SELECT ItemUID, UserUID, Craftname, Count 
FROM dbo.UserStoredItems 
WHERE Exists (
SELECT ItemUID FROM dbo.UserStoredItems dub WHERE dbo.UserStoredItems.ItemUID = dub.ItemUID and dbo.UserStoredItems.UserUID <> dub.UserUID )
ORDER BY UserUID;

----Auctionshaus--überprüfen----

USE PS_GameData
SELECT ItemUID, MarketID, Craftname, Count 
FROM dbo.MarketItems 
WHERE Exists (
SELECT ItemUID FROM dbo.MarketItems dub WHERE dbo.MarketItems.ItemUID = dub.ItemUID and dbo.MarketItems.MarketID <> dub.MarketID )
ORDER BY MarketID;
			
----Gildenlager--überprüfen----			

USE PS_GameData
SELECT ItemUID, GuildID, Craftname, Count 
FROM dbo.GuildStoredItems 
WHERE Exists (
SELECT ItemUID FROM dbo.GuildStoredItems dub WHERE dbo.GuildStoredItems.ItemUID = dub.ItemUID and dbo.GuildStoredItems.GuildID <> dub.GuildID )
ORDER BY GuildID;