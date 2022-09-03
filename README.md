[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/HistData)](https://cran.r-project.org/package=HistData)
[![](http://cranlogs.r-pkg.org/badges/grand-total/HistData)](https://cran.r-project.org/package=HistData)
[![DOI](https://zenodo.org/badge/106572219.svg)](https://zenodo.org/badge/latestdoi/106572219)

# HistData  <img src="man/figures/HistData-logo.png" align="right" height="200px" />
**Data Sets from the History of Statistics and Data Visualization**

Dev. Version: 0.8-9

The `HistData` package provides a collection of small data sets
that are interesting and important in the history of statistics and data
visualization. The goal of the package is to make these available, both for
instructional use and for historical research. Some of these present interesting
challenges for graphics or analysis in R.

Some of the data sets have examples which reproduce an historical graph or analysis.
These are meant mainly as starters for more extensive re-analysis or graphical
elaboration. 

They are part of a program of research called *statistical historiography*
(Friendly, 2007; Friendly & Denis, 2001; Friendly et-al, 2016)
meaning the use of statistical methods to study problems and questions in the
history of statistics and graphics. They are also used in our book,
_A History of Data Visualization & Graphic Communication_
(Friendly & Wainer, 2021). See also the companion website for this book,
https://friendly.github.io/HistDataVis/.

## Installation

Get the released version from CRAN:

    install.packages("HistData")

The development version can be installed to your R library directly from github via:

    if (!require(devtools)) install.packages("devtools")
    library(devtools)
    install_github("friendly/HistData")



## References

Friendly, M. (2007). A Brief History of Data Visualization.
In Chen, C., Hardle, W. & Unwin, A. (eds.)  
*Handbook of Computational Statistics: Data Visualization*, Springer-Verlag, III, Ch. 1, 1-34.
[preprint](http://datavis.ca/papers/hbook.pdf)

Friendly, M. & Denis, D. (2001).
Milestones in the history of thematic cartography, statistical graphics, and data visualization.
[http://datavis.ca/milestones/](http://datavis.ca/milestones/)

Friendly, M. & Sigal, M. & Harnanansingh, D. (2016).
"The Milestones Project: A Database for the History of Data Visualization,"
In Kostelnick, C. & Kimball, M. (ed.), *Visible Numbers: The History of Data Visualization*, Ashgate Press, Chapter 10.

Friendly, M. & Wainer, H. (2021). [*A History of Data Visualization and Graphic Communication*](https://www.hup.harvard.edu/catalog.php?isbn=9780674975231).
Harvard University Press.

