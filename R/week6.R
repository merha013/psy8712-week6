# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)
library(stringi)
library(rebus)
# line reserved for library call

# Data Import
citations <- stri_read_lines("../data/citations.txt", encoding = '297')
citations_txt <- stri_trim_both(citations, pattern = "[:WHITE_SPACE:]")
# stri_trim_both(citations, pattern = "[:space:]") <-- this works.?
# stri_trim_both(citations, pattern = "^[:space:]*$")
# citations[stri_trim_both(citations) != ""] 
# stri_trim_both(citations, pattern != "", negate = TRUE) 
# stri_trim(citations, side = "both")
sum(str_count(citations) - str_count(citations_txt))
#sum(str_length(citations)-str_length(citations_txt))
mean(nchar(citations_txt))
  
# Data Cleaning
citations_tbl %>%
  sample_n(20)
#next row should be on line 17
citations_tbl <- 
  
  
# practice area
writeLines(citations)
