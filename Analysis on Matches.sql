--Find the team with the most wins in the Asia Cup (Result = 'Win').
SELECT 
	Team,
	COUNT(*) as 'Matches Win'
FROM asiacup
	WHERE Result = 'Win'
	GROUP BY Team
	ORDER BY COUNT(*) desc

--Calculate the average run rate for each team across different formats (Run Rate column).
SELECT 
	Team,
	Format,
	AVG(Run_Rate) as 'Average'
FROM asiacup
	GROUP BY Team,Format
	ORDER BY Team

--Identify which team had the highest score in the Asia Cup (Highest Score). T20
SELECT Top 1 
	Team,
	MAX(Run_Scored) as 'Matches Win in T20'
FROM asiacup
	WHERE Format = 'T20I'
	GROUP BY Team,Format
	ORDER BY MAX(Run_Scored) desc

--Identify which team had the highest score in the Asia Cup (Highest Score).ODI
SELECT Top 1 
	Team,
	MAX(Run_Scored) 'Matches Win in T20'
FROM asiacup
	WHERE Format = 'ODI'
	GROUP BY Team,Format
ORDER BY MAX(Run_Scored) desc

--Find the number of tosses won by each team and compare it with the match results.
SELECT 
    Team,
    COUNT(CASE WHEN Toss = 'Win' THEN 1 END) AS 'Total Toss Win',
    COUNT(CASE WHEN Result = 'Win' THEN 1 END) AS 'Total Match Win'
FROM asiacup 
GROUP BY Team


--Analyze the correlation between toss wins and match outcomes (win/loss).
SELECT 
    Team,
    COUNT(CASE WHEN Toss = 'Win' THEN 1 END) AS 'Total Toss Win',
    COUNT(CASE WHEN Toss = 'Lose' THEN 1 END) AS 'Total Toss Loose',
    COUNT(CASE WHEN Result = 'Win' THEN 1 END) AS 'Total Match Win',
    COUNT(CASE WHEN Result = 'Lose' THEN 1 END) AS 'Total Match Lose'
FROM asiacup 
GROUP BY Team

--List the player with the most Player of the Match awards in the Asia Cup (Player Of The Match).
SELECT Top 1 
	Player_Of_The_Match,
	COUNT(*) 'No. of Man of the Matches'
FROM asiacup 
	GROUP BY Player_Of_The_Match
	ORDER BY COUNT(*) desc


