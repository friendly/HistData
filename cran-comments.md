## Test environments
* local Windows 10 install, R version 4.4.1 (2024-06-14 ucrt)
* win-builder: R 4.5.0 RC (2025-04-04 r88118 ucrt)

## R CMD check results
There were no ERRORs, WARNINGs or NOTEs 
  
## Comments

This is a maintenance release, largely fixing CRAN check problems since the last public release, 0.9-1

* add Pyx ggplot histogram
* add seealso: cholera pkg for Snow
* fix http -> https in README
* fixed other moved / broken url links
* Remove Rdatasets from Suggests b/c not on CRAN
* Now Depends: R >= 4.1.0 for use of |> in examples

## Version 0.9-2

* now run Minard examples for documentation
* renamed `Armada$Armada` -> `Armada$Fleet` and updated documentation.

## Reverse dependencies

> devtools::revdep()
[1] "cholera" "ibawds"  "statsr"  "UsingR" 

## revdepcheck results

> revdepcheck::revdep_check(num_workers = 4, bioc=FALSE)

── CHECK ──────────────────────────────────────────────────────────────────────────────────────────────────────────────────── 4 packages ──
✔ statsr 0.3.0                           ── E: 0     | W: 1     | N: 0                                                                     
✔ UsingR 2.0.7                           ── E: 0     | W: 1     | N: 1                                                                     
✔ ibawds 1.1.0                           ── E: 0     | W: 1     | N: 1                                                                     
✔ cholera 0.9.0                          ── E: 0     | W: 0     | N: 0                                                                     
OK: 4                                                                                                                                    
BROKEN: 0

We checked 4 reverse dependencies, comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 0 new problems
 * We failed to check 0 packages

