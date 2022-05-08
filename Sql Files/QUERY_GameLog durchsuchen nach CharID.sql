-- Hier eine kleine Hilfe einfache Abfragen selbst zu schreiben :-)

-- --------------------------
-- Beschreibung der Befehle:
-- SELECT = Auswählen | * = alle Spalten | FROM = von bzw aus folgender Tabelle | PS_GameLog = Database | dbo.ActionLog = Actionlog tabelle
-- --------------------------

-- Zusammen heißt die Befehlszeile nichts anderes als:
-- Wähle alle Zeilen aus Tabelle ActionLog aus wo CharakterID gleich den wert x hat (UND wo ActionType den wert y hat)



-- Jetzt die Befehle:

SELECT top 20 * FROM PS_GameLog.dbo.ActionLog 

where actiontype=180
-- WHERE = Wo "CharID" gleich den Wert  x  hat
-- WHERE CharID = 9

-- Bei nicht zahlen muss der text in  ' ' geschrieben werden. z.B. ...AND CharName = 'HoaX'...
-- AND CharName = ''
-- UND WO ActionType gleich den wert x hat.... ( einfach die -- weglassen )
-- AND ActionType=



-- ORDER = Sortieren | by = nach | ActionTime = (in dem fall nach Zeit) | 
-- | DESC bei höchsten bzw aktuellsten wert an der spitze oder ASC für ältesten bzw niedrigsten wert von oben sortieren
ORDER by Actiontime DESC


-- Einfach mal ausprobieren! Viel Spaß, - HoaX

-- sieht bei dir so einfach aus hi hi
-- also eine neue abfrage starten und die befehle so eingeben ? 

-- HoaX: Die befehle stehen schon da, du musst nur noch z.B. die werte eingeben wie z.B. die CharID. Alles was in blau und schwarz steht sind befehle.
-- Alles was grün ist mit zwei -- davor sind kommentare. Du kannst vorgeschriebene befehle nutzen indem du ganz einfach die -- davor entfernst.