install.packages("RSQLite")
library(RSQLite)

emp <- read.csv("SQLDATA/employee_leaves.csv")


con <- dbConnect(SQLite(),"data/example.sqlite")

dbWriteTable(con,"employees2",emp)

dbExistsTable(con,"employees2")

emp_data <- dbGetQuery(con,"Select * from employees2 ")
emp_data

#Display employees whose leave type is PL
emp_data <- dbGetQuery(con,"Select * from employees1 where leavetype = 'PL' ")
emp_data

#Display employees whose reason is empty
emp_data <- dbGetQuery(con,"Select * from employees1 where reason= '' ")
emp_data


#Display employees whose leavetype is empty
emp_data <- dbGetQuery(con,"Select * from employees1 where leavetype= '' ")
emp_data

#Display employees from whose leave between dec-2019 to jan-2020
emp_data <- dbGetQuery(con,"Select * from employees1 where strftime('%d,/%m/%Y' ,from_date>='01-01-2019') and strftime('%d,/%m/%Y',to_date <='31-01-2020')")
emp_data



emp_data <- dbGetQuery(con,"select from_date from employees1 where substr(from_date,7)||substr(from_date,4,2)||substr(from_date,1,2)
                       between'20190101' and '20201231' ")
emp_data