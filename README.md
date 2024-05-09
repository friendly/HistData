
<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->

[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/HistData)](https://cran.r-project.org/package=HistData)
[![](http://cranlogs.r-pkg.org/badges/grand-total/HistData)](https://cran.r-project.org/package=HistData)
[![DOI](https://zenodo.org/badge/106572219.svg)](https://zenodo.org/badge/latestdoi/106572219)
[![HistData status
badge](https://friendly.r-universe.dev/badges/HistData)](https://friendly.r-universe.dev/HistData)
[![](https://img.shields.io/badge/documentation-blue)](https://friendly.github.io/HistData)

<!-- badges: end -->

# HistData <img src="man/figures/logo.png" align="right" height="200px" />

**Data Sets from the History of Statistics and Data Visualization**

Dev. Version: 0.9-2

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

They are also used in our book, [*A History of Data Visualization &
Graphic
Communication*](https://www.hup.harvard.edu/catalog.php?isbn=9780674975231)
(Friendly & Wainer, 2021). See also the [companion website for this
book](https://friendly.github.io/HistDataVis/).

If you are looking more widely for datasets to use for examples,
teaching or research, check out Vincent Arel-Bundock’s
[Rdatasets](https://vincentarelbundock.github.io/Rdatasets/) package,
with over 2200 datasets from various R packages, with this list of
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

Get the released version from CRAN or
[R-universe](https://friendly.r-universe.dev/)

    install.packages("HistData")
    install.packages('HistData', repos = 'https://friendly.r-universe.dev')

The development version can be installed to your R library directly from
github via:

    remotes::install_github("friendly/HistData")

## Data sets

Here are the data sets in the package, with links to their
documentation. Some topics are represented by two or more data sets.

``` r
# link dataset to pkgdown doc
refurl <- "http://friendly.github.io/HistData/reference/"

dsets <- vcdExtra::datasets("HistData") |> 
  dplyr::select(Item, Title) |> 
  dplyr::mutate(Item = glue::glue("[{Item}]({refurl}{Item}.html)")) 

#knitr::kable(dsets)

library(tinytable)
# tt(dsets) |>
#   format_tt(j = 1, markdown = TRUE) |>
#   style_tt(j = 1, bootstrap_css = "width: 30%;") |>
#   style_tt(j = 2, bootstrap_css = "width: 70%;")
tt(dsets, width = c(.2, .8)) |> 
    format_tt(j = 1, markdown = TRUE) 
```

| Item                                                                                     | Title                                                                              |
|------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
| [Arbuthnot](http://friendly.github.io/HistData/reference/Arbuthnot.html)                 | Arbuthnot’s data on male and female birth ratios                                   |
| [Armada](http://friendly.github.io/HistData/reference/Armada.html)                       | La Felicisima Armada                                                               |
| [Bowley](http://friendly.github.io/HistData/reference/Bowley.html)                       | Bowley’s data on values of British and Irish trade, 1855-1899                      |
| [Breslau](http://friendly.github.io/HistData/reference/Breslau.html)                     | Halley’s Breslau Life Table                                                        |
| [Cavendish](http://friendly.github.io/HistData/reference/Cavendish.html)                 | Cavendish’s Determinations of the Density of the Earth                             |
| [ChestSizes](http://friendly.github.io/HistData/reference/ChestSizes.html)               | Chest measurements of Scottish Militiamen                                          |
| [ChestStigler](http://friendly.github.io/HistData/reference/ChestStigler.html)           | Chest measurements of Scottish Militiamen                                          |
| [Cholera](http://friendly.github.io/HistData/reference/Cholera.html)                     | William Farr’s Data on Cholera in London, 1849                                     |
| [CholeraDeaths1849](http://friendly.github.io/HistData/reference/CholeraDeaths1849.html) | Daily Deaths from Cholera and Diarrhaea in England, 1849                           |
| [CushnyPeebles](http://friendly.github.io/HistData/reference/CushnyPeebles.html)         | Cushny-Peebles Data: Soporific Effects of Scopolamine Derivatives                  |
| [CushnyPeeblesN](http://friendly.github.io/HistData/reference/CushnyPeeblesN.html)       | Cushny-Peebles Data: Soporific Effects of Scopolamine Derivatives                  |
| [Dactyl](http://friendly.github.io/HistData/reference/Dactyl.html)                       | Edgeworth’s counts of dactyls in Virgil’s Aeneid                                   |
| [DrinksWages](http://friendly.github.io/HistData/reference/DrinksWages.html)             | Elderton and Pearson’s (1910) data on drinking and wages                           |
| [EdgeworthDeaths](http://friendly.github.io/HistData/reference/EdgeworthDeaths.html)     | Edgeworth’s Data on Death Rates in British Counties                                |
| [Fingerprints](http://friendly.github.io/HistData/reference/Fingerprints.html)           | Waite’s data on Patterns in Fingerprints                                           |
| [Galton](http://friendly.github.io/HistData/reference/Galton.html)                       | Galton’s data on the heights of parents and their children                         |
| [GaltonFamilies](http://friendly.github.io/HistData/reference/GaltonFamilies.html)       | Galton’s data on the heights of parents and their children, by child               |
| [Guerry](http://friendly.github.io/HistData/reference/Guerry.html)                       | Data from A.-M. Guerry, “Essay on the Moral Statistics of France”                  |
| [HalleyLifeTable](http://friendly.github.io/HistData/reference/HalleyLifeTable.html)     | Halley’s Life Table                                                                |
| [Jevons](http://friendly.github.io/HistData/reference/Jevons.html)                       | W. Stanley Jevons’ data on numerical discrimination                                |
| [Langren.all](http://friendly.github.io/HistData/reference/Langren.all.html)             | van Langren’s Data on Longitude Distance between Toledo and Rome                   |
| [Langren1644](http://friendly.github.io/HistData/reference/Langren1644.html)             | van Langren’s Data on Longitude Distance between Toledo and Rome                   |
| [Macdonell](http://friendly.github.io/HistData/reference/Macdonell.html)                 | Macdonell’s Data on Height and Finger Length of Criminals, used by Gosset (1908)   |
| [MacdonellDF](http://friendly.github.io/HistData/reference/MacdonellDF.html)             | Macdonell’s Data on Height and Finger Length of Criminals, used by Gosset (1908)   |
| [Mayer](http://friendly.github.io/HistData/reference/Mayer.html)                         | Mayer’s Data on the Libration of the Moon.                                         |
| [Michelson](http://friendly.github.io/HistData/reference/Michelson.html)                 | Michelson’s Determinations of the Velocity of Light                                |
| [MichelsonSets](http://friendly.github.io/HistData/reference/MichelsonSets.html)         | Michelson’s Determinations of the Velocity of Light                                |
| [Minard.cities](http://friendly.github.io/HistData/reference/Minard.cities.html)         | Data from Minard’s famous graphic map of Napoleon’s march on Moscow                |
| [Minard.temp](http://friendly.github.io/HistData/reference/Minard.temp.html)             | Data from Minard’s famous graphic map of Napoleon’s march on Moscow                |
| [Minard.troops](http://friendly.github.io/HistData/reference/Minard.troops.html)         | Data from Minard’s famous graphic map of Napoleon’s march on Moscow                |
| [Nightingale](http://friendly.github.io/HistData/reference/Nightingale.html)             | Florence Nightingale’s data on deaths from various causes in the Crimean War       |
| [OldMaps](http://friendly.github.io/HistData/reference/OldMaps.html)                     | Latitudes and Longitudes of 39 Points in 11 Old Maps                               |
| [PearsonLee](http://friendly.github.io/HistData/reference/PearsonLee.html)               | Pearson and Lee’s data on the heights of parents and children classified by gender |
| [PolioTrials](http://friendly.github.io/HistData/reference/PolioTrials.html)             | Polio Field Trials Data                                                            |
| [Pollen](http://friendly.github.io/HistData/reference/Pollen.html)                       | Pollen Data Challenge                                                              |
| [Prostitutes](http://friendly.github.io/HistData/reference/Prostitutes.html)             | Parent-Duchatelet’s time-series data on the number of prostitutes in Paris         |
| [Pyx](http://friendly.github.io/HistData/reference/Pyx.html)                             | Trial of the Pyx                                                                   |
| [Quarrels](http://friendly.github.io/HistData/reference/Quarrels.html)                   | Statistics of Deadly Quarrels                                                      |
| [Saturn](http://friendly.github.io/HistData/reference/Saturn.html)                       | Laplace’s Saturn data.                                                             |
| [Snow.dates](http://friendly.github.io/HistData/reference/Snow.dates.html)               | John Snow’s Map and Data on the 1854 London Cholera Outbreak                       |
| [Snow.deaths](http://friendly.github.io/HistData/reference/Snow.deaths.html)             | John Snow’s Map and Data on the 1854 London Cholera Outbreak                       |
| [Snow.deaths2](http://friendly.github.io/HistData/reference/Snow.deaths2.html)           | John Snow’s Map and Data on the 1854 London Cholera Outbreak                       |
| [Snow.polygons](http://friendly.github.io/HistData/reference/Snow.polygons.html)         | John Snow’s Map and Data on the 1854 London Cholera Outbreak                       |
| [Snow.pumps](http://friendly.github.io/HistData/reference/Snow.pumps.html)               | John Snow’s Map and Data on the 1854 London Cholera Outbreak                       |
| [Snow.streets](http://friendly.github.io/HistData/reference/Snow.streets.html)           | John Snow’s Map and Data on the 1854 London Cholera Outbreak                       |
| [Virginis](http://friendly.github.io/HistData/reference/Virginis.html)                   | John F. W. Herschel’s Data on the Orbit of the Twin Stars gamma *Virginis*         |
| [Virginis.interp](http://friendly.github.io/HistData/reference/Virginis.interp.html)     | John F. W. Herschel’s Data on the Orbit of the Twin Stars gamma *Virginis*         |
| [Wheat](http://friendly.github.io/HistData/reference/Wheat.html)                         | Playfair’s Data on Wages and the Price of Wheat                                    |
| [Wheat.monarchs](http://friendly.github.io/HistData/reference/Wheat.monarchs.html)       | Playfair’s Data on Wages and the Price of Wheat                                    |
| [Yeast](http://friendly.github.io/HistData/reference/Yeast.html)                         | Student’s (1906) Yeast Cell Counts                                                 |
| [YeastD.mat](http://friendly.github.io/HistData/reference/YeastD.mat.html)               | Student’s (1906) Yeast Cell Counts                                                 |
| [ZeaMays](http://friendly.github.io/HistData/reference/ZeaMays.html)                     | Darwin’s Heights of Cross- and Self-fertilized Zea May Pairs                       |

``` r
#    save_tt("html") |>
#    knitr::asis_output()
```

## Contributors

Please note that the `HistData` project is released with a [Contributor
Code of
Conduct](https://friendly.github.io/HistData/CODE_OF_CONDUCT.html). By
contributing to this project, you agree to abide by its terms.

Over the years, many people have contributed new data sets, offered
corrections, suggestions, or documentation examples. They are
appreciatedly listed below:

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

Friendly, M. & Wainer, H. (2021). [*A History of Data Visualization and
Graphic
Communication*](https://www.hup.harvard.edu/catalog.php?isbn=9780674975231).
Harvard University Press. Companion [web
site](https://friendly.github.io/HistDataVis/)
