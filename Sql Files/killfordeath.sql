USE [PS_GameData]
GO
/****** Object:  Trigger [dbo].[KillForDeath]    Script Date: 04/28/2013 14:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
                                                                                            
create trigger [dbo].[KillForDeath]
on [PS_GameData].[dbo].[Chars]
after update
as
IF (UPDATE (k2))
begin
declare @oldk2 int
declare @newk2 int
set @oldk2 = (select k2 from deleted)
set @newk2 = (select k2 from inserted)
if ((convert (varchar (5),@newk2) % 90)) = 0
begin
update PS_GameData.dbo.Chars
set k1=k1+1
end
end
