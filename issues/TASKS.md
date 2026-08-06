# HistData — development tasks

Broken out from the cross-package working list in `C:\Users\friendly\Dropbox\R\TASKS-all.md`
(2026-08-04). Update here as items are finished; sync back to the main list only if it's useful
to see HistData status at a glance across packages.

No `dev/`/`extra/` folder — `sandbox/` is the example-graphs equivalent, now cleaned up to hold
only that (2026-08-04): dev-scratch that had drifted in there (tooling for already-shipped doc
features) moved to this `issues/` folder, matching the convention used by the other packages.
Also had the same pre-roxygen `man-old/`/`NAMESPACE-old` leftover pattern seen elsewhere — already
removed. v1.0.0 (shipped 2025-11-29, per `NEWS.md`) converted docs Rd→roxygen, added `@concept`
tags to all 34 datasets, and added `@references` links to John Russell's
[30DayChartChallenge](https://github.com/drjohnrussell/30DayChartChallenge) recreations.

## TODO: find DOIs for histdata-challenge vignette references

While fleshing out `issues/histdata-challenge.md`, added a motivating example (Zabell's discovery
of an inconsistency in the `Arbuthnot` data — identical 1674/1704 values, already noted in
`R/data-concepts.R`'s `@details` for `Arbuthnot`) citing:

- Zabell, S. (1976). Arbuthnot, Heberden and the Bills of Mortality (Technical Report No. 40).
  Department of Statistics: The University of Chicago. (Also already in `R/data-concepts.R`'s
  `@references` for `Arbuthnot`, without a DOI — it's a technical report, may not have one.)
- Zabell, S., & Wainer, H. (2002). A Small Hurrah for the Black Death. *Chance*, 15(4), 58-60.
  (Not currently cited anywhere else in the package.)

No DOI found yet for either (confirmed absent from `timeref.bib` too). Deferred — look these up
(CrossRef/tandfonline) before the vignette actually ships, and spot-check other references pulled
into the vignette at the same time rather than one at a time.

## TODO (belongs to vcdExtra, not HistData): cite James Hanley's Draft 1970 re-creation

Found while gathering material on James Hanley (McGill) for `issues/vignettes/HistData-Challenge.Rmd`'s
"What is re-visioning?" section (2026-08-06) — not used there per instruction, but shouldn't be
lost. `vcdExtra::Draft1970` (US Selective Service lottery data) has a matching re-creation/analysis
by Hanley that should be cited and described in *vcdExtra*'s own docs, not here:

- <https://jhanley.biostat.mcgill.ca/Reprints/LestWeForgetUSSelectiveServiceLotteries1917-2019.pdf>
- <https://jhanley.biostat.mcgill.ca/DraftLotteries/> — "US Selective Service Lotteries 1917-1975: Datasets"

Move this note to `vcdExtra`'s own `issues/TASKS.md` next time working in that package.

## Workflow: rebuilding pkgdown (2026-08-05)

Before running `pkgdown::build_site()`, check both of these — a stale one silently produces a
site that doesn't reflect the current source:

1. **Installed version matches `DESCRIPTION`** — `pkgdown` builds against the *installed* package,
   not the source tree. Compare `packageVersion("HistData")` to `DESCRIPTION`'s `Version:`; if they
   differ, `devtools::install(dependencies = FALSE, upgrade = FALSE)` first. Caught this 2026-08-05:
   installed was still 1.0.0 (pre-`Perozzo`) while `DESCRIPTION` was already at 1.0.1, so the
   homepage dataset table was silently missing `Perozzo` until reinstalling.
2. **`README.md` is freshly re-knit from `README.Rmd`** — pkgdown's homepage reads `README.md`
   directly; it does not know about `README.Rmd`. Run `devtools::build_readme()` (which reinstalls-
   and-renders against the *current* source, unlike a stale committed `README.md`) and check the
   diff before building the site. Also caught 2026-08-05: re-knitting surfaced a stray
   `vcdExtra`/`vcd` S3-override startup message leaking into the rendered dataset-table chunk output
   (chunk had no `message=FALSE`); fixed by adding `message=FALSE` to the `datasets` chunk in
   `README.Rmd`.

## TODOs

Two raw-data drops in `data-raw/` with no corresponding shipped dataset, i.e. real unfinished
work rather than clean-up:

- [X] **New dataset: `Perozzo`** — shipped 2026-08-05. `data-raw/Perozzo-import.R` reads the tidy
  `data-raw/perozzo-tidy.csv` grid (Year × Age × Survivors, Swedish census-era data, 1750-1875) into
  `data/Perozzo.RData`, documented in `R/Perozzo.R`. Named for Luigi Perozzo, the 19th-c. Italian
  statistician famous for an early 3D population-pyramid stereogram — thematically a strong fit for
  HistData. Citation confirmed against `timeref.bib`: Perozzo (1880), *Annali di Statistica* 12,
  1-16 (also see the follow-up Perozzo 1881, vol. 22).

  - [ ] **TODO: identify the digitization source** — who/where this tidy grid was originally
    digitized from is unknown (lost track of it). Noted in `R/Perozzo.R`'s `@details`.
  - [X] **Resolved: `data-raw/perozzo-contours.json` is redundant, not shipping it** — compared
    against `contourLines()` recomputed straight from the `Perozzo` grid at the same 29 levels
    (`data-raw/Perozzo-contours-compare.R`, output `.png`/`.csv` alongside it). Exact match: 0
    mean/max absolute age difference at every level, 34 segments either way. So the JSON isn't
    independently-digitized or specially-fit data — it was generated (by base R's `contourLines()`
    or an equivalent marching-squares implementation) from this exact grid, making it fully
    reproducible from `Perozzo` alone. Confirms the earlier deferral was right; not worth shipping
    as a second dataset. Kept in `data-raw/` as a cross-check, not a TODO.
  (Filenames were originally misspelled "porozzo" — fixed 2026-08-04, commit `a68f615`.)

- [ ] **New dataset: Ebbinghaus forgetting-curve replication** —
  `data-raw/Ebbinghaus Replication Schema and Results.xlsx` (26 sheets: schema tables, Mathematica
  curve fits, several sheets explicitly marked "not used"/"old"). Messier and further from
  dataset-ready than the Perozzo files — would need real triage of which sheets are the actual
  data vs. superseded drafts. Thematically connects to `WordPools` (memory-research datasets).
  Moved from `sandbox/` to `data-raw/` 2026-08-04 (commit `db5b137`), alongside the other
  not-yet-imported raw data.
  File: `data-raw/Ebbinghaus Replication Schema and Results.xlsx`

## Reference material (not TODO, not clean-up)

- `sandbox/*.R` (14 loose scripts: `Arbuthnot-PieGlyph.R`, `Cholera-plots.R`,
  `Galton-PearsonLee.R`, `Guerry-map.R`, `Langren-graph.R`, `Mcdonnell-density.R`,
  `Nightingale-graph.R`, `OldMaps-plot-map.R`, `Pollen-ex.R`, `Pyx-ggbump.R`, `Pyx-histogram.R`,
  `Snow-density.R`, `Virginis-plot.R`, `Yeast.R`) — per `NEWS.md` v0.9.4 ("Add example graphs from
  John Russell to `sandbox/`"), these are the local copies behind the `@references` links to
  Russell's 30DayChartChallenge in `R/data-concepts.R`. Job already done; kept as reference.

  - [X] **Fixed 2026-08-05: 3 of the 14 scripts had no `@references` link at all** — found while
    prepping `issues/histdata-challenge.md` (a vignette idea) and cross-checking `sandbox/` against
    `grep -n "Russell" R/data-concepts.R`. `Mcdonnell-density.R` (→ `Macdonell`, Challenge04),
    `Nightingale-graph.R` (→ `Nightingale`, Challenge06), and `Snow-density.R` (→ `Snow`,
    Challenge11) were undocumented gaps, not "already done" as previously logged here. Added the
    missing `@references` lines to their `R/data-concepts.R` blocks, matching the existing pattern.

- `sandbox/john-snow-cholera-maps-nrennie.R` (+ `nrennie0.R`, `.png`) — a fuller recreation of
  Snow's cholera map in Nicola Rennie's style, referencing external data files not present in the
  repo (`John Snow Cholera Maps/data/...`). This was incorporated: commit `c62c843` ("add link to
  N Rennie Snow Maps; bump ver") added an `@references` link to Rennie's
  [data-viz-projects](https://github.com/nrennie/data-viz-projects/tree/main/John%20Snow%20Cholera%20Maps)
  in `man/Snow.Rd`/`R/data-concepts.R`. So this is reference material for already-shipped work,
  same bucket as the Russell scripts above.

- `sandbox/HistData-downloads.R`, `sandbox/mypkg-downloads.R` — standalone fun/promotional
  CRAN-download-stats plots (one HistData-specific "true hist-ogram" pun graph, one comparing
  download counts across all of the author's packages). Unrelated to package content; left in
  `sandbox/` (doesn't cleanly fit "example graphs of this package's data", but not worth a special
  location either).

## Clean-up log

Both `@concept`/roxygen-item fixes confirmed superseded — fully shipped per `NEWS.md` v1.0.0;
moved rather than deleted, since they're legitimate dev-scratch history, just filed in the wrong
folder:

- [X] `issues/concepts/` (6 files: `CONCEPTS-README.md`, `HistData-concepts.zip`,
  `add_concept_tags.R`, `dataset-concepts.md`, `dataset-concepts-structured.md`,
  `dataset-concepts.csv`) — the `@concept`-tag generation workflow. Confirmed applied: 140
  `@concept` tags present in shipped `R/data-concepts.R` (commit `7edb4f8`, "add concept tags ->
  data-concepts.R"). Moved `sandbox/concepts/` → `issues/concepts/` 2026-08-04 (commit `db5b137`).

- [X] `issues/roxygen-redoc/` (8 files: `README.md`, `data.R`, `data-fixed.R`,
  `download_and_fix_data.R`, `fix-describe-claude.md`, `fix_items.sh`, `fix_roxygen_items.R`,
  `roxygen_item_fix.md`, `HistData-fixifiles2.zip`) — fixes `rd2roxygen`'s malformed
  `\item{list("X")}` → `\item{\code{X}}` output. Confirmed applied: zero `\item{list(` patterns
  remain in shipped `R/data-concepts.R`. Moved `sandbox/roxygen-redoc/` → `issues/roxygen-redoc/`
  2026-08-04 (commit `db5b137`).

- [X] `issues/test-tt.qmd`, `issues/test-tt.html` — prototype of a `tinytable` dataset-index
  table linking to pkgdown reference pages. Confirmed applied: `README.Rmd` already has its own
  `tt(dsets, width = c(.2, .8)) |> ...` table (line 137) built the same way. Moved from `sandbox/`
  2026-08-04 (commit `db5b137`).

- [X] `man-old/` (40 `.Rd` files, exact 1:1 name match with current `man/`) + `NAMESPACE-old` —
  pre-roxygen leftovers, superseded by the v1.0.0 Rd→roxygen conversion. Same pattern as the other
  packages' `man-old/`/`NAMESPACE-old` folders. Deleted 2026-08-04 (commit `f6be948`), also removed
  the now-dangling `.Rbuildignore` entries for both paths. NEWS.md entry added (commit `30228f7`).

`issues/` also added to `.Rbuildignore` (`^issues$`, 2026-08-04, commit `db5b137`), matching the
other packages.
