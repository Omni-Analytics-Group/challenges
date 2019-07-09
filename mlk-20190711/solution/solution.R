###
### Libraries
###
library(rvest)
library(tidyverse)
library(tidytext)
library(hunspell)
library(ggwordcloud)

## On July 11th, 1977, #MLK was presented with the Presidential Medal of Freedom. 
## We have an three part #rstats challenge to commerate that day. 
## Day One: Using #rvest and #tidyverse, scrape the I Have a Dream speech text 
## into a 29 row #tibble (one per paragraph) from https://aol.it/2NFuaum #tidytuesday

dream_text <- "https://aol.it/2NFuaum" %>%
    read_html() %>%
    html_nodes("em") %>%
    html_text()

dream_tbl <- tibble(
    Paragraph = 1:length(dream_text),
    Text = dream_text
)
