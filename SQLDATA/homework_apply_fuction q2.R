install.packages("readxl")
install.packages("writexl")
library(readxl)
library(writexl)

student <- read_excel("howeworkquest 2 for apply package.xlsx")
student

#Display all the student details
student

#Display total marks for all the students
apply(student[3:5],1,sum)

cbind(student,total_marks=apply(student[3:5],1,sum))

student1 <- cbind(student,total_marks=apply(student[3:5],1,sum))
student1
#Display percentage all students
result <- apply(student[3:5],1,sum)
result/300*100

student1 <- cbind(student1,percentage=student1$total_marks/300*100)
student1

df <- student1
mapply(sum,df$sybject1,df$subject2,df$subject3)/300*100