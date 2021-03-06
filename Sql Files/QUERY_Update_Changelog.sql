DECLARE @datetime datetime,@Change varchar(800),@made_by varchar(18),@Show_on_Updater bit,@Show_on_Webpage bit,@Show_only_Admin bit

-- Speichert immer das aktuelle datum und zeit ggf. ändern
SET @datetime = GETDATE()

-- Hier neue Änderungen eintragen:
-- -------------------------------------------------
-- Geändert von...
SET @made_by = '[Dev]HoaX'

-- Hier die änderung eintragen:
SET @Change = 'FP coins können jetzt auch gestapelt ans NPC verkauft werden. Die AP gibt es nach reloggen gutgeschrieben.'

-- Im Updater als Update anzeigen lassen 
-- (0 = nein; 1 = Ja)
SET @Show_on_Updater = 1

-- Auf der Webpage als Update anzeigen lassen
SET @Show_on_Webpage = 1
-- -------------------------------------------------

/*
Ä - &Auml;
ä - &auml;
Ö - &Ouml;
ö - &ouml;
Ü - &Uuml;
ü - &uuml;
ß - &szlig;
*/

SET @Change = replace(@Change,'ä','&auml;');
SET @Change = replace(@Change,'ö','&ouml;');
SET @Change = replace(@Change,'ü','&uuml;');
SET @Change = replace(@Change,'ß','&szlig;');

-- Überall ausblenden und nur für Admins Anzeigen lassen (Noch nicht verfügbar)
SET @Show_only_Admin = 0


INSERT INTO [PS_GameLog].[dbo].[Changelog]
([datetime],[Change],[made_by],[Show_on_Updater],[Show_on_Webpage],[Show_only_Admin])
     VALUES
(@datetime,@Change,@made_by,@Show_on_Updater,@Show_on_Webpage,@Show_only_Admin)