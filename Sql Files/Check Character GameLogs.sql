Select 
	c.CharName
	,cl.*
From 
	[PS_GameLog].[dbo].[ActionLog] cl
	inner join PS_GameData.dbo.Chars c
		on cl.CharID = c.CharID
		Where 1=1
	and c.CharName = 'Skyla' -- Put Character name between ''
--	and ChatTime like '%okt 9%'
