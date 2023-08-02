
<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->

[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/HistData)](https://cran.r-project.org/package=HistData)
[![](http://cranlogs.r-pkg.org/badges/grand-total/HistData)](https://cran.r-project.org/package=HistData)
[![DOI](https://zenodo.org/badge/106572219.svg)](https://zenodo.org/badge/latestdoi/106572219)
<!-- badges: end -->

# HistData <img src="man/figures/HistData-logo.png" align="right" height="200px" />

**Data Sets from the History of Statistics and Data Visualization**

Dev. Version: 0.9-1

The `HistData` package provides a collection of small data sets that are
interesting and important in the history of statistics and data
visualization. The goal of the package is to make these available, both
for instructional use and for historical research. Some of these present
interesting challenges for graphics or analysis in R.

Some of the data sets have examples which reproduce an historical graph
or analysis. These are meant mainly as starters for more extensive
re-analysis or graphical elaboration.

They are part of a program of research called *statistical
historiography* (Friendly, 2007; Friendly & Denis, 2001; Friendly et-al,
2016) meaning the use of statistical methods to study problems and
questions in the history of statistics and graphics. They are also used
in our book, *A History of Data Visualization & Graphic Communication*
(Friendly & Wainer, 2021). See also the companion website for this book,
<https://friendly.github.io/HistDataVis/>.

## Installation

Get the released version from CRAN:

    install.packages("HistData")

The development version can be installed to your R library directly from
github via:

    if (!require(devtools)) install.packages("devtools")
    library(devtools)
    install_github("friendly/HistData")

## Data sets

Here are the data sets in the package. Some topics are represented by
two or more data sets.

``` r
vcdExtra::datasets("HistData") |> dplyr::select(Item, Title) |> knitr::kable()
```

| Item              | Title                                                                              |
|:------------------|:-----------------------------------------------------------------------------------|
| Arbuthnot         | Arbuthnot’s data on male and female birth ratios in London from 1629-1710.         |
| Armada            | La Felicisima Armada                                                               |
| Bowley            | Bowley’s data on values of British and Irish trade, 1855-1899                      |
| Breslau           | Halley’s Breslau Life Table                                                        |
| Cavendish         | Cavendish’s Determinations of the Density of the Earth                             |
| ChestSizes        | Chest measurements of Scottish Militiamen                                          |
| ChestStigler      | Chest measurements of Scottish Militiamen                                          |
| Cholera           | William Farr’s Data on Cholera in London, 1849                                     |
| CholeraDeaths1849 | Daily Deaths from Cholera and Diarrhaea in England, 1849                           |
| CushnyPeebles     | Cushny-Peebles Data: Soporific Effects of Scopolamine Derivatives                  |
| CushnyPeeblesN    | Cushny-Peebles Data: Soporific Effects of Scopolamine Derivatives                  |
| Dactyl            | Edgeworth’s counts of dactyls in Virgil’s Aeneid                                   |
| DrinksWages       | Elderton and Pearson’s (1910) data on drinking and wages                           |
| EdgeworthDeaths   | Edgeworth’s Data on Death Rates in British Counties                                |
| Fingerprints      | Waite’s data on Patterns in Fingerprints                                           |
| Galton            | Galton’s data on the heights of parents and their children                         |
| GaltonFamilies    | Galton’s data on the heights of parents and their children, by child               |
| Guerry            | Data from A.-M. Guerry, “Essay on the Moral Statistics of France”                  |
| HalleyLifeTable   | Halley’s Life Table                                                                |
| Jevons            | W. Stanley Jevons’ data on numerical discrimination                                |
| Langren.all       | van Langren’s Data on Longitude Distance between Toledo and Rome                   |
| Langren1644       | van Langren’s Data on Longitude Distance between Toledo and Rome                   |
| Macdonell         | Macdonell’s Data on Height and Finger Length of Criminals, used by Gosset (1908)   |
| MacdonellDF       | Macdonell’s Data on Height and Finger Length of Criminals, used by Gosset (1908)   |
| Mayer             | Mayer’s Data on the Libration of the Moon.                                         |
| Michelson         | Michelson’s Determinations of the Velocity of Light                                |
| MichelsonSets     | Michelson’s Determinations of the Velocity of Light                                |
| Minard.cities     | Data from Minard’s famous graphic map of Napoleon’s march on Moscow                |
| Minard.temp       | Data from Minard’s famous graphic map of Napoleon’s march on Moscow                |
| Minard.troops     | Data from Minard’s famous graphic map of Napoleon’s march on Moscow                |
| Nightingale       | Florence Nightingale’s data on deaths from various causes in the Crimean War       |
| OldMaps           | Latitudes and Longitudes of 39 Points in 11 Old Maps                               |
| PearsonLee        | Pearson and Lee’s data on the heights of parents and children classified by gender |
| PolioTrials       | Polio Field Trials Data                                                            |
| Pollen            | Pollen Data Challenge                                                              |
| Prostitutes       | Parent-Duchatelet’s time-series data on the number of prostitutes in Paris         |
| Pyx               | Trial of the Pyx                                                                   |
| Quarrels          | Statistics of Deadly Quarrels                                                      |
| Saturn            | Laplace’s Saturn data.                                                             |
| Snow.dates        | John Snow’s Map and Data on the 1854 London Cholera Outbreak                       |
| Snow.deaths       | John Snow’s Map and Data on the 1854 London Cholera Outbreak                       |
| Snow.deaths2      | John Snow’s Map and Data on the 1854 London Cholera Outbreak                       |
| Snow.polygons     | John Snow’s Map and Data on the 1854 London Cholera Outbreak                       |
| Snow.pumps        | John Snow’s Map and Data on the 1854 London Cholera Outbreak                       |
| Snow.streets      | John Snow’s Map and Data on the 1854 London Cholera Outbreak                       |
| Virginis          | John F. W. Herschel’s Data on the Orbit of the Twin Stars gamma *Virginis*         |
| Virginis.interp   | John F. W. Herschel’s Data on the Orbit of the Twin Stars gamma *Virginis*         |
| Wheat             | Playfair’s Data on Wages and the Price of Wheat                                    |
| Wheat.monarchs    | Playfair’s Data on Wages and the Price of Wheat                                    |
| Yeast             | Student’s (1906) Yeast Cell Counts                                                 |
| YeastD.mat        | Student’s (1906) Yeast Cell Counts                                                 |
| ZeaMays           | Darwin’s Heights of Cross- and Self-fertilized Zea May Pairs                       |

## References

Friendly, M. (2007). A Brief History of Data Visualization. In Chen, C.,
Hardle, W. & Unwin, A. (eds.)  
*Handbook of Computational Statistics: Data Visualization*,
Springer-Verlag, III, Ch. 1, 1-34.
[preprint](http://datavis.ca/papers/hbook.pdf)

Friendly, M. & Denis, D. (2001). Milestones in the history of thematic
cartography, statistical graphics, and data visualization.
<http://datavis.ca/milestones/>

Friendly, M. & Sigal, M. & Harnanansingh, D. (2016). “The Milestones
Project: A Database for the History of Data Visualization,” In
Kostelnick, C. & Kimball, M. (ed.), *Visible Numbers: The History of
Data Visualization*, Ashgate Press, Chapter 10.

Friendly, M. & Wainer, H. (2021). [*A History of Data Visualization and
Graphic
Communication*](https://www.hup.harvard.edu/catalog.php?isbn=9780674975231).
Harvard University Press.
