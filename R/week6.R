# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)
library(stringi)
library(rebus)
# line reserved for library call

# Data Import
citations <- stri_read_lines("../data/citations.txt", encoding = "CP1252")
citations_txt <- citations[stri_trim_both(citations) != ""] 
sum(length(citations)-length(citations_txt))
mean(nchar(citations_txt))
  
# Data Cleaning
citations_tbl %>%
  sample_n(20)
citations_tbl <- tibble(line = seq_along(citations_txt), cite = citations_txt) %>%
  str_sub(start = '|\\", end = '|\\") #still need to work on this one.

  
# practice area
writeLines(citations)
writeLines(citations_txt)
View(citations_tbl)
