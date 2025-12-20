#WAP in R to create following data fram  customers of shopping date: 

Customers
	-customerid
	-first_name
	-last_name
	-amount
	-gender
	-date

customer <- data.frame(
  "customerid"=c(1,2,3,4,5,6),
  "fistname"=c("Ravi","Sameer","Ankit","Saad","Prachi","Reena")
)
str(customer)
customer



library(dplyr)
customers <- data.frame(
    "customerid"=c(01,02,03,04,05,06,07,08,09,10),
    "firstname"=c("Ravi","Sam","Ankit","Rishi","Sameer","Ankita","Vijay","Saad","Prishi","Prachi"),
    "lastname"=c("Sharma","Desouza","Maurya","Pandit","Khan","Thakur","Deva","Chohan","Jain","Jadhav"),
    "amount"=c(2000,1500,1800,1675,1870,9000,6500,7500,8970,9500),
    "gender"=c("Male","Male","Male","Male","Male","Female","Male","Male","Female","Female"),
    "date"=c("01/02/2022","07/04/2022","02/03/2018","08/04/2019","03/02/2023","09/04/2020","04/02/2019","10/04/2020","05/02/2024","11/04/2018")
)
str(customers)
customers
customers$date <- as.Date(customers$date,format="%y/%m/%d")
customers
#select Function
#Display all customers
dplyr::select(customers,everything())
#Display Customer firstname, lastname and amount
dplyr::select(customers,firstname,lastname,amount)
#Display Customerid, firstname and date of shopping 
dplyr::select(customers,firstname,date)
#Display Customerid, firstname amount and date of shopping 
dplyr::select(customers,firstname, amount,date)
#Display customer details without gender column
dplyr::select(customers,-gender)

#mutate function
#Add fullname column
customers <- dplyr::mutate(customers,Fullname = paste(firstname, lastname))
#Calculate total amount Column(2% GST on Existing amount column) 
customers <-dplyr::mutate(customers,total_amount = (amount*0.02)+amount)
customers 
#Filter function
#Display all the customer whose amount is greater than Rs500
dplyr::filter(customers,amount>5000)
#Display all the customer whose gender is male  amount is greater than Rs500
dplyr::filter(customers,amount>5000 & gender == "Male")
#Display all the customer whose date is between 2019 to 2020
dplyr::filter(customers,date>as.Date("2002/01/01") & date<=as.Date("2004/12/31"))
customers
as.Date("2019/12/31")



