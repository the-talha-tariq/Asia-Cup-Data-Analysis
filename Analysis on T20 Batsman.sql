--Rank T20 batsmen by their highest score (Highest Score).
SELECT Player_Name,
		Highest_Score
FROM [dbo].[batsman data t20i]
	ORDER BY Highest_Score desc

--List players with  3 or More T20 fifties but no centuries.
SELECT Player_Name,
		Fifties
FROM [dbo].[batsman data t20i]
	WHERE Fifties>=3 and Centuries=0
	ORDER BY Fifties desc

--Find the player with the best batting average in T20 matches.
SELECT TOP 1 
		Player_Name,
		Batting_Average
FROM [dbo].[batsman data t20i]
	ORDER BY Batting_Average desc

--Analyze which player has the best strike rate among batsmen with over 300 runs.
SELECT TOP 1 
		Player_Name,
		Strike_Rate
FROM [dbo].[batsman data t20i]
	WHERE Runs>300
	ORDER BY Strike_Rate desc

--Calculate the total number of sixes hit by batsmen from each country.
SELECT 
		Country,
		SUM(Sixes)
FROM [dbo].[batsman data t20i]
	GROUP BY Country
	ORDER BY SUM(Sixes) desc