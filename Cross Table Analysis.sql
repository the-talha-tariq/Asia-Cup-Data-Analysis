--7. Cross Table Analysis:
--Compare the performance of the top run-scorers (Highest Run Scorer) in the Champions data with their overall ODI and T20 stats.
SELECT  o.Player_Name,
		SUM(o.Runs+t.Runs) 'Total Run Score'
FROM [batsman data odi] o
	INNER JOIN [batsman data t20i] t ON o.Player_Name=t.Player_Name
	INNER JOIN [champion] c on t.Player_Name=c.Highest_Run_Scorer
	GROUP BY o.Player_Name
	ORDER BY SUM(o.Runs+t.Runs) desc

--Analyze the impact of top bowlers (Highest Wicket Taker) from the Champions data in ODI and T20 matches.
SELECT  o.Player_Name,
		SUM(o.Wickets+t.Wickets) 'Total Wicket Taken'
FROM [bowler data odi] o
	INNER JOIN [bowler data t20i] t ON o.Player_Name=t.Player_Name
	INNER JOIN [champion] c on t.Player_Name=c.Highest_Wicket_Taker
	GROUP BY o.Player_Name
	ORDER BY SUM(o.Wickets+t.Wickets) desc

--Find out if there is any correlation between a team winning the toss and becoming the champion in the Asia Cup (Toss and Champion).
SELECT 
	c.Champion,
	c.Year,
	COUNT(a.Toss) AS TossWins
FROM champion c
	INNER JOIN asiacup a ON c.Champion = a.Team AND c.Year = a.Year
	WHERE a.Toss = 'Win'
	GROUP BY c.Champion, c.Year
	ORDER BY TossWins DESC

--Compare the highest individual score in Asia Cup (Highest Score) with the top batsmen's performance in ODI and T20.
SELECT 
	o.Player_Name,
	o.Highest_Score 'Highest Score in Odi',
	t.Highest_Score 'Highest Score in T20',
	COUNT(*) 'No. of Player of Series'
FROM [batsman data odi] o
	INNER JOIN [batsman data t20i] t ON o.Player_Name = t.Player_Name
	INNER JOIN champion c ON c.Highest_Run_Scorer = t.Player_Name
	GROUP BY o.Player_Name,o.Highest_Score,t.Highest_Score


--8. Time Period Based Analysis:
--Identify the top-performing batsmen and bowlers in different eras (Time Period).
SELECT Player_Name, Country, Time_Period, SUM(Runs) AS TotalRuns, AVG(Batting_Average) AS AvgBattingAverage, 
       AVG(Strike_Rate) AS AvgStrikeRate, SUM(Centuries) AS TotalCenturies, SUM(Fifties) AS TotalFifties
FROM [batsman data odi]
GROUP BY Player_Name, Country, Time_Period
ORDER BY Time_Period

SELECT Player_Name, Country, Time_Period, SUM(Runs) AS TotalRuns, AVG(Batting_Average) AS AvgBattingAverage, 
       AVG(Strike_Rate) AS AvgStrikeRate, SUM(Centuries) AS TotalCenturies, SUM(Fifties) AS TotalFifties
FROM [batsman data t20i]
GROUP BY Player_Name, Country, Time_Period
ORDER BY Time_Period


--Compare the batting averages of players before and after a specific year (e.g., 2000).
SELECT 
	Player_Name,
	Time_Period,
	CASE WHEN Time_Period<'2000' THEN 'Before 2000' ELSE 'After 2000' END,
	Batting_Average
FROM [batsman data odi]

SELECT 
		COUNT(CASE WHEN Time_Period<'2000' and Batting_Average>50 THEN 1 END ) AS 'NO of Batsman with Average >50 before 2000',
		COUNT(CASE WHEN Time_Period>'2000' and Batting_Average>50 THEN 1 END ) AS 'NO of Batsman with Average >50 After 2000'
		FROM [batsman data odi]

--Calculate the change in bowling strike rates over time for each country in both formats.
SELECT 
	t.Country,
	AVG(t.Strike_Rate) 'Average Strike Rate in T20',
	AVG(o.Strike_Rate) 'Average Strike Rate in Odi'
FROM [batsman data t20i] t
	LEFT JOIN [batsman data odi] o ON o.Country = t.Country
	GROUP BY t.Country


SELECT 
	t.Country,
	AVG(t.Strike_Rate) 'Average Strike Rate in T20',
	AVG(o.Strike_Rate) 'Average Strike Rate in Odi'
FROM [bowler data t20i] t
	LEFT JOIN [bowler data odi] o ON o.Country = t.Country
	GROUP BY t.Country

