DECLARE @UserID varchar(18)

/* Game Account nach anmeldung auf Webpage freischalten) */


-- Hier die UserID eingeben:
SET @UserID = ''



UPDATE PS_UserData.dbo.Users_Master SET UseQueue = 0 WHERE UserID = @UserID