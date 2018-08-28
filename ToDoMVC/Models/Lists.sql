--DELETE FROM Lists

GO

INSERT INTO Lists
		(UserID, Name, ListOrder, UseTimeFrames)
	VALUES
		(1, 'Tasks', 1, 'True'),
		(1, 'Activities', 2, 'False'),
		(1, 'Priorities', 3, 'False'),
		(1, 'Goals', 4, 'False'),
		(1, 'Desires', 5, 'False'),
		(1, 'Passions', 6, 'False'),
		(1, 'Joys', 7, 'False'),
		(1, 'Values', 8, 'False'),
		(1, 'Links', 9, 'False'),
		(1, 'Notes', 10, 'False')
