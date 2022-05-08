use [PS_UserData]
go
create view dbo.[DEV]AriezTable
    with schemabinding
as
select
    UserUID,
    UserID
from
    dbo.Users_Master