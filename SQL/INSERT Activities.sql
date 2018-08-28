INSERT INTO [dbo].[ListItems]  ([ListID],[UserID],[Text],[Priority])
	SELECT 3, 1, Name, Priority
		FROM Activities
		WHERE UserName = 'Devin'
