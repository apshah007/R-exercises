
#Write a function called temp_categorizer that takes one argument ‘temperature’ and returns the following:       
# - a value of “hot” if temperature is greater or equal to 90 
#- a value of warm if temperature is greater than 60 but less than 90
#- a value of cold if temperature is more than 32 but less than 60
#- a value of freezing if temperature is 32 or below
#2) Use the following vector for problem number 2:        
#sentence <- c(Learning, loops, in, R, is, not, that, bad")       



temp_categorizer <-function(temperature) {
  if (temperature>=90) 
    {res<-"hot"}
  else if(temperature >= 60 & temperature<90)
    {res<-"warm"}
  else if(temperature>32 & temperature<60)
    {res<-"cold"}
  else if (temperature <= 32)
    {res<-"freezing"}
  return(res)
}
temp_categorizer(79)


# Create a loop that:
# sentence <- c(Learning, loops, in, R, is, not, that, bad")  
#loops over the range of possible word lengths
# displays a message detailing the words that match the length
#For example: at length 8, the loop should state that the word "Learning" has 8 letters
# Hints: 
#    Use the function nchar() which gives the number of letters in each word. 
#  Example: try nchar(sentence)
#  min() and max() may help you specify a range
#  unique() can give you the unique values that match a given condition



sentence <- c("Learning", "loops", "in", "R", "is", "not", "that", "bad")

strings_length <- sapply(sentence,nchar)

min_length <- min(strings_length)

max_length <- max(strings_length)

for(word_length in min_length:max_length)
{
  
  words <- c()
 
  for(word in sentence)
  {
   
    if(nchar(word) == word_length)
    {
     
      words <- c(words,word)
    }
  }
  
  if(length(words) <1)
  {
  
    print(paste("No words found in the vector whose length is ",word_length,sep=' '))
  }
  else
  {
    
    words_str <- paste(words,collapse=' ')
  
    print(paste("The words in the vector of length",word_length,"is:",words_str,sep=' '))
  }
}





  