#factors

#Continuous #By default in R
#Categorical
#Nominal - eg.Gender date 
#Ordinal - eg. Week data 

g <- c("male","female","female","male","female") 
f <- factor(g,levels = c("male","female"))
f
summary(f)

d <- c("Morning","midnight","Evening","midnight","afternoon")
f <- factor(d,levels = c("Morning","afternoon","Evening","midnight"))
f
summary(f)
