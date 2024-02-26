# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse) # recommend we always load this first in our projects
library(stringi)



# Data Import
citations <- stri_read_lines("../data/citations.txt", encoding = "ISO-8859-1") # I used CP1252 for the encoding.
citations_txt <- citations[stri_trim_both(citations) != ""] # usually stri_trim only trims within a line
length(citations)-length(citations_txt)
mean(nchar(citations_txt)) # can also use mean(str_length(citations_txt))

# Data Cleaning
sample_n(citations_tbl, 20) %>%
  View
citations_tbl <- tibble(line = seq_along(citations_txt), cite = citations_txt) %>%
  mutate(cite = str_replace_all(cite, "[\"']","")) %>%
  mutate(year = as.integer(str_match(cite, "(([1-2][0-9]{3}))")[,1])) %>%
  mutate(page_start = as.integer((str_match(cite, "\\b(\\d+)(?=-)")[,1]))) %>%
  mutate(perf_ref = str_detect(str_to_lower(cite), "performance")) %>%
  mutate(title = (str_match(cite, "\\). (.+?)[.!?]")[,2])) %>%
  mutate(first_author = (str_match(cite, "(([A-Z][a-z]+,\\s[A-Z]\\.)(\\s[A-Z]\\.)?)")[,1]))

sum(!is.na(citations_tbl$first_author))


# updates during class
# how to find other encodings, for reference
tibble(stri_enc_list()) %>%
  filter(str_detect('stri_enc_list()', "windows")) %>%
  View

# other way to do line 10
citations_text <- citations[!str_detect(citations, "^\\s*$")]
citations_text <- str_subset(citations, pattern = "\\S+")
citations_text <- citations[!stri_isempty(citations)]

# other line 17
tibble(line = 1:length(citations_txt), cite = citations_txt)

# other line 18
mutate(cite = str_remove_all(cite, "[\"']"))

# other line 19
mutate(year = (str_extract(cite, "\\d{4}"))
       
# other line 20
mutate(page_start = (str_match(cite, "\\b(\\d+)(?=-)")[,1]))
mutate(page_start = (str_match(cite, "(\\d+)-\\d+")[,2]))

# other line 21
mutate(perf_ref = str_detect(cite, regex("performance", ignore_case=T)))
mutate(perf_ref = grepl(cite, regex("performance", ignore_case=T)))

# my original line 22

mutate(title = (str_match(cite, "\\d{4}\\)\\. ([^\\.]+)")[,2])