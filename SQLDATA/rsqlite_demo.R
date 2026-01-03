
#Ctrl + Shif + 1 -> to maximize code editor window
#RSQLITE Package is used for a database 
#Database is a collection of tables 
#SQL- Structure Query language 

#CRUD operations    
#C Create
#R Read
#U Update
#D Delete

#install R SQLITE Package

install.packages("RSQLite",dependencies = TRUE,respos ='http://cran.rstudio.com/')
install.packages("RSQLite")
#use Library
library("RSQLite")

#Check if folder doen't exist. Create a new one 
if (!dir.exists("SQL"))
  dir.create("SQL")

#Create Dataframe
employees <- data.frame(
  "employeeid"=c(1,2,3),
  "employeename"=c("Shaan","Ankita","Soni"),
  "salary"=c(50000,45000,45000)
)
employees
install.packages("DBI")
install.packages("sqldf")
library("sqldf")
library("DBI")
library("RSQLite")
#Connect to the file if already exist otherwise create database
mydb <- dbConnect(SQLite(),"example.sqlite")

con <- dbConnect(SQLite(),"demo.sqlite")

install.packages("DBI")
install.packages("RSQLite")
install.packages("sqldf")
install.packages("devtools")

#Using Database connection store your dataframe with name employees as table name.
#First Parameter - connection with database
#Second Parameter - Table name
#Thrid Parameter - dataframe
dbWriteTable(mydb,"employeess",employees)

#Check if the employees table exists in your database
dbExistsTable(mydb,"employees")


install.packages("ggplot2")
install.packages("nycflights13")
install.packages("vignettes")
install.packages("tidyverse")
library(ggplot2)
library(nycflights13)


data("diamonds",package = "ggplot2")
data("flights", package = "nycflights13")

#str(diamonds)
#data(diamonds)
#head(diamonds)

flights
diamonds

#To Store the data in the database

dbWriteTable(mydb,"diamond",diamonds)
dbWriteTable(mydb,"flight",flights)

#Check diamonds and flight table Exists or not 
dbExistsTable(mydb,"diamond")
dbExistsTable(mydb,"flight")


#display list of table from a given database file.
dbListTables(mydb)
dbListFields(mydb,"employeess")
dbListFields(mydb,"diamond")
dbListFields(mydb,"flight")

#Read data from table without sql query
employee_data <- dbReadTable(mydb,"employees")
employee_data

diamond_data <- dbReadTable(mydb,"diamond")
diamond_data

flight_data <- dbReadTable(mydb,"flight")
flight_data
#Read data from  table using sql query 
  
employee_data <- dbGetQuery(mydb,"select * from employees")
employee_data

employee_data <- dbGetQuery(mydb,"select employeeid,salary from employees")
employee_data

#Sort
#order by clause 
#Bydefault order by sort data in ascending order



employee_data <- dbGetQuery(mydb,"select * from employees order by salary ")
employee_data


employee_data <- dbGetQuery(mydb,"select * from employees order by salary desc")
employee_data

#order By with aplhabets 
employee_data <- dbGetQuery(mydb,"select * from employees order by employeename desc")
employee_data

employee_data <- dbGetQuery(mydb,"select * from employees order by employeename asc")
employee_data

#Condition queries(where query)
employee_data <- dbGetQuery(mydb,"select* from employees where salary = 50000")
employee_data

s

employee_data <- dbGetQuery(mydb,"select* from employees where employeename = 'Shaan'")
employee_data

employee_data <- dbGetQuery(mydb,"select* from employees where employeeid >1")
employee_data

write.csv(flight_data ,"flight.csv")

#like operator
#Wildcard 
employee_data <- dbGetQuery(mydb,"select * from employees where employeename like '%a'")
employee_data

#insert new records in existing table employees
emps <- data.frame(
  "employeeid"=c(4,5),
  "employeename"=c("Prachi","Riya"),
  "salary"=c(35000,65000)
)
emps

dbAppendTable(mydb,"employees",emps)

#SQL Query to fetch data from database table employees

employee_data <- dbGetQuery(mydb,"select * from employees ")
employee_data

#Aggregate Function
employee_data <- dbGetQuery(mydb,"select sum(salary) from employees")
employee_data

employee_data <- dbGetQuery(mydb,"select avg(salary) from employees ")
employee_data

employee_data <- dbGetQuery(mydb,"select count(salary) from employees ")
employee_data

employee_data <- dbGetQuery(mydb,"select max(salary)from employees ")
employee_data

employee_data <- dbGetQuery(mydb,"select min(salary) from employees ")
employee_data


#you are not modifying exixting table 
#annual salary column is just created tempory
#Alise name 
employee_data <- dbGetQuery(mydb,"select employeeid,employeename,salary,salary*12 as[Annualsalary] from employees ")
employee_data


employee_data <- dbGetQuery(mydb,"select* from employees where employeeid = 1")
employee_data

#give me the data of employee whose employee_id = user input
get_employee_by_id <- function(id){
  employee_data <- dbGetQuery(mydb,"Select * from employees where employeeid =?",id)
  employee_data
}
get_employee_by_id(1)
get_employee_by_id(5)
get_employee_by_id(2)
get_employee_by_id(4)


#Delete employee whose employee is 5
dbSendStatement(mydb,"delete from employees where employeeid =?",5)
employee_data <- dbGetQuery(mydb,"select * from employees ")
employee_data

#update name from Soni to 
dbSendStatement(mydb,sprintf("update employees set employeename='%s'where employeeid=%d",'Rani',3))
employee_data <- dbGetQuery(mydb,"select * from employees ")
employee_data


dbSendStatement(mydb,sprintf("update employees set employeename='Sonia'where employeeid=3",'Sonia',3))
employee_data <- dbGetQuery(mydb,"select * from employees ")
employee_data


dbSendStatement(mydb,"alter table employees rename column employeename to empname")
employee_data <- dbGetQuery(mydb,"select * from employeess ")
employee_data

#check the datetyes of the table 
dbDataType(mydb,employee_data)

#Disconnect datatype file example.sqlite
dbDisconnect(mydb)
rm(employee_data)

#Try to fetch  data after closing connection
#It will giving an error
employee_data <- dbGetQuery(mydb,"select * from employees")
employee_data