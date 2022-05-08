
Select *
into #char
From [PS_GameData].dbo.Chars 
Where CharName = '[A]dmin'  -- Insert Player name between the ' '

update a
Set PosX = 61.100
	,PosY = 1.892
	,Posz = 67.142
	,Map = 42
From [PS_GameData].dbo.Chars a
Where a.UserUID in (select UserUID from #char)

/*
select *
from [PS_GameData].dbo.Chars a
where a.UserUID in (select UserUID from #char)
*/

drop table #char