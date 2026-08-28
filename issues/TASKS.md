# HistData — development tasks

## Release checklist: HistData 1.1.0 CRAN submission (2026-08-28)

Session progress toward the next CRAN release. `DESCRIPTION` is already at 1.1.0 with a `NEWS.md`
entry (edited directly by MF at the end of this session, not by Claude). Commits this session:
`6afafaa` (vignette content + CRAN cleanup + pkgdown rebuild), `ea010a8` and `4492ad5` (URL fixes
caught by `urlchecker::url_check()`), all pushed to `origin/master`.

**Done:**

- `devtools::document()` — no changes needed, docs already current.
- `devtools::check()` — clean: 0 errors, 0 warnings, 0 notes, after:
  - Adding `.github/` and `dev/` to `.Rbuildignore` (were generating NOTEs).
  - Resaving `Federalist_text.RData`, `Pollen.RData`, `Quarrels.RData` with better compression
    (`tools::resaveRdaFiles()`) — was a WARNING. Note: this re-serializes *every* `.RData` file if
    run over the whole `data/` dir, mostly as byte-level noise (same size, different bytes); only
    keep the diff for files that actually shrank, `git checkout --` the rest.
- `pkgdown::build_site()` rebuilt and pushed (as of commit `6afafaa`; **not** re-run after the two
  follow-up URL-fix commits below, so the live site's Nightingale/Quarrels reference pages still
  show the old http:// links — cosmetic only, rebuild before final submission).
- `urlchecker::url_check()` run — flagged and fixed:
  - Empty link `[HistData Challenge]()` in `README.Rmd` → now points at the vignette's pkgdown
    article page.
  - `man/Nightingale.Rd` and one URL in `man/Quarrels.Rd`: http→https (page unchanged, safe swap).
  - **Left open**: a second `Quarrels.Rd` URL (`icpsrweb/ICPSR/studies/05407`) redirects to
    ICPSR's generic homepage, not an https version of the same study page — real link rot, not a
    protocol bump. Needs someone to find the study's current ICPSR URL (search their site for
    study 5407) rather than a mechanical fix.
  - **Left open**: `man/Cholera.Rd`'s `archive.org` PDF link timed out during the check (5s
    timeout) — likely transient, but worth re-running `url_check()` to confirm it's not actually
    dead.
- `spelling::spell_check_package()` run — no new problems beyond expected proper
  nouns/foreign-language terms/dataset names. One unrelated pre-existing typo noticed but *not*
  fixed (out of scope for today): "devloping" → "developing",
  `vignettes/HistData-Challenge.Rmd:112` (Hotelling Society paragraph).

**2026-08-28 follow-up (Claude), triggered by a win-builder run of the pre-`4492ad5` tarball:**
MF ran `devtools::check_win_devel()` and got back 4 NOTEs. Checked each against current source:
`Nightingale.Rd` and the Quarrels `file_id` URL were already https in the repo (`4492ad5`) — the
win-builder result was just stale, built before that commit. The other two were the genuinely
left-open items above, now resolved:
- `man/Cholera.Rd`'s archive.org PDF: the item-specific `ia600208.us.archive.org` node URL is
  confirmed still down (21s timeout, not transient — same failure via direct `curl`). Swapped for
  archive.org's stable load-balanced alias, `https://archive.org/download/{item}/{file}.pdf`
  (fast, 200, doesn't pin to one storage node).
- `man/Quarrels.Rd`'s `icpsrweb/ICPSR/studies/05407` URL: ICPSR's site blocks bot/curl requests
  outright (403) so the new URL couldn't be content-verified directly, but its DOI
  (`10.3886/ICPSR05407.v1`, found via a working `doi.org` redirect) resolves to
  `.../studies/5407/versions/V1` — same numeric study ID as the broken URL, confirming it's the
  same study. Used the DOI form (`https://doi.org/10.3886/ICPSR05407.v1`) instead of a path, since
  DOIs survive site reorganizations that plain paths don't (this is the *second* ICPSR URL scheme
  change for this study).
- Re-running `url_check()` after the above two fixes surfaced two more real issues, now also
  fixed: `man/Quarrels.Rd`'s other ICPSR URL (`cgi-bin/file?...file_id=652814`, the codebook link)
  came back `300 Multiple Choices` — same bot-protection flakiness as the study-page URL — swapped
  to point at the same DOI-resolved study page instead; `vignettes/histdata.bib`'s `tandfonline.com`
  URL was still http, fixed to https.
- `urlchecker::url_check()` now reports **all URLs correct** — the `datavis.ca` timeouts seen in
  one run didn't recur on a second run (confirmed manually via `curl` too: 200 OK, ~5s), so those
  were transient network latency against `url_check()`'s aggressive default timeout, not real
  breakage — no fix needed there.
- `pkgdown::build_site()` re-run to pick up all of the above.

**Still open before actually submitting to CRAN:**

- [ ] `cran-comments.md` is stale — currently mixes a Nov-2025 win-builder run (R-devel,
  pre-1.1.0) with leftover 1.0.0/0.9.4 release-note boilerplate that doesn't belong there. Needs a
  clean rewrite for 1.1.0: fresh `devtools::check_win_devel()` and/or R-hub run, current R CMD
  check summary, current `revdepcheck::revdep_check()` results.
- [ ] `revdepcheck::revdep_check()` against reverse dependencies (`cholera`, `statsr`, `UsingR`)
  for 1.1.0 — last run was for a prior version per `cran-comments.md`.
- [ ] `DESCRIPTION`'s `Date:` field (currently 2026-08-26) — bump to the actual submission date
  right before submitting.
- [X] Resolve the two left-open `urlchecker` items above — done 2026-08-28, see follow-up note.
- `vignettes/figures/Minard-GoG-specs.jpeg` is intentionally kept on disk, untracked (MF: "keep
  the Minard-GoG-specs image for now") — unused in the vignette (the code spec was reproduced as a
  text chunk instead), not committed. Leave as-is unless MF says otherwise.


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

## Workflow: whenever `DESCRIPTION`'s `Version:` changes (2026-08-26)

Reinstall (`devtools::install(dependencies = FALSE, upgrade = FALSE)`) and re-knit README
(`devtools::build_readme()`) right after bumping the version — don't wait until the next pkgdown
rebuild. README.md's version line reads from the *installed* package, so it silently goes stale
the moment `DESCRIPTION` changes, independent of whether/when pkgdown gets rebuilt next. Caught
2026-08-26: bumped to 1.1.0 in one commit, README.md still said 1.0.1 until reinstalling+re-knitting
in a follow-up commit. This is the same underlying issue as item 1 below, just triggered by the
version bump itself rather than by pkgdown-build time.

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

  - [X] **Partially resolved 2026-08-07: immediate source traced** — MF traced
    `data-raw/perozzo-tidy.csv` to RJ Andrews' `old-charts` GitHub repo
    (<https://github.com/infowetrust/old-charts/tree/main/src/components/PerozzoSweden/data>,
    posted at <https://charts.infowetrust.com/>): confirmed byte-identical (after normalizing
    line endings) to that repo's `porozzo-tidy.csv`. Explains the original "porozzo" misspelling
    (commit `a68f615`) — it's the upstream filename. Full trace, plus what the repo's `.tsx`
    rendering code reveals, in `issues/vignettes/verifying-perozzo.md`.
    
  - [ ] **TODO: still open — original digitization from Perozzo's 1880/1881 plate is unknown**
    — `old-charts` is itself a from-scratch redraw built from this same grid; nothing in that repo
    (code comments, README) documents how its numbers were originally read off the plate, so
    tracing the immediate source doesn't close this. Noted in `R/Perozzo.R`'s `@details`/`@source`.
    See `issues/vignettes/verifying-perozzo.md` for a methodology (gridline plausibility check,
    label-anchored spot checks, rigorous re-digitization via the chart's own axonometric
    projection) and for the current, informal state of each check — including the still-unbuilt
    "does `Perozzo`, plotted, actually reproduce the look of the original lithograph" comparison,
    which is the real target here, not just provenance-chasing.
    
  - [X] **Resolved (narrowly): `data-raw/perozzo-contours.json` is redundant, not shipping it** —
    compared against `contourLines()` recomputed straight from the `Perozzo` grid at the same 29
    levels (`data-raw/Perozzo-contours-compare.R`, output `.png`/`.csv` alongside it). Exact
    match: 0 mean/max absolute age difference at every level, 34 segments either way. So the JSON
    isn't independently-digitized or specially-fit data — it was generated (by base R's
    `contourLines()` or an equivalent marching-squares implementation) from this exact grid,
    making it fully reproducible from `Perozzo` alone. Confirms the earlier deferral was right;
    not worth shipping as a second dataset. Kept in `data-raw/` as a cross-check, not a TODO.
    **Caveat added 2026-08-07**: this only establishes that the JSON and the grid are mutually
    consistent — an exact match here is actually the tell that they share an undocumented common
    ancestor, not independent evidence that either one is faithful to the original lithograph. Do
    not read this item as validating `Perozzo` against the source image; the TODO above is the one
    that would do that, and it's still open. See `issues/vignettes/verifying-perozzo.md`.
  (Filenames were originally misspelled "porozzo" — fixed 2026-08-04, commit `a68f615`.)

- [ ] **New dataset: Framingham Heart Study** — planning stage (2026-08-26), no `data-raw/` yet.
  MF wants a Framingham dataset next, after `Federalist`. Researched licensing/sourcing before
  starting, since this one has a real trap:

  - **The obvious route is a dead end.** The famous "framingham.csv" (~4,238 rows) that's
    everywhere on Kaggle/DataCamp/textbooks is an NHLBI BioLINCC "Teaching Dataset" release, not
    freely redistributable — BioLINCC's own terms say it needs a per-project data-use request, and
    explicitly "not appropriate for publication purposes." The one CRAN package that ships
    Framingham microdata, `riskCommunicator` (11,627 rows, 39 vars), does so under its own specific
    NHLBI approval (request #7161, approved 2019-03-11) — that permission is tied to that package's
    request, not transferable to `HistData`. Kaggle/DataCamp copies are downstream of the same
    release, riding on nobody's explicit permission. **Do not build this from that CSV or from
    `riskCommunicator`'s data** without HistData getting its own NHLBI approval first.
    
  - **Better-fitting route, no licensing issue**: build from the small *published summary tables*
    in the two landmark papers instead — publicly published numbers, transcribable and citable the
    same way `Guerry`/`Playfair1824`/`Perozzo` already are, and a better thematic fit for
    "history of statistics" than a generic modeling dataset:
    
    - Kannel, Dawber, Kagan, Revotskie & Stokes (1961). "Factors of Risk in the Development of
      Coronary Heart Disease — Six Year Follow-up Experience." *Annals of Internal Medicine*,
      55(1), 33-50. Coined the term "risk factor" itself; small cross-tabulated risk tables
      (BP x cholesterol x ECG combinations vs. CHD incidence).
      
    - Truett, Cornfield & Kannel (1967). "A multivariate analysis of the risk of coronary heart
      disease in Framingham." *Journal of Chronic Diseases*, 20(7), 511-524. First multiple
      logistic risk function in epidemiology (age, cholesterol, weight, ECG abnormality,
      hemoglobin, cigarettes, systolic BP) — replaced the unwieldy multi-way cross-tab tables from
      1961 with a single fitted model. The more "statistically historic" of the two.
      
  - **Not yet found**: an iconic, crisply-dated Framingham *graphic* the way Minard/Playfair/Snow
    each have one — the well-known risk-score nomogram/point-chart is a 1990s derivative (Wilson et
    al.), not an original-era graphic. Worth another look once the table data is in hand; may just
    not exist for this one, and that's fine (`Federalist` and `Arbuthnot`'s motivating example
    aren't built around a single iconic graphic either).
    
  - **Next concrete step**: track down the actual 1961/1967 tables (JSTOR/journal archives) and
    transcribe them into `data-raw/`, following the `Federalist.R` pattern (cached raw source,
    documented quirks, `@references`/`@source`/prior-work section in the roxygen doc). Not started.

- [X] **DONE 2026-08-27: New dataset: Ebbinghaus forgetting-curve replication** —
  Triaged `data-raw/Ebbinghaus Replication Schema and Results.xlsx` (26 sheets: schema tables,
  Mathematica curve fits, several sheets explicitly marked "not used"/"old") down to the
  "Ebbinghaus, Mack, Seitz" sheet's learning/relearning repetition counts, plus Dros' own
  numbers from the published paper's Table 1. Added as `Ebbinghaus` (commits `5bdb624`,
  `f2f3a6a`): `R/Ebbinghaus.R`, `data/Ebbinghaus.RData`, `man/Ebbinghaus.Rd`, source materials
  and import script kept in `data-raw/Ebbinghaus/`. Citation confirmed against the published
  PLOS ONE version (Murre & Dros, 2015); Jaap Murre added as a `ctb` in `DESCRIPTION`.
  Thematically connects to `WordPools` (memory-research datasets).
  File: `data-raw/Ebbinghaus/Ebbinghaus Replication Schema and Results.xlsx`

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
