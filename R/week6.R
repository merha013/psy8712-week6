# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)
library(stringi)
library(rebus)
# library(dplyr)

# Data Import
citations <- stri_read_lines("../data/citations.txt", encoding = "CP1252")
citations_txt <- citations[stri_trim_both(citations) != ""] 
sum(length(citations)-length(citations_txt))
mean(nchar(citations_txt))
  
# Data Cleaning
citations_tbl %>%
  sample_n(20)
citations_tbl <- tibble(line = seq_along(citations_txt), cite = citations_txt) %>%
  # str_replace_all(coll("\"'"), "")    # str_replace_all("[\"']", "")
  mutate(year = (str_match(string = citations_tbl$cite, pattern = "(([1-2][0-9]{3}))")[,1])) %>% 
  mutate(citations_tbl, page_start = (str_match(string = citations_tbl$cite, pattern = "\\b(\\d+)(?=-)")[,1])) 

mutate(perf_ref = )


# practice area
writeLines(citations)
writeLines(citations_txt)
View(citations_tbl)
is.atomic(citations_tbl)
class(citations_tbl)
