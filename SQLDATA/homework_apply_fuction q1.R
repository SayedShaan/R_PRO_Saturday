install.packages("readxl")
install.packages("writexl")
library(readxl)
library(writexl)

data <- read_excel("SQLDATA/data to import.xlsx")
data

#Display all the employees
data

#Display employees who are working is sales department
data[data$department=="sales",]

#Display department wise total salary
tapply(data$salary,data$department,sum)


#Display department wise max salary
tapply(data$salary,data$department,max)

#Display annual salary 
vapply(data$salary, function(x) x*12, numeric(1))


