-- Identify the number of different nationalities recruited in the NBA / Top 10 Nationalities drafted in the NBA
-- Who is the highest-scoring player in the dataset, and in which year did they achieve this?
-- Is there a correlation between player height and average points scored per game?
-- Which NBA team has had the most diverse roster in terms of player nationalities?



Select *
From NBAProject..all_seasons

-- This is to show the number of players per country. Top 10

Select Top 10 Country, Count(country) as TotalPlayerPerCountry
From NBAProject..all_seasons
Group by country
--Order by 1
Order by 2 Desc


-- Showing the number of drafted player per year

Select draft_year, Count(draft_year) as DraftedPlayerPerYear
From NBAProject..all_seasons
Group by draft_year
Order by 1


-- Data Cleaning. Country Column have values with U.S. Virgin Islands vs US Virgin Islands and Bosnia & Herzegovina vs Bosnia and Herzegovina

Select country
From NBAProject.dbo.all_seasons
Where Country Like '%U.S.%';

Select country
From NBAProject.dbo.all_seasons
Where Country Like 'Bosnia%';

Select country
, Case When country = 'U.S. Virgin Islands' Then 'US Virgin Islands'
		When country = 'Bosnia & Herzegovina' Then 'Bosnia and Herzegovina'
		Else country
End

From NBAProject.dbo.all_seasons
--Where country = 'U.S. Virgin Islands'
--Where country = 'Bosnia & Herzegovina'

Update NBAProject.dbo.all_seasons
Set country = Case When country = 'U.S. Virgin Islands' Then 'US Virgin Islands'
		When country = 'Bosnia & Herzegovina' Then 'Bosnia and Herzegovina'
		Else country
End


-- Highest Scoring Player in the Dataset and the Year/Season they achieved it

Select player_name, pts, season
From NBAProject.dbo.all_seasons
Order by 2 Desc

-- Comparing the player height and scoring avg

Select player_name, pts, season, player_height
From NBAProject.dbo.all_seasons
Order by 2 Desc

-- Comparing the player nationality and scoring avg

Select player_name, pts, season, country
From NBAProject.dbo.all_seasons
Order by 2 Desc

-- NBA team with most diverse roster in terms of player nationalities

Select team_abbreviation, country
From NBAProject.dbo.all_seasons
Group by team_abbreviation, country

-- Use this to show total number of nationalities per team

Select team_abbreviation, count(distinct country) as CountofNationality
From NBAProject.dbo.all_seasons
Group by team_abbreviation
Order by 2 Desc

--------------------------------------------------------------

Select team_abbreviation, country
From NBAProject..all_seasons
Order by 1 desc
