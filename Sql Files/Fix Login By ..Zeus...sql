USE [PS_UserData] 
GO 
/****** Objekt:  StoredProcedure [dbo].[usp_Try_GameLogin_Taiwan]    Skriptdatum: 04/23/2012 17:36:59 ******/ 
SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER OFF 
GO 

/****** Object:  Stored Procedure dbo.usp_Try_GameLogin_Taiwan    Script Date: 2008-6-7 18:34:05 ******/ 

/*================================================== 
@date    2007-12-04 
@brief    Login Proc( Taiwan ) 
==================================================*/ 

ALTER  Proc [dbo].[usp_Try_GameLogin_Taiwan] 

@UserID     varchar(18), 
@InPassword    varchar(32), 

@SessionID     bigint, 
@UserIP     varchar(15), 

-- ???? ??? ??, ???? ?? ?? 

@UserUID     int = 0, 
@LoginType     smallint = 1,  
@LoginTime     datetime = NULL 

AS 

SET NOCOUNT ON 

DECLARE  

@Leave         tinyint, 
@Status         smallint, 

@CompanyIP     varchar(15), 
@TempIP     varchar(15), 
@Check        int 

SET @Status =         -1 
SET @LoginTime =     GETDATE() 

-------------------------------------------------- 
SET @CompanyIP =     '61.107.81' 
SET @UserIP =        LTRIM( RTRIM(@UserIP) ) 
-------------------------------------------------- 
SET @Check = 0 
-------------------------------------------------- 

SELECT @UserUID=UserUID, @Status=Status, @Leave=Leave FROM Users_Master WHERE UserID = @UserID 

-- NotExist User OR Leave User 
IF( @UserUID = 0 OR @Leave = 1 ) 
BEGIN 
    SET @Status = -3 
END 
ELSE 
BEGIN 
    -- Check Password 
    EXEC dbo.sp_LoginSuccessCheck @UserID, @InPassword, @Check output 
    IF ( @@ERROR = 0 ) 
    BEGIN 
        IF( @Check <> 1 ) 
        BEGIN 
            SET @Status = -1 
        END 
    END 
    ELSE 
    BEGIN 
        SET @Status = -1 
    END 

    /* Old 
    SET @InEnPassword = master.dbo.fn_md5(@InPassword) 
    IF ( @InEnPassword <> @EnPassword ) 
    BEGIN 
        SET @Status = -1 
    END 
    */ 
END 

-- BlockUser Check 
IF( (@Status >= 2) AND (@Status <= 6) ) 
BEGIN 
    -- Get Block Limit Date AND Replace date text 
    DECLARE @BlockEndDate datetime 
    SELECT @BlockEndDate = BlockEndDate FROM Users_Block WHERE UserUID = @UserUID 
    IF ( @@ROWCOUNT <> 0 ) 
    BEGIN 
        -- Block Release 
        IF ( @BlockEndDate <= @LoginTime ) 
        BEGIN 
            SET @Status = 0 
            UPDATE Users_Master SET Status = @Status WHERE UserUID = @UserUID 
        END 
    END 
END 

-- Admin IP Check(2006-02-21) 
/* 
IF( @Status = 16 OR @Status = 32 OR @Status = 48 OR @Status = 64 OR @Status = 80 ) 
BEGIN 
    SET @TempIP = LEFT(@UserIP, 9) 
    IF( @TempIP <> @CompanyIP ) 
    BEGIN 
        SET @Status = -999 
    END 
END 
*/ 

-- Select  
SELECT @Status AS Status, @UserUID AS UserUID 

-- Log Insert 
IF( @Status = 0 OR @Status = 16 OR @Status = 32 OR @Status = 48 OR @Status = 64 OR @Status = 80 ) 
BEGIN 
    EXEC usp_Insert_LoginLog_E @SessionID=@SessionID, @UserUID=@UserUID, @UserIP=@UserIP, @LogType=0, @LogTime=@LoginTime, @LoginType=@LoginType 
END 
SET NOCOUNT OFF  