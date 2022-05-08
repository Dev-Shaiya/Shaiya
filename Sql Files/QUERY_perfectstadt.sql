USE [PS_GameData]
GO
/****** Object:  Trigger [dbo].[Perfect_Orange_Stats]    Script Date: 07/31/2013 15:21:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ==================================================
--	    Developed by Euphoria Dev Team
-- ==================================================

CREATE TRIGGER [dbo].[Perfect_Orange_Stats]
   ON  [dbo].[CharQuests]
   AFTER INSERT
AS 
BEGIN

	SET NOCOUNT ON;

    DECLARE @QuestID INT = (SELECT QuestID FROM inserted)
    
    IF @QuestID = 2222 -- The Perfect Orange Stats QuestID
    BEGIN
		
		DECLARE @CharID INT = (SELECT CharID FROM inserted)
		DECLARE	@UserUID INT = (SELECT UserUID FROM Chars WHERE CharID = @CharID)
		
		DECLARE	@ItemType TINYINT,
				@RecRuneItemID INT
		
		DECLARE @StatRecRuneItemID TABLE (StatRecRuneItemID INT) -- Str, Dex, Rec, Int, Wis, Luc
		DECLARE @VitalRecRuneItemID TABLE (VitalRecRuneItemID INT) -- HP, MP, SP
		DECLARE @GearTypes TABLE (GearTypes TINYINT) -- Gears, Capes and Shields
		DECLARE @WeaponTypes TABLE (WeaponTypes TINYINT) -- Weapons and Accessories
		
		-- The above tables were created in order to ensure a fast access to the types
		-- of items that are to be recreated and the rune used to recreate them.
		
		
		SET @ItemType = (SELECT Type FROM UserStoredItems WHERE UserUID = @UserUID AND Slot = 0)
		SET @RecRuneItemID = (SELECT ItemID FROM UserStoredItems WHERE UserUID = @UserUID AND Slot = 1)
		
		INSERT INTO @StatRecRuneItemID VALUES (100230),(100231),(100232),(100233),(100234),(100235)
		-- ItemIDs of stat recreation runes (Str, Dex, Rec, Int, Wis, Luc, HP, MP, SP)
		
		INSERT INTO @VitalRecRuneItemID VALUES (100236),(100237),(100238)
		-- ItemIDs of vital stat recreation runes (HP, MP, SP)
		
		INSERT INTO @GearTypes VALUES (16),(17),(18),(19),(20),(21),(24),(31),(32),(33),(34),(35),(36),(39)
		-- Types of gears, capes. Here you can include anything you want to be rerollable with both stat and vital stat recreation runes.
		
		INSERT INTO @WeaponTypes VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(22),(23),(40)
		-- Types of weapons, accessories. Here you can include anything you want to be rerollable only with stat recreation runes.
		
		IF ((@ItemType IN (SELECT GearTypes FROM @GearTypes)) AND (@RecRuneItemID IN (SELECT StatRecRuneItemID FROM @StatRecRuneItemID) OR @RecRuneItemID IN (SELECT VitalRecRuneItemID FROM @VitalRecRuneItemID))) OR (@ItemType IN (SELECT WeaponTypes FROM @WeaponTypes) AND (@RecRuneItemID IN (SELECT StatRecRuneItemID FROM @StatRecRuneItemID)))
		-- The above IF statement checks if the item to be recreated and the recreation rune are compatible with each other.
		-- As you can see, it works only if it's an item with the Type from @GearTypes(gears, capes) and all recreation runes,
		-- or if it's an item with the Type from @WeaponTypes(weapons, accessories) and stat recreation runes only.
		BEGIN
			
			DECLARE @Craftname VARCHAR(20),
					@Str TINYINT,
					@Dex TINYINT,
					@Rec TINYINT,
					@Int TINYINT,
					@Wis TINYINT,
					@Luc TINYINT,
					@HP TINYINT,
					@MP TINYINT,
					@SP TINYINT,
					@Enchant TINYINT,
								
					@ItemID INT,
					@ReqWis TINYINT,
					@Server TINYINT,
					@OJs TINYINT,
					@NewOJs TINYINT,
					@MaxedOJs TINYINT,
					@LowestOJType VARCHAR(3),
					@LowestOJ TINYINT
			
			SET @Craftname = (SELECT Craftname FROM UserStoredItems WHERE UserUID = @UserUID AND Slot = 0)
			SET @Str = CAST(SUBSTRING(@Craftname,1,2) AS TINYINT)
			SET @Dex = CAST(SUBSTRING(@Craftname,3,2) AS TINYINT)
			SET @Rec = CAST(SUBSTRING(@Craftname,5,2) AS TINYINT)
			SET @Int = CAST(SUBSTRING(@Craftname,7,2) AS TINYINT)
			SET @Wis = CAST(SUBSTRING(@Craftname,9,2) AS TINYINT)
			SET @Luc = CAST(SUBSTRING(@Craftname,11,2) AS TINYINT)
			SET @HP = CAST(SUBSTRING(@Craftname,13,2) AS TINYINT)
			SET @MP = CAST(SUBSTRING(@Craftname,15,2) AS TINYINT)
			SET @SP = CAST(SUBSTRING(@Craftname,17,2) AS TINYINT)
			SET @Enchant = CAST(SUBSTRING(@Craftname,19,2) AS TINYINT)
						
			SET @ItemID = (SELECT ItemID FROM UserStoredItems WHERE UserUID = @UserUID AND Slot = 0)
			SET @ReqWis = (SELECT ReqWis FROM PS_GameDefs.dbo.Items WHERE ItemID = @ItemID)
			-- Get the maximum possible OJ on the item
			SET @Server = (SELECT Server FROM PS_GameDefs.dbo.Items WHERE ItemID = @ItemID)
			-- Get the maximum amount of OJs on the item
			
			DECLARE @AllOJs TABLE (StatName VARCHAR(3), Stats TINYINT)
			INSERT INTO @AllOJs VALUES ('Str',@Str),('Dex',@Dex),('Rec',@Rec),('Int',@Int),('Wis',@Wis),('Luc',@Luc),('HP',@HP),('MP',@MP),('SP',@SP)
			-- Declaring the @AllOJs table and storing the OJs of the item before the recreation process.
			
			SET @OJs = (SELECT COUNT(*) FROM @AllOJs WHERE Stats > 0) -- Getting the amount of OJs
			SET @MaxedOJs = (SELECT COUNT(*) FROM @AllOJs WHERE Stats = @ReqWis) -- Getting the amount of MaxedOJs
			
			IF @OJs <= @Server AND @MaxedOJs < @Server
			-- Checking if there's still room for another perfect OJ.
			BEGIN
			
			DECLARE @NewStr TINYINT,
					@NewDex TINYINT,
					@NewRec TINYINT,
					@NewInt TINYINT,
					@NewWis TINYINT,
					@NewLuc TINYINT,
					@NewHP TINYINT,
					@NewMP TINYINT,
					@NewSP TINYINT,
					@NewEnchant TINYINT
					
					-- Declaring the new variables, where the new orange stats will be stored
					
			SET @NewStr = @Str
			SET @NewDex = @Dex
			SET @NewRec = @Rec
			SET @NewInt = @Int
			SET @NewWis = @Wis
			SET @NewLuc = @Luc
			SET @NewHP = @HP
			SET @NewMP = @MP
			SET @NewSP = @SP
			SET @NewEnchant = @Enchant
				
				-- Assigning the old OJs to the new OJ variables
				
				IF @RecRuneItemID = 100230 -- STR Rec Rune
				BEGIN				
					SET @NewStr = @ReqWis
				END
				
				ELSE IF @RecRuneItemID = 100231 -- DEX Rec Rune
				BEGIN				
					SET @NewDex = @ReqWis
				END
				
				ELSE IF @RecRuneItemID = 100232 -- REC Rec Rune
				BEGIN				
					SET @NewRec = @ReqWis
				END
				
				ELSE IF @RecRuneItemID = 100233 -- INT Rec Rune
				BEGIN				
					SET @NewInt = @ReqWis
				END
				
				ELSE IF @RecRuneItemID = 100234 -- WIS Rec Rune
				BEGIN				
					SET @NewWis = @ReqWis
				END
				
				ELSE IF @RecRuneItemID = 100235 -- LUC Rec Rune
				BEGIN				
					SET @NewLuc = @ReqWis
				END
				
				ELSE IF @RecRuneItemID = 100236 -- HP Rec Rune
				BEGIN				
					SET @NewHP = @ReqWis
				END
				
				ELSE IF @RecRuneItemID = 100237 -- MP Rec Rune
				BEGIN				
					SET @NewMP = @ReqWis
				END
				
				ELSE IF @RecRuneItemID = 100238 -- SP Rec Rune
				BEGIN				
					SET @NewSP = @ReqWis
				END
								
			END 
			
			ELSE GOTO FAIL
						
		END -- End of the case where both items are good and compatible with each other
		
		ELSE GOTO FAIL
		-- In the case where the item and the rec rune aren't compatible with each other,
		-- the process will end. No modifications to the item will occur.
		
		CHECKOJAMOUNT:
		-- This label checks if after the reroll there aren't more
		-- types of orange stats than the item can normally have.
		
			DECLARE @NewAllOJs TABLE (StatName VARCHAR(3), Stats TINYINT)
			INSERT INTO @NewAllOJs VALUES ('Str',@NewStr),('Dex',@NewDex),('Rec',@NewRec),('Int',@NewInt),('Wis',@NewWis),('Luc',@NewLuc),('HP',@NewHP),('MP',@NewMP),('SP',@NewSP)
			-- Declaring the @NewAllOJs table and assigning the new OJs to it.
			
			SET @NewOJs = (SELECT COUNT(*) FROM @NewAllOJs WHERE Stats > 0)
			-- Getting the amount of OJs on the item after the reroll.		
		
			IF @NewOJs > @Server
			-- If the amount is bigger than what the item can normally have,
			-- the lowest stat, that is bigger than zero of course, is going to be removed.
			-- e.g. If the item allows max 4 orange stats, max stat being 40,
			-- it has 40 STR, 40 DEX, 40 REC, 39 LUC, and we want to use a HP Rec Rune on it.
			-- After the reroll process it will have 4000 HP, 40 STR, 40 DEX, 40 REC and 0 LUC.
			BEGIN				
				SET @LowestOJType = (SELECT StatName FROM @NewAllOJs WHERE Stats = (SELECT MIN(Stats) FROM @NewAllOJs WHERE Stats > 0))
				-- Getting the lowest stat.
								
				IF @LowestOJType = 'Str'
					SET @NewStr = 0
				ELSE IF @LowestOJType = 'Dex'
					SET @NewDex = 0
				ELSE IF @LowestOJType = 'Rec'
					SET @NewRec = 0
				ELSE IF @LowestOJType = 'Int'
					SET @NewInt = 0
				ELSE IF @LowestOJType = 'Wis'
					SET @NewWis = 0
				ELSE IF @LowestOJType = 'Luc'
					SET @NewLuc = 0
				ELSE IF @LowestOJType = 'HP'
					SET @NewHP = 0
				ELSE IF @LowestOJType = 'MP'
					SET @NewMP = 0
				ELSE IF @LowestOJType = 'SP'
					SET @NewSP = 0
				-- Whichever the lowest stat is, it is changed to 0.
			END
		
		CRAFTNAMEUPDATE:
		-- This label is responsible for applying the new orange stat to the item.
		
			DECLARE @FinalStr VARCHAR(2),
					@FinalDex VARCHAR(2),
					@FinalRec VARCHAR(2),
					@FinalInt VARCHAR(2),
					@FinalWis VARCHAR(2),
					@FinalLuc VARCHAR(2),
					@FinalHP VARCHAR(2),
					@FinalMP VARCHAR(2),
					@FinalSP VARCHAR(2),
					@FinalEnchant VARCHAR(2)
					-- As Craftname is a varchar(20), we need to create it out of varchars.
			
			SET @FinalStr = CAST(@NewStr AS VARCHAR(2))
			SET @FinalDex = CAST(@NewDex AS VARCHAR(2))
			SET @FinalRec = CAST(@NewRec AS VARCHAR(2))
			SET @FinalInt = CAST(@NewInt AS VARCHAR(2))
			SET @FinalWis = CAST(@NewWis AS VARCHAR(2))
			SET @FinalLuc = CAST(@NewLuc AS VARCHAR(2))
			SET @FinalHP = CAST(@NewHP AS VARCHAR(2))
			SET @FinalMP = CAST(@NewMP AS VARCHAR(2))
			SET @FinalSP = CAST(@NewSP AS VARCHAR(2))
			SET @FinalEnchant = CAST(@NewEnchant AS VARCHAR(2))
			-- Assigning the new OJs to the respective varchar(2) variables.
			
			IF LEN(@FinalStr) < 2
			BEGIN
				SET @FinalStr = '0' + @FinalStr
			END
			
			IF LEN(@FinalDex) < 2
			BEGIN
				SET @FinalDex = '0' + @FinalDex
			END
			
			IF LEN(@FinalRec) < 2
			BEGIN
				SET @FinalRec = '0' + @FinalRec
			END
			
			IF LEN(@FinalInt) < 2
			BEGIN
				SET @FinalInt = '0' + @FinalInt
			END
			
			IF LEN(@FinalWis) < 2
			BEGIN
				SET @FinalWis = '0' + @FinalWis
			END
			
			IF LEN(@FinalLuc) < 2
			BEGIN
				SET @FinalLuc = '0' + @FinalLuc
			END
			
			IF LEN(@FinalHP) < 2
			BEGIN
				SET @FinalHP = '0' + @FinalHP
			END
			
			IF LEN(@FinalMP) < 2
			BEGIN
				SET @FinalMP = '0' + @FinalMP
			END
			
			IF LEN(@FinalSP) < 2
			BEGIN
				SET @FinalSP = '0' + @FinalSP
			END
			
			IF LEN(@FinalEnchant) < 2
			BEGIN
				SET @FinalEnchant = '0' + @FinalEnchant
			END
			-- The above 10 blocks are here to ensure that each orange stat varchar(2) is actually 2 digit long.
		
			UPDATE UserStoredItems
			SET Craftname = @FinalStr + @FinalDex + @FinalRec + @FinalInt + @FinalWis + @FinalLuc + @FinalHP + @FinalMP + @FinalSP + @FinalEnchant
			WHERE UserUID = @UserUID AND Slot = 0
			-- The above block updates the Craftname of the item.
			
		DELETERUNE:
		-- This label removes the recreation rune.
		-- As you can see, it removes just one recreation rune, not the whole stack.
		
			UPDATE UserStoredItems
			SET Count -= 1
			WHERE UserUID = @UserUID AND Slot = 1
			-- Decrementing the amount of recreation runes
			
			DELETE FROM UserStoredItems
			WHERE UserUID = @UserUID AND Slot = 1 AND Count = 0
			-- If after decrementing the amount of recreation runes the amount is 0, delete the row from the database. 
		
    END
    
    FAIL:
    -- This label is called from above a couple of times,
    -- in case the recreation requirements aren't met.		
	DELETEQUEST:
	-- This label deletes the recreation quest.
		DELETE FROM CharQuests
		WHERE CharID = @CharID AND QuestID = @QuestID

END