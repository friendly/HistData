## Test environments
* local Windows 7 install, 3.2.5 (2016-04-14)
* win-builder (R Under development (unstable) (2017-01-06 r71920)), R version 3.3.2 (2016-10-31)

## R CMD check results
There were no ERRORs, WARNINGs or NOTEs 
  
## Comments
This is a minor release, adding a a new set of functions to draw John Snow's map of cholera

Version 0.8-1 (2016-12-22)

* Added SnowMap()
* fixed Snow.pumps data:  label should be character, not a factor; added missing labels for pumps 1:2
* SnowMap now uses asp=1
* Replaced Snow.polygons with new version consisting of actual vertices of the polygons surrounding each pump.

