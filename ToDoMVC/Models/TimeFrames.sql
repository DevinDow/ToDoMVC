DELETE FROM TimeFrames

GO

INSERT INTO TimeFrames
		(ID, Name)
	VALUES
		(1, 'Now'),
		(2, 'Today'),
		(3, 'Tomorrow'),
		(4, 'This Week'),
		(5, 'Next Week'),
		(6, 'This Month'),
		(7, 'Next Month'),
		(8, 'This Year'),
		(9, 'Next Year'),
		(10, 'Some Day')
