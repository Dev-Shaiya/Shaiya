
-- Skript zum ändern der Droprate bei Mobs

DECLARE @DropRate int, @MobID smallint, Grade smallint




-- -- KONFIGURATION --------------------------------------
-- Droprate in Prozent
SET @DropRate = 

-- Bei welchem Mob soll die %-Rate angewendet werden?
SET @MobID = 

-- Bei welcher Dropgruppe (Grade) soll die %-Rate angewendet werden?
SET @Grade = 
-- -------------------------------------------------------







SELECT 'Alte Konfiguration'
SELECT * FROM PS_GameDefs.dbo.MobItems WHERE MobID = @MobID AND Grade = @Grade

SET NOCOUNT ON
UPDATE PS_GameDefs.dbo.MobItems SET DropRate = @DropRate WHERE MobID = @MobID AND Grade = @Grade
SET NOCOUNT OFF


SELECT 'Neue Änderung:'
SELECT * FROM PS_GameDefs.dbo.MobItems WHERE MobID = @MobID AND Grade = @Grade