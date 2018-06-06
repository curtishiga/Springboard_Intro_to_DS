library("dplyr")
library("tidyverse")

# Substitute missing values of embarked with "S"
titanic_original$embarked[is.na(titanic_original$embarked)] <- "S"

# substitue missing values in age with average
age_mean <- mean(titanic_original$age,na.rm=TRUE)
titanic_original$age[is.na(titanic_original$age)] <- age_mean

# Input dummy text for passengers who did not make it onto lifeboats
titanic_original$boat[is.na(titanic_original$boat)] <- "N/A"

# Insert a has_cabin_number column filled with dummy values
dummy_cabin <- titanic_original %>% select(cabin) %>% mutate(has_cabin_number = as.numeric(!is.na(cabin)))


# Create a new data frame called titanic_clean
titanic_clean <- data.frame(titanic_original,
                            "has_cabin_number" = dummy_cabin$has_cabin_number)

# Write a new CSV file
write.csv(titanic_clean,"titanic_clean.csv")