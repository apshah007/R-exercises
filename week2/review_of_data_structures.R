##############
# matrices
##############

# matrix review (column-wise)
m <- matrix(1:10, nrow = 5, ncol = 2)
m

m <- matrix(1:10, nrow = 2, ncol = 5)
m

# matrices can also be created by adding a dimension attribute to an 
# existing vector
m <- 1:10
m

dim(m) <- c(2,5) # number of rows is first, number of columns is second
m

# as we discussed previously, matrices can also be created by binding 
# rows or columns together with the rbind or cbind commands
m <- 1:2
n <- 3:4
o <- 5:6
p <- 7:8
q <- 9:10

m <- cbind(m, n, o, p, q)
m
colnames(m)

############################
# Factors with forcats
###########################

# create a string to record months
month <- c("Dec", "Apr", "Jan", "Feb", "Sept")

# creating this string is prone to typos such as
month2 <- c("Dec", "Apr", "Jam", "Feb", "Sep")

# the string vector doesn't sort according to our knowledge
# of month order
sort(month) # string vectors are sorted alphabetically

# factors fix these problems
# to create a factor you must start by creating a list
# of the levels your factor will contain
month_levels <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun",
                  "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")

        # now create the factor
        months <- factor(month, levels = month_levels)
        months
        
        # why is there an <NA> value?
        
        
# month.name is a constant built into R that contains month names
?month.name
month.name[4:6]
        
# let's use it to populate a new factor
months <- factor(month.name[], levels = unique(month.name[]))
months

# let's take a look "under the hood" to get a peek at how factors
# are actually represented as integer vectors with labels
x <- factor(c("yes", "no", "yes", "no", "yes"))
x

# how many of each level are there?
table(x)

        # unclass() function exposes the integers in the factor
        unclass(x)
        
# we can set the levels of a factor using the "levels =" argument
table(x)
x <- factor(c("yes", "no", "yes", "no", "yes"),
            levels = c("yes", "no")) # this argument sets the order

table(x)

# forcats
library(forcats)

grades <- read.csv("grade_sample.csv")

table(grades$grade)




###############
# data frames
###############

# creating data frames

my.df <- data.frame(
        x = letters[1:5],
        y = rnorm(5),
        z = runif(5) > 0.5)

my.df
View(my.df)

class(my.df)
str(my.df)

# If any of the input vectors have names, then the row names
# are taken from the first such vector

y <- rnorm(5)
names(y) <- month.name[1:5]

my.df <- data.frame(
        x = letters[1:5],
        y = y,
        z = runif(5) > 0.5)

y
my.df

        # row.names = NULL can override the row.name behavior
        my.df <- data.frame(
                x = letters[1:5],
                y = y,
                z = runif(5) > 0.5,
                row.names = NULL)

        my.df
        
# Row names can be specified by passing a vector to row.names
        my.df <- data.frame(
                x = letters[1:5],
                y = y,
                z = runif(5) > 0.5,
                row.names = c("Willie", "Adam", "Tammy", "Shaun", "Taylor"))
        
        my.df
        
    
###############################
# indexing
###############################
        
# indexing a vector
        
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


