USE [PS_GameData]
GO
/****** Object:  Trigger [dbo].[ChangeMap]    Script Date: 04/28/2013 14:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create trigger [dbo].[ChangeMap]
on [PS_GameData].[dbo].[Chars]
after update
as
IF (UPDATE (Map))
begin
declare @oldmap int
declare @newmap int
set @oldmap = (select map from deleted)
set @newmap = (select map from inserted)

if @newmap = 1
begin
update PS_gamedata.dbo.chars
set map=35,
posx=591.963,
posy=26.940,
posz=270.155
end

else if @newmap = 2
begin
update ps_gamedata.dbo.chars
set map=35,
posx=591.963,
posy=26.940,
posz=270.155
end

else if @newmap = 19
begin
update ps_gamedata.dbo.chars
set map=35,
posx=591.963,
posy=26.940,
posz=270.155
end

else if @newmap = 20
begin
update ps_gamedata.dbo.chars
set map=35,
posx=591.963,
posy=26.940,
posz=270.155
end

else if @newmap = 36
begin
update ps_gamedata.dbo.chars
set map=35,
posx=591.963,
posy=26.940,
posz=270.155
end

end
