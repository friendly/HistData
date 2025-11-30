## Test environments
* local Windows 10 install, 4.5.1 (2025-06-13 ucrt)
* win-builder: R Under development (unstable) (2025-11-27 r89071 ucrt)

## R CMD check results
There were no ERRORs, WARNINGs or NOTEs 
  
## Comments

## Version 1.0.0

This is a major release of the package, reorganizing and reformatting the documentation and adding one new dataset

* Add `Playfair1824` data [Thx: Ivan Lokhov]
* Convert documentation from Rd to roxygen (painfully!), but also make edits to dataset descriptions, references, ...
* Some contributors made authors
* Extended package description
* Ran `roxygen2md(scope="simple")` to use markdown in docs
* Fixed broken URLs
* Add @references to nice examples of the use of these datasets
* Added @concept tags to all datasets giving the associated statistical or graphic ideas one might want to search for [Thx: Claude]

## Version 0.9.4

* Switch to recommended versioning
* Add example graphs from John Russell to `sandbox/`
* Add link to Horsekicks package

## Reverse dependencies

> devtools::revdep()
[1] "cholera" "statsr"  "UsingR" 

## revdepcheck results

> revdepcheck::revdep_check(num_workers = 4, bioc=FALSE)

## revdepcheck results

We checked 3 reverse dependencies, comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 0 new problems
 * We failed to check 0 packages


