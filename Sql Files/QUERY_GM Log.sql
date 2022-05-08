-- GM Log - GM/ADMIN/GS etc Tätigkeiten sortiert nach Zeit.
SELECT [UserID],[UserUID],[CharID],[CharName],[CharLevel],[MapID],[PosX],[PosY],
[ActionTime],[ActionType],[Value1],[Value2],[Value3],[Value4],[Value5],[Value6],
[Value7],[Value8],[Value9],[Value10],[Text1],[Text2],[Text3],[Text4] 

FROM dbo.ActionLog 
WHERE 
CharName like '%]%' or CharName like '%ADM%'
--ActionType = 180
ORDER by ActionTime DESC

