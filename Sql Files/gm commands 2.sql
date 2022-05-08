 -- Range Ban Script --
DECLARE @IPexist int, @o1 tinyint, @o2 tinyint, @ChkIP varchar(7)
    set @o1 = PARSENAME(@UserIP, 4)
    set @o2 = PARSENAME(@UserIP, 3)
    SET @ChkIP = CONVERT(varchar(3),@o1)+'.'+ CONVERT(varchar(3),@o2)
    SET @IPexist = (SELECT COUNT(IP) FROM PS_UserData.dbo.Users_BlockIpRange WHERE IP like @ChkIP+'%')
    IF (@IPexist <> 0) SET @Status = -5 
    -- -----------------------------------