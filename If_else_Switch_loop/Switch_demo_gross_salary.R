# Read basic salary from user
basic_salary <- as.numeric(readline("Enter Basic Salary: "))

# Initialize HRA and DA
hra <- 0
da <- 0

# Calculate HRA and DA based on conditions
if (basic_salary >= 20000) {
  hra <- basic_salary * 0.60
  da <- basic_salary * 0.70
} else if (basic_salary >= 15000) {
  hra <- basic_salary * 0.65
  da <- basic_salary * 0.75
} else if (basic_salary >= 10000) {
  hra <- basic_salary * 0.70
  da <- basic_salary * 0.80
} else {
  hra <- basic_salary * 0.80
  da <- basic_salary * 0.90
}

# Calculate gross salary
gross_salary <- basic_salary + hra + da

# Print the gross salary
cat("The Gross Salary is:", gross_salary, "\n")
