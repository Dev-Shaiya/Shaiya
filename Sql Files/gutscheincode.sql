set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[Codes]
ON [dbo].[ChatLog]
FOR INSERT
AS

-- ********* SHAIYA SyFy ********* --
-- GutscheinCodes v.1.0
-- By [Dev]HoaX (c)2011 - 2015
-- *********************************** --

DECLARE
@ChatData varchar(128),
@ChatTime datetime, 
@UserUID int,
@CharID int,
@IP varchar(15),
@CodeID int, 
@Code varchar(30), 
@AP int, 
@ItemID int, 
@BankItemID int, 
@ItemCount tinyint, 
@erstellt_am datetime,
@Gültig_bis datetime


SET NOCOUNT ON

SET @ChatData = (SELECT ChatData FROM inserted)

IF (@ChatData like 'SSYFY-%')
BEGIN
    SET @Code = substring(@ChatData,7,20)
    SET @UserUID = ( SELECT UserUID FROM INSERTED )

    IF EXISTS (SELECT * FROM PS_GameDefs.dbo.GutscheinCodes WHERE Code = @Code AND Aktiv = 1)
		BEGIN
			SET @Ap = ( SELECT AP FROM PS_GameDefs.dbo.GutscheinCodes WHERE Code = @Code )
			SET @CodeID = ( SELECT CodeID FROM PS_GameDefs.dbo.GutscheinCodes WHERE Code = @Code )
			SET @Code = ( SELECT Code FROM PS_GameDefs.dbo.GutscheinCodes WHERE Code = @Code )
			SET @BankItemID = ( SELECT BankItemID FROM PS_GameDefs.dbo.GutscheinCodes WHERE Code = @Code )
			SET @ItemCount = ( SELECT ItemCount FROM PS_GameDefs.dbo.GutscheinCodes WHERE Code = @Code )
			SET @erstellt_am =( SELECT erstellt_am FROM PS_GameDefs.dbo.GutscheinCodes WHERE Code = @Code )
			SET @Gültig_bis = ( SELECT Gültig_bis FROM PS_GameDefs.dbo.GutscheinCodes WHERE Code = @Code )
	  
			-- Wenn Code noch nicht abgelaufen ist...
			IF ( GETDATE() <= @Gültig_bis )
				BEGIN
					-- AP Gutschreiben
					UPDATE PS_UserData.dbo.Users_Master SET point = point + @Ap WHERE UserUID = @UserUID

					-- Log einfügen
					INSERT INTO PS_GameLog.dbo.BenutzteCodesLog 
						(UserUID, CodeID, Code, AP, BankItemID, ItemCount, erstellt_am, benutzt_am)
					VALUES
						(@UserUID, @CodeID, @Code, @AP, @BankItemID, @ItemCount, @erstellt_am, GETDATE())

					-- Löschen des Benutzten Codes aus der Liste
					DELETE FROM PS_GameDefs.dbo.GutscheinCodes WHERE Code = @Code
				END

			-- Abgelaufenen Code löschen
			IF (GETDATE() > @Gültig_bis) DELETE FROM PS_GameDefs.dbo.GutscheinCodes WHERE Code = @Code

		END
END