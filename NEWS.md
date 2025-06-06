## Version 0.9.4

* Switch to recommended versioning
* Add example graphs from John Russell to `sandbox/`
* Add link to Horsekicks package

## Version 0.9-3

This is a maintenance release, largely fixing CRAN check problems since the last public release, 0.9-1

* add Pyx ggplot histogram [thx: John Russell]
* add seealso: cholera pkg for Snow
* fix http -> https in README
* fixed other moved / broken url links
* Remove Rdatasets from Suggests b/c not on CRAN
* Now Depends: R >= 4.1.0 for use of |> in examples

## Version 0.9-2

* now run Minard examples for documentation
* renamed `Armada$Armada` -> `Armada$Fleet` and updated documentation.

## Version 0.9-1

* Added `CholeraDeaths1849` [Thx: James Riley]

## Version 0.9-0

* Added `Pollen` data, a multivariate challenge
* Add table of datasets to README

## Version 0.8-9 

* Added `Breslau` data [thx: David Bellhouse]

## Version 0.8-8 (2021-03-14)

* Added `Mayer` and `Saturn` data sets [thx: Luiz Fernando Palin Droubi]


## Version 0.8-7 (2021-03-04)

* Added `ChestStigler` data, Stigler's correction of Quetelet `ChestSizes` (now depends on R (>= 3.5.0))
* Fixed URLs broken since the last release
* Now Depends: R >= 3.5.0

## Version 0.8-6 (2019-12-22)

* fix documentation problems with CRAN checks

## Version 0.8-5 (2018-04-26)

* Added EdgeworthDeaths data, one of the first examples of two-way ANOVA


## Version 0.8-4 (2018-04-04)

* fixed errors in Cholera.Rd related to car 3.0-0
* fix spelling errors

## Version 0.8-3 (2017-10-01)

* Add clarifying note to Arbuthnot.Rd that the data are christenings, not births 
  (thx: Jim Oeppen <joeppen@health.sdu.dk>)

## Version 0.8-2 (2017-02-10)

* Added Herschel's data on the twin stars Virginis, used in the first scatterplot
* Complete the example plots of Minard data


## Version 0.8-1 (2016-12-22)

* Added SnowMap()
* fixed Snow.pumps data:  label should be character, not a factor; added missing labels for pumps 1:2
* SnowMap now uses asp=1
* Replaced Snow.polygons with new ## Version consisting of actual vertices of the polygons surrounding each pump.

## Version 0.8-0 (2016-12-07)

*  Added HalleyLifeTable
*  Added Cholera data from Farr 1852 [thx: Neville Verlander]
*  Correction to ZeaMays.Rd [thx: Bryan Clair]
*  Add Suggests: effects for effect plots for some examples.
*  Added Snow.dates -- deaths by date from Aug 19 -- Sept 30, 1854
*  Substantially revised examples in Snow.Rd to make plots more flexible. `SnowMap()`
   should be a function in the package and made more general, but this is not yet done.

## Version 0.7-8 (2016-04-13)

*  Fix web links again
  
## Version 0.7-7 (2016-04-09)

*  Added vignettes/Snow_deaths and data/Snow.deaths2 [Thx: Peter Li]
*  Fixed web links to make curl happy

## Version 0.7-6 (2015-10-13)

*  Added Armada data [thx: Antoine de Falguerolles]

## Version 0.7-4 (2013-10-29)

*  Added reference to agridat package
*  Fixed Nightingale.Rd examples to avoid obscuring some segments by overplotting [thx: Monique Graf].  

## Version 0.7-3 (2013-08-20)

*  Cosmetic: fix long lines in .Rd files

## Version 0.7-2

*  Extended Nightingale examples

## Version 0.7-1

*  CushnyPebbles renamed to proper spelling, CushnyPeebles (thx: Ian E. Holliday)
*  Removed Suggests: ReadImage; for now, retain old code examples as \dontrun{}
*  Extended GaltonFamilies examples

## Version 0.7-0

*  Revised Langren.Rd examples to replace ReadImage with jpeg

## Version 0.6-14 (2012-12-01)

*  Extended examples for Playfair Wheat
*  Replaced original data(Wheat) on 26 intervals with a new ## Version at 53 time points
	  and a separate data.frame, Wheat.monarchs giving the reigns. Updated examples to
	  more closely approximate Playfair's original and a revision.

## Version 0.6-13 (2011-11-03)

*  Added GaltonFamilies data
*  Fixed deprecated warnings from ggplot2

## Version 0.6-12 (2011-10-12)

*  Added CushnyPebbles data
*  Extended examples for Michelson and CushnyPebbles
*  Fixed Suggests: for all packages used in examples
*  Added ZeaMays data from Darwin, used by Fisher for an early non-parametric test
*  Illustrated permutation and non-parametric tests for ZeaMays data
*  Added examples for Macdonell data showing contour plots and simulations [thx: Jim Hanley]
*  Added frequency-expanded ## Version, MacdonellRD
*  Now Suggest: lattice
*  Added plotting examples to PearsonLee
	
## Version 0.6-11 (2011-10-05)

*  Added ChestSizes data - Quetelet's data on chest measurements of 5738 Scottish Militiamen
*  Added PolioTrials data - two experiments on the Salk polio vaccine
*  Added Cavendish data - density of the earth
*  Added Michelson data - speed of light experiments

## Version 0.6-10 (2010-12-22)

*  Additional variables added to Langren1644

## Version 0.6-9 (2010-07-27)

*  \dontrun{} portion of example(Snow) using sp, due to error from sp::Lines()
*  Minor documentation fix for car_2

## Version 0.6-8 (2010-03-19)

*  Added links to data sets on main package page

## Version 0.6-7 (2010-02-28)

*  Switched from inst/ChangeLog to NEWS
*  Corrected typo in Yeast.Rd

## Version 0.6-6 (2010-01-26)
*  Added Quarrels data

## Version 0.6-5 (2009-11-13)
*  Added Dactyl data
*  Added Pyx data
*  Fixed one-off error creating Night1, Night2
*  Added simple Dactyl examples; minor updates to other examples
*  Extended example(Jevons)
*  Added Fingerprints data

## Version 0.6-4 (2009-11-11)
*  Initial release to CRAN

## Version 0.6-3 (2009-11-08)
*  Nightingale$Month made ordered factor
*  Added Nightingale examples

## Version 0.6-1 (2009-11-06)
*  Added Yeast example
*  Fixed latin1 characters in Langren1644
*  Extended Langren example

## Version 0.6 (2009-11-05)
*  Added Yeast data

## Version 0.5 (2009-11-03)
*  Added Macdonell data
*  Added Langren/ggplot2 example
*  Added OldMaps data

## Version 0.4 (2009-11-02)
*  Added Nightingale data

## Version 0.3 (2009-10-27)
*  Added Snow data
*  Added Langren data
*  Added inst/images/google-toledo-rome3.jpg

## Version 0.2 (2009-10-23)
*  Added Minard data
*  Added Bowley data
	
## Version 0.1 (2009-10-20)

*  Initial Version uploaded to R-Forge


