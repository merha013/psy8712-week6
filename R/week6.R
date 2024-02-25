# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)
library(stringi)
library(rebus)
library(dplyr)

# Data Import
citations <- stri_read_lines("../data/citations.txt", encoding = "CP1252")
citations_txt <- citations[stri_trim_both(citations) != ""] 
length(citations)-length(citations_txt)
mean(nchar(citations_txt))

# Data Cleaning
View(citations_tbl %>%
  sample_n(20))
citations_tbl <- tibble(line = seq_along(citations_txt), cite = citations_txt) %>%
  mutate(cite = str_replace_all(cite, "[\"\']","")) %>%
  mutate(year = (str_match(cite, "(([1-2][0-9]{3}))")[,1])) %>%
  mutate(page_start = (str_match(cite, "\\b(\\d+)(?=-)")[,1])) %>%
  mutate(perf_ref = str_detect(cite, "performance")) %>%  # when I use regex and ignore_case = TRUE it no longer matches any form of the word performance
  mutate(title = (str_match(cite, "\\). (.+?)[.!?]")[,2])) %>%
  mutate(first_author = (str_match(cite, "(([A-Z][a-z]+,\\s[A-Z]\\.)(\\s[A-Z]\\.)?)")[,1]))

sum(!is.na(citations_tbl$first_author))