install.packages("gapminder")
gapminder::gapminder
install.packages("dplyr")
library(gapminder)
library(dplyr)
mydataframe = gapminder %>%
  group_by(country) %>% 
  summarise(averageLifeExp = mean(lifeExp)) %>%
  arrange(desc(averageLifeExp)) %>%
  top_n(10)

install.packages("ggplot2")
library(ggplot2)

mydataframe %>% 
  ggplot(mapping = aes(x = country, y = averageLifeExp)) +
  geom_point()
# The highest life expectancy is Iceland.