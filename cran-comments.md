## Test environments
* local Windows 10 x64 install, R version 4.6.1 (2026-06-24 ucrt)
* win-builder R Under development (unstable) (2026-08-27 r90452 ucrt)

## R CMD check results
0 error(s) | 0 warning(s) | 0 note(s)



## Reverse dependencies checks


We checked 3 reverse dependencies, comparing R CMD check results across CRAN and dev versions of this package.

* We saw 0 new problems
* We failed to check 0 packages


## Comments

## Version 1.1.0

This is a modest release of the package, adding three new data sets and a vignette

* Add `Federalist` data: `Federalist_corpus`, `Federalist_markers`, and `Federalist_text`, built from the 85 Federalist Papers (Project Gutenberg #18) for Mosteller & Wallace-style authorship-attribution and text analysis
* Add link to N. Rennie's Snow Maps
* Package cleanup: get rid of `man-old`, reorganize `sandbox/`
* Add `Perozzo` data (Swedish census survivorship grid underlying Perozzo's 1880/1881 stereogram). This also poses another HistData challenge re-create his graphic, or do something better or different.
* Add `HistData-Challenge` vignette: "re-visioning" historical graphics as a form of statistical historiography, with a taxonomy of ways to re-create or extend a graphic and worked case studies for `Arbuthnot`, `Minard`, `Perozzo`, and `Snow`
* Add `Ebbinghaus` data: learning/relearning repetition counts for Ebbinghaus' (1885) forgetting-curve experiment and two replications (Heller, Mack & Seitz 1991; Murre & Dros 2015) [Thx: Jaap Murre]

