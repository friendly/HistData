#' @name Perozzo
#' @aliases Perozzo
#' @docType data
#' @title
#' Perozzo's Swedish Population Survivorship Data
#'
#' @description
#' Data underlying Luigi Perozzo's (1880, 1881) "stereogram" -- an early three-dimensional
#' population pyramid -- showing the number of survivors, by age, of Swedish birth cohorts
#' followed forward through successive census years, 1750-1875.
#'
#' @usage data("Perozzo")
#' @format
#'  A data frame with 546 observations on the following 3 variables, forming a
#'  26 (Year) x 21 (Age) grid.
#'  \describe{
#'    \item{`Year`}{numeric, census year, 1750-1875 in steps of 5}
#'    \item{`Age`}{numeric, age in years, 0-100 in steps of 5}
#'    \item{`Survivors`}{numeric, number of survivors at that age in that census year}
#'  }
#'
#' @details
#' Perozzo's stereogram plotted `Survivors` as a surface over the `Year` x `Age` grid,
#' letting a viewer read off both cross-sections (the age distribution in a given census
#' year) and diagonal cohort lines (survivorship of a single birth cohort as it ages) from
#' one figure -- widely cited as one of the earliest true 3D statistical graphics.
#'
#' The digitization source for this tidy grid is currently unknown; see `issues/TASKS.md` in the GitHub repo
#' for the open item to track it down.
#'
#' @source
#' Digitized from Perozzo's original stereogram (source of the digitization itself not yet
#' identified -- see Details). The original is held by Wikimedia Commons:
#' <https://commons.wikimedia.org/wiki/File:Stereogram_(three-dimensional_population_pyramid)_modeled_on_actual_data_(Swedish_census,_1750-1875).jpg>
#'
#' @references
#' Perozzo, L. (1880). Della Rappresentazione Graphica di una Collettivita di Individuinella
#' Successione del Tempo. *Annali di Statistica*, 12, 1-16.
#'
#' Perozzo, L. (1881). Stereogrammi Demografici -- Seconda memoria dell'Ingegnere Luigi
#' Perozzo. *Annali di Statistica*, 22, 1-20.
#'
#' @concept mortality
#' @concept survival
#' @concept 3D
#' @examples
#' data(Perozzo)
#' str(Perozzo)
#'
#' # reshape to a Year x Age matrix for a surface / contour plot
#' Pmat <- xtabs(Survivors ~ Year + Age, data = Perozzo)
#' years <- as.numeric(rownames(Pmat))
#' ages  <- as.numeric(colnames(Pmat))
#'
#' # perspective plot: Year horizontal (1750 -> 1875, left to right), Age receding
#' # in depth (0 in front -> 100 at the back), as in Perozzo's original stereogram
#' persp(years, ages, Pmat,
#'       xlab = "Year", ylab = "Age", zlab = "Survivors",
#'       theta = 0, phi = 25, expand = 0.6, col = "lightblue", shade = 0.5)
#'
#' # contour plot of the same surface
#' contour(years, ages, Pmat, xlab = "Year", ylab = "Age")
#'
#' # extract the contour lines themselves, e.g. for further analysis or custom plotting
#' cl <- contourLines(years, ages, Pmat, levels = seq(20000, 280000, by = 20000))
#' length(cl)
#' str(cl[[1]])
#'
#' @keywords datasets
NULL
