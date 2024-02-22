# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)
library(stringi)
library(rebus)
# line reserved for library call

# Data Import
citations <- stri_read_lines("../data/citations.txt", encoding = "CP1252")
citations_txt <- citations[stri_trim_both(citations) != ""] 
sum(str_count(citations) - str_count(citations_txt)) 
sum(length(citations)-length(citations_txt))
mean(nchar(citations_txt))
  
# Data Cleaning <--line 14
citations_tbl %>%
  sample_n(20)
citations_tbl <- 

  
# practice area
writeLines(citations)
writeLines(citations_txt)
str_view(citations, pattern = START %R% "C")
