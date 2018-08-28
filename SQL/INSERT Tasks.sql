-- DELETE FROM ListItems

INSERT INTO [dbo].[ListItems]  ([ListID],[UserID],[Text],[Priority])
	SELECT 2, 1, Name, TimeFrame
		FROM Tasks
		WHERE UserName = 'Devin'
