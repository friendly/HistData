#' ---
#' title: The Federalist Papers -- corpus metadata, marker-word counts, and paragraph text
#' ---

# data from: Project Gutenberg eBook #18, https://www.gutenberg.org/ebooks/18
#
# Builds three datasets from the 85 Federalist essays:
#   Federalist_corpus  -- one row per essay: title, venue, date, byline (as
#                          printed), author (traditional/M&W consensus),
#                          n_words, word_length, word_length_sd, n_para
#   Federalist_markers -- long format, one row per essay x marker word (12
#                          words with documented Hamilton/Madison discriminating
#                          power, per Mosteller & Wallace 1963/1964)
#   Federalist_text    -- long format, one row per essay x paragraph, cleaned
#                          text for general text-mining use
#
# Prior work (see roxygen @references for full citations): DiscreteDatasets::federalist
# (CRAN, wide top-1500-word matrix, excludes Jay/co-authored/dedupes No.70);
# corpus::federalist (archived from CRAN 2023-05-20, essay-level raw text only).
# Neither carries title/venue/date metadata, a curated marker-word set, or
# paragraph-level text.
#
# Known quirks handled here, not silently "fixed":
#   - No. 70 appears TWICE in this Gutenberg edition (two genuine historical
#     textual variants); we keep the second (clean) one and drop the first,
#     which has an editorial note in place of a title.
#   - `byline` (as printed on the page) and `author` (traditional/M&W-consensus
#     grouping) genuinely disagree for essay 58: printed flatly as "MADISON"
#     here, but M&W's "disputed" set traditionally includes it.
#   - `date` is NA for 35 essays -- all 26 "Independent Journal" essays, all 8
#     "McLEAN's Edition" essays, and No. 58 (no dateline at all). This is a
#     genuine property of this transcription, not a parsing failure -- the
#     historical dates ARE knowable from other sources, but that would mean
#     supplementing with external data rather than deriving from the text.

library(gutenbergr)
library(dplyr)
library(stringr)
library(purrr)
library(tidyr)

## ---- 1. Get the text (cached locally after first pull) -------------------

raw_cache <- "data-raw/Federalist-raw.txt"
if (!file.exists(raw_cache)) {
  fed_raw <- gutenberg_download(18) |> pull(text) |> paste(collapse = "\n")
  writeLines(fed_raw, raw_cache, useBytes = TRUE)
} else {
  fed_raw <- paste(readLines(raw_cache, encoding = "UTF-8", warn = FALSE), collapse = "\n")
}

## ---- 2. Split into the 85 numbered essays, dropping the duplicate No. 70 -

blocks <- str_split(fed_raw, "(?=\\nTHE FEDERALIST\\.\\nNo\\. [IVXLC]+\\.\\n)")[[1]]
blocks <- blocks[str_detect(blocks, "^\\nTHE FEDERALIST\\.\\nNo\\. ")]
romans <- str_match(blocks, "No\\.\\s+([IVXLC]+)\\.")[, 2]
nums <- as.integer(as.roman(romans))
keep <- !(nums == 70 & str_detect(blocks, "two slightly different versions"))
blocks <- blocks[keep]
nums <- nums[keep]
stopifnot(length(blocks) == 85, all(sort(nums) == 1:85))

## ---- 3. Per-essay metadata: title, venue, date, byline, word stats, paragraphs

month_names <- "January|February|March|April|May|June|July|August|September|October|November|December"
date_pat <- str_glue("({month_names}) \\d{{1,2}}, \\d{{4}}")

parse_essay <- function(block, n) {
  rest <- str_remove(block, "^\\nTHE FEDERALIST\\.\\nNo\\.\\s+[IVXLC]+\\.\\n+")

  byline_raw <- str_match(rest, "\\n(HAMILTON(?: OR MADISON| AND MADISON)?|MADISON|JAY)\\n+\\s*\\nTo the People")[, 2]
  byline <- case_when(
    byline_raw == "HAMILTON" ~ "Hamilton",
    byline_raw == "MADISON" ~ "Madison",
    byline_raw == "JAY" ~ "Jay",
    byline_raw == "HAMILTON AND MADISON" ~ "Hamilton and Madison",
    byline_raw == "HAMILTON OR MADISON" ~ "Hamilton or Madison",
    TRUE ~ NA_character_
  )
  pre_byline <- str_split(rest, "\\n(HAMILTON(?: OR MADISON| AND MADISON)?|MADISON|JAY)\\n")[[1]][1]
  pre_byline <- str_trim(pre_byline)

  # split into blank-line-separated chunks. venue/date can be one chunk
  # ("From the New York Packet. Friday, ...") or two (venue chunk, then a
  # separate date-only chunk) -- take everything from the first "For"/"From"
  # chunk onward as the venue block. (Can't just regex-search "From"/"For"
  # anywhere in pre_byline: several essay titles contain "From" mid-sentence,
  # e.g. "Concerning Dangers From Foreign Force and Influence".)
  chunks <- str_split(pre_byline, "\\n\\s*\\n")[[1]] |> str_trim()
  chunks <- chunks[chunks != ""]
  venue_idx <- which(str_detect(chunks, "^(For|From)\\s"))

  if (length(venue_idx) > 0) {
    venue_idx <- venue_idx[1]
    venue_chunk <- paste(chunks[venue_idx:length(chunks)], collapse = " ")
    title_chunks <- if (venue_idx > 1) chunks[seq_len(venue_idx - 1)] else character(0)
  } else {
    venue_chunk <- NA_character_
    title_chunks <- chunks
  }

  venue <- if (!is.na(venue_chunk)) str_match(venue_chunk, "^(?:For|From) (?:the |)([^.]+?)\\.")[, 2] else NA_character_
  date_str <- if (!is.na(venue_chunk)) str_match(venue_chunk, date_pat)[, 1] else NA_character_
  date <- if (!is.na(date_str)) as.Date(date_str, format = "%B %d, %Y") else as.Date(NA)

  title <- paste(title_chunks, collapse = " ") |> str_replace_all("\\s+", " ") |> str_trim()

  body_start <- str_locate(rest, "To the People")[1]
  body <- str_sub(rest, body_start)
  body <- str_extract(body, "(?s)^.*?(?=PUBLIUS\\.)")
  if (is.na(body)) body <- str_sub(rest, body_start)

  words <- str_extract_all(str_to_lower(body), "[a-z']+")[[1]]

  paras <- str_split(body, "\\n\\s*\\n")[[1]]
  paras <- str_remove_all(paras, "\\[\\d+\\]")
  paras <- str_trim(str_replace_all(paras, "\\s+", " "))
  paras <- paras[paras != ""]

  list(
    meta = tibble(essay = n, title = title, venue = venue, date = date,
                   byline = byline, n_words = length(words),
                   word_length = round(mean(nchar(words)), 3),
                   word_length_sd = round(sd(nchar(words)), 3),
                   n_para = length(paras)),
    words = words,
    paras = paras
  )
}

parsed <- map2(blocks, nums, parse_essay)
parsed <- parsed[order(nums)]
nums_sorted <- sort(nums)

## ---- 4. Federalist_corpus --------------------------------------------------
## traditional/Mosteller & Wallace-consensus authorship grouping, distinct
## from `byline` (what the page actually prints)

author_of <- function(n) {
  case_when(
    n %in% c(2, 3, 4, 5, 64) ~ "Jay",
    n %in% c(1, 6:9, 11:13, 15:17, 21:36, 59:61, 65:85) ~ "Hamilton",
    n %in% c(49:58, 62, 63) ~ "Disputed",
    n %in% c(10, 14, 18:20, 37:48) ~ "Madison",
    TRUE ~ NA_character_
  )
}

Federalist_corpus <- map_dfr(parsed, "meta") |>
  mutate(
    byline = factor(byline, levels = c("Hamilton", "Madison", "Jay", "Hamilton and Madison", "Hamilton or Madison")),
    author = factor(author_of(essay), levels = c("Hamilton", "Madison", "Jay", "Disputed"))
  ) |>
  arrange(essay) |>
  as.data.frame()

str(Federalist_corpus)
save(Federalist_corpus, file = "data/Federalist_corpus.RData")

## ---- 5. Federalist_markers --------------------------------------------------
## 12 words with documented Hamilton/Madison discriminating power:
## upon, enough, whilst, while, by, on (Priceonomics; Harvard Crimson 1962;
## Douglass Adair 1944) and to, this, there, any, an, also (posterior-interval
## evidence, Albert, "Probability and Bayesian Modeling", case study chapter).
## All twelve confirmed present in Mosteller (1963)'s own function-word tables,
## reproduced in Jeong & Ročková (2025) arXiv:2503.01869, Appendix D.

marker_words <- c("upon", "enough", "whilst", "while", "by", "on",
                   "to", "this", "there", "any", "an", "also")

count_markers <- function(words, n) {
  tibble(essay = n, word = marker_words, n = map_int(marker_words, ~ sum(words == .x)))
}

Federalist_markers <- map2_dfr(map(parsed, "words"), nums_sorted, count_markers) |>
  mutate(word = factor(word, levels = marker_words)) |>
  arrange(essay, word) |>
  as.data.frame()

str(Federalist_markers)
save(Federalist_markers, file = "data/Federalist_markers.RData")

## ---- 6. Federalist_text -----------------------------------------------------
## paragraph-level cleaned text (footnote markers stripped, line-wraps
## joined, original casing/punctuation kept) for general text-mining use

Federalist_text <- map2_dfr(parsed, nums_sorted, function(p, n) {
  if (length(p$paras) == 0) return(tibble(essay = integer(), paragraph = integer(), text = character()))
  tibble(essay = n, paragraph = seq_along(p$paras), text = p$paras)
}) |>
  arrange(essay, paragraph) |>
  as.data.frame()

str(Federalist_text)
save(Federalist_text, file = "data/Federalist_text.RData")
