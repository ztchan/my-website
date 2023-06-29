# Install the packages if you haven't already
# install.packages(c("textreadr", "rvest"))

library(tidyverse)
library(textreadr)
library(rvest)

# URL
url <- "https://www.un.org/press/en/2021/gashc4340.doc.htm"

# Save the page
page <- rvest::read_html(url)

# Extract session
session <- page %>%
  html_element(css = "#block-system-main > div.field.field-name-field-meeting-session.field-type-taxonomy-info > span.meeting-session") %>%
  html_text()
session

# Extract date
date <- page %>%
  html_element(css = "#block-system-main > div.info-float-right > div.field.field-name-field-dated.field-type-taxonomy-info > span") %>%
  html_text()
date

# Extract header
header <- page %>%
  html_element(css = "#block-system-main > h1") %>%
  html_text()
header

# Extract main text
text <- page %>%
  html_element(css = "#block-system-main > div.content") %>%
  html_text()
text

# Merge into a dataset
df <- tibble(
  url = url,
  session = session,
  date = date,
  header = header,
  text = text
)
df

