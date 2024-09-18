--Find the bowler with the lowest economy rate in T20 matches.
SELECT TOP 1
	Player_Name,
	Economy_Rate
FROM [dbo].[bowler data t20i]
	ORDER BY Economy_Rate

--List the top 5 bowlers with the highest number of wickets in T20.
SELECT TOP 5
	Player_Name,
	Wickets
FROM [dbo].[bowler data t20i]
	ORDER BY Wickets desc

--Analyze which bowler has the best strike rate in T20 matches.
SELECT TOP 1
	Player_Name,
	Strike_Rate
FROM [dbo].[bowler data t20i]
	ORDER BY Strike_Rate 

--Identify bowlers who have taken more than 3 four-wicket hauls in T20.
SELECT 
	Player_Name,
	Four_Wickets
FROM [dbo].[bowler data t20i]
	WHERE Four_Wickets<>0
	ORDER BY Four_Wickets  desc
