declare @charname varchar(18), @CharID int


-- hier charnamen eingeben:
SET @charname = 'PaRaNoID'

SET @CharID = (SELECT CharID FROM PS_GameData.dbo.Chars WHERE Charname = @charname)
select useruid,charid,chattype,targetname[Geflüstert zu:],chatdata,mapid,chattime from PS_ChatLog.dbo.chatlog where charid=@CharID order by chattime asc