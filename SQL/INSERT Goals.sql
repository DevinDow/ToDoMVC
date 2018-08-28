INSERT INTO [dbo].[ListItems]  ([ListID],[UserID],[Text],[Priority])
	SELECT 5, 1, Name, Priority
		FROM Goals
		WHERE UserName = 'Devin'
