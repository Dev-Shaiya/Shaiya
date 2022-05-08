SELECT 

-- Fehlgeschlagene Logins



-- Anzahl der anzuzeigenden Reihen. 
TOP 100
-- ---------------------------------


* FROM PS_GameLog.dbo.FailedLoginsLog
ORDER BY Row DESC