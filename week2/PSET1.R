#Use your knowledge of dplyr to create a table with season, team name, goals for, goals against, and goal differential based on the original EPL data frame from lecture. 
#Calculate a new column (calculated field) to check goal differential.
#Calculate another column to check the difference between the old GD variable and the one you calculated. Are there any discrepancies? Why or why not? (answer in your group’s script)
#Create a new data frame (tibble) that contains all of the rows that have problematic GD values

# load required libraries
library(tidyverse)


epl13 <- read_csv("EPL_13-14.csv")
epl14 <- read_csv("EPL_14-15.csv")
epl15 <- read_csv("EPL_15-16.csv")
# first, how can we combine these tables?
epl <- rbind(epl13, epl14, epl15)


# let's also look at a list of variable names
colnames(epl)
# table with season, team name, goals for, goals against, and goal differential 
goalDifferential <- select(epl, Season, Team, GF, GA, GD)
goalDifferential$GD <- as.numeric(goalDifferential$GD)

goalDifferential <- mutate(goalDifferential, goaldiff = GF - GA)

problematicDF <- filter(goalDifferential, is.na(GD)==T)




#problematic2DF <- filter(goalDifferential, is.numeric(GD)==F)
#typeof(epl$GD)

#For the second problem, you will use the titanic data set discussed in class
#1) Using dplyr, build a data frame with the following:
#  A variable called survival_status – character vector with “Survived” or “Did not survive” based on the Survived variable in the existing data
#A table with summary statistics broken out by survival_status:
#  Average age
#Average Fare
#2) Using dplyr, build a single data frame that shows the % of passengers who survived, broken out by gender and the port from which they embarked

# url() to download a .csv from the internet
titanic <- read_csv(url("https://raw.githubusercontent.com/plotly/datasets/master/titanic.csv"))
view(titanic)
df <- data.frame(survival_status = ifelse(titanic$Survived == 1, "Survived", "Did not survive"), age=
                   titanic$Age, fare = titanic$Fare)
view(df)


#epl_sum <- group_by(epl, Team)
#epl_sum <- summarize(epl_sum, wins = sum(W), draws = sum(D), losses = sum(L))
averagesdf <- df %>%
  filter(!is.na(survival_status)) %>%
  group_by(survival_status) %>%
  summarise(averageAge =  mean(age, na.rm = TRUE),
            averageFare =  mean(fare, na.rm = TRUE))

percentdf <- titanic %>%
  filter(Survived == 1) %>%
  group_by(Sex, Embarked) %>%
  tally(name="Count") %>%
  ungroup() %>%
  mutate(percentCount = (Count/sum(Count)*100))

