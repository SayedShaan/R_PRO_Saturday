##Apply Family Function
##Apply Function
m1 <- matrix(C <- (1:10),nrow = 5,ncol = 2)
m1

#Here 1 is row and 2 is column
a_m1 <- apply(m1, 1 ,max)
a_m1

a_m1 <- apply(m1, 2, max)
a_m1

#LAPPLY Function
movies <- c("SPIDERMAN","BATMAN","VERTIGO","CHINATOWN")
movies_lower <- lapply(movies,tolower)
str(movies_lower)

#unlistfunction
movies_lower <- unlist(lapply(movies,tolower))
movies_lower

#lapply
data <- list(x = 1:5, y = 6:10, z = 11:15)
data

lapply(data,FUN=median)
sapply(data,FUN=median)

#sapply 

dt <- cars
cars
lms_cars <- lapply(dt,min)
smn_cars <- sapply(dt,min)

lms_cars
smn_cars
is.list(lms_cars)

#tapply
library(datasets)
mtcars
tapply(mtcars$mpg,mtcars$cyl,sum)

#mapply
x <- 1:5
b <- 6:10
mapply(sum,x,b)