library(rvest)

library(tidyverse)

mobile<- read_html_live("https://www.flipkart.com/search?q=mobiles&otracker=search&otracker1=search&marketplace=FLIPKART&as-show=on&as=off")
html_element("div.KzDlHZ") %>% 
  html_table()


url= "https://www.flipkart.com/search?q=mobiles&otracker=search&otracker1=search&marketplace=FLIPKART&as-show=on&as=off" 
happy <- read_html(url) %>% 
  html_element("div.KzDlHZ") %>% 
  html_table()

ggplot(happy, aes(x='Gdp',Y='suppot data'))