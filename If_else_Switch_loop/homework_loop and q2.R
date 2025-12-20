#WAP in R to print all odd number between 1 to n

#n <- as.numeric(readline("enter the number"))

#for (i in 1:n) {
 # print(i)
  
#}




n <- as.numeric(readline("enter the number"))

for (i in 1:n) {
 if(i%%2!=0){
   print(i)
 }
}
print("")
for (i in seq(1,n,2)) {
  print(i)
}



