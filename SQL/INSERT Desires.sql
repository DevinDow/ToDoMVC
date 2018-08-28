INSERT INTO [dbo].[ListItems]  ([ListID],[UserID],[Text],[Priority])
	SELECT 6, 1, Name, Priority
		FROM Desires
		WHERE UserName = 'Devin'
