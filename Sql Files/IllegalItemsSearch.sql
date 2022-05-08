Select
ci.CharID
,c.UserUID
,c.CharName
,i.ItemName
,ci.Type
,ci.TypeID
,i.ReqLevel
,U_M.Status
,L1.ItemName as 'Lapis1'
,L2.ItemName as 'Lapis2'
,L3.ItemName as 'Lapis3'
,L4.ItemName as 'Lapis4'
,L5.ItemName as 'Lapis5'
,L6.ItemName as 'Lapis6'
,ci.Craftname
,ci.Count
,ci.Del
,c.LoginStatus
 From PS_GameData.dbo.CharItems ci
 inner join PS_GameDefs.dbo.Items i
 on ci.Type=i.Type and ci.TypeID = i.TypeID
 inner join PS_GameData.dbo.Chars c
 on c.CharID=ci.CharID
 inner join PS_UserData.dbo.Users_Master U_M
 on c.UserUID=U_M.UserUID
 		left join PS_GameDefs.dbo.Items L1 
		on L1.TypeID = ci.Gem1 and L1.Type = 30
		left join PS_GameDefs.dbo.Items L2
		on L2.TypeID = ci.Gem2 and L2.Type = 30
		left join PS_GameDefs.dbo.Items L3
		on L3.TypeID = ci.Gem3 and L3.Type = 30
		left join PS_GameDefs.dbo.Items L4
		on L4.TypeID = ci.Gem4 and L4.Type = 30
		left join PS_GameDefs.dbo.Items L5
		on L5.TypeID = ci.Gem5 and L5.Type = 30
		left join PS_GameDefs.dbo.Items L6
		on L6.TypeID = ci.Gem6 and L6.Type = 30
Where
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='7' or   -- Craft Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='14' or  -- Safe Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='21' or  -- Mystic Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='28' or  -- Wise Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='35' or  -- Shrewd Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='42' or  -- Fortune Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='49' or  -- Life Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='56' or  -- Vigor Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='63' or  -- Mental Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='82' or  -- Assault Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='96' or  -- Forbid Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='105' or -- Wit Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='111' or -- Dual Craft Lapis LV5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='112' or -- Dual Shrewd Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='113' or -- Dual Safe Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='114' or -- Dual Mystic Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='115' or -- Dual Wise Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='116' or -- Dual Fortune Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='118' or -- Helm Craft Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='119' or -- Helm Shrewd Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='120' or -- Helm Safe Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='121' or -- Helm Mystic Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='122' or -- Helm Wise Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='123' or -- Helm Fortune Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='124' or -- Shrewd Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='126' or -- Fortune Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='143' or -- Assault Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='177' or -- Craft Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='179' or -- Safe Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='189' or -- Mystic Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='233' or -- Purity Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='234' or -- Crash Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='235' or -- Extreme Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='236' or -- Empress Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='237' or -- Expert Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='238' or -- Beast Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='239' or -- Rapt Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='241' or -- Absorption Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='242' or -- Absorption Lapis Lv6
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='243' or -- Absorption Lapis Lv7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='244' or -- Spirit Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='245' or -- Ace Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='246' or -- True Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='247' or -- Force Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='248' or -- Magical Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='249' or -- Rapid Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='250' or -- Equal Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='252' or -- Blessed Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='253' or -- Strength Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='254'    -- Wise Lapis LV8
or 
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='7' or   -- Craft Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='14' or  -- Safe Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='21' or  -- Mystic Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='28' or  -- Wise Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='35' or  -- Shrewd Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='42' or  -- Fortune Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='49' or  -- Life Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='56' or  -- Vigor Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='63' or  -- Mental Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='82' or  -- Assault Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='96' or  -- Forbid Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='105' or -- Wit Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='111' or -- Dual Craft Lapis LV5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='112' or -- Dual Shrewd Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='113' or -- Dual Safe Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='114' or -- Dual Mystic Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='115' or -- Dual Wise Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='116' or -- Dual Fortune Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='118' or -- Helm Craft Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='119' or -- Helm Shrewd Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='120' or -- Helm Safe Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='121' or -- Helm Mystic Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='122' or -- Helm Wise Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='123' or -- Helm Fortune Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='124' or -- Shrewd Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='126' or -- Fortune Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='143' or -- Assault Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='177' or -- Craft Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='179' or -- Safe Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='189' or -- Mystic Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='233' or -- Purity Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='234' or -- Crash Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='235' or -- Extreme Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='236' or -- Empress Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='237' or -- Expert Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='238' or -- Beast Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='239' or -- Rapt Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='241' or -- Absorption Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='242' or -- Absorption Lapis Lv6
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='243' or -- Absorption Lapis Lv7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='244' or -- Spirit Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='245' or -- Ace Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='246' or -- True Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='247' or -- Force Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='248' or -- Magical Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='249' or -- Rapid Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='250' or -- Equal Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='252' or -- Blessed Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='253' or -- Strength Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='254'    -- Wise Lapis LV8
or
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='7' or   -- Craft Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='14' or  -- Safe Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='21' or  -- Mystic Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='28' or  -- Wise Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='35' or  -- Shrewd Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='42' or  -- Fortune Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='49' or  -- Life Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='56' or  -- Vigor Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='63' or  -- Mental Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='82' or  -- Assault Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='96' or  -- Forbid Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='105' or -- Wit Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='111' or -- Dual Craft Lapis LV5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='112' or -- Dual Shrewd Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='113' or -- Dual Safe Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='114' or -- Dual Mystic Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='115' or -- Dual Wise Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='116' or -- Dual Fortune Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='118' or -- Helm Craft Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='119' or -- Helm Shrewd Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='120' or -- Helm Safe Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='121' or -- Helm Mystic Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='122' or -- Helm Wise Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='123' or -- Helm Fortune Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='124' or -- Shrewd Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='126' or -- Fortune Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='143' or -- Assault Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='177' or -- Craft Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='179' or -- Safe Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='189' or -- Mystic Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='233' or -- Purity Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='234' or -- Crash Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='235' or -- Extreme Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='236' or -- Empress Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='237' or -- Expert Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='238' or -- Beast Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='239' or -- Rapt Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='241' or -- Absorption Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='242' or -- Absorption Lapis Lv6
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='243' or -- Absorption Lapis Lv7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='244' or -- Spirit Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='245' or -- Ace Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='246' or -- True Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='247' or -- Force Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='248' or -- Magical Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='249' or -- Rapid Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='250' or -- Equal Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='252' or -- Blessed Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='253' or -- Strength Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='254'    -- Wise Lapis LV8
or
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='7' or   -- Craft Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='14' or  -- Safe Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='21' or  -- Mystic Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='28' or  -- Wise Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='35' or  -- Shrewd Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='42' or  -- Fortune Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='49' or  -- Life Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='56' or  -- Vigor Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='63' or  -- Mental Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='82' or  -- Assault Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='96' or  -- Forbid Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='105' or -- Wit Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='111' or -- Dual Craft Lapis LV5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='112' or -- Dual Shrewd Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='113' or -- Dual Safe Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='114' or -- Dual Mystic Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='115' or -- Dual Wise Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='116' or -- Dual Fortune Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='118' or -- Helm Craft Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='119' or -- Helm Shrewd Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='120' or -- Helm Safe Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='121' or -- Helm Mystic Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='122' or -- Helm Wise Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='123' or -- Helm Fortune Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='124' or -- Shrewd Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='126' or -- Fortune Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='143' or -- Assault Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='177' or -- Craft Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='179' or -- Safe Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='189' or -- Mystic Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='233' or -- Purity Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='234' or -- Crash Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='235' or -- Extreme Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='236' or -- Empress Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='237' or -- Expert Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='238' or -- Beast Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='239' or -- Rapt Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='241' or -- Absorption Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='242' or -- Absorption Lapis Lv6
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='243' or -- Absorption Lapis Lv7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='244' or -- Spirit Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='245' or -- Ace Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='246' or -- True Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='247' or -- Force Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='248' or -- Magical Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='249' or -- Rapid Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='250' or -- Equal Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='252' or -- Blessed Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='253' or -- Strength Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='254'    -- Wise Lapis LV8
or
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='7' or   -- Craft Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='14' or  -- Safe Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='21' or  -- Mystic Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='28' or  -- Wise Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='35' or  -- Shrewd Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='42' or  -- Fortune Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='49' or  -- Life Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='56' or  -- Vigor Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='63' or  -- Mental Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='82' or  -- Assault Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='96' or  -- Forbid Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='105' or -- Wit Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='111' or -- Dual Craft Lapis LV5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='112' or -- Dual Shrewd Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='113' or -- Dual Safe Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='114' or -- Dual Mystic Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='115' or -- Dual Wise Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='116' or -- Dual Fortune Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='118' or -- Helm Craft Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='119' or -- Helm Shrewd Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='120' or -- Helm Safe Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='121' or -- Helm Mystic Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='122' or -- Helm Wise Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='123' or -- Helm Fortune Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='124' or -- Shrewd Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='126' or -- Fortune Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='143' or -- Assault Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='177' or -- Craft Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='179' or -- Safe Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='189' or -- Mystic Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='233' or -- Purity Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='234' or -- Crash Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='235' or -- Extreme Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='236' or -- Empress Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='237' or -- Expert Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='238' or -- Beast Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='239' or -- Rapt Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='241' or -- Absorption Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='242' or -- Absorption Lapis Lv6
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='243' or -- Absorption Lapis Lv7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='244' or -- Spirit Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='245' or -- Ace Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='246' or -- True Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='247' or -- Force Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='248' or -- Magical Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='249' or -- Rapid Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='250' or -- Equal Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='252' or -- Blessed Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='253' or -- Strength Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='254'    -- Wise Lapis LV8
or
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='7' or   -- Craft Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='14' or  -- Safe Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='21' or  -- Mystic Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='28' or  -- Wise Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='35' or  -- Shrewd Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='42' or  -- Fortune Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='49' or  -- Life Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='56' or  -- Vigor Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='63' or  -- Mental Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='82' or  -- Assault Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='96' or  -- Forbid Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='105' or -- Wit Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='111' or -- Dual Craft Lapis LV5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='112' or -- Dual Shrewd Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='113' or -- Dual Safe Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='114' or -- Dual Mystic Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='115' or -- Dual Wise Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='116' or -- Dual Fortune Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='118' or -- Helm Craft Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='119' or -- Helm Shrewd Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='120' or -- Helm Safe Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='121' or -- Helm Mystic Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='122' or -- Helm Wise Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='123' or -- Helm Fortune Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='124' or -- Shrewd Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='126' or -- Fortune Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='143' or -- Assault Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='177' or -- Craft Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='179' or -- Safe Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='189' or -- Mystic Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='233' or -- Purity Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='234' or -- Crash Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='235' or -- Extreme Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='236' or -- Empress Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='237' or -- Expert Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='238' or -- Beast Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='239' or -- Rapt Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='241' or -- Absorption Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='242' or -- Absorption Lapis Lv6
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='243' or -- Absorption Lapis Lv7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='244' or -- Spirit Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='245' or -- Ace Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='246' or -- True Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='247' or -- Force Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='248' or -- Magical Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='249' or -- Rapid Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='250' or -- Equal Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='252' or -- Blessed Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='253' or -- Strength Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='254'    -- Wise Lapis LV8

Select
ci.UserUID
,U_M.UserID
,i.ItemName
,ci.Type
,ci.TypeID
,i.ReqLevel
,U_M.Status
,L1.ItemName as 'Lapis1'
,L2.ItemName as 'Lapis2'
,L3.ItemName as 'Lapis3'
,L4.ItemName as 'Lapis4'
,L5.ItemName as 'Lapis5'
,L6.ItemName as 'Lapis6'
,ci.Craftname
,ci.Count
,ci.Del
,U_M.Leave
 From PS_GameData.dbo.UserStoredItems ci
 inner join PS_GameDefs.dbo.Items i
 on ci.Type=i.Type and ci.TypeID = i.TypeID
 inner join PS_UserData.dbo.Users_Master U_M
 on ci.UserUID=U_M.UserUID
 		left join PS_GameDefs.dbo.Items L1 
		on L1.TypeID = ci.Gem1 and L1.Type = 30
		left join PS_GameDefs.dbo.Items L2
		on L2.TypeID = ci.Gem2 and L2.Type = 30
		left join PS_GameDefs.dbo.Items L3
		on L3.TypeID = ci.Gem3 and L3.Type = 30
		left join PS_GameDefs.dbo.Items L4
		on L4.TypeID = ci.Gem4 and L4.Type = 30
		left join PS_GameDefs.dbo.Items L5
		on L5.TypeID = ci.Gem5 and L5.Type = 30
		left join PS_GameDefs.dbo.Items L6
		on L6.TypeID = ci.Gem6 and L6.Type = 30

Where
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='7' or   -- Craft Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='14' or  -- Safe Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='21' or  -- Mystic Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='28' or  -- Wise Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='35' or  -- Shrewd Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='42' or  -- Fortune Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='49' or  -- Life Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='56' or  -- Vigor Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='63' or  -- Mental Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='82' or  -- Assault Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='96' or  -- Forbid Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='105' or -- Wit Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='111' or -- Dual Craft Lapis LV5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='112' or -- Dual Shrewd Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='113' or -- Dual Safe Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='114' or -- Dual Mystic Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='115' or -- Dual Wise Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='116' or -- Dual Fortune Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='118' or -- Helm Craft Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='119' or -- Helm Shrewd Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='120' or -- Helm Safe Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='121' or -- Helm Mystic Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='122' or -- Helm Wise Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='123' or -- Helm Fortune Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='124' or -- Shrewd Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='126' or -- Fortune Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='143' or -- Assault Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='177' or -- Craft Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='179' or -- Safe Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='189' or -- Mystic Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='233' or -- Purity Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='234' or -- Crash Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='235' or -- Extreme Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='236' or -- Empress Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='237' or -- Expert Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='238' or -- Beast Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='239' or -- Rapt Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='241' or -- Absorption Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='242' or -- Absorption Lapis Lv6
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='243' or -- Absorption Lapis Lv7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='244' or -- Spirit Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='245' or -- Ace Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='246' or -- True Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='247' or -- Force Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='248' or -- Magical Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='249' or -- Rapid Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='250' or -- Equal Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='252' or -- Blessed Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='253' or -- Strength Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='254'    -- Wise Lapis LV8
or 
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='7' or   -- Craft Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='14' or  -- Safe Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='21' or  -- Mystic Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='28' or  -- Wise Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='35' or  -- Shrewd Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='42' or  -- Fortune Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='49' or  -- Life Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='56' or  -- Vigor Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='63' or  -- Mental Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='82' or  -- Assault Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='96' or  -- Forbid Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='105' or -- Wit Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='111' or -- Dual Craft Lapis LV5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='112' or -- Dual Shrewd Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='113' or -- Dual Safe Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='114' or -- Dual Mystic Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='115' or -- Dual Wise Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='116' or -- Dual Fortune Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='118' or -- Helm Craft Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='119' or -- Helm Shrewd Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='120' or -- Helm Safe Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='121' or -- Helm Mystic Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='122' or -- Helm Wise Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='123' or -- Helm Fortune Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='124' or -- Shrewd Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='126' or -- Fortune Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='143' or -- Assault Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='177' or -- Craft Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='179' or -- Safe Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='189' or -- Mystic Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='233' or -- Purity Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='234' or -- Crash Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='235' or -- Extreme Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='236' or -- Empress Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='237' or -- Expert Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='238' or -- Beast Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='239' or -- Rapt Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='241' or -- Absorption Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='242' or -- Absorption Lapis Lv6
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='243' or -- Absorption Lapis Lv7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='244' or -- Spirit Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='245' or -- Ace Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='246' or -- True Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='247' or -- Force Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='248' or -- Magical Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='249' or -- Rapid Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='250' or -- Equal Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='252' or -- Blessed Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='253' or -- Strength Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='254'    -- Wise Lapis LV8
or
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='7' or   -- Craft Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='14' or  -- Safe Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='21' or  -- Mystic Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='28' or  -- Wise Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='35' or  -- Shrewd Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='42' or  -- Fortune Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='49' or  -- Life Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='56' or  -- Vigor Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='63' or  -- Mental Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='82' or  -- Assault Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='96' or  -- Forbid Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='105' or -- Wit Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='111' or -- Dual Craft Lapis LV5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='112' or -- Dual Shrewd Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='113' or -- Dual Safe Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='114' or -- Dual Mystic Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='115' or -- Dual Wise Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='116' or -- Dual Fortune Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='118' or -- Helm Craft Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='119' or -- Helm Shrewd Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='120' or -- Helm Safe Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='121' or -- Helm Mystic Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='122' or -- Helm Wise Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='123' or -- Helm Fortune Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='124' or -- Shrewd Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='126' or -- Fortune Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='143' or -- Assault Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='177' or -- Craft Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='179' or -- Safe Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='189' or -- Mystic Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='233' or -- Purity Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='234' or -- Crash Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='235' or -- Extreme Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='236' or -- Empress Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='237' or -- Expert Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='238' or -- Beast Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='239' or -- Rapt Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='241' or -- Absorption Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='242' or -- Absorption Lapis Lv6
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='243' or -- Absorption Lapis Lv7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='244' or -- Spirit Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='245' or -- Ace Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='246' or -- True Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='247' or -- Force Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='248' or -- Magical Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='249' or -- Rapid Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='250' or -- Equal Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='252' or -- Blessed Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='253' or -- Strength Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='254'    -- Wise Lapis LV8
or
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='7' or   -- Craft Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='14' or  -- Safe Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='21' or  -- Mystic Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='28' or  -- Wise Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='35' or  -- Shrewd Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='42' or  -- Fortune Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='49' or  -- Life Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='56' or  -- Vigor Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='63' or  -- Mental Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='82' or  -- Assault Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='96' or  -- Forbid Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='105' or -- Wit Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='111' or -- Dual Craft Lapis LV5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='112' or -- Dual Shrewd Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='113' or -- Dual Safe Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='114' or -- Dual Mystic Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='115' or -- Dual Wise Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='116' or -- Dual Fortune Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='118' or -- Helm Craft Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='119' or -- Helm Shrewd Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='120' or -- Helm Safe Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='121' or -- Helm Mystic Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='122' or -- Helm Wise Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='123' or -- Helm Fortune Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='124' or -- Shrewd Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='126' or -- Fortune Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='143' or -- Assault Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='177' or -- Craft Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='179' or -- Safe Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='189' or -- Mystic Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='233' or -- Purity Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='234' or -- Crash Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='235' or -- Extreme Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='236' or -- Empress Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='237' or -- Expert Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='238' or -- Beast Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='239' or -- Rapt Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='241' or -- Absorption Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='242' or -- Absorption Lapis Lv6
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='243' or -- Absorption Lapis Lv7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='244' or -- Spirit Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='245' or -- Ace Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='246' or -- True Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='247' or -- Force Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='248' or -- Magical Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='249' or -- Rapid Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='250' or -- Equal Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='252' or -- Blessed Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='253' or -- Strength Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='254'    -- Wise Lapis LV8
or
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='7' or   -- Craft Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='14' or  -- Safe Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='21' or  -- Mystic Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='28' or  -- Wise Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='35' or  -- Shrewd Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='42' or  -- Fortune Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='49' or  -- Life Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='56' or  -- Vigor Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='63' or  -- Mental Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='82' or  -- Assault Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='96' or  -- Forbid Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='105' or -- Wit Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='111' or -- Dual Craft Lapis LV5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='112' or -- Dual Shrewd Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='113' or -- Dual Safe Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='114' or -- Dual Mystic Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='115' or -- Dual Wise Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='116' or -- Dual Fortune Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='118' or -- Helm Craft Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='119' or -- Helm Shrewd Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='120' or -- Helm Safe Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='121' or -- Helm Mystic Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='122' or -- Helm Wise Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='123' or -- Helm Fortune Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='124' or -- Shrewd Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='126' or -- Fortune Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='143' or -- Assault Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='177' or -- Craft Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='179' or -- Safe Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='189' or -- Mystic Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='233' or -- Purity Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='234' or -- Crash Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='235' or -- Extreme Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='236' or -- Empress Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='237' or -- Expert Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='238' or -- Beast Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='239' or -- Rapt Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='241' or -- Absorption Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='242' or -- Absorption Lapis Lv6
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='243' or -- Absorption Lapis Lv7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='244' or -- Spirit Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='245' or -- Ace Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='246' or -- True Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='247' or -- Force Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='248' or -- Magical Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='249' or -- Rapid Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='250' or -- Equal Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='252' or -- Blessed Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='253' or -- Strength Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='254'    -- Wise Lapis LV8
or
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='7' or   -- Craft Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='14' or  -- Safe Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='21' or  -- Mystic Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='28' or  -- Wise Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='35' or  -- Shrewd Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='42' or  -- Fortune Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='49' or  -- Life Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='56' or  -- Vigor Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='63' or  -- Mental Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='82' or  -- Assault Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='96' or  -- Forbid Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='105' or -- Wit Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='111' or -- Dual Craft Lapis LV5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='112' or -- Dual Shrewd Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='113' or -- Dual Safe Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='114' or -- Dual Mystic Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='115' or -- Dual Wise Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='116' or -- Dual Fortune Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='118' or -- Helm Craft Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='119' or -- Helm Shrewd Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='120' or -- Helm Safe Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='121' or -- Helm Mystic Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='122' or -- Helm Wise Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='123' or -- Helm Fortune Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='124' or -- Shrewd Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='126' or -- Fortune Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='143' or -- Assault Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='177' or -- Craft Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='179' or -- Safe Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='189' or -- Mystic Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='233' or -- Purity Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='234' or -- Crash Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='235' or -- Extreme Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='236' or -- Empress Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='237' or -- Expert Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='238' or -- Beast Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='239' or -- Rapt Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='241' or -- Absorption Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='242' or -- Absorption Lapis Lv6
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='243' or -- Absorption Lapis Lv7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='244' or -- Spirit Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='245' or -- Ace Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='246' or -- True Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='247' or -- Force Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='248' or -- Magical Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='249' or -- Rapid Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='250' or -- Equal Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='252' or -- Blessed Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='253' or -- Strength Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='254'    -- Wise Lapis LV8

Select
M.CharID
,c.UserUID
,c.CharName
,ci.MarketID
,i.ItemName
,ci.Type
,ci.TypeID
,i.ReqLevel
,U_M.Status
,L1.ItemName as 'Lapis1'
,L2.ItemName as 'Lapis2'
,L3.ItemName as 'Lapis3'
,L4.ItemName as 'Lapis4'
,L5.ItemName as 'Lapis5'
,L6.ItemName as 'Lapis6'
,ci.Craftname
,ci.Count
,M.Del
,c.LoginStatus
 From PS_GameData.dbo.MarketItems ci
 inner join PS_GameDefs.dbo.Items i
 on ci.Type=i.Type and ci.TypeID = i.TypeID
 inner join PS_GameData.dbo.Market M
 on ci.MarketID=M.MarketID
 inner join PS_GameData.dbo.Chars c
 on c.CharID=M.CharID
 inner join PS_UserData.dbo.Users_Master U_M
 on c.UserUID=U_M.UserUID
 		left join PS_GameDefs.dbo.Items L1 
		on L1.TypeID = ci.Gem1 and L1.Type = 30
		left join PS_GameDefs.dbo.Items L2
		on L2.TypeID = ci.Gem2 and L2.Type = 30
		left join PS_GameDefs.dbo.Items L3
		on L3.TypeID = ci.Gem3 and L3.Type = 30
		left join PS_GameDefs.dbo.Items L4
		on L4.TypeID = ci.Gem4 and L4.Type = 30
		left join PS_GameDefs.dbo.Items L5
		on L5.TypeID = ci.Gem5 and L5.Type = 30
		left join PS_GameDefs.dbo.Items L6
		on L6.TypeID = ci.Gem6 and L6.Type = 30

Where
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='7' or   -- Craft Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='14' or  -- Safe Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='21' or  -- Mystic Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='28' or  -- Wise Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='35' or  -- Shrewd Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='42' or  -- Fortune Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='49' or  -- Life Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='56' or  -- Vigor Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='63' or  -- Mental Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='82' or  -- Assault Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='96' or  -- Forbid Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='105' or -- Wit Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='111' or -- Dual Craft Lapis LV5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='112' or -- Dual Shrewd Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='113' or -- Dual Safe Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='114' or -- Dual Mystic Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='115' or -- Dual Wise Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='116' or -- Dual Fortune Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='118' or -- Helm Craft Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='119' or -- Helm Shrewd Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='120' or -- Helm Safe Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='121' or -- Helm Mystic Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='122' or -- Helm Wise Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='123' or -- Helm Fortune Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='124' or -- Shrewd Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='126' or -- Fortune Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='143' or -- Assault Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='177' or -- Craft Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='179' or -- Safe Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='189' or -- Mystic Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='233' or -- Purity Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='234' or -- Crash Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='235' or -- Extreme Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='236' or -- Empress Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='237' or -- Expert Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='238' or -- Beast Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='239' or -- Rapt Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='241' or -- Absorption Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='242' or -- Absorption Lapis Lv6
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='243' or -- Absorption Lapis Lv7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='244' or -- Spirit Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='245' or -- Ace Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='246' or -- True Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='247' or -- Force Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='248' or -- Magical Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='249' or -- Rapid Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='250' or -- Equal Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='252' or -- Blessed Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='253' or -- Strength Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='254'    -- Wise Lapis LV8
or 
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='7' or   -- Craft Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='14' or  -- Safe Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='21' or  -- Mystic Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='28' or  -- Wise Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='35' or  -- Shrewd Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='42' or  -- Fortune Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='49' or  -- Life Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='56' or  -- Vigor Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='63' or  -- Mental Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='82' or  -- Assault Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='96' or  -- Forbid Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='105' or -- Wit Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='111' or -- Dual Craft Lapis LV5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='112' or -- Dual Shrewd Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='113' or -- Dual Safe Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='114' or -- Dual Mystic Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='115' or -- Dual Wise Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='116' or -- Dual Fortune Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='118' or -- Helm Craft Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='119' or -- Helm Shrewd Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='120' or -- Helm Safe Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='121' or -- Helm Mystic Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='122' or -- Helm Wise Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='123' or -- Helm Fortune Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='124' or -- Shrewd Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='126' or -- Fortune Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='143' or -- Assault Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='177' or -- Craft Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='179' or -- Safe Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='189' or -- Mystic Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='233' or -- Purity Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='234' or -- Crash Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='235' or -- Extreme Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='236' or -- Empress Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='237' or -- Expert Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='238' or -- Beast Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='239' or -- Rapt Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='241' or -- Absorption Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='242' or -- Absorption Lapis Lv6
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='243' or -- Absorption Lapis Lv7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='244' or -- Spirit Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='245' or -- Ace Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='246' or -- True Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='247' or -- Force Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='248' or -- Magical Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='249' or -- Rapid Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='250' or -- Equal Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='252' or -- Blessed Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='253' or -- Strength Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='254'    -- Wise Lapis LV8
or
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='7' or   -- Craft Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='14' or  -- Safe Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='21' or  -- Mystic Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='28' or  -- Wise Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='35' or  -- Shrewd Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='42' or  -- Fortune Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='49' or  -- Life Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='56' or  -- Vigor Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='63' or  -- Mental Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='82' or  -- Assault Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='96' or  -- Forbid Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='105' or -- Wit Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='111' or -- Dual Craft Lapis LV5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='112' or -- Dual Shrewd Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='113' or -- Dual Safe Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='114' or -- Dual Mystic Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='115' or -- Dual Wise Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='116' or -- Dual Fortune Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='118' or -- Helm Craft Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='119' or -- Helm Shrewd Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='120' or -- Helm Safe Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='121' or -- Helm Mystic Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='122' or -- Helm Wise Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='123' or -- Helm Fortune Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='124' or -- Shrewd Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='126' or -- Fortune Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='143' or -- Assault Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='177' or -- Craft Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='179' or -- Safe Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='189' or -- Mystic Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='233' or -- Purity Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='234' or -- Crash Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='235' or -- Extreme Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='236' or -- Empress Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='237' or -- Expert Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='238' or -- Beast Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='239' or -- Rapt Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='241' or -- Absorption Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='242' or -- Absorption Lapis Lv6
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='243' or -- Absorption Lapis Lv7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='244' or -- Spirit Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='245' or -- Ace Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='246' or -- True Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='247' or -- Force Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='248' or -- Magical Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='249' or -- Rapid Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='250' or -- Equal Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='252' or -- Blessed Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='253' or -- Strength Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='254'    -- Wise Lapis LV8
or
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='7' or   -- Craft Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='14' or  -- Safe Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='21' or  -- Mystic Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='28' or  -- Wise Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='35' or  -- Shrewd Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='42' or  -- Fortune Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='49' or  -- Life Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='56' or  -- Vigor Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='63' or  -- Mental Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='82' or  -- Assault Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='96' or  -- Forbid Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='105' or -- Wit Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='111' or -- Dual Craft Lapis LV5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='112' or -- Dual Shrewd Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='113' or -- Dual Safe Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='114' or -- Dual Mystic Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='115' or -- Dual Wise Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='116' or -- Dual Fortune Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='118' or -- Helm Craft Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='119' or -- Helm Shrewd Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='120' or -- Helm Safe Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='121' or -- Helm Mystic Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='122' or -- Helm Wise Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='123' or -- Helm Fortune Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='124' or -- Shrewd Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='126' or -- Fortune Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='143' or -- Assault Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='177' or -- Craft Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='179' or -- Safe Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='189' or -- Mystic Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='233' or -- Purity Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='234' or -- Crash Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='235' or -- Extreme Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='236' or -- Empress Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='237' or -- Expert Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='238' or -- Beast Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='239' or -- Rapt Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='241' or -- Absorption Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='242' or -- Absorption Lapis Lv6
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='243' or -- Absorption Lapis Lv7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='244' or -- Spirit Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='245' or -- Ace Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='246' or -- True Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='247' or -- Force Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='248' or -- Magical Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='249' or -- Rapid Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='250' or -- Equal Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='252' or -- Blessed Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='253' or -- Strength Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='254'    -- Wise Lapis LV8
or
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='7' or   -- Craft Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='14' or  -- Safe Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='21' or  -- Mystic Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='28' or  -- Wise Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='35' or  -- Shrewd Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='42' or  -- Fortune Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='49' or  -- Life Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='56' or  -- Vigor Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='63' or  -- Mental Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='82' or  -- Assault Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='96' or  -- Forbid Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='105' or -- Wit Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='111' or -- Dual Craft Lapis LV5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='112' or -- Dual Shrewd Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='113' or -- Dual Safe Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='114' or -- Dual Mystic Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='115' or -- Dual Wise Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='116' or -- Dual Fortune Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='118' or -- Helm Craft Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='119' or -- Helm Shrewd Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='120' or -- Helm Safe Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='121' or -- Helm Mystic Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='122' or -- Helm Wise Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='123' or -- Helm Fortune Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='124' or -- Shrewd Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='126' or -- Fortune Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='143' or -- Assault Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='177' or -- Craft Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='179' or -- Safe Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='189' or -- Mystic Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='233' or -- Purity Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='234' or -- Crash Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='235' or -- Extreme Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='236' or -- Empress Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='237' or -- Expert Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='238' or -- Beast Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='239' or -- Rapt Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='241' or -- Absorption Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='242' or -- Absorption Lapis Lv6
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='243' or -- Absorption Lapis Lv7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='244' or -- Spirit Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='245' or -- Ace Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='246' or -- True Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='247' or -- Force Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='248' or -- Magical Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='249' or -- Rapid Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='250' or -- Equal Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='252' or -- Blessed Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='253' or -- Strength Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='254'    -- Wise Lapis LV8
or
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='7' or   -- Craft Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='14' or  -- Safe Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='21' or  -- Mystic Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='28' or  -- Wise Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='35' or  -- Shrewd Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='42' or  -- Fortune Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='49' or  -- Life Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='56' or  -- Vigor Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='63' or  -- Mental Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='82' or  -- Assault Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='96' or  -- Forbid Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='105' or -- Wit Lapis LV7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='111' or -- Dual Craft Lapis LV5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='112' or -- Dual Shrewd Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='113' or -- Dual Safe Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='114' or -- Dual Mystic Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='115' or -- Dual Wise Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='116' or -- Dual Fortune Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='118' or -- Helm Craft Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='119' or -- Helm Shrewd Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='120' or -- Helm Safe Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='121' or -- Helm Mystic Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='122' or -- Helm Wise Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='123' or -- Helm Fortune Lapis Lv2
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='124' or -- Shrewd Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='126' or -- Fortune Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='143' or -- Assault Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='177' or -- Craft Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='179' or -- Safe Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='189' or -- Mystic Lapis LV8
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='233' or -- Purity Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='234' or -- Crash Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='235' or -- Extreme Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='236' or -- Empress Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='237' or -- Expert Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='238' or -- Beast Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='239' or -- Rapt Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='241' or -- Absorption Lapis Lv5
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='242' or -- Absorption Lapis Lv6
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='243' or -- Absorption Lapis Lv7
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='244' or -- Spirit Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='245' or -- Ace Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='246' or -- True Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='247' or -- Force Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='248' or -- Magical Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='249' or -- Rapid Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='250' or -- Equal Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='252' or -- Blessed Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='253' or -- Strength Lapis
U_M.Status='0' and ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='254'    -- Wise Lapis LV8

Select
G.GuildName
,ci.GuildID
,i.ItemName
,ci.Type
,ci.TypeID
,i.ReqLevel
,L1.ItemName as 'Lapis1'
,L2.ItemName as 'Lapis2'
,L3.ItemName as 'Lapis3'
,L4.ItemName as 'Lapis4'
,L5.ItemName as 'Lapis5'
,L6.ItemName as 'Lapis6'
,ci.Craftname
,ci.Count
,ci.Del
 From PS_GameData.dbo.GuildStoredItems ci
 inner join PS_GameDefs.dbo.Items i
 on ci.Type=i.Type and ci.TypeID = i.TypeID
 inner join PS_GameData.dbo.Guilds G
 on ci.GuildID=G.GuildID
 		left join PS_GameDefs.dbo.Items L1 
		on L1.TypeID = ci.Gem1 and L1.Type = 30
		left join PS_GameDefs.dbo.Items L2
		on L2.TypeID = ci.Gem2 and L2.Type = 30
		left join PS_GameDefs.dbo.Items L3
		on L3.TypeID = ci.Gem3 and L3.Type = 30
		left join PS_GameDefs.dbo.Items L4
		on L4.TypeID = ci.Gem4 and L4.Type = 30
		left join PS_GameDefs.dbo.Items L5
		on L5.TypeID = ci.Gem5 and L5.Type = 30
		left join PS_GameDefs.dbo.Items L6
		on L6.TypeID = ci.Gem6 and L6.Type = 30
Where
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='7' or   -- Craft Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='14' or  -- Safe Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='21' or  -- Mystic Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='28' or  -- Wise Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='35' or  -- Shrewd Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='42' or  -- Fortune Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='49' or  -- Life Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='56' or  -- Vigor Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='63' or  -- Mental Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='82' or  -- Assault Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='96' or  -- Forbid Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='105' or -- Wit Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='111' or -- Dual Craft Lapis LV5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='112' or -- Dual Shrewd Lapis Lv5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='113' or -- Dual Safe Lapis Lv5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='114' or -- Dual Mystic Lapis Lv5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='115' or -- Dual Wise Lapis Lv5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='116' or -- Dual Fortune Lapis Lv5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='118' or -- Helm Craft Lapis Lv2
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='119' or -- Helm Shrewd Lapis Lv2
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='120' or -- Helm Safe Lapis Lv2
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='121' or -- Helm Mystic Lapis Lv2
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='122' or -- Helm Wise Lapis Lv2
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem1='123' or -- Helm Fortune Lapis Lv2
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='124' or -- Shrewd Lapis LV8
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='126' or -- Fortune Lapis LV8
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='143' or -- Assault Lapis LV8
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='177' or -- Craft Lapis LV8
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='179' or -- Safe Lapis LV8
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='189' or -- Mystic Lapis LV8
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='233' or -- Purity Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='234' or -- Crash Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='235' or -- Extreme Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='236' or -- Empress Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='237' or -- Expert Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='238' or -- Beast Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='239' or -- Rapt Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='241' or -- Absorption Lapis Lv5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='242' or -- Absorption Lapis Lv6
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='243' or -- Absorption Lapis Lv7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='244' or -- Spirit Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='245' or -- Ace Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='246' or -- True Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='247' or -- Force Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='248' or -- Magical Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='249' or -- Rapid Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='250' or -- Equal Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='252' or -- Blessed Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='253' or -- Strength Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem1='254'    -- Wise Lapis LV8
or 
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='7' or   -- Craft Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='14' or  -- Safe Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='21' or  -- Mystic Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='28' or  -- Wise Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='35' or  -- Shrewd Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='42' or  -- Fortune Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='49' or  -- Life Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='56' or  -- Vigor Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='63' or  -- Mental Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='82' or  -- Assault Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='96' or  -- Forbid Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='105' or -- Wit Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='111' or -- Dual Craft Lapis LV5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='112' or -- Dual Shrewd Lapis Lv5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='113' or -- Dual Safe Lapis Lv5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='114' or -- Dual Mystic Lapis Lv5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='115' or -- Dual Wise Lapis Lv5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='116' or -- Dual Fortune Lapis Lv5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='118' or -- Helm Craft Lapis Lv2
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='119' or -- Helm Shrewd Lapis Lv2
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='120' or -- Helm Safe Lapis Lv2
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='121' or -- Helm Mystic Lapis Lv2
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='122' or -- Helm Wise Lapis Lv2
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem2='123' or -- Helm Fortune Lapis Lv2
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='124' or -- Shrewd Lapis LV8
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='126' or -- Fortune Lapis LV8
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='143' or -- Assault Lapis LV8
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='177' or -- Craft Lapis LV8
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='179' or -- Safe Lapis LV8
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='189' or -- Mystic Lapis LV8
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='233' or -- Purity Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='234' or -- Crash Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='235' or -- Extreme Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='236' or -- Empress Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='237' or -- Expert Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='238' or -- Beast Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='239' or -- Rapt Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='241' or -- Absorption Lapis Lv5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='242' or -- Absorption Lapis Lv6
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='243' or -- Absorption Lapis Lv7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='244' or -- Spirit Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='245' or -- Ace Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='246' or -- True Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='247' or -- Force Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='248' or -- Magical Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='249' or -- Rapid Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='250' or -- Equal Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='252' or -- Blessed Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='253' or -- Strength Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem2='254'    -- Wise Lapis LV8
or
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='7' or   -- Craft Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='14' or  -- Safe Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='21' or  -- Mystic Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='28' or  -- Wise Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='35' or  -- Shrewd Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='42' or  -- Fortune Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='49' or  -- Life Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='56' or  -- Vigor Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='63' or  -- Mental Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='82' or  -- Assault Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='96' or  -- Forbid Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='105' or -- Wit Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='111' or -- Dual Craft Lapis LV5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='112' or -- Dual Shrewd Lapis Lv5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='113' or -- Dual Safe Lapis Lv5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='114' or -- Dual Mystic Lapis Lv5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='115' or -- Dual Wise Lapis Lv5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='116' or -- Dual Fortune Lapis Lv5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='118' or -- Helm Craft Lapis Lv2
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='119' or -- Helm Shrewd Lapis Lv2
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='120' or -- Helm Safe Lapis Lv2
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='121' or -- Helm Mystic Lapis Lv2
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='122' or -- Helm Wise Lapis Lv2
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem3='123' or -- Helm Fortune Lapis Lv2
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='124' or -- Shrewd Lapis LV8
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='126' or -- Fortune Lapis LV8
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='143' or -- Assault Lapis LV8
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='177' or -- Craft Lapis LV8
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='179' or -- Safe Lapis LV8
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='189' or -- Mystic Lapis LV8
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='233' or -- Purity Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='234' or -- Crash Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='235' or -- Extreme Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='236' or -- Empress Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='237' or -- Expert Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='238' or -- Beast Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='239' or -- Rapt Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='241' or -- Absorption Lapis Lv5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='242' or -- Absorption Lapis Lv6
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='243' or -- Absorption Lapis Lv7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='244' or -- Spirit Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='245' or -- Ace Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='246' or -- True Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='247' or -- Force Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='248' or -- Magical Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='249' or -- Rapid Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='250' or -- Equal Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='252' or -- Blessed Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='253' or -- Strength Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem3='254'    -- Wise Lapis LV8
or
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='7' or   -- Craft Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='14' or  -- Safe Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='21' or  -- Mystic Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='28' or  -- Wise Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='35' or  -- Shrewd Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='42' or  -- Fortune Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='49' or  -- Life Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='56' or  -- Vigor Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='63' or  -- Mental Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='82' or  -- Assault Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='96' or  -- Forbid Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='105' or -- Wit Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='111' or -- Dual Craft Lapis LV5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='112' or -- Dual Shrewd Lapis Lv5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='113' or -- Dual Safe Lapis Lv5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='114' or -- Dual Mystic Lapis Lv5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='115' or -- Dual Wise Lapis Lv5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='116' or -- Dual Fortune Lapis Lv5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='118' or -- Helm Craft Lapis Lv2
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='119' or -- Helm Shrewd Lapis Lv2
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='120' or -- Helm Safe Lapis Lv2
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='121' or -- Helm Mystic Lapis Lv2
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='122' or -- Helm Wise Lapis Lv2
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem4='123' or -- Helm Fortune Lapis Lv2
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='124' or -- Shrewd Lapis LV8
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='126' or -- Fortune Lapis LV8
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='143' or -- Assault Lapis LV8
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='177' or -- Craft Lapis LV8
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='179' or -- Safe Lapis LV8
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='189' or -- Mystic Lapis LV8
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='233' or -- Purity Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='234' or -- Crash Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='235' or -- Extreme Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='236' or -- Empress Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='237' or -- Expert Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='238' or -- Beast Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='239' or -- Rapt Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='241' or -- Absorption Lapis Lv5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='242' or -- Absorption Lapis Lv6
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='243' or -- Absorption Lapis Lv7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='244' or -- Spirit Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='245' or -- Ace Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='246' or -- True Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='247' or -- Force Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='248' or -- Magical Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='249' or -- Rapid Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='250' or -- Equal Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='252' or -- Blessed Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='253' or -- Strength Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem4='254'    -- Wise Lapis LV8
or
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='7' or   -- Craft Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='14' or  -- Safe Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='21' or  -- Mystic Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='28' or  -- Wise Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='35' or  -- Shrewd Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='42' or  -- Fortune Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='49' or  -- Life Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='56' or  -- Vigor Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='63' or  -- Mental Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='82' or  -- Assault Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='96' or  -- Forbid Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='105' or -- Wit Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='111' or -- Dual Craft Lapis LV5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='112' or -- Dual Shrewd Lapis Lv5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='113' or -- Dual Safe Lapis Lv5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='114' or -- Dual Mystic Lapis Lv5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='115' or -- Dual Wise Lapis Lv5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='116' or -- Dual Fortune Lapis Lv5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='118' or -- Helm Craft Lapis Lv2
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='119' or -- Helm Shrewd Lapis Lv2
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='120' or -- Helm Safe Lapis Lv2
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='121' or -- Helm Mystic Lapis Lv2
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='122' or -- Helm Wise Lapis Lv2
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem5='123' or -- Helm Fortune Lapis Lv2
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='124' or -- Shrewd Lapis LV8
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='126' or -- Fortune Lapis LV8
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='143' or -- Assault Lapis LV8
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='177' or -- Craft Lapis LV8
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='179' or -- Safe Lapis LV8
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='189' or -- Mystic Lapis LV8
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='233' or -- Purity Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='234' or -- Crash Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='235' or -- Extreme Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='236' or -- Empress Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='237' or -- Expert Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='238' or -- Beast Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='239' or -- Rapt Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='241' or -- Absorption Lapis Lv5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='242' or -- Absorption Lapis Lv6
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='243' or -- Absorption Lapis Lv7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='244' or -- Spirit Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='245' or -- Ace Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='246' or -- True Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='247' or -- Force Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='248' or -- Magical Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='249' or -- Rapid Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='250' or -- Equal Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='252' or -- Blessed Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='253' or -- Strength Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem5='254'    -- Wise Lapis LV8
or
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='7' or   -- Craft Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='14' or  -- Safe Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='21' or  -- Mystic Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='28' or  -- Wise Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='35' or  -- Shrewd Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='42' or  -- Fortune Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='49' or  -- Life Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='56' or  -- Vigor Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='63' or  -- Mental Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='82' or  -- Assault Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='96' or  -- Forbid Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='105' or -- Wit Lapis LV7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='111' or -- Dual Craft Lapis LV5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='112' or -- Dual Shrewd Lapis Lv5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='113' or -- Dual Safe Lapis Lv5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='114' or -- Dual Mystic Lapis Lv5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='115' or -- Dual Wise Lapis Lv5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='116' or -- Dual Fortune Lapis Lv5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='118' or -- Helm Craft Lapis Lv2
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='119' or -- Helm Shrewd Lapis Lv2
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='120' or -- Helm Safe Lapis Lv2
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='121' or -- Helm Mystic Lapis Lv2
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='122' or -- Helm Wise Lapis Lv2
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 31 and ci.Gem6='123' or -- Helm Fortune Lapis Lv2
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='124' or -- Shrewd Lapis LV8
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='126' or -- Fortune Lapis LV8
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='143' or -- Assault Lapis LV8
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='177' or -- Craft Lapis LV8
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='179' or -- Safe Lapis LV8
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='189' or -- Mystic Lapis LV8
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='233' or -- Purity Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='234' or -- Crash Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='235' or -- Extreme Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='236' or -- Empress Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='237' or -- Expert Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='238' or -- Beast Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='239' or -- Rapt Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='241' or -- Absorption Lapis Lv5
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='242' or -- Absorption Lapis Lv6
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='243' or -- Absorption Lapis Lv7
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='244' or -- Spirit Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='245' or -- Ace Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='246' or -- True Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='247' or -- Force Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='248' or -- Magical Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='249' or -- Rapid Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='250' or -- Equal Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='252' or -- Blessed Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='253' or -- Strength Lapis
ci.Type!='24' and ci.Type!='39' and i.ReqLevel < 61 and ci.Gem6='254'    -- Wise Lapis LV8