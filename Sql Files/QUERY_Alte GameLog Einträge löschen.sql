DECLARE @row int, @count as varchar(11)


SET @count = (SELECT COUNT(row) FROM PS_GameLog.dbo.ActionLog) 
SET @row = (SELECT TOP 1 row FROM PS_GameLog.dbo.ActionLog ORDER BY row DESC) 


--   Die letzten '100' Reihen behalten
SET @row = @row - 100
-- -----------------------------------


DELETE FROM PS_GameLog.dbo.ActionLog WHERE row <= @row
print 'Es sind noch insgesammt ' + @count + ' Zeilen vorhanden'