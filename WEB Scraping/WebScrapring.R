install.packages("rvest")
library(rvest)

single_table_page <- read_html("first_page.html")
single_table_page

html_table(single_table_page)
html_table(html_node(single_table_page,"table"))
html_table(html_nodes(single_table_page,"table"))


#pipe Operator
single_table_page %>% # single records from the webpage 
  html_node("table") %>%
  html_table()

single_table_page %>%    # all the records for the webpage 
  html_nodes("table") %>% 
  html_table()

product_page <- read_html("products.html")
names <- product_page %>% 
  html_nodes("span.name") %>% 
  html_text()


  prices <- product_page %>% 
  html_nodes("span.price") %>% 
  html_text()
  
  names
  prices
  
  myproduct <- data.frame(
    names=names,
    prices=prices
  )

  myproduct
  
  
  products_page <- read_html("product.html")
  products_page %>% 
    html_nodes(xpath = "//div[@class='product-list']//li//span[@class='names']//span[@class='prices']")
  html_text()