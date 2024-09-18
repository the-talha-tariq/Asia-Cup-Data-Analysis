--List the countries that have won the most championships (Champion).
SELECT 
	Champion,
	COUNT(*) AS 'Won Championships'
FROM [dbo].[champion]
	GROUP BY Champion
	ORDER BY COUNT(*) desc

--Find the players who won Player of the Series multiple times.
SELECT 
	Player_Of_The_Series,
	COUNT(*) AS 'No OF Player of Series Award'
FROM [dbo].[champion]
	GROUP BY Player_Of_The_Series
	HAVING COUNT(*)>1
	ORDER BY COUNT(*) desc
	

--Determine the highest run scorer for each tournament year.
SELECT 
	Year,
	Highest_Run_Scorer
FROM [dbo].[champion]
	ORDER BY Year

--List the countries that have won the most Runner-UP (Champion).
SELECT 
	Runner_Up,
	COUNT(*) AS 'Runner Up'
FROM [dbo].[champion]
	GROUP BY Runner_Up
	ORDER BY COUNT(*) desc

	


