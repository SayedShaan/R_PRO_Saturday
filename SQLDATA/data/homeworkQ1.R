install.packages("RSQLite")
library(RSQLite)

if(!dir.exists("data"))
  dir.create("data")

emp <- read.csv("employee_details.csv")

con <- dbConnect(SQLite(),"data/example.sqlite")

dbWriteTable(con,"employee",emp)

dbExistsTable(con,"employee")

emp_data <- dbGetQuery(con,"Select * from employee ")
emp_data

#Display employees woring in hr department
emp_data <- dbGetQuery(con,"Select * from employee where departmentname = 'Hr' ")
emp_data

#Display employees whose salary is between 50000 and 90000
emp_data <- dbGetQuery(con,"Select * from employee where salary between 60000 and 90000  asc")
emp_data


emp_data <- dbGetQuery(con,"Select * from employee where salary>50000 and salary<90000")
emp_data


emp_data <- dbGetQuery(con,"Select * from employee where doj>01/03/2020")
emp_data

emp_data <- dbGetQuery(con,"Select * from employee where employeename like 'sa%'")
emp_data
