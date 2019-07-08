## Day One

We have a three part #tidytuesday #rstats challenge for you. Using #rvest and #tidyverse, scrape the I Have a Dream Speech text into a 29 row #tibble from https://aol.it/2NFuaum.

## Day Two

Perform the following #tidytext steps: 

1. Unnest words
2. Remove stop words
3. Append `afinn` word sentiment #rstats

## Day Three

Using #dplyr, 

1. Count the occurrence of each word (maintaining the afinn score)
2. Remove any word with an NA afinn score
3. Use #ggwordcloud to produce this wordcloud shown!

![](output/wordcloud.png)

## Suggested Libraries

```
library(rvest)
library(tidyverse)
library(tidytext)
library(hunspell)
library(ggwordcloud)
```
