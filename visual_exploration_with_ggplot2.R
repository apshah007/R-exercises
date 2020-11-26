##########################################################
# Visually Exploring Data with ggplot2
##########################################################

# Install tidyverse
install.packages("tidyverse")

# load package
library(tidyverse)

# we will be working with the diamods data set to demonstrate 
# the qplot() function in ggplot2 (quick plot)
        
        # check out the diamonds data set
        ?diamonds

        # let's look at the relationship betwen carats and price:
        qplot(diamonds$carat, diamonds$price)
        
        # without using the $:
        qplot(carat, price, data = diamonds)
        
        # let's add a dimension better understand how diamond clarity
        # is related to carat and price
        qplot(carat, price, data = diamonds, color = cut)
        
        # let's check out a histogram of carat size
        qplot(carat, data = diamonds, geom = "bar", fill = color)
        
        # now let's look at price and add diamond color as a fill
        qplot(price, data = diamonds, geom = "histogram", fill = color)


#########################################################################
# Do bigger engines = more fuel consumption?

# How do we load mpg?

# Inspect the data (print/view)
?mpg

# create plot:
ggplot(data = mpg) +
        geom_point(mapping = aes(x = displ, y = hwy))

        # What are we looking at here? (What does the graph show?)
        

# store plot as an object



# what if we wanted a scatterplot of hwy vs. cyl?


#############
# adding aesthetic mappings for a third dimension (class of vehicle):
        # check the unique levels of the class variable
        unique(mpg$class)

# add colors to denote classification of each vehicle
        ggplot(data = mpg) +
                geom_point(mapping = aes(x = displ, y = hwy, color = class))
        
        # you can set the aesthetic properties of your geom manually
        ggplot(data = mpg) +
                geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

        ggplot(data = mpg) +
                geom_point(mapping = aes(x = displ, y = hwy), 
                           color = "blue", 
                           size = 5)

        # you can also map an aesthetic to something other than a variable name:
        ggplot(data = mpg) +
                geom_point(mapping = aes(x = displ, y = hwy, color = displ < 5))
        
        # what if we want to isolate the 6 cars that we singled out earlier?
        ggplot(data = mpg) +
                geom_point(mapping = aes(x = displ, 
                                         y = hwy, 
                                         color = displ > 5 & hwy > 21),
                           color = "blue")

############
# Facets
        
        # use facet_wrap() to create a faceted plot of engine size by gas mileage
        # across vehicle classifications
        ggplot(data = mpg) +
                geom_point(mapping = aes(x = displ, y = hwy)) +
                facet_wrap(~ class, nrow = 2)
        
        # facet_grid()
        ggplot(data = mpg) +
                geom_point(mapping = aes(x = displ, y = hwy, color = class)) +
                facet_grid(drv ~ cyl)
        
        # edtiting labels for axes and adding a title
        ggplot(data = mpg) +
                geom_point(mapping = aes(x = displ, y = hwy, color = class)) +
                facet_grid(drv ~ cyl) +
                labs(title = "Automobile Fuel Effeciency by Number of Engine Cylinders and Drive Type") +
                xlab("Engine Displacement (in Liters)") +
                ylab("Highway Miles per Gallon")

###########
# Variations on geoms
        
        ggplot(data = mpg) +
                geom_point(mapping = aes(x = displ, y = hwy))
        
        ggplot(data = mpg) +
                geom_smooth(mapping = aes(x = displ, y = hwy))
        
        ggplot(data = mpg) +
                geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))
        
        # Let's combine a few geoms
        ggplot(data = mpg) +
                geom_point(mapping = aes(x = displ, y = hwy)) +
                geom_smooth(mapping = aes(x = displ, y = hwy))
        
        # Instead of duplicating the code we can pass one set of mappings 
        # to the ggplot command. These global mappings will apply to all geoms.
        
        ggplot(data = mpg, aes(x = displ, y = hwy)) +
                geom_point(aes(color = class)) +
                geom_smooth()


        
#################################
# bar charts & statistical transformations
        
        # use diamonds data to look at count of each cut
        ggplot(data = diamonds) + 
                geom_bar(mapping = aes(x = cut))
        
        # what is the default stat used by geom_bar()?
        ?geom_bar
        
        # stat_count() is interchangable with geom_bar()
        ggplot(data = diamonds) + 
                stat_count(mapping = aes(x = cut))
        
        # overriding the default stat to show proportion
        ggplot(data = diamonds) + 
                geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1))
        
        # adding fill color to differentiate the bars
        ggplot(data = diamonds) + 
                geom_bar(mapping = aes(x = cut, fill = cut))
        
        # adding fill color for clarity to show more data
        ggplot(data = diamonds) + 
                stat_count(mapping = aes(x = cut, fill = clarity))
        
        # overriding the default position to stack bars for proportions
        ggplot(data = diamonds) + 
                stat_count(mapping = aes(x = cut, 
                                         fill = clarity), 
                                         position = "fill")
        
        # position "dodge" places overlapping objects directly 
        # next to one another
        ggplot(data = diamonds) + 
                stat_count(mapping = aes(x = cut, 
                                fill = clarity), 
                                position = "dodge")
        
        install.packages("RColorBrewer")
        # colors with RColorBrewer
        library(RColorBrewer)
        
        # use display.brewer.all() to view all palettes
        display.brewer.all()
        
        # choose a palette and add it as a layer
        ggplot(data = diamonds) + 
                geom_bar(mapping = aes(x = cut, fill = clarity), 
                           position = "dodge") +
                scale_fill_brewer(palette="Set1")
                
                # Note: use scale_color_brewer() for lines and points
        
        # let's try a clean theme with theme_classic()
        ggplot(data = diamonds) + 
                geom_bar(mapping = aes(x = cut, fill = clarity), 
                         position = "dodge") +
                scale_fill_brewer(palette="Set1") +
                theme_classic()
        
        
        # fix the y-axis issue by adding scale_y_continuous(expand = c(0, 0))
        ggplot(data = diamonds) + 
                geom_bar(mapping = aes(x = cut, fill = clarity), 
                         position = "dodge") +
                scale_fill_brewer(palette="Set1") +
                theme_classic() +
                scale_y_continuous(expand = c(0, 0))
                

################
        # recall the original scatterplot
        ggplot(data = mpg) +
                geom_point(mapping = aes(x = displ, y = hwy))
        
        # note 234 observations in set, but in our chart there are 
        # only 126 points displayed
        str(mpg)
        
        # jitter adds slight "randomness" to the position of points
        # in order to avoid overlap
        ggplot(data = mpg) +
                geom_point(mapping = aes(x = displ, y = hwy), 
                           position = "jitter")

        ggplot(data = mpg) +
                geom_point(mapping = aes(x = displ, y = hwy))
#################################
# Group Activity
#################################

# install the gapminder package
install.packages("gapminder")
library(gapminder)
?gapminder

# explore the data



