#Important Concept of R is DataFrame

df <- data.frame(
  "employeeid"=c(1,2,3,4,5),
  "employeename"=c("Sameeer","Sagar","Ankit","Vijay","Saad"),
    "Salary"=c(45000,50000,60000,35000,25000),
    "Department"=c("hr","Sales","hr","Admin","IT")
  
)
df

#Disaplay Column
df["employeename"]
df[2]  #column number 
df$employeename #$ gives you in vector format 

df[,c("employeename","Salary")] #to get multiple columns you need vector


#Conditions
#Display employees whose salary is greater than 3000
df[df$Salary>35000,]# wont condition only on rows not on columns 


# display employee name whose salary in gretarer than 35000
df[df$Salary>35000,"employeename"]
df[df$Salary>35000,c("employeename","Salary","Department")]


#Built in function in R
sum(df[,"Salary"])
mean(df[,"Salary"])
min(df[,"Salary"])
max(df[,"Salary"])
length(df[,"employeeid"])

#use Aggregate functions in conditions
df[df$Salary==max(df[,"Salary"]),]
df$Department

df[,"Salary"]
df["Annual_Salary"]=df$Salary*12
df
#Adding the row in dataframe
df <- rbind(df,c(6,c("A"),45454,"Sales",1212))
df


