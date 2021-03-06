USE [PS_GameData]
GO
/****** Object:  Trigger [dbo].[PointsForKills]    Script Date: 04/28/2013 14:44:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

                                                     
                                             

create trigger [dbo].[PointsForKills]
on [PS_GameData].[dbo].[Chars]
after update
as
IF (UPDATE (k1))
begin
declare @oldk1 int
declare @newk1 int
set @oldk1 = (select k1 from deleted)
set @newk1 = (select k1 from inserted)
if (convert ( varchar (5),@newk1) like '%000')
	begin
	update PS_userdata.dbo.users_master
	set point=point+5 
	from PS_userdata.dbo.users_master m,inserted i where m.userUID=i.useruid
        end
end