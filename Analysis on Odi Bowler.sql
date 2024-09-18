--Find the bowler with the best bowling average (Bowling Average) in ODI.
SELECT TOP 1
	Player_Name,
	Bowling_Average
FROM [dbo].[bowler data odi]
	ORDER BY Bowling_Average 

--List bowlers who took 5-wicket hauls for 3 or more times in ODI matches.
SELECT
	Player_Name,
	Five_Wickets
FROM [dbo].[bowler data odi]
	WHERE Five_Wickets>=3
	ORDER BY Five_Wickets desc 

--Determine the economy rate of bowlers who bowled more than 50 overs.
SELECT
	Player_Name,
	Economy_Rate
FROM [dbo].[bowler data odi]
	WHERE Overs>50
	ORDER BY Economy_Rate  

--Analyze the correlation between overs bowled and wickets taken.
SELECT
	Player_Name,
	Overs,
	Wickets
FROM [dbo].[bowler data odi]
	ORDER BY Wickets desc

--Rank ODI bowlers by their best bowling figures (Best Figure).
SELECT
	Player_Name,
	Best_Figure
FROM [dbo].[bowler data odi]
	ORDER BY Best_Figure desc