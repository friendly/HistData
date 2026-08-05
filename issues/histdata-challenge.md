# HistData Challenge

A vignette idea: catalog and invite "re-visions" of historical graphics using HistData's
datasets, and showcase what's already been done in `sandbox/`.

## Core framing: "re-visioning" as statistical historiography

`R/HistData-package.R` already states the package's mission in almost exactly these terms
(lines 6, 11-21) — the vignette's intro can quote/adapt this directly rather than re-invent it:

> Some of these present graphical challenges to reproduce in R ... They are part of a program
> of research called *statistical historiography*, meaning the use of statistical methods to
> study problems and questions in the history of statistics and graphics. A main aspect of this
> is the increased understanding of historical problems in science and data analysis through the
> process of trying to reproduce a graph or analysis using modern methods. I call this
> "Re-visioning", meaning to *see again, hopefully in a new light*.

Origin: **Friendly, M. (2002). Visions and Re-Visions of Charles Joseph Minard. *Journal of
Educational and Behavioral Statistics*, 27(1), 31-51.**
<https://www.datavis.ca/papers/jebs.pdf>. Opens with a dictionary-style epigraph worth reusing
as-is:

> RE-VISION *n.* ri-'vizh-en (ca. 1611) 1. To see again, possibly from a new perspective; *syn:*
> review, reconsideration, reexamination, retrospection. 2. An act of revising; *syn:* rewrite,
> alteration, transformation. (Merriam-Webster, 2002)

The paper's second half, "Re-Visions of Minard's Other Graphics," is the template: take a
canonical historical graphic and re-examine/re-create it with modern tools and eyes.

### A ready-made taxonomy of re-visions

The gallery accompanying the paper, <https://www.datavis.ca/gallery/re-minard.php>, catalogs
~15 different re-visions of the Minard graphic across recognizable categories. These make a good
organizing rubric for the vignette — a checklist of *kinds* of re-vision to apply to any
HistData dataset, not just Minard's:

1. **Software/language ports** — same graphic, different tool (Mathematica, ggplot2, SAS/IML,
   Protovis, a formal Grammar-of-Graphics spec)
2. **Design variations** — legibility fixes, a graphic designer's redraw, an alternate visual
   metaphor (e.g. pictograph)
3. **Interactive/web-based** — tooltips, drill-down, linked views, map overlays
4. **Temporal/animated** — step-by-step reveal, a 3rd axis for time, narrated video
5. **Alternative representations** — a genuinely different chart type for the same data
6. **Data packaged for reuse** — the original figures plus machine-readable data in multiple
   formats (this is literally what the HistData package itself does)

### Companion resources (link out, don't duplicate)

- Book: Friendly, M. & Wainer, H. (2021). *A History of Data Visualization and Graphic
  Communication*. Harvard University Press.
- Companion site: <https://friendly.github.io/HistDataVis/> — R code "reconstructions of
  historical graphs" tied to each book chapter. The vignette should position itself as the
  *package-specific*, practitioner-facing entry point, distinct from this book-length treatment —
  cross-link rather than repeat.
- Gallery of Data Visualization (GDV), referenced in the Minard paper.

## Named "challenges" already flagged inside HistData's own docs

Grepped `R/` for existing "challenge" language — these are ready-made worked examples for the
vignette, each already has a citation in place:

| Dataset | Where | Nature of the challenge |
|---|---|---|
| `Minard` | `data-concepts.R` ~2182 | "Minard's Challenge": reproduce the March on Moscow graphic with modern tools, showing off the language/library's expressiveness. (Friendly 2002, above) |
| `Guerry` | `data-concepts.R` ~1296 | Friendly (2007), *Statistical Science* 22, 368-399: "Challenges for Multivariable Spatial Analysis" |
| `Playfair1824` | `R/Playfair1824.R:29` | Re-create Playfair's last chart, or do better, using modern graphics. Data digitized by Ivan Lokhov via WebPlotDigitizer. |
| `Perozzo` | `R/Perozzo.R:33` | Newest addition (2026-08-05): get closer to Perozzo's hand-drawn stereogram, or do better in some way. `@details` already names a specific open piece: colored trace lines for `age`/`year` at 25-year intervals. |
| `Pollen` | `data-concepts.R` ~2741 | The original 1986 ASA JSM "Data Challenge" — a synthetic 5D dataset with several deliberately hidden "features" to find. |
| `OldMaps` | `data-concepts.R` ~2490 | Open call: "produce useful analyses and graphical displays" relating map accuracy to other characteristics. |

## `sandbox/` inventory: what's done vs. not yet linked

14 loose scripts. Cross-checking which ones are actually linked from the docs (`grep -n
"Russell" R/data-concepts.R`) turned up a real gap:

**Already cross-referenced** via `@references` to John Russell's [30DayChartChallenge
2025](https://github.com/drjohnrussell/30DayChartChallenge) edition:

- `Arbuthnot-PieGlyph.R` → `Arbuthnot` (Challenge03)
- `Cholera-plots.R` → `Cholera` (Challenge01)
- `Galton-PearsonLee.R` → `Galton` & `PearsonLee` (Challenge02)
- `Guerry-map.R` → `Guerry` (Challenge22)
- `OldMaps-plot-map.R` → `OldMaps` (Challenge10)
- `Pyx-ggbump.R` / `Pyx-histogram.R` → `Pyx` (Challenge08)
- `Virginis-plot.R` → `Virginis` (Challenge22)
- `Yeast.R` → `Yeast` (Challenge28)

**NOT yet cross-referenced** — the scripts exist in `sandbox/` but nothing in `R/data-concepts.R`
points to them. A real gap worth a small separate TASKS.md fix, independent of the vignette:

- `Mcdonnell-density.R` → `Macdonell` — no `@references` link
- `Nightingale-graph.R` → `Nightingale` — no `@references` link
- `Snow-density.R` → `Snow` — no `@references` link

**Pre-existing, not from Russell/30DayChallenge:**

- `Langren-graph.R` → `Langren1644` (NEWS v0.5, original ggplot2 example)
- `Pollen-ex.R` → `Pollen`

**Not package-content, exclude or mention only in passing:**

- `HistData-downloads.R`, `mypkg-downloads.R` — CRAN download-stats fun plots, unrelated to any
  dataset's historical content
- `john-snow-cholera-maps-nrennie.R` (+ `nrennie0.R`, `.png`) — Nicola Rennie's fuller Snow map
  recreation, already linked via `@references` in `Snow.Rd`, but depends on external data files
  not present in the repo, so it can't actually be re-run. Vignette could show the static `.png`
  only, or list it as "aspirational" / an example of a re-vision that lives outside the package.

## `Perozzo` as the newest worked example — ggplot2 angles

Currently ships base-R-only examples (`persp()`/`contour()`/`contourLines()`, see `R/Perozzo.R`).
Candidate "how would you do this in ggplot2 (or beyond)" ideas — good seeds either for the
vignette's own demo or as additional listed open challenges:

- `geom_raster()`/`geom_tile()` + `geom_contour()` — a straightforward 2D heatmap-plus-isolines
  version.
- Fake the oblique/receding 3D look with a manual isometric/shear coordinate transform (shift
  `Age` into `x`/`y` before plotting in ordinary 2D ggplot) — the classic "fake 3D" trick, and
  unlike `persp()` it gets full access to ggplot's color scales, legends, and layering.
- `gganimate`: animate across `Year`, revealing each birth cohort's survivorship curve as it
  "arrives" — a direct visualization of the cohort-diagonal insight already described in
  `R/Perozzo.R`'s `@details`.
- `plotly::plot_ly(type = "surface")` — a genuinely rotatable interactive 3D version, arguably
  the truest modern analogue of a physical stereogram you can walk around.
- The still-open piece named in `R/Perozzo.R` itself: color the fixed-year age trace lines red
  (deferred mid-session on 2026-08-05 as "a subsequent step" — see git history). This could
  literally *be* one of the vignette's demonstrated solutions.

## Proposed vignette structure (draft)

1. **Title/intro** — "The HistData Challenge: Re-Visioning Historical Graphics" (working title).
   Open with the Merriam-Webster "RE-VISION" epigraph.
2. **What is re-visioning / statistical historiography** — adapted from `HistData-package.R` +
   the Minard paper's framing.
3. **A taxonomy of re-visions** — the 6-category rubric above; this becomes the vignette's
   organizing frame for everything that follows.
4. **Challenges already named in HistData** — the table above (Minard, Guerry, Playfair1824,
   Perozzo, Pollen, OldMaps), each with its citation.
5. **Gallery of existing re-visions in `sandbox/`** — the Russell 30DayChartChallenge scripts +
   Rennie's Snow map, organized by the taxonomy in (3), with code + plot for a few standouts.
6. **Case study walkthrough: `Perozzo`** — newest, most-documented example. Show the shipped
   base-R version, then live-demo 1-2 of the ggplot2/plotly re-visions above.
7. **Open invitations** — the not-yet-attempted pieces: the 3 unlinked sandbox scripts, the
   `Ebbinghaus` dataset (per `issues/TASKS.md`), the red-gridline Perozzo idea, Rennie's Snow map
   needing external data. A literal "how to contribute" list.
8. **Closing** — links to companion resources (book, HistDataVis site, GDV gallery, datavis.ca
   Minard gallery).

## Decisions (2026-08-05)

- **Format**: R Markdown (`.Rmd`), matching the existing `vignettes/Snow_deaths-duplicates.Rmd`.
- **Scope for first draft**: go deep on 2-3 examples — Minard + Perozzo + one Russell
  30DayChartChallenge example — fully worked through the taxonomy, rather than a broad survey of
  all 6 named challenges. Easier to finish and keep accurate; the other challenges stay listed as
  "open invitations" (section 7) rather than fully drafted.
- **Prerequisite**: fix the 3 missing `@references` links (Macdonell/Nightingale/Snow) *before*
  drafting, so the vignette's "already done" inventory is accurate from the start. (Done
  2026-08-05 — see `issues/TASKS.md`.)

## Still open

- **Should `sandbox/` scripts actually be sourced/run live** in the vignette (turning "reference
  material" into "executed examples"), or just described/linked with static images — some depend
  on packages not in `Suggests` (`sp`, `ggbump`, etc.)?
