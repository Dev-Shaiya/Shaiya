USE [PS_GameData]
DECLARE
@User varchar(12),
@Char varchar(30),
@Slot tinyint,
@Country tinyint,
@Family tinyint,
@Del tinyint
--vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
--This is the only thing you need to change, just put the toon name in here and press F5
SET @Char = 'CharacterName'--- Toon Name 
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

SELECT @User=um.UserID, @Country=umg.Country, @Family=c.family, @Del=c.del
FROM PS_UserData.dbo.Users_Master AS um
INNER JOIN PS_GameData.dbo.UserMaxGrow AS umg ON umg.UserUID = um.UserUID
INNER JOIN PS_GameData.dbo.Chars AS c ON c.UserUID = um.UserUID
WHERE c.CharName = @Char

IF(@@ROWCOUNT = 0)
BEGIN
	PRINT 'Character "' +@Char+ '" does not exist, or does not have a related account.'
	RETURN
END
ELSE IF(@@ROWCOUNT > 1)
BEGIN
	PRINT 'There are multiple characters named "' +@Char+ '".'
	RETURN
END
ELSE IF(@Del != 1)
BEGIN
	PRINT 'Character "' +@Char+ '" is not dead.'
	RETURN
END

-- Slot Selection
SELECT @Slot=ISNULL(MIN(Slots.Slot),-1) FROM
	(SELECT 0 AS Slot UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) AS Slots
LEFT JOIN
	(SELECT c.Slot
	FROM PS_UserData.dbo.Users_Master AS um
	INNER JOIN PS_GameData.dbo.Chars AS c ON c.UserUID = um.UserUID
	WHERE um.UserID = @User
	AND c.Del = 0) AS Chars ON Chars.Slot = Slots.Slot
WHERE Chars.Slot IS NULL

IF(@Slot = -1)
BEGIN
	PRINT 'Account "' + @User + '" does not have any open slots.'
	RETURN
END

IF(@Slot IN(0,1,2,3,4))
BEGIN
	IF(@Country=0 AND @Family IN (0,1))
	BEGIN
		IF(@Family IN (0,1))
		BEGIN
			UPDATE PS_GameData.dbo.Chars
			SET DEL = 0
				,Map = 42
				,PosX = 47
				,PosY = 2
				,PosZ = 52
				,RemainTime = 0
				,Slot = @Slot
			WHERE UserID = @User
			AND CharName = @Char
			AND Del = 1
			IF(@@ROWCOUNT = 1)
			BEGIN
				PRINT 'Character "' +@Char+ '" resurrected!'
				RETURN
			END
		END
	END
	ELSE IF(@Country=1)
	BEGIN
		IF(@Family IN (2,3))
		BEGIN
			UPDATE PS_GameData.dbo.Chars
			SET DEL = 0
				,Map = 42
				,PosX = 47
				,PosY = 2
				,PosZ = 52
				,RemainTime = 0
				,Slot = @Slot
			WHERE UserID = @User
			AND CharName = @Char
			AND Del = 1
			IF(@@ROWCOUNT = 1)
			BEGIN
				PRINT 'Character "' +@Char+ '" resurrected!'
				RETURN
			END
		END
	END
	ELSE
	BEGIN
		PRINT 'Invalid country.'
	END
END