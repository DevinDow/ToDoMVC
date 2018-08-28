INSERT INTO [dbo].[ListItems]  ([ListID],[UserID],[Text],[Priority])
	SELECT 4, 1, Name, Priority
		FROM Priorities
		WHERE UserName = 'Devin'
