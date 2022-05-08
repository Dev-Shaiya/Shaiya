DECLARE 
@UserID varchar(18), @CoM TINYINT

-- -------------------------------------------------------------
-- Gives an User Access to Connect to GameServer on Maintenance
-- (c)2012 - 2015 Shaiya SyFy, by [Dev]HoaX
-- -------------------------------------------------------------


-- ------ CONFIG HERE ------
-- User Name:
SET @UserID = 'alpayomer2'

-- CoM: (0 = Normal User; 1 = User connect/GM's always ; 2 = User or GM connect)
SET @CoM = 1
-- -------------------------


-- Maintenance Mode: - Change there --> PS_GameDefs.dbo.ServerSettings
-- ----------------------------------------------------------------------------
-- 0 = Off / Normal server
-- 1 = On, Everyone allowed to connect (Shows Maintenance mode on Webpage only)

-- 2 = On, User can only connect when CoM is setted to 1, GM's always allowed
-- 3 = On, User/GM can only connect when CoM is setted to 2

-- 4 = On, Only GM's allowed to connect
-- 5 = On, Only Admins allowed to connect
-- ----------------------------------------------------------------------------







UPDATE PS_UserData.dbo.Users_Master 
SET CoM = @CoM
WHERE UserID = @UserID
