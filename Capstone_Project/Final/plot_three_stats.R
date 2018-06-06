library(ggplot2)
library(dplyr)
library(tidyr)
library(Hmisc)
library(caTools)
library(ROCR)

complete_gamelogs <- read.csv("complete_gamelogs.csv")

complete_gamelogs$win_team <- as.factor(complete_gamelogs$win_team)

# Compute statistics
statistics <- complete_gamelogs %>% filter(win_team == 1) %>% summarise_each(funs(mean, sd), c(13,14,17))
write.csv(statistics, file="statistics.csv")


# Histogram of difference in 3-pointers made by winning team per game
hist_diff_tpm <- complete_gamelogs %>% filter(win_team == 1) %>%
  ggplot(aes(x = diff_tpm)) +
  geom_histogram(aes(y = ..count..), position = position_dodge(), binwidth = 1) +
  scale_x_continuous(breaks = round(seq(-12,16, by = 1),1))

# Plot three_pt_Made vs. opp_three_point_Made by winning & losing teams
plot_tpm_otpm <- complete_gamelogs %>%
  group_by(game.id) %>%
  ggplot(aes(x = three_pt_Made, y = opp_three_pt_Made, col = win_team)) +
  geom_point(position = position_jitter()) +
  stat_smooth(method = 'lm', se = FALSE) +
  scale_x_continuous(breaks = round(seq(0,30, by = 5),1)) +
  scale_y_continuous(breaks = round(seq(0,30, by = 5),1)) +
  labs(x = "Three Pointers Made", y = "Opponent Three Pointers Made")



# Plot three_pt_Percentage vs. opp_three_point_Percentage by winning & losing teams
plot_tpp_otpp <- complete_gamelogs %>%
    group_by(game.id) %>%
    ggplot(aes(x = three_pt_Percentage, y = opp_three_pt_Percentage, col = win_team)) +
      geom_point(position = position_jitter()) +
      stat_smooth(method = 'lm') +
      scale_x_continuous(breaks = round(seq(0,80, by = 5),1)) +
      scale_y_continuous(breaks = round(seq(0,80, by = 5),1))

# Histogram of difference in 3-point percentage by winning team per game
hist_diff_tpp <- complete_gamelogs %>% filter(win_team == 1) %>%
  ggplot(aes(x = diff_tpp)) +
  geom_histogram(aes(y = ..count..), position = position_dodge(), binwidth = 1) +
  scale_x_continuous(breaks = round(seq(-70,70, by = 5),1))



# Statistics for Percent_of_Points
pop_statistics <- complete_gamelogs %>% filter(win_team == 1) %>% summarise_each(funs(mean, var, sd), diff_pop)

# Histogram of Percent_of_Points by winning team per game
hist_diff_pop <- complete_gamelogs %>% filter(win_team == 1) %>%
  ggplot(aes(x = diff_pop)) +
  geom_histogram(aes(y = ..count..), position = position_dodge(), binwidth = 1)

# Plot three_pt_Percentage vs. opp_three_point_Percentage by winning & losing teams
plot_pop_opop <- complete_gamelogs %>%
  group_by(game.id) %>%
  ggplot(aes(x = Percent_of_Points, y = opp_Percent_of_Points, col = win_team)) +
  geom_point(position = position_jitter()) +
  stat_smooth(method = 'lm')




library(boot)

split <- sample.split(complete_gamelog$win_team, SplitRatio = 0.6)

train <- subset(complete_gamelogs, split == TRUE)
test <- subset(complete_gamelogs, split == FALSE)

mod1 <- glm(win_team ~ three_pt_Percentage + opp_three_pt_Percentage, data = train, family = "binomial")

predictTrain <- predict(mod1, type = "response")
predictTest <- predict(mod1, type = "response", newdata = test)

tab <- table(test$win_team, predictTest >= 0.5)

ROCRpred <- prediction(predictTrain, train$win_team)
ROCRperf <- performance(ROCRpred, "tpr","fpr")

plot(ROCRperf)