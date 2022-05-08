--Löscht gedubte und die Originale---


---Character-Items-Löschen---
USE PS_GameData
DELETE FROM dbo.CharItems
WHERE EXISTS (SELECT ItemUID FROM dbo.Charitems dub WHERE dbo.Charitems.ItemUID = dub.ItemUID and dbo.Charitems.CharID <> dub.CharID);

---Warenlager-Items-Löschen---
USE PS_GameData
DELETE FROM dbo.UserStoredItems
WHERE EXISTS (SELECT ItemUID FROM dbo.UserStoredItems dub WHERE dbo.UserStoredItems.ItemUID = dub.ItemUID and dbo.UserStoredItems.UserUID <> dub.UserUID);

---Auctionshaus-Items-Löschen---
USE PS_GameData
DELETE FROM dbo.MarketItems
WHERE EXISTS (SELECT ItemUID FROM dbo.MarketItems dub WHERE dbo.MarketItems.ItemUID = dub.ItemUID and dbo.MarketItems.MarketID <> dub.MarketID);

---Gildenlager-Items-Löschen---
USE PS_GameData
DELETE FROM dbo.GuildStoredItems
WHERE EXISTS (SELECT ItemUID FROM dbo.GuildStoredItems dub WHERE dbo.GuildStoredItems.ItemUID = dub.ItemUID and dbo.GuildStoredItems.GuildID <> dub.GuildID);