UPDATE PS_GameDefs.dbo.Items



-- Anzahl der max. m�glichen Items zum Stapel
SET [count]= 255
-- ItemID des Items
WHERE ItemID='30145'



SELECT ItemID,ItemName, [count] FROM PS_GameDefs.dbo.Items