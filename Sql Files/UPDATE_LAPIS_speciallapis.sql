SELECT ItemID,ItemName,ReqInt[benutzbar ab Level] FROM dbo.Items 
WHERE 
ItemName like '%Lapis%' 
AND ItemName not like '%stück%'  
AND ItemName not like '%kiste%'  
AND ItemName not like '%essenz%'  
AND ItemName not like '%GM-%'  
AND ItemName not like '%tasche%'  
AND ItemName not like '%box%'  
AND ItemName not like '%balsam%'  
AND Type = 30
Order by ItemName ASC
