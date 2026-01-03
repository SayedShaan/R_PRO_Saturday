#Email Validation 
library(stringr)
email <- "sayedniit@gmail.com"
str_match(email,"([a-z]|[0-9])+@[a-z]+\\.[a-z]{2,3}") 