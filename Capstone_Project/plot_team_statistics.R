library(ggplot2)
library(dplyr)
library(tidyr)
library(Hmisc)
library(corrplot)

team_statistics <- read.csv("team_statistics.csv")

team_statistics <- team_statistics[,2:10]


# No linear relation
team_statistics %>% ggplot(aes(x = three_pt_Percentage_mean, y = opp_three_pt_Percentage_mean)) +
  geom_point() + 
  geom_smooth(method = "lm")

# No linear relation
team_statistics %>% ggplot(aes(x = three_pt_Made_mean, y = opp_three_pt_Made_mean)) +
  geom_point() + 
  geom_smooth(method = "lm")

# No linear relation
team_statistics %>% ggplot(aes(x = Percent_of_Points_mean, y = opp_Percent_of_Points_mean)) + 
  geom_point() + 
  geom_smooth(method = "lm")


# Positive linear relation, high residuals
team_statistics %>% ggplot(aes(x = win_team_sum, y = three_pt_Percentage_mean)) + 
  geom_point() + 
  geom_smooth(method = "lm")

wins_v_tpp <- lm(three_pt_Percentage_mean ~ win_team_sum, data = team_statistics)


# Positive linear relation, high residuals
team_statistics %>% ggplot(aes(x = win_team_sum, y = three_pt_Made_mean)) + 
  geom_point() + 
  geom_smooth(method = "lm")

wins_v_tpm <- lm(three_pt_Made_mean ~ win_team_sum, data = team_statistics)


# Positive linear relation, high residuals
team_statistics %>% ggplot(aes(x = win_team_sum, y = Percent_of_Points_mean)) + 
  geom_point() + 
  geom_smooth(method = "lm")

wins_v_pop <- lm(Percent_of_Points_mean ~ win_team_sum, data = team_statistics)


# Negative linear relation, high residuals
team_statistics %>% ggplot(aes(x = win_team_sum, y = opp_three_pt_Made_mean)) + 
  geom_point() + 
  geom_smooth(method = "lm")

wins_v_otpm <- lm(opp_three_pt_Made_mean ~ win_team_sum, data = team_statistics)


# Negative linear relation, small residuals
team_statistics %>% ggplot(aes(x = win_team_sum, y = opp_three_pt_Percentage_mean)) + 
  geom_point() +
  geom_smooth(method = "lm")

wins_v_otpp <- lm(opp_three_pt_Percentage_mean ~ win_team_sum, data = team_statistics)


# No linear relation
team_statistics %>% ggplot(aes(x = win_team_sum, y = opp_Percent_of_Points_mean)) + 
  geom_point() + 
  geom_smooth(method = "lm")

# Positive linear relation, high residuals
team_statistics %>% ggplot(aes(x = win_team_sum, y = diff_tpm)) +
  geom_point() +
  geom_smooth(method = "lm")

# Positive linear relation, small residuals
team_statistics %>% ggplot(aes(x = win_team_sum, y = diff_tpp)) +
  geom_point() +
  geom_smooth(method = "lm")

# Positive linear relation, high residuals
team_statistics %>% ggplot(aes(x = win_team_sum, y = diff_pop)) +
  geom_point() +
  geom_smooth(method = "lm")


# Shows 3-point defense is more important to winning than offense. Applies to 48.66% of the data.
# Not a good indication
reg_mode <- lm(win_team_mean ~ three_pt_Percentage_mean + opp_three_pt_Percentage_mean, data = team_statistics)


# Shows strong negative correlation between win percentage and opp_three_point_percentage
cor <- cor(team_statistics[,c("win_team_mean","three_pt_Made_mean","opp_three_pt_Made_mean","three_pt_Percentage_mean","opp_three_pt_Percentage_mean","Percent_of_Points_mean","opp_Percent_of_Points_mean")])
corrplot(cor)
corrplot(cor, method="circle")


summary(reg_mode)



split_team <- sample.split(team_statistics$win_team_mean, SplitRatio = 0.7)

train_team <- subset(team_statistics, split_team == TRUE)
test_team <- subset(team_statistics, split_team == FALSE)

mod_team <- lm(win_team_mean ~ three_pt_Percentage_mean + opp_three_pt_Percentage_mean, data = train_team)

pred_team <- predict(mod_team, type = "response", newdata = test_team)

