# Verifying Perozzo

Working notes for a possible blog post or package vignette: "Verifying Perozzo" -- what a
quant-historian actually has to do to check a digitized dataset against the historical graphic it
claims to represent. Grew out of a 2026-08-07 conversation asking, essentially, "how do you know
`HistData::Perozzo` is faithful to the 1880 stereogram?" -- and finding that the package's own
existing "check" doesn't answer that question at all. That finding is the hook for the piece:
verification is harder than it looks, and it's easy to build a check that reassures you without
actually testing anything.

## The hook: a check that checks nothing

`data-raw/Perozzo-contours-compare.R` compares two files sitting in `data-raw/`:
`perozzo-tidy.csv` (the grid that became the shipped `Perozzo` dataset) and
`perozzo-contours.json` (a separate set of "digitized" contour lines, present in the repo since
commit `a68f615`). The comparison reports **0 mean/max absolute difference at every one of 29
contour levels** -- and `issues/TASKS.md` (lines 75-82) reads that as confirmation the JSON is
"not independently-digitized," i.e. redundant, safe not to ship separately.

That conclusion happens to be *right*, but the reasoning is worth pulling apart because the
result looks like validation and isn't:

- **The precision fingerprint.** Points in `perozzo-contours.json` carry values like
  `age: 78.75213503466291` -- 14+ significant digits. No one clicking on a scanned 1880
  lithograph with a mouse, or even a careful digitizing tool, produces that. That precision is
  the signature of a numeric algorithm (`contourLines()`'s marching squares) run against a grid,
  not a human reading pixels off an image.
- **A perfect match is itself the tell.** Two *independently* sourced digitizations of a
  hand-drawn chart -- one from clicking the image, one from interpolating a grid -- would never
  agree to the 15th decimal place. They agree exactly because one was almost certainly generated
  from the other (or both from a common ancestor), not because both separately verified the same
  ground truth.
- **So what did the check actually establish?** Only that `perozzo-tidy.csv` and
  `perozzo-contours.json` are mutually consistent -- internal self-consistency, not fidelity to
  Perozzo's 1880 original. The real open question -- does the shipped grid match the
  lithograph? -- was never tested. `R/Perozzo.R`'s own `@details` says as much: "The digitization
  source for this tidy grid is currently unknown." That's still an open `issues/TASKS.md` TODO
  ("identify the digitization source"), not a resolved one, and the contour comparison doesn't
  close it.

The general lesson, worth stating plainly for the post: **a comparison between two derived
artifacts only tells you about their relationship to each other, not their relationship to the
ground truth, unless you know their provenance is independent.** Precision mismatches (or
suspicious exact matches) are a cheap, general-purpose smell test for that -- before trusting any
"we checked X against Y" claim, ask whether X and Y could plausibly have come from the same
process.

## The general problem this is an instance of

Every dataset in `HistData` (and in quantitative history generally) is a digitization of some
prior artifact -- a printed table, a hand-drawn chart, a census volume. Two failure modes recur:

1. **Lost provenance.** The digitization happened once, by someone, using some method, and the
   record of *how* didn't travel with the data. This is exactly `Perozzo`'s situation.
2. **Circular re-validation.** A later check is built using the same (undocumented) source or
   process as the original digitization, so it can't detect an error the original process would
   have made. This is what `Perozzo-contours-compare.R` accidentally does.

Both are common enough in inherited historical datasets that "how would you actually verify this"
is a reusable methodology, not a one-off Perozzo fix. That's the case for writing it up rather
than just patching the one TODO.

## A methodology: verifying data against a reference image

Ranked roughly by effort and rigor -- a real verification project would move down this list only
as far as the stakes justify.

### 1. Provenance triage (cheapest, do this first)

Before any pixel-level work: is there actually an independent source of truth here, or two
artifacts derived from a common one? Checks:

- **Precision fingerprinting** (as above) -- does one artifact have implausible precision for its
  claimed origin (e.g. a "hand-digitized" file with 14-digit floats)?
- **Exact-match suspicion** -- two supposedly-independent sources agreeing to more decimal places
  than either measurement process could support is evidence of shared ancestry, not
  corroboration.
- **Paper trail** -- commit history, `data-raw/` scripts, comments, `@source`/`@details` roxygen
  fields, README notes. Often the fastest way to settle provenance is just `git log` on the raw
  file and reading who touched it and from what.

### 2. Quick plausibility check against the image's own printed scale

Many historical charts print their own axis/gridlines with labeled values -- use those directly,
no digitizing tool required. For Perozzo: the right edge carries `HOMINVM NVMERVS` gridlines at
50,000 increments up to 300,000. Eyeballing where the tallest peak in the shipped data's surface
should fall (Age 0, Year 1860, `Survivors = 297,648`) against where the tallest peak actually
appears in the lithograph is a five-minute sanity check -- weak evidence, but free, and a quick
way to catch a badly wrong scale (e.g. off by 10x, or years transposed) before investing in
anything rigorous.

### 3. Label-anchored spot checks

Better than free-hand eyeballing: many hand-drawn charts self-label specific features. Perozzo's
stereogram labels individual traces directly on the image ("0-5", "26-30", "51-55", "76-80") and
highlights specific reference lines (red for 25-year census-year cross-sections, per the
"Sistema d'Assi" legend). Each labeled trace at a labeled year is an independently-readable
check-point -- read its height off the printed gridlines, compare to the corresponding row in
`Perozzo`. This needs no knowledge of the chart's projection geometry, just careful reading, and
gives several real (if approximate) data points rather than one.

### 4. Rigorous re-digitization via the chart's own projection

The only approach that actually closes a "digitization source unknown" TODO instead of routing
around it. Perozzo's lithograph includes an inset, "AXIVM SYSTEMA," giving the actual axonometric
axis angles used for the projection. That's enough to reconstruct the forward transform
(Year, Age, Survivors) &rarr; (pixel x, pixel y) and invert it. Then:

- Pick a set of pixel coordinates on clearly identifiable features (line crossings, labeled
  points, gridline intersections) -- with a tool (`magick` + `locator()` in R, WebPlotDigitizer,
  Engauge Digitizer).
- Invert the projection to recover (Year, Age, Survivors) estimates.
- Compare directly against `HistData::Perozzo`, with actual error statistics this time --
  distances that reflect real measurement uncertainty, not `0.00000000000000`.

This is real, non-trivial work (estimating a projection from a scanned image, propagating
digitizing error) -- appropriate when the answer matters enough to justify it, not a first step.
Explicitly *not* attempted yet for `Perozzo` -- flagged, not built, as of this note.

### 5. Narrative/qualitative feature cross-check

Independent of any of the above: does the data reproduce the *story* the chart is known for, not
just its numbers? The draft vignette (`issues/vignettes/HistData-Challenge.Rmd`) already flags a
TODO about this -- a visible dip/"chipped off" look in the young-age region around 1850-1870,
usually attributed to Swedish emigration in that period. Checking the shipped grid: Age-0
survivors rise from 245,986 (1845) to a peak of 297,648 (1860), then ease to 286,079 (1875) -- a
mild plateau, not a dramatic dip, in that specific fixed-age slice. Worth resolving one of two
ways: either the visible feature lives in a different age band or cohort diagonal than checked
here, or the shipped data actually fails to reproduce a feature visible by eye in the original --
which would itself be a finding, not just a footnote. Not yet resolved either way.

## Applying this to `Perozzo`: state as of 2026-08-07

- Check 1 (provenance triage): done, this note *is* that result -- `perozzo-contours.json` is
  derived from `perozzo-tidy.csv`, not an independent source; `perozzo-tidy.csv`'s own
  digitization source is still unrecovered.
- Check 2 (gridline plausibility): done informally against `issues/vignettes/figures/
  Perozzo-600dpi.jpg` -- the tallest-peak-vs-300,000-line comparison looked plausible, but this
  was a visual read, not a measurement, and should be treated as weak evidence only.
- Check 3 (label-anchored spot checks): not done.
- Check 4 (rigorous re-digitization): not built. This is the natural next step if `Perozzo`'s
  fidelity ever needs to be more than "plausible" -- e.g. before citing specific values from it in
  a publication.
- Check 5 (narrative cross-check): partially done (see above) -- inconclusive, needs the actual
  image feature identified precisely before it can be called resolved either way.

## Open questions / TODOs for this piece

- Decide venue: **blog post** (`friendly.github.io/blog`, standalone, can be more essayistic
  about the general "verification of inherited data" problem) vs. **package vignette**
  (narrower, `HistData`-specific, would live alongside or inside the `HistData-Challenge`
  material). Leaning blog post for the general-methodology framing, with a short pointer from the
  `Perozzo` case-study section of `HistData-Challenge.Rmd` back to it -- but not decided.
- If blog post: fits the same "statistical historiography" framing already used in
  `HistData-Challenge.Rmd`'s intro -- could open with the same Merriam-Webster "RE-VISION"
  epigraph, or find a different hook specific to verification/provenance rather than re-creation.
- Whether to actually build check 4 (the axonometric re-digitizer) as part of this piece, or leave
  it as a described-but-not-built methodology step, same trade-off `histdata-challenge.md` made
  for `gganimate`/gallery-image licensing elsewhere.
- Update `issues/TASKS.md`'s Perozzo entry -- the current "Resolved" framing for the contour
  comparison (lines 75-82) is accurate about *what* it found (JSON is derived, not independent)
  but could more clearly state that this does *not* address the still-open digitization-source
  TODO, to avoid a future reader assuming the fidelity question is settled.
- If the digitization source genuinely can't be recovered (asked around, checked old email/notes,
  nothing), that's itself worth stating explicitly in `R/Perozzo.R`'s `@details` rather than
  leaving it as an open TODO indefinitely -- "unknown, presumed lost" is a legitimate, honest end
  state for provenance, not a failure to keep chasing.

## Related files

- `R/Perozzo.R` -- dataset documentation, `@details` names the unresolved digitization-source
  question.
- `data-raw/Perozzo-import.R`, `data-raw/perozzo-tidy.csv` -- the shipped data's immediate source;
  earlier provenance unknown.
- `data-raw/perozzo-contours.json`, `data-raw/Perozzo-contours-compare.R` (+ `.csv`/`.png`
  output) -- the circular comparison this note is built around.
- `issues/vignettes/HistData-Challenge.Rmd` -- the `Perozzo` case study section this connects to;
  also where the "1850-1870 dip" TODO already lives.
- `issues/vignettes/figures/Perozzo-600dpi.jpg`, `perozzo-original.jpg` -- reference images used
  for the informal gridline check above.
- `issues/TASKS.md` (lines 66-83) -- the existing Perozzo TODO entry, due for a follow-up note
  per "Open questions" above.
