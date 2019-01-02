# Capstone Project

## NBA Three Pointers

This is my Capstone Project for Springboard's Introduction to Data Science course. The purpose of this project is investigate the impact of the three point line as on a team's success. For more details on the motivation behind this project, please reference "capstone_project_proposal.pdf" above.

This repository is laid out in the following manner:
- Data Sets
  - [complete_gamelogs.csv](https://github.com/curtishiga/Springboard_Intro_to_DS/blob/master/Capstone_Project/Data%20Sets/complete_gamelogs.csv)
    - Game-by-game three-point data for every team
  - [team_gamelogs_3s.csv](https://github.com/curtishiga/Springboard_Intro_to_DS/blob/master/Capstone_Project/Data%20Sets/team_gamelogs_3s.csv)
    - Original three-point data pulled from MySportsFeeds
  - [team_statistics.csv](https://github.com/curtishiga/Springboard_Intro_to_DS/blob/master/Capstone_Project/Data%20Sets/team_statistics.csv)
    - Team-by-team three-point data throughout the entire season
- Final
  - [Final Presentation.pdf](https://github.com/curtishiga/Springboard_Intro_to_DS/blob/master/Capstone_Project/Final/Final%20Presentation.pdf)
    - Slides of processes taken for this project and the results for the models
  - [Final_Results_Report.pdf](https://github.com/curtishiga/Springboard_Intro_to_DS/blob/master/Capstone_Project/Final/Final_Results_Report.pdf)
    - Report summarizing steps taken to clean, explore, and model the data
  - (Latest version of the R files listed below)
- Reports
  - [Data_Story.pdf](https://github.com/curtishiga/Springboard_Intro_to_DS/blob/master/Capstone_Project/Reports/Data_Story.pdf)
    - This report summarizes the entire project and the steps that were taken to complete this project
  - [Data_Wrangling_Summary.pdf](https://github.com/curtishiga/Springboard_Intro_to_DS/blob/master/Capstone_Project/Reports/Data_Wrangling_Summary.pdf)
    - This report describes how the data was obtained and cleaned for purposes of this project
  - [Machine_Learning_Report.pdf](https://github.com/curtishiga/Springboard_Intro_to_DS/blob/master/Capstone_Project/Reports/Machine_Learning_Report.pdf)
    - This report summarizes how this project was modeled and the results of those models
  - [Statistical_Analysis.pdf](https://github.com/curtishiga/Springboard_Intro_to_DS/blob/master/Capstone_Project/Reports/Statistical_Analysis.pdf)
    - This report describes the statistical significance between three-point metrics on a game-by-game and team-by-team basis

- [Win_column.R](https://github.com/curtishiga/Springboard_Intro_to_DS/blob/master/Capstone_Project/Win_column.R)
  - This code mutates columns for opponents stats of every game a team played and whether they won or lost that game. The csv file ["complete_gamelogs.csv"](https://github.com/curtishiga/Springboard_Intro_to_DS/blob/master/Capstone_Project/Data%20Sets/complete_gamelogs.csv) is outputted.

- [capstone_project_proposal.pdf](https://github.com/curtishiga/Springboard_Intro_to_DS/blob/master/Capstone_Project/capstone_project_proposal.pdf)
  - A brief summary of the motivation and approach to this project.

- [get_results.R](https://github.com/curtishiga/Springboard_Intro_to_DS/blob/master/Capstone_Project/get_results.R)
  - This is code for pulling the data of game logs for every team in the NBA for the 2016-2017 regular season. This creates the csv file ["team_gamelogs_3s.csv"](https://github.com/curtishiga/Springboard_Intro_to_DS/blob/master/Capstone_Project/Data%20Sets/team_gamelogs_3s.csv) which can be found in "Data Sets"

- [plot_team_statistics.R](https://github.com/curtishiga/Springboard_Intro_to_DS/blob/master/Capstone_Project/plot_team_statistics.R)
  - This code plots and fits a linear regression model on the [team_statistics.R](https://github.com/curtishiga/Springboard_Intro_to_DS/blob/master/Capstone_Project/team_statistics.R) data set to model the relationship between how a team performs on three-point statistics and how many games they won.

- [plot_three_stats.R](https://github.com/curtishiga/Springboard_Intro_to_DS/blob/master/Capstone_Project/plot_three_stats.R)
  - This code plots and fits a logistic regression model to the ["complete_gamelogs.csv"](https://github.com/curtishiga/Springboard_Intro_to_DS/blob/master/Capstone_Project/Data%20Sets/complete_gamelogs.csv) data set to hopefully predict the outcome of a game based solely on how well a team performs on three-point stats.

- [team_statistics.R](https://github.com/curtishiga/Springboard_Intro_to_DS/blob/master/Capstone_Project/team_statistics.R)
  - This code creates the csv file ["team_statistics.csv"](https://github.com/curtishiga/Springboard_Intro_to_DS/blob/master/Capstone_Project/Data%20Sets/team_statistics.csv) which contains three-point stats for each team over the course of the season.
