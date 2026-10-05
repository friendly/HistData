## Test environments
* local Windows 10 x64 install, R version 4.6.1 (2026-06-24 ucrt)
* win-builder R Under development (unstable) (2026-09-30 r90605 ucrt)

## R CMD check results
0 error(s) | 0 warning(s) | 1 note(s)

win-builder reports one possibly invalid URL:

* `https://observablehq.com/` (in the `HistData-Challenge` vignette): status 429, "Too Many Requests".
  The URL is valid; the Observable site rate-limits automated requests.



## Reverse dependencies checks

# > revdep()
# [1] "cholera" "statsr"  "UsingR" 

We checked 3 reverse dependencies, comparing R CMD check results across CRAN and dev versions of this package.

* We saw 0 new problems
* We failed to check 0 packages


## Comments

Changes since the last CRAN release (v. 1.0.0)

## Version 1.1.1

This is a minor release of the package, adding one new group of data sets

* Add `Handwashing` data: `Handwashing.clinics`, `Handwashing.monthly`, and `Handwashing.hospital`, Semmelweis' (1861) counts of births and maternal deaths from childbed fever at the Vienna maternity clinics, before and after he introduced handwashing in May 1847. Transcribed from the tables in the original 1861 book.
* Document `Perozzo`'s full provenance chain to the original 1880 printed table [Thx: RJ Andrews]
* Use `tinyplot` for some examples: the `Nightingale` line graphs, `Handwashing` (two clinics) and `Mayer`
* Remove an unreachable URL from the `PearsonLee` references

## Version 1.1.0

This is a modest release of the package, adding three new data sets and a vignette

* Add `Federalist` data: `Federalist_corpus`, `Federalist_markers`, and `Federalist_text`, built from the 85 Federalist Papers (Project Gutenberg #18) for Mosteller & Wallace-style authorship-attribution and text analysis
* Add link to N. Rennie's Snow Maps
* Package cleanup: get rid of `man-old`, reorganize `sandbox/`
* Add `Perozzo` data (Swedish census survivorship grid underlying Perozzo's 1880/1881 stereogram). This also poses another HistData challenge re-create his graphic, or do something better or different.
* Add `HistData-Challenge` vignette: "re-visioning" historical graphics as a form of statistical historiography, with a taxonomy of ways to re-create or extend a graphic and worked case studies for `Arbuthnot`, `Minard`, `Perozzo`, and `Snow`
* Add `Ebbinghaus` data: learning/relearning repetition counts for Ebbinghaus' (1885) forgetting-curve experiment and two replications (Heller, Mack & Seitz 1991; Murre & Dros 2015) [Thx: Jaap Murre]


