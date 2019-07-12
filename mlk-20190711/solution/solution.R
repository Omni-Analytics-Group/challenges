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

## Our #rstats challenge solution for Day One is here: 
## https://github.com/Omni-Analytics-Group/challenges/blob/master/mlk-20190711/solution/solution.R.
## Day Two: Perform the following #tidytext operations on your #tibble: 
## (1) Unnest words, (2) Remove stop words, (3) Append afinn sentimen

dream_words <- dream_tbl %>%
    unnest_tokens(word, Text) %>%
    anti_join(stop_words) %>%
    left_join(
        get_sentiments("afinn")
        , by = c("word" = "word"))

dream_sent <- dream_words %>%
    group_by(word) %>%
    summarise(value = mean(value),
              count = n()) %>%
    filter(!is.na(value))

ggplot(data = dream_sent, aes(label = word, size = count, colour = value)) +
    geom_text_wordcloud() +
    scale_colour_gradient2()
