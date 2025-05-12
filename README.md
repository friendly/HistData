
<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->

[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/HistData)](https://cran.r-project.org/package=HistData)
[![HistData status
badge](https://friendly.r-universe.dev/badges/HistData)](https://friendly.r-universe.dev/HistData)
[![Last
Commit](https://img.shields.io/github/last-commit/friendly/HistData)](https://github.com/friendly/HistData)
[![cranlog](http://cranlogs.r-pkg.org/badges/grand-total/HistData)](https://cran.r-project.org/package=HistData)
[![DOI](https://zenodo.org/badge/106572219.svg)](https://zenodo.org/badge/latestdoi/106572219)
[![docs](https://img.shields.io/badge/documentation-blue)](https://friendly.github.io/HistData/)

<!-- badges: end -->

# HistData <img src="man/figures/logo.png" align="right" height="200px" />

**Data Sets from the History of Statistics and Data Visualization**

Dev. Version: 0.9-4

The `HistData` package provides a collection of small data sets that are
interesting and important in the history of statistics and data
visualization. The goal of the package is to make these available, both
for instructional use (as examples, problem sets or projects) and for
historical research (extending or criticizing a previous analysis). Some
of these present interesting challenges, or opportunities to “show off”,
with graphics or analysis in R.

Many of the data sets have examples which reproduce an historical graph
or analysis. These are meant mainly as starters for more extensive
re-analysis or graphical elaboration. If you are interested in any of
these problems or data sets, I’ve purposely left lots of room to do
better!

They are part of a program of research called *statistical
historiography* (Friendly, 2007; Friendly & Denis, 2001; Friendly et-al,
2016) meaning the use of statistical methods to study problems and
questions in the history of statistics and graphics. A main aspect of
this is the increased understanding of historical problems in science
and data analysis trough the process of trying to reproduce a graph or
analysis using modern methods. I call this “Re-visioning”, meaning *to
see again, hopefully in a new light*.

They are also used in our book, (Friendly & Wainer, 2021), *A History of
Data Visualization & Graphic Communication*,
<https://www.hup.harvard.edu/books/9780674975231>. See also the
[companion website for this
book](https://friendly.github.io/HistDataVis/).

If you are looking more widely for datasets to use for examples,
teaching or research, check out Vincent Arel-Bundock’s
[Rdatasets](https://vincentarelbundock.github.io/Rdatasets/) package,
with over 2500 datasets from various R packages, with this list of
[Available
datasets](https://vincentarelbundock.github.io/Rdatasets/articles/data.html).

### Data science

There is another R aspect that should be noted here: A great deal of
“data sciency” work was involved in constructing this package, alas (for
teaching) not captured in the resulting CRAN-friendly package.

- In some cases, data had to be **extracted** from historical documents,
  using a variety of techniques (web scraping, OCR of PDS files followed
  by conversion to a data set), each problem with its own toolbox, in R
  or outside. In many cases, transcription errors had to be corrected
  with code or manually;
- **digitization** of data from an image;
- **conversion** of text-based data sets to a CSV file and then to an
  `.RData` file with proper column names. Ever seen a Unix `.shar`
  (shell archive) file? Well, I have.
- **cleaning** variable names, e.g., using `janitor::clean_names()`, or,
  in some cases, manually editing an excel file.
- Applying **type-conversion**, e.g., `chr` to `factor` or `ordered`;
  constructing appropriate contrasts for factors to facilitate
  re-analysis.
- **tidying** data.frames: long \<–\> wide, abbreviations of character
  string labels, …
- **documentation**: The thankless task? No – considerable effort was
  made to give detailed descriptions, notes on methods, executable
  examples, references to original sources and analyses, …

## Installation

Get the released version from CRAN

    install.packages("HistData")

The development version can be installed to your R library directly from
github or my [R-universe](https://friendly.r-universe.dev/) via:

    install.packages('HistData', repos = 'https://friendly.r-universe.dev')
    remotes::install_github("friendly/HistData")

## Data sets

Here are the data sets in the package, with links to their
documentation. Some topics are represented by two or more data sets.

``` r
# link dataset to pkgdown doc
refurl <- "https://friendly.github.io/HistData/reference/"

dsets <- vcdExtra::datasets("HistData") |> 
  dplyr::select(Item, Title) |> 
  dplyr::mutate(Item = glue::glue("[{Item}]({refurl}{Item}.html)")) 

library(tinytable)
# tt(dsets) |>
#   format_tt(j = 1, markdown = TRUE) |>
#   style_tt(j = 1, bootstrap_css = "width: 30%;") |>
#   style_tt(j = 2, bootstrap_css = "width: 70%;")
tt(dsets, width = c(.2, .8)) |> 
    format_tt(j = 1, markdown = TRUE) 
```

| Item | Title |
|----|----|
| [Arbuthnot](https://friendly.github.io/HistData/reference/Arbuthnot.html) | Arbuthnot’s data on male and female birth ratios |
| [Armada](https://friendly.github.io/HistData/reference/Armada.html) | La Felicisima Armada |
| [Bowley](https://friendly.github.io/HistData/reference/Bowley.html) | Bowley’s data on values of British and Irish trade, 1855-1899 |
| [Breslau](https://friendly.github.io/HistData/reference/Breslau.html) | Halley’s Breslau Life Table |
| [Cavendish](https://friendly.github.io/HistData/reference/Cavendish.html) | Cavendish’s Determinations of the Density of the Earth |
| [ChestSizes](https://friendly.github.io/HistData/reference/ChestSizes.html) | Chest measurements of Scottish Militiamen |
| [ChestStigler](https://friendly.github.io/HistData/reference/ChestStigler.html) | Chest measurements of Scottish Militiamen |
| [Cholera](https://friendly.github.io/HistData/reference/Cholera.html) | William Farr’s Data on Cholera in London, 1849 |
| [CholeraDeaths1849](https://friendly.github.io/HistData/reference/CholeraDeaths1849.html) | Daily Deaths from Cholera and Diarrhaea in England, 1849 |
| [CushnyPeebles](https://friendly.github.io/HistData/reference/CushnyPeebles.html) | Cushny-Peebles Data: Soporific Effects of Scopolamine Derivatives |
| [CushnyPeeblesN](https://friendly.github.io/HistData/reference/CushnyPeeblesN.html) | Cushny-Peebles Data: Soporific Effects of Scopolamine Derivatives |
| [Dactyl](https://friendly.github.io/HistData/reference/Dactyl.html) | Edgeworth’s counts of dactyls in Virgil’s Aeneid |
| [DrinksWages](https://friendly.github.io/HistData/reference/DrinksWages.html) | Elderton and Pearson’s (1910) data on drinking and wages |
| [EdgeworthDeaths](https://friendly.github.io/HistData/reference/EdgeworthDeaths.html) | Edgeworth’s Data on Death Rates in British Counties |
| [Fingerprints](https://friendly.github.io/HistData/reference/Fingerprints.html) | Waite’s data on Patterns in Fingerprints |
| [Galton](https://friendly.github.io/HistData/reference/Galton.html) | Galton’s data on the heights of parents and their children |
| [GaltonFamilies](https://friendly.github.io/HistData/reference/GaltonFamilies.html) | Galton’s data on the heights of parents and their children, by child |
| [Guerry](https://friendly.github.io/HistData/reference/Guerry.html) | Data from A.-M. Guerry, “Essay on the Moral Statistics of France” |
| [HalleyLifeTable](https://friendly.github.io/HistData/reference/HalleyLifeTable.html) | Halley’s Life Table |
| [Jevons](https://friendly.github.io/HistData/reference/Jevons.html) | W. Stanley Jevons’ data on numerical discrimination |
| [Langren.all](https://friendly.github.io/HistData/reference/Langren.all.html) | van Langren’s Data on Longitude Distance between Toledo and Rome |
| [Langren1644](https://friendly.github.io/HistData/reference/Langren1644.html) | van Langren’s Data on Longitude Distance between Toledo and Rome |
| [Macdonell](https://friendly.github.io/HistData/reference/Macdonell.html) | Macdonell’s Data on Height and Finger Length of Criminals, used by Gosset (1908) |
| [MacdonellDF](https://friendly.github.io/HistData/reference/MacdonellDF.html) | Macdonell’s Data on Height and Finger Length of Criminals, used by Gosset (1908) |
| [Mayer](https://friendly.github.io/HistData/reference/Mayer.html) | Mayer’s Data on the Libration of the Moon. |
| [Michelson](https://friendly.github.io/HistData/reference/Michelson.html) | Michelson’s Determinations of the Velocity of Light |
| [MichelsonSets](https://friendly.github.io/HistData/reference/MichelsonSets.html) | Michelson’s Determinations of the Velocity of Light |
| [Minard.cities](https://friendly.github.io/HistData/reference/Minard.cities.html) | Data from Minard’s famous graphic map of Napoleon’s march on Moscow |
| [Minard.temp](https://friendly.github.io/HistData/reference/Minard.temp.html) | Data from Minard’s famous graphic map of Napoleon’s march on Moscow |
| [Minard.troops](https://friendly.github.io/HistData/reference/Minard.troops.html) | Data from Minard’s famous graphic map of Napoleon’s march on Moscow |
| [Nightingale](https://friendly.github.io/HistData/reference/Nightingale.html) | Florence Nightingale’s data on deaths from various causes in the Crimean War |
| [OldMaps](https://friendly.github.io/HistData/reference/OldMaps.html) | Latitudes and Longitudes of 39 Points in 11 Old Maps |
| [PearsonLee](https://friendly.github.io/HistData/reference/PearsonLee.html) | Pearson and Lee’s data on the heights of parents and children classified by gender |
| [PolioTrials](https://friendly.github.io/HistData/reference/PolioTrials.html) | Polio Field Trials Data |
| [Pollen](https://friendly.github.io/HistData/reference/Pollen.html) | Pollen Data Challenge |
| [Prostitutes](https://friendly.github.io/HistData/reference/Prostitutes.html) | Parent-Duchatelet’s time-series data on the number of prostitutes in Paris |
| [Pyx](https://friendly.github.io/HistData/reference/Pyx.html) | Trial of the Pyx |
| [Quarrels](https://friendly.github.io/HistData/reference/Quarrels.html) | Statistics of Deadly Quarrels |
| [Saturn](https://friendly.github.io/HistData/reference/Saturn.html) | Laplace’s Saturn data. |
| [Snow.dates](https://friendly.github.io/HistData/reference/Snow.dates.html) | John Snow’s Map and Data on the 1854 London Cholera Outbreak |
| [Snow.deaths](https://friendly.github.io/HistData/reference/Snow.deaths.html) | John Snow’s Map and Data on the 1854 London Cholera Outbreak |
| [Snow.deaths2](https://friendly.github.io/HistData/reference/Snow.deaths2.html) | John Snow’s Map and Data on the 1854 London Cholera Outbreak |
| [Snow.polygons](https://friendly.github.io/HistData/reference/Snow.polygons.html) | John Snow’s Map and Data on the 1854 London Cholera Outbreak |
| [Snow.pumps](https://friendly.github.io/HistData/reference/Snow.pumps.html) | John Snow’s Map and Data on the 1854 London Cholera Outbreak |
| [Snow.streets](https://friendly.github.io/HistData/reference/Snow.streets.html) | John Snow’s Map and Data on the 1854 London Cholera Outbreak |
| [Virginis](https://friendly.github.io/HistData/reference/Virginis.html) | John F. W. Herschel’s Data on the Orbit of the Twin Stars gamma *Virginis* |
| [Virginis.interp](https://friendly.github.io/HistData/reference/Virginis.interp.html) | John F. W. Herschel’s Data on the Orbit of the Twin Stars gamma *Virginis* |
| [Wheat](https://friendly.github.io/HistData/reference/Wheat.html) | Playfair’s Data on Wages and the Price of Wheat |
| [Wheat.monarchs](https://friendly.github.io/HistData/reference/Wheat.monarchs.html) | Playfair’s Data on Wages and the Price of Wheat |
| [Yeast](https://friendly.github.io/HistData/reference/Yeast.html) | Student’s (1906) Yeast Cell Counts |
| [YeastD.mat](https://friendly.github.io/HistData/reference/YeastD.mat.html) | Student’s (1906) Yeast Cell Counts |
| [ZeaMays](https://friendly.github.io/HistData/reference/ZeaMays.html) | Darwin’s Heights of Cross- and Self-fertilized Zea May Pairs |

## See also

- The [Horsekicks
  package](https://cran.r-project.org/package=Horsekicks) contains the
  classic data from von Bortkeiwicz, “Death by the kick of a horse in
  the Prussian Army”, with additional data on deaths by falling from a
  horse and by drowning. A
  [vignette](https://cran.r-project.org/web/packages/Horsekicks/vignettes/hkdeaths.html)
  provides some analyses.

- [Rdatasets](https://vincentarelbundock.github.io/Rdatasets/) is a
  collection of over 2500 datasets culled from CRAN packages to make
  them broadly accessible for teaching and statistical software
  development.

## Contributors

Please note that the `HistData` project is released with a [Contributor
Code of
Conduct](https://friendly.github.io/HistData/CODE_OF_CONDUCT.html). By
contributing to this project, you agree to abide by its terms.

Over the years, many people have contributed new data sets, offered
corrections, suggestions, or documentation examples. They are
appreciatively listed below:

David Bellhouse, Brian Clair, Stephane Dray, Luiz Droubi, Antoine de
Falguerolles, Monique Graf, James Hanley, Peter Li, Dennis Murphy, Jim
Oeppen, James Riley, Neville Verlander, Hadley Wickham.

## References

Friendly, M. (2007). A Brief History of Data Visualization. In Chen, C.,
Hardle, W. & Unwin, A. (eds.)  
*Handbook of Computational Statistics: Data Visualization*,
Springer-Verlag, III, Ch. 1, 1-34.
[Preprint](http://datavis.ca/papers/hbook.pdf)

Friendly, M. & Denis, D. (2001). Milestones in the history of thematic
cartography, statistical graphics, and data visualization. Web stite:
<http://datavis.ca/milestones/>

Friendly, M. & Sigal, M. & Harnanansingh, D. (2016). “The Milestones
Project: A Database for the History of Data Visualization,” In
Kostelnick, C. & Kimball, M. (ed.), *Visible Numbers: The History of
Data Visualization*, Ashgate Press, Chapter 10.
[Preprint](https://www.datavis.ca/papers/MilestonesProject.pdf)

Friendly, M. & Wainer, H. (2021). *A History of Data Visualization and
Graphic Communication*,
<https://www.hup.harvard.edu/books/9780674975231>, Harvard University
Press. Companion [web site](https://friendly.github.io/HistDataVis/)
