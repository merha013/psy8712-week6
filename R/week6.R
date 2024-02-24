# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)
library(stringi)
library(rebus)
library(dplyr)

# Data Import
citations <- stri_read_lines("../data/citations.txt", encoding = "CP1252")
citations_txt <- citations[stri_trim_both(citations) != ""] 
sum(length(citations)-length(citations_txt))
mean(nchar(citations_txt))
  
# Data Cleaning
citations_tbl %>%
  sample_n(20)
citations_tbl <- tibble(line = seq_along(citations_txt), cite = citations_txt) %>%
# input line 18
  mutate(year = (str_match(string = cite, pattern = "(([1-2][0-9]{3}))")[,1])) %>%
  mutate(page_start = (str_match(string = cite, pattern = "\\b(\\d+)(?=-)")[,1])) %>%
  mutate(perf_ref = str_detect(string = cite, pattern = "performance")) %>% # need to ensure this is capturing capitalization as well
  mutate(title = (str_match(string = cite, pattern = "\\). (.+?)[.!?]")[,2])) %>%
  mutate(first_author = (str_match(string = cite, pattern ="(([A-Z][a-z]+,\\s[A-Z]\\.)(\\s[A-Z]\\.)?)")[,1]))

sum(!is.na(citations_tbl$first_author))


#practice area for line 18
mutate(cite = str_replace_all(string = citations_tbl$cite, pattern = "[\"|']", replacement = ""))
mutate(cite = str_replace_all(coll(string = citations_tbl$cite, pattern = "[\"|']", replacement = ""))
mutate(str_replace_all(string = citations_tbl$cite, pattern = "[\"\']", "")
str_replace_all(citations_tbl$cite, pattern = "[\"']", replacement = "")


# practice area for line 21
mutate(perf_ref = str_detect(string = citations_tbl$cite, pattern = regex("performance", negate = TRUE))
       mutate(perf_ref = str_detect(string = citations_tbl$cite, pattern = regex("performance", ignore_case = TRUE))
              