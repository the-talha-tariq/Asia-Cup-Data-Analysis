--Calculate the top 5 ODI batsmen with the highest batting average (Batting Average).
SELECT Top 5 
	Player_Name,
	Batting_Average 
FROM [batsman data odi]
	ORDER BY Batting_Average desc

--List batsmen who scored the most centuries in ODI matches (Centuries).
SELECT 
	Player_Name,
	Centuries 
FROM [batsman data odi]
	WHERE Centuries<>0
	ORDER BY Centuries desc

--Find the player with the highest strike rate (Strike Rate).
SELECT TOP 1
	Player_Name,
	Strike_Rate 
FROM [batsman data odi]
	ORDER BY Strike_Rate desc

--Identify the batsman who hit the most sixes (Sixes) in ODI.
SELECT TOP 1
	Player_Name,
	Sixes 
FROM [batsman data odi]
	ORDER BY Sixes desc

--Calculate the average runs per match for each batsman.
SELECT
	Player_Name,
	(Runs/Matches) as 'Average Runs Per Match'
FROM [batsman data odi]
	ORDER BY (Runs/Matches) desc

--Determine which country has produced the most players with a batting average over 50
SELECT Top 1
	Country,
	COUNT(*) 'No of Players With a Batting Average Over 50'
FROM [batsman data odi]
	WHERE Batting_Average>50
	GROUP BY Country
	ORDER BY COUNT(*) desc
