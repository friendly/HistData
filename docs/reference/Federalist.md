# The Federalist Papers: corpus metadata, marker-word counts, and text

Three linked datasets built from the 85 essays of *The Federalist*
(1787-1788), published under the pseudonym "Publius" by Alexander
Hamilton, James Madison, and John Jay to promote ratification of the
U.S. Constitution. Twelve of the essays (49-58, 62, 63) have
long-disputed authorship between Hamilton and Madison.

## Format

`Federalist_corpus`: A data frame with 85 observations (one per essay)
on the following 10 variables.

- `essay`:

  integer: essay number, 1-85

- `title`:

  character: essay heading as printed

- `venue`:

  character: original publication venue (`NA` for essay 58)

- `date`:

  Date: original publication date (`NA` for 35 essays; see Details)

- `byline`:

  factor: author as originally printed, with levels `Hamilton`,
  `Madison`, `Jay`, `Hamilton and Madison`, `Hamilton or Madison`

- `author`:

  factor: traditional/Mosteller & Wallace-consensus attribution, with
  levels `Hamilton`, `Madison`, `Jay`, `Disputed`

- `n_words`:

  integer: essay body word count

- `word_length`:

  numeric: mean word length in characters

- `word_length_sd`:

  numeric: standard deviation of word length

- `n_para`:

  integer: number of paragraphs in the essay body

`Federalist_markers`: A data frame with 1020 observations (85 essays x
12 words, long format) on the following 3 variables.

- `essay`:

  integer: essay number, 1-85, joins to `Federalist_corpus$essay`

- `word`:

  factor: one of `upon`, `enough`, `whilst`, `while`, `by`, `on`, `to`,
  `this`, `there`, `any`, `an`, `also`

- `n`:

  integer: raw count of `word` in that essay

`Federalist_text`: A data frame with 1091 observations (one row per
essay paragraph, long format) on the following 3 variables.

- `essay`:

  integer: essay number, 1-85, joins to `Federalist_corpus$essay`

- `paragraph`:

  integer: paragraph number within the essay, starting at 1

- `text`:

  character: cleaned paragraph text

## Source

Project Gutenberg eBook \#18, <https://www.gutenberg.org/ebooks/18>.

## Details

The papers are historically important in the development of statistical
inference in their own right: Mosteller & Wallace's 1963/1964 Bayesian
analysis of function-word frequencies, resolving the disputed authorship
in Madison's favor, is a landmark early application of applied Bayesian
methods to a real inference problem.

`Federalist_corpus` carries two distinct author variables that are worth
keeping separate rather than collapsing into one: `byline`, the author
as originally printed on the page (which is itself sometimes "Hamilton
or Madison" or "Hamilton and Madison" – the original ambiguity), and
`author`, the traditional/Mosteller & Wallace-consensus grouping
conventionally used for analysis (Hamilton/Madison/Jay/Disputed). These
genuinely disagree for essay 58: printed flatly as "Madison" here, but
traditionally still grouped with the eleven other "disputed" essays.
`date` is `NA` for 35 essays – all essays originally published in the
*Independent Journal*, all published directly in McLean's bound edition
rather than serialized, and No. 58 – because this transcription simply
doesn't carry a dateline for them, not because the dates are unknown to
history.

`Federalist_markers` gives raw counts for twelve function words with
documented Hamilton/Madison discriminating power. All twelve are
confirmed members of Mosteller & Wallace's own original word sets (see
References below). Rates (e.g. per 1,000 words) are not stored here –
join on `essay` against `Federalist_corpus$n_words` to compute them,
rather than storing a derived value that could go stale.

`Federalist_text` gives cleaned prose – footnote markers and line-wraps
removed, original casing and punctuation kept – for general text-mining
use (tokenization, n-grams, or discriminator words beyond the twelve
curated here).

Essay No. 70 appears twice in the source Gutenberg transcription – two
genuine historical textual variants, the first flagged with an editorial
note in place of a title. The second (clean) version is used here; the
first is dropped.

## Prior work

Two existing packages carry Federalist Papers data, both with real gaps
this fills:

- `DiscreteDatasets::federalist` (CRAN, active): a 77 x 1984 wide matrix
  of `doc_no`, `doc_author`, and raw counts of the 1,500 most frequent
  words, built from the `syllogi` package's Gutenberg text. It excludes
  Jay's essays and one co-authored essay entirely, and deduplicates No.
  70 (as done here too). No title/venue/date metadata, no curated
  marker-word set, no paragraph-level text.

- `corpus::federalist`: an 85-row raw-text corpus (title, author, text),
  used e.g. in Evangeline Reynolds' worked example
  (<https://evangelinereynolds.netlify.app/post/federalist-papers/>) via
  `quanteda` document-feature matrices. The `corpus` package itself was
  archived and removed from CRAN on 2023-05-20, so it is no longer
  [`install.packages()`](https://rdrr.io/r/utils/install.packages.html)-able.
  Essay-level only; no paragraph granularity.

Ruoyu Zhang's clustering-analysis writeup
(<https://rpubs.com/ruoyuzhang426/federalist_papers>) independently
reproduces Mosteller (1963)'s 70-word function-word list as per-essay
word *proportions* (rather than raw counts) with an `Author` variable
distinguishing collaborative ("COL") and disputed ("DIS") essays – a
third independent confirmation of the same underlying 70-word list used
here and in `DiscreteDatasets::federalist`.

## References

Mosteller, F. and Wallace, D. L. (1963). Inference in an Authorship
Problem. *Journal of the American Statistical Association*, 58(302),
275-309.

Mosteller, F. and Wallace, D. L. (1964). *Inference and Disputed
Authorship: The Federalist*. Addison-Wesley.

Adair, D. (1944). The Authorship of the Disputed Federalist Papers.
*William and Mary Quarterly*, 1(2), 97-122; 1(3), 235-264. (Origin of
the "while"/"whilst" marker, twenty years before Mosteller & Wallace.)

Jeong, S. W. and Ročková, V. (2025). From Small to Large Language
Models: Revisiting the Federalist Papers. arXiv:2503.01869. (Appendix D
reproduces Mosteller (1963)'s original function-word tables; independent
modern replication via LASSO recovers "whilst" and "upon" as the
strongest discriminators.)

## See also

`DiscreteDatasets::federalist` (CRAN); `corpus::federalist` (archived
from CRAN 2023-05-20).

## Examples

``` r

data(Federalist_corpus)
#> Warning: data set 'Federalist_corpus' not found
str(Federalist_corpus)
#> Error: object 'Federalist_corpus' not found
table(Federalist_corpus$author)
#> Error: object 'Federalist_corpus' not found

# byline vs. author disagree only for essay 58
subset(Federalist_corpus, byline != "Hamilton or Madison" &
                           byline != "Hamilton and Madison" &
                           author == "Disputed")
#> Error: object 'Federalist_corpus' not found

data(Federalist_markers)
#> Warning: data set 'Federalist_markers' not found
str(Federalist_markers)
#> Error: object 'Federalist_markers' not found

# reproduce the classic "upon" rate-per-1000-words comparison
upon <- subset(Federalist_markers, word == "upon")
#> Error: object 'Federalist_markers' not found
upon <- merge(upon, Federalist_corpus[c("essay", "author", "n_words")])
#> Error: object 'upon' not found
upon$rate_1000 <- 1000 * upon$n / upon$n_words
#> Error: object 'upon' not found
aggregate(rate_1000 ~ author, data = subset(upon, author != "Jay"), mean)
#> Error in eval(m$data, parent.frame()): object 'upon' not found

data(Federalist_text)
#> Warning: data set 'Federalist_text' not found
str(Federalist_text)
#> Error: object 'Federalist_text' not found
subset(Federalist_text, essay == 1 & paragraph == 1)
#> Error: object 'Federalist_text' not found
```
