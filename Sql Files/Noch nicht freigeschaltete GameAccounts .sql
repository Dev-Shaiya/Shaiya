/* Game Accounts die noch nicht freigeschaltet wurden) */


SELECT JoinDate,UserID,UserID[Forum ID],UserUID,Status,CoM,leave,UserIp,Point FROM PS_UserData.dbo.Users_Master WHERE UseQueue = 1 ORDER BY JoinDate ASC