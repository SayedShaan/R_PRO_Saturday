#WAP in to create folowing data frame 

#Department 
#deptid (1,2,3)
#deptname("hr","sales","admin")

#Employees
#empId
#empname
#salary
#deptid 

dep <- data.frame(
  "dept_id"=c(1,2,3),
  "dept_name"=c("IT","Sales","R&D")
)
dep

emp <- data.frame(
  "emp_id"=c(1,2,3,4),
  "emp_name"=c("Sagar","Ankit","Ravi","shaan"),
  "emp_salary"=c(15000,20000,18000,19000),
  "dept_id"=c(1,2,3,4)
)
emp

#Display employees details with their department detail
emp %>% full_join(dep)
#Display employees who is working in hr department
emp %>% full_join(dep) %>% filter(dept_name=="IT")
#Display department wise sum in salary
emp %>% full_join(dep) %>% group_by(dept_name) %>% summarise(sum=sum(emp_salary))

emp %>% inner_join(dep) %>% group_by(dept_name) %>% summarise(sum=sum(emp_salary)) 

emp %>% inner_join(dep)
