USE [PS_GameData]
GO
/****** Object:  StoredProcedure [dbo].[usp_Create_Char_R]    Script Date: 05/19/2012 18:11:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

/****** 개체: 저장 프로시저 dbo.usp_Create_Char_R    스크립트 날짜: 2006-05-30 오후 12:53:23 ******/

ALTER  Proc [dbo].[usp_Create_Char_R]

@ServerID tinyint,
@UserID varchar(12),
@UserUID int,
@CharName varchar(50) ,

@Slot Tinyint,
@Family Tinyint,
@Grow Tinyint,
@Hair Tinyint,
@Face Tinyint,
@Size Tinyint,
@Job Tinyint,
@Sex Tinyint,
@Level Smallint,
@Statpoint Smallint,
@Skillpoint Smallint,
@Str Smallint,
@Dex Smallint,
@Rec Smallint,
@Int Smallint,
@Luc Smallint,
@Wis Smallint,
@Hp Smallint,
@Mp Smallint,
@Sp Smallint,
@Map Smallint,
@Dir Smallint,
@Exp Int,
@Money Int,
@Posx Real,
@Posy Real,
@Posz Real,
@Hg Smallint,
@Vg Smallint,
@Cg Tinyint,
@Og Tinyint,
@Ig Tinyint,


/* 여기까지 인자값 주어져야 함 */

/* SP 내부 참조용 변수 */

@CharID int = 0,
@NameCnt tinyint = 0

AS

SET NOCOUNT ON

DECLARE @Ret int
IF @Grow = 0 -- Easy mode
BEGIN
SET @Grow = 2
SET @Level = 15
SET @StatPoint = 89
SET @SkillPoint = 56
SET @money = 200000

IF @Job = 0
BEGIN
SET @Str = 28
END
ELSE IF @Job = 1
BEGIN
SET @rec = 26
END
ELSE IF @Job = 2
BEGIN
SET @dex = 33
END
ELSE IF @Job = 3
BEGIN
SET @luc = 27
END
ELSE IF @job = 4
BEGIN 
SET @int = 29
END
ELSE IF @job = 5
BEGIN
SET @wis = 28
END

END

ELSE IF @Grow = 1 -- normal mode
BEGIN
SET @Grow = 2
SET @Level = 30
SET @StatPoint = 203
SET @SkillPoint = 116
SET @money = 200000

IF @Job = 0
BEGIN
SET @Str = 43
END
ELSE IF @Job = 1
BEGIN
SET @rec = 41
END
ELSE IF @Job = 2
BEGIN
SET @dex = 48
END
ELSE IF @Job = 3
BEGIN
SET @luc = 42
END
ELSE IF @job = 4
BEGIN 
SET @int = 44
END
ELSE IF @job = 5
BEGIN
SET @wis = 43
END

END

ELSE IF @Grow = 2 -- Hard mode
BEGIN
SET @Grow = 3
SET @Level = 1
SET @StatPoint = 0
SET @SkillPoint = 3
SET @money = 200000

IF @Job = 0
BEGIN
SET @Str = 14
END
ELSE IF @Job = 1
BEGIN
SET @rec = 12
END
ELSE IF @Job = 2
BEGIN
SET @dex = 19
END
ELSE IF @Job = 3
BEGIN
SET @luc = 13
END
ELSE IF @job = 4
BEGIN 
SET @int = 15
END
ELSE IF @job = 5
BEGIN
SET @wis = 14
END


END


ELSE IF @Grow = 3 -- Ultimate mode
BEGIN
SET @Grow = 3
SET @Level = 1
SET @StatPoint = 0
SET @SkillPoint = 3
SET @money = 200000

IF @Job = 0
BEGIN
SET @Str = 14
END
ELSE IF @Job = 1
BEGIN
SET @rec = 12
END
ELSE IF @Job = 2
BEGIN
SET @dex = 19
END
ELSE IF @Job = 3
BEGIN
SET @luc = 13
END
ELSE IF @job = 4
BEGIN 
SET @int = 15
END
ELSE IF @job = 5
BEGIN
SET @wis = 14
END
END
SET @CharName = LTRIM(RTRIM(@CharName))
SET @Ret = 0



SET @NameCnt = (SELECT ISNULL(COUNT(*),0) FROM Chars WHERE CharName=@CharName AND Del=0)

IF(@NameCnt <> 0)
BEGIN
	RETURN -2
END
ELSE
BEGIN
	IF EXISTS ( SELECT CharID FROM Chars WHERE CharName=@CharName AND Del = 1 AND [Level] >10 AND DeleteDate > DATEADD(dd, -7, GETDATE()) )
	BEGIN
		RETURN -2
	END

	BEGIN TRANSACTION

	INSERT INTO Chars(ServerID,UserID, UserUID, CharName, Slot, Family, Grow, 
	Hair, Face, [Size], Job, Sex, [Level], StatPoint, SkillPoint, 
	[Str], Dex, Rec, [Int], Luc, Wis, HP, MP, SP, Map, Dir, [Exp], [Money], 
	PosX, PosY, Posz, Hg, Vg, Cg, Og, Ig, RenameCnt, RemainTime)

	VALUES(@ServerID,@UserID, @UserUID, @CharName, @Slot, @Family, @Grow, 
	@Hair, @Face, @Size, @Job, @Sex, @Level, @StatPoint, @SkillPoint, 
	@Str, @Dex, @Rec, @Int, @Luc, @Wis, @HP, @MP, @SP, @Map, @Dir, @Exp, @Money, 
	@PosX, @PosY, @Posz, @Hg, @Vg, @Cg, @Og, @Ig, 0, 0)

	IF( @@ERROR=0 )
	BEGIN
		COMMIT TRANSACTION
	END
	ELSE
	BEGIN
		ROLLBACK TRANSACTION
		RETURN -1
	END

	SET @CharID = IDENT_CURRENT('Chars')
END

RETURN @CharID

SET NOCOUNT OFF