## Test environments
* local Windows 10 install, 4.2.3 (2023-03-15 ucrt)
* win-builder: R Under development (unstable) (2023-08-01 r84819 ucrt)
* rhub: Fedora Linux, R-devel, clang, gfortran
* rhub: Windows Server 2022, R-devel, 64 bit

## R CMD check results
There were no ERRORs, WARNINGs or NOTEs 
  
## Comments

This is a minor update.  It adds a number of new data sets.

* Added `CholeraDeaths1849` [Thx: James Riley]
* Added `Pollen` data, a multivariate challenge
* Add table of datasets to README
* Added `Breslau` data [thx: David Bellhouse]
* Added `Mayer` and `Saturn` data sets [thx: Luiz Fernando Palin Droubi]


## Reverse dependencies

> devtools::revdep()
[1] "cholera" "ibawds"  "statsr"  "UsingR" 

## revdepcheck results

We checked 4 reverse dependencies, comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 0 new problems
 * We failed to check 0 packages

