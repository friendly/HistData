## Test environments
* local Windows 7 install, 3.6.3 (2020-02-29)
* win-builder: R Under development (unstable) (2021-03-05 r80073)
* rhub: Fedora Linux, R-devel, clang, gfortran

## R CMD check results
There were no ERRORs, WARNINGs or NOTEs 
  
## Comments

This is a minor release.  It was triggered by a CRAN-check NOTE on the last version
regarding a reference to the `alr3` package.

## Reverse dependencies

> devtools::revdep()
[1] "cholera" "statsr"  "UsingR

*Wow, no problems at all. :)*

## Version 0.8-7 

* Added `ChestStigler` data, Stigler's correction of Quetelet `ChestSizes` (now depends on R (>= 3.5.0))
* Fixed URLs broken since the last release
