# Data importing

# load required libraries
library(tidyverse)

# read data file from .csv
read_csv("data/df1.csv")

# you can also use read_csv() to read comma sep. values in the function itself
read_csv("first_col, second_col, third_col
         1, 2, a
         3, 4, b
         5, 6, c")

# typically when you import a file you assign the data frame to an object
df1 <- read_csv("data/df1.csv")

# you can skip any metadata at the top of your file like so
read_csv("meta data may be in the first line
         and the second line of your file
         first_col, second_col, third_col
         1, 2, a
         3, 4, b
         5, 6, c", skip = 2)

read_csv("# the first line contains a comment I want to skip
         first_col, second_col, third_col
         1, 2, a
         3, 4, b
         5, 6, c", skip = 1)

# read_csv() imports the first line of the file as column names
# if your file doesn't contain column names you can override this
# functionality
read_csv("1, 2, a
         3, 4, b
         5, 6, c", col_names = FALSE) # notice that R assigns var. names


# url() to download a .csv from the internet
titanic <- read_csv(url("https://raw.githubusercontent.com/plotly/datasets/master/titanic.csv"))

# to write a csv use write_csv, then specify a data frame, followed by a file name to save as.
write_csv(titanic, "titanic_data.csv")


####################
# tibbles
####################

# tibbles provide informative and neat printing in the console
print(titanic)

# tibbles allow non-standard column names
tibble_data <- read_csv(url("https://gist.githubusercontent.com/theoroe3/8bc989b644adc24117bc66f50c292fc8/raw/f677a2ad811a9854c9d174178b0585a87569af60/tibbles_data.csv"))

# data frames do not allow this behavior
data.frame(tibble_data)


####################
# subsetting
###################

# vectors

        # create vector of 15 letters
        x <- c(letters[1:15])
        
        # subset using []
        x[4]
        
        x[3:8]
        
        x[x > "e"]
        
        # notice how the result of the above code differs from this:
        y <- x > "e"
        y
        
        # return all elements of x that are > "e"
        x[y]
        # is same as this:
        x[x > "e"]
        
        
        # indexing a vector practice
        
        x <- 1:10
        x[10]        
        x[2:5]
        
        x[4] <- 400
        
        x
        
        # subsetting / indexing a list
        list(x, mtcars, AirPassengers)
        
        my_list <- list(x, mtcars, AirPassengers)
        
        
        my_list[[1]]
        
        cars_data <- my_list[[2]]
        
        
        # subsetting / indexing a data frame
        titanic$Name
        
        
        
###############################
# EPL Data - Basic Manipulation
###############################
        
epl13 <- read_csv("data/EPL_13-14.csv")
epl14 <- read_csv("data/EPL_14-15.csv")
epl15 <- read_csv("data/EPL_15-16.csv")

# first, how can we combine these tables?
epl <- rbind(epl13, epl14, epl15)

# let's also look at a list of variable names
colnames(epl)

# dplyr: filter()
        # let's find all teams that have finished in first over the 
        # past 3 seasons

        top3 <- filter(epl, Pos == 1 | Pos == 2 | Pos == 3)
        
        # x %in% y -- selects every row where x is one of the values
        # listed in y
        
        # this gives us an alternative way of writing the code:
        top3 <- filter(epl, Pos %in% c(1,2,3))
        
# dplyr: arrange()
        # what if we want to order our new table so that the teams are 
        # listed in order of their finish?
        
        top3 <- arrange(top3, Pos)
        
        # if we want to arrange by goals scored, we can simply change the 
        # argument for arrange()
        top3 <- arrange(top3, GF)
        
        # what's wrong with our data frame now?
        
        
        
        top3 <- arrange(top3, -GF)
        
        
# dplyr: select()
        # What if we want a table to look at that doesn't include all of the 
        # extra information we have right now? What if we only want to see
        # position, team name, number of wins, draws, losses, and goal differential?(
        
        
        small_epl <- select(epl, Pos, Team, W, D, L, GD)
        
        # we can ask for the variables in a range also
        small_epl <- select(epl, Pos:Team, W:L, GD)
        
        # or we can get all of the variables that aren't in a range
        small_epl <- select(epl, -(W:GD))
                
        # if we want to quickly move a few variables to the beginning of the df,
        # we can use everything() at the end of our variable argument
        small_epl <- select(epl, Season, Pos:Team, W:L, Pts, everything())
        
        rename_epl <- select(epl, Year = Season, everything())
        
# dplyr: mutate()
        # we can create new variables calculated from previous variables using
        # the mutate() function
        
        # Who knows how the EPL points work? 
        # Let's create columns to check the pts variable in our original epl table
        epl <- mutate(epl, points = W * 3 + D)
                
        # win points = 3 points
                
        # draw points = 1 point
                
        # total points
                
        # lets create a new column that gives us the difference between 
        # our new points_check column and the old pts column
                

# dplyr: summarize() and group_by()
        # What if we want to know how many wins, losses, etc. each team has
        # had over the last 3 seasons combined?
        epl_sum <- group_by(epl, Team)
        epl_sum <- summarize(epl_sum, wins = sum(W), draws = sum(D), losses = sum(L))
        
        # which teams have the most wins over the past 3 seasons?
        epl_sum <- arrange(epl_sum, desc(wins))
        
# Piping: simplify your code
        epl_sum <- epl %>%
                group_by(Team) %>%
                summarize(wins = sum(W), 
                          draws = sum(D), 
                          losses = sum(L)) %>%
                mutate(points = wins * 3 + D) %>% 
                arrange(desc(wins))
        
##############################
# digital advertising example
##############################
        
ads <- read_csv("data/digital_advertising.csv")
        
        # work through various data transformation exercises
        
        
        
        
#-------------------------------------------------------------------------------------------------                
# In-class Activity: Use your knowledge of dplyr to create a table with season, team name,
# goals for, and goals against, and goal differential. 
# Calculate a column for goal differential.
# Calculate another column to check the difference between the old GD variable
# and the one you calculated. Are there any discrepancies?
#-------------------------------------------------------------------------------------------------
               


        
        

        
        
        
        
        
