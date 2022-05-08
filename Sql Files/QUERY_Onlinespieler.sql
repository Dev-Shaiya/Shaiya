-- Wer ist Online?  -- Ausführen ^ klicken!

DECLARE 
@OnlinePlayer as varchar(5), 
@wort varchar(5),
@light as varchar(5),
@dark as varchar(5)

SET NOCOUNT ON

SELECT UserUID,UserID,CharID,CharName[Charakter Name],family,Level,Map,k2[tode],k1[Kills] FROM PS_GameData.dbo.Chars WHERE LoginStatus = 1 

ORDER BY Map DESC


SET @OnlinePlayer = (SELECT COUNT(LoginStatus) FROM PS_GameData.dbo.Chars WHERE LoginStatus = 1) 
SET @light = (SELECT COUNT(LoginStatus) FROM PS_GameData.dbo.Chars WHERE LoginStatus = 1 AND Family <= 1) 
SET @dark = (SELECT COUNT(LoginStatus) FROM PS_GameData.dbo.Chars WHERE LoginStatus = 1 AND Family >= 2) 

IF (@OnlinePlayer = '0') SET @wort = 'kein'
IF (@OnlinePlayer = '1') SET @wort = 'ist'
ELSE SET @wort = 'sind'

PRINT ''
PRINT 'Es ' + @wort + ' insgesammt ' +  @OnlinePlayer + ' Spieler online.'
PRINT ''
PRINT 'Online Light: ' + @light
PRINT 'Online Dark: ' + @dark


