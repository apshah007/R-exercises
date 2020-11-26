# MSBA 615 - Week 1 - Intro to R and R Studio

# Playing around with R and RStudio:
        
        # addition / subtraction
        1+5
        15-9

        # multiplication / divison
        102834*989
        73492/3868

        # mod is denoted with x%%y
        73492%%3868
        
# Operators continued
        # Exponents
        3^3
        5i^2
        # Colon operator
        1:5
        # Concatenate values
        c(1, 2, 3, 4, 5)
        # case sensitivity
        C(1, 2, 3, 4, 5)

# Assigning values to objects

        object <- 8
        
        print(object) # explicit
        
        object # auto-prints
        
        # Assigning values to objects
        
        x <- c(1, 2, 3, 4, 5)
        x
        
        x + 2 # operators passed to vectors modify each value individually  
        
# Vectorization
        10 * c(1:5) # here 1:5 is vectorized
        
        sum(1:5)
        median(1:5)
        
        sum(1, 2, 3, 4, 5)
        median(1, 2, 3, 4, 5)
        
        # Fix the previous function
        
        
# Quick Check (on ppt slides):
        
        
        
        
        
        
        
        
        
# Numbers
        x <- 5
        x <- 5L # L suffix = integer
        
        
# Special Numbers
        
        # Inf:
        1/0
        
        # NaN:
        0/0       
        
        # make vector of special numbers
        vec <- c(0, Inf, -Inf, NaN, NA)
        
        # Check for finite values
        is.finite(vec)
        # Check for NaN
        is.nan(vec)
        # Check for NAs
        is.na(vec)
        
# logical vectors
        # create an object that tells which integers between 1 and 10 are >= 5
        x <- 1:10 >= 5
        x
        # return opposite
        !x
        
        # What will this expression create?
        y <- 1:10 %% 2 == 0
        
# Object Attributes
        ?mtcars
        data <- mtcars
        # Names:
        names(data)
        # Dimensions:
        dim(data)
        # Class:
        class(data)
        # Length:
        length(data)
        # Metadata, or all attributes:
        str(data)
        
        # try it again eith a different dataset
        ?airquality
        data <- airquality
        str(data)
        
# R has five atomic classes of objects:
        # Character
        x <- c("a", "b", "c")
        str(x)
        # Numeric
        x <- c(0.52, 0.61, 0.32)
        str(x)
        # Integer
        x <- 3:43
        str(x)
        # Complex
        x <- c(1+0i, 2+4i)
        str(x)
        # Logical
        x <- c(TRUE, FALSE, TRUE)
        str(x)
        
# Coercion: objects can be manually coerced into other classes
        # logical to integer/numeric
        as.numeric(x)
        as.integer(x)
        # logial to character
        x <- as.character(x)
        str(x)
        # character to numeric?
        as.numeric(x)
        
# Matrices
        x <- matrix(nrow = 3, ncol = 4)
        
# rbind and cbind 
        x <- 1:4
        y <- 5:8
        z <- 9:12
        
        # stack the vectors (bind into rows)
        xyz <- rbind(x, y, z)
        
        # bind the vectors side-by-side (bind into columns)
        xyz <- cbind(x, y, z)
        
# Data Frames
        ?data.frame
        
        
        
# Quick Check 2:
        # Create an object that stores 2 columns. 
        # The first column is comprised of numbers 100, 200, 300, 400, 500. 
        # The second column stores the square of each value in the first column,
        # divided by half of the value in the first column
        
        #
        #
        #
        #
        #
        # What type is your object?
        #
        #
        
        
        # One possible solution
        x <- c(100, 200, 300, 400, 500)
        y <- (x^2)/(x/2)
        df <- cbind(x,y)
        df
        
        # Another solution (Student's solution from class)
        x <- c(1:5)*100
        y <- (x^2)/(x/2)
        df <- cbind(x,y)
        df
        
        # notice how the output changes when you run:
        data.frame(df) 
        # this is because a data frame is different from a matrix
        