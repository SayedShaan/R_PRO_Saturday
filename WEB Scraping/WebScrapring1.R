install.packages(rvest)

library(rvest)
# retrieving the target web page 
document <- read_html("https://www.scrapingcourse.com/ecommerce/")
# selecting the list of product HTML elements 
html_products <- document %>% html_elements("li.product")
# selecting the "a" HTML element storing the product URL 
a_element <- html_products %>% html_element("a") 
# selecting the "img" HTML element storing the product image 
img_element <- html_products %>% html_element("img") 
# selecting the "h2" HTML element storing the product name 
h2_element <- html_products %>% html_element("h2") 
# selecting the "span" HTML element storing the product price 
span_element <- html_products %>% html_element("span")

# extracting data from the list of products and storing the scraped data into 4 lists 
product_urls <- html_products %>% 
  html_element("a") %>% 
  html_attr("href") 
product_images <- html_products %>% 
  html_element("img") %>% 
  html_attr("src") 
product_names <- html_products %>% 
  html_element("h2") %>% 
  html_text2() 
product_prices <- html_products %>% 
  html_element("span") %>% 
  html_text2()


# converting the lists containg the scraped data into a dataframe 
products <- data.frame( 
  product_urls, 
  product_images, 
  product_names, 
  product_prices 
)
products

# changing the column names of the data frame before exporting it into CSV 
names(products) <- c("url", "image", "name", "price")


# export the data frame containing the scraped data to a CSV file 
write.csv(products, file = "./products.csv", fileEncoding = "UTF-8")