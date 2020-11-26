100:130
5 -
+
+1
3%5
2*3
4-1
6/(4-1)

4+2
18-6
12/3
1:6
a<-1
a
a+2

die <- 1:6
die

die-1
die/2

die*die



1:2
1:4

die

die + 1:2

die + 1:4

#inner multiplication 
#     %*%
  
#outer multiplication
#     %o%
  
die %*% die 

die %o% die

round(3.1415)

factorial(3)

mean(1:6)

round(mean(die))

sample(x = 1:4, size = 2)

sample(x = die, size = 1)
sample(x = die, size = 1)
sample(x = die, size = 1)

args(round)

round(3.1415, digits = 2)

sample(die, 1)

sample(size = 1, x = die)

sample(die, size = 2)

sample(die, size = 2, replace = TRUE)

sample(die, size = 2, replace = TRUE)

dice <- sample(die, size = 2, replace = TRUE)
dice
sum(dice)

die <- 1:6 
dice <- sample(die, size = 2, replace = TRUE)
sum(dice)

my_function <- function() {}

roll <- function() {
  die <- 1:6
  dice <- sample(die, size = 2, replace = TRUE)
  sum(dice)
}

roll()

roll()

roll

roll()

roll2 <- function(bones) {
  dice <- sample(bones, size= 2, replace=TRUE)
  sum(dice)
}
roll2(bones = 5:6)

roll2(bones = 1:4)

roll2(bones = 1:6)

roll2(1:20)

roll2()

roll2 <- function(bones = 1:6) {
  dice <- sample(bones, size = 2, replace = TRUE)
  sum(dice)
}

roll2()


install.packages("ggplot2")
qplot
library("ggplot2")

qplot

x <- c(-1, -0.8, -0.6, -0.4, -0.2, 0, 0.2, 0.4, 0.6, 0.8, 1)
x

y <- x^3
y 

qplot(x,y)

x <- c(1, 2, 2, 2, 3, 3)
qplot(x, binwidth = 1)

x2 <- c(1,1,1,1,1,2,2,2,2,3,3,4)
qplot(x2, binwidth = 1)

x3 <- c(0,1,1,2,2,2,3,3,4)
qplot(x3, binwidth = 1)

replicate(3, 1+1)
replicate(10, roll())

rolls <- replicate(10000, roll())
qplot(rolls, binwidth = 1)

?sqrt
?log10
?sample
??log

?sample

roll <- function() {
  die <- 1:6 
  dice <-sample(die, size = 2, replace = TRUE, 
                prob = c(1/8, 1/8, 1/8, 1/8, 1/8, 3/8))
  sum(dice)
}

rolls <- replicate(10000, roll())
qplot(rolls, binwidth =0.5)

is.vector(die)

five <- 5
five 

is.vector(five)

length(five)

length(die)

#what are the 6 basic types of atomic vectors
#doubles, integers, characters, logicals, complex, raw 

int <- 1L
text <- "ace"

int <- c(1L, 5L)
text <- c("ace", "hearts")

#double vector stores regular numbers
#they have digits to the right of the decimal place or not 


die <- c(1,2,3,4,5,6)
die

typeof(die)

int <- c(-1L, 2L, 4L)
int

typeof(int)

sqrt(2)^2 -2 

logic <- c(TRUE, FALSE, TRUE)
logic

typeof(logic)

typeof(F)

comp <- c(1 + 1i, 1 + 2i, 1+ 3i)
comp

typeof(comp)

raw(3)

typeof(raw(3))

hand <- c("ace", "king", "queen", "jack", "ten")
hand

typeof(hand)

attributes(die)

names(die)

names(die) <- c("one", "two", "three", "four", "five", "six")
names(die)

attributes(die)

die
die+1

names(die) <- c("uno", "dos", "tres", "quatro", "cinco", "seis")
die

names(die) <- NULL
die

dim(die) <- c(2,3)
die


dim(die) <- c(3,2)
die

dim(die) <- c(1,2,3)
die

m <- matrix (die, nrow = 2)
m

m <- matrix(die, nrow = 2, byrow = TRUE)
m

ar <- array(c(11:14, 21:24, 31:34), dim = c(2, 2, 3))
ar

hand1 <- c("ace", "king","queen","jack", "ten", "spades", "spades", "spades", "spades", "spades")
matrix(hand1, nrow =5)
matrix(hand1, ncol =2)
dim(hand1)< c(5,2)

hand2 <- c("ace", "spades", "king", "spades", "queen", "spades", "jack", "spades", "ten", "spades")
matrix(hand2, nrow = 5, byrow = TRUE)
matrix(hand2, ncol = 2, byrow = TRUE)

dim(die)<- c(2,3)
typeof(die)

class(die)

attributes(die)

class("Hello")
class(5)


now <- Sys.time()
typeof(now)
class(now)

unclass(now)

mil <- 1000000
mil

class(mil) <- c("POSIxct", "POSIXt")
mil

gender <- factor(c("male", "female", "female", "male"))
typeof(gender)
attributes(gender)

unclass(gender)

gender

as.character(gender)

card <- c("ace", "hearts",1)
card

sum(c(TRUE, TRUE, FALSE, FALSE))

as.character(1)
as.logical(1)
as.numeric(FALSE)

list1 <- list(100:300, "R", list(TRUE, FALSE))
list1

card <- list("ace", "hearts", 1)
card

df <- data.frame(face = c("ace", "two", "six"), suit = c("clubs", "clubs", "clubs"), value= c(1, 2, 3))
df

list(face = "ace", suit = "hearts", value = 1)
c(face = "ace", suit = "hearts", value = "one")

typeof(df)
class(df)
str(df)

df <- data.frame(face = c("ace", "two", "six" ), 
  suit = c("clubs", "clubs", "clubs"), value = c(1, 2, 3), 
  stringsAsFactors = FALSE)

head(deck,10)
tail(deck,10)

write.csv(deck, file = "cards.csv", row.names = FALSE)
getwd()

deck[ , ]

head(deck)

deck[1,1]

deck[1,c(1,2,3)]

new <- deck[1, c(1,2,3)]
new

deck[c(1,1), c(1, 2, 3)]

vec <- c(6, 1, 3, 6, 10, 5)
vec[1:3]

deck[1:2, 1:2]

deck[1:2, 1]

deck[1:2, 1, drop = FALSE]

deck[-(2.52), 1:3]

deck[c(-1, 1), 1]

deck[-1,1]

deck[0,0]

deck[1, ]

deck[1, c(TRUE, TRUE, FALSE)]

rows <- c(TRUE, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, 
          F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, 
          F, F, F, F, F, F, F, F, F, F, F, F, F, F)
deck[rows, ]
## face   suit value
## king spades    13

deck[1, c("face", "suit", "value")]
## face   suit value
## king spades    13

# the entire value column
deck[ , "value"]
##  13 12 11 10  9  8  7  6  5  4  3  2  1 13 12 11 10  9  8
##  7  6  5  4  3  2  1 13 12 11 10  9  8  7  6  5  4  3  2
##  1 13 12 11 10  9  8  7  6  5  4  3  2  1

deal<- function(cards){
  cards[1, ]
}

deal(deck)

deck2 <- deck[1:52, ]
head(deck2)

deck3 <- deck[c(2, 1, 3:52), ]
deck3

random <- sample(1:52, size = 52)
random

deck4 = deck[random, ]
head(deck4)

shuffle <- function(cards) {
  random <- sample(1:52, size= 52)
  cards[random, ]
}

deal(deck)
deck2 <- shuffle(deck)
deal(deck2)

deck$value
mean(deck$value)
median(deck$value)

first <- list(numbers = c(1, 2), logical = TRUE, strings = c("a", "b", "c"))
first

first[1]

sum(first[1])

first$numbers

sum(first$numbers)

first[[1]]

first["numbers"]

first[["numbers"]]

deck2 <- deck

vec <- c(0,0,0,0,0,0)
vec

vec[1]


vec[1] <- 1000
vec

vec[c(1,3,5)] <- c(1,1,1)
vec

vec[4:6] <- vec[4:6]+1
vec

vec[7] <- 0
vec

deck2$new <- 1:52
head(deck2)

deck2$new <- NULL
head(deck2)


deck2[c(13, 26, 39, 52), ]

deck2[c(13, 26, 39, 52), 3]

deck2$value[c(13, 26, 39, 52)]

deck2$value[c(1, 26, 39, 52)] <- c(14, 14, 14, 14)

deck2$value[c(13, 26, 39, 52)] <- 14

head(deck2, 13)

vec

vec[c(FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE)]

a %in% c(a, b, c)


