library(rvest)

# URL of the BBC News website
url <- "https://www.bbc.com/news"

# Read the HTML content of the webpage
webpage <- read_html(url)

# Extract the titles and links of top articles
articles <- webpage %>%
  html_nodes(".gs-c-promo-heading") %>%
  html_text() %>%
  trimws()  # Remove leading and trailing whitespace

article_links <- webpage %>%
  html_nodes(".gs-c-promo-heading a") %>%
  html_attr("href")

# Combine titles and links into a data frame
article_data <- data.frame(
  title = articles,
  link = paste("https://www.bbc.com", article_links)
)

# Print the scraped data
print(article_data)