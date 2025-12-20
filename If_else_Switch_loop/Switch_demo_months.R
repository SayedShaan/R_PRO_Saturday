# Read month number from user
month_num <- as.integer(readline("Enter month number (1-12): "))

# Determine the month name
month_name <- switch(month_num,
                     "January",
                     "February",
                     "March",
                     "April",
                     "May",
                     "June",
                     "July",
                     "August",
                     "September",
                     "October",
                     "November",
                     "December",
                     "Invalid month number")

# Print the month name
cat("The month is:", month_name, "\n")
