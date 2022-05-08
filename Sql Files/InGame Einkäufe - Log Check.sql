/****** Skript zum anzeigen von gekauften Items ******/


SELECT *  FROM [PS_GameData].[dbo].[PointLog] order by [UseDate] desc
SELECT SUM(UsePoint)[Ausgegebene AP] FROM [PS_GameData].[dbo].[PointLog] 

-- Hier UserUID eingeben: 
WHERE UserUID = 1085