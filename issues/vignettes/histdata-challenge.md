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

### A small motivating example for the intro: Zabell's find in `Arbuthnot`

Before the vignette gets to anything as ambitious as Minard, it's worth opening with something
small and concrete: `R/data-concepts.R`'s own `@details` for `Arbuthnot` already records that
Sandy Zabell (1976) found the data contain an error — the values for 1674 and 1704 are identical,
suggesting one was miscopied from the other — a discrepancy that surfaces once you actually plot
the series rather than just tabulate it. That's re-visioning in miniature: looking again at old
data with a graph turns up something a table alone hides. Citations (the second isn't currently
used anywhere else in the package):

- Zabell, S. (1976). Arbuthnot, Heberden and the Bills of Mortality (Technical Report No. 40).
  Department of Statistics: The University of Chicago. (Already cited in `Arbuthnot`'s
  `@references`.)
- Zabell, S., & Wainer, H. (2002). A Small Hurrah for the Black Death. *Chance*, 15(4), 58-60.

DOIs for both (and a pass over the vignette's other references) are deferred — see
`issues/TASKS.md`.

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

This taxonomy *is* the vignette's value-add, not just background: rather than a flat list of
"here's a challenge, go do something," each of the 6 categories above should become its own `###`
subsection with real description — what that kind of re-vision asks of you, why it's a distinct
mode of "seeing again" rather than a cosmetic variant of another category, and (where the
datavis.ca gallery has one) an illustrative image pulled from
<https://www.datavis.ca/gallery/re-minard.php>. See section "A taxonomy of re-visions, fleshed
out" in the proposed structure below.



(Companion resources — the book, the HistDataVis site, the GDV gallery — moved to a "Going
Further" section at the end, per the proposed structure below, rather than sitting in the intro.)

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

## `sandbox/` inventory, refined: what's actually done vs. dormant-but-linked

First pass (above) only checked whether a `@references` link exists. Re-checked more carefully —
every one of these datasets already had *its own* example plot in `@examples` before Russell's
2025 contribution (unsurprising: they're mature, long-shipped datasets). What actually
distinguishes them is whether *Russell's specific recreation* is executed/shown anywhere, or
just sits as a dormant file with a link pointing at it. Only one script clears that bar. Also
checked each dormant script's `library()` calls against `DESCRIPTION`'s `Suggests:` — relevant
for choosing a low-friction live demo (see "Decisions" below):

**Fully embedded & executed** — Russell's own code lives directly in the package's `@examples`,
using only packages already in `Suggests` (`ggplot2`, `dplyr`, `forcats`):

- `Pyx-histogram.R` → `Pyx` (Challenge08, `data-concepts.R:2923`). Note this is distinct from
  `Pyx-ggbump.R` (below), which is a second, still-dormant Russell recreation of the same dataset.

**Linked via `@references`, but dormant** — the script exists, the link exists, but the code has
never been run/shown in the package. Each already coexists with the dataset's own separate
(usually simpler, base-R) example. Extra packages needed beyond current `Suggests`
(`ggplot2`/`dplyr`/`forcats`/`lubridate` already covered) in parens:

- `Yeast.R` → `Yeast` (Challenge28) — **no extra deps** (just `tidyverse`'s `ggplot2`/`dplyr`;
  one `tibble()` call, trivially swappable for `data.frame()`)
- `Snow-density.R` → `Snow` (Challenge11) — **no extra deps**, same reasoning
- `Galton-PearsonLee.R` → `Galton` & `PearsonLee` (Challenge02) — `RColorBrewer` (lightweight)
- `Mcdonnell-density.R` → `Macdonell` (Challenge04) — `RColorBrewer`, `ggExtra`
- `Pyx-ggbump.R` → `Pyx` (Challenge08, the *other* Pyx script) — `RColorBrewer`, `ggbump`
- `Virginis-plot.R` → `Virginis` (Challenge22) — `ggrepel`
- `Arbuthnot-PieGlyph.R` → `Arbuthnot` (Challenge03) — `PieGlyph` (niche)
- `Cholera-plots.R` → `Cholera` (Challenge01) — `waffle`, `emojifont`, `RColorBrewer`
- `Nightingale-graph.R` → `Nightingale` (Challenge06) — `RColorBrewer`, `showtext`. Package's own
  `@examples` already has a *different*, older coxcomb/rose-diagram `ggplot2` example
  (`data-concepts.R` ~2390-2410); Russell's is a distinct `coord_radial()` take. A genuinely nice
  "two re-visions, two taxonomy categories, same data" pairing if this gets picked for section 6.
- `Guerry-map.R` → `Guerry` (Challenge22) — `sf`, `patchwork`
- `OldMaps-plot-map.R` → `OldMaps` (Challenge10) — `geosphere`, `rnaturalearth`, `sf`, `metR`
  (heaviest of the set)

**Best low-friction candidates for a live-executed case study (section 6.3)**: `Yeast.R` or
`Snow-density.R` — zero new `Suggests`. `Snow-density.R` is the more thematically appealing pick
(iconic dataset, ties into the existing `SnowMap()` function, fits the "alternative
representation"/density-contour taxonomy category cleanly).

**Pre-existing, not from Russell/30DayChallenge:**

- `Langren-graph.R` → `Langren1644` (NEWS v0.5, original ggplot2 example). Related: the blog post
  [Van Langren's Secret, Finally Told](https://friendly.github.io/blog/posts/2026-07-van-langren/)
  has its own "Bonus: Reproducing Langren's 1644 Graph" section — a *third* independent re-vision
  of the same graphic, with period-appropriate fonts. Good material for a short aside on the
  design/implementation trade-offs different re-visions make (the blog version trades simplicity
  for historical-authenticity touches the sandbox script doesn't attempt) — without needing to
  build out a full third case study.

**Safe to delete, not vignette material:**

- `Pollen-ex.R` — scratch file for testing something, not a real example. Candidate for deletion
  rather than inclusion; flag in `issues/TASKS.md` separately from the vignette.
- `HistData-downloads.R`, `mypkg-downloads.R` — CRAN download-stats fun plots. Out of scope,
  ignore for vignette purposes.

**Not package-content, exclude or mention only in passing:**

- `john-snow-cholera-maps-nrennie.R` (+ `nrennie0.R`, `.png`) — Nicola Rennie's fuller Snow map
  recreation, already linked via `@references` in `Snow.Rd`, but depends on external data files
  not present in the repo, so it can't actually be re-run. Vignette could show the static `.png`
  only, or list it as "aspirational" / an example of a re-vision that lives outside the package.

## `Perozzo` as the newest worked example — ggplot2 angles

Currently ships base-R-only examples (`persp()`/`contour()`/`contourLines()`, see `R/Perozzo.R`).
Candidate "how would you do this in ggplot2 (or beyond)" ideas, now split by whether they're
worth actually *building* for the case study (section 6.2) vs. just *describing* as a further
open challenge — driven mainly by dependency cost, since `ggplot2`/`dplyr` are already in
`Suggests` but `gganimate`/`plotly` are not:

**Build for real, in the vignette:**

- `geom_raster()`/`geom_tile()` + `geom_contour()` — straightforward 2D heatmap-plus-isolines
  version. No new dependencies.
- Fake the oblique/receding 3D look with a manual isometric/shear coordinate transform (shift
  `Age` into `x`/`y` before plotting in ordinary 2D ggplot) — the classic "fake 3D" trick, and
  unlike `persp()` it gets full access to ggplot's color scales, legends, and layering. No new
  dependencies.
- The still-open piece named in `R/Perozzo.R` itself: color the fixed-year age trace lines red
  (deferred mid-session on 2026-08-05 as "a subsequent step" — see git history). This could
  literally *be* one of the vignette's demonstrated solutions, and is base-R/`persp()` — no new
  dependencies either.

**Describe as an open challenge, unless dependency cost turns out acceptable:**

- `gganimate`: animate across `Year`, revealing each birth cohort's survivorship curve as it
  "arrives" — a direct visualization of the cohort-diagonal insight already described in
  `R/Perozzo.R`'s `@details`. Would add `gganimate` (+ a renderer like `gifski`) to `Suggests`.
- `plotly::plot_ly(type = "surface")` — a genuinely rotatable interactive 3D version, arguably
  the truest modern analogue of a physical stereogram you can walk around. Would add `plotly` to
  `Suggests`; also the one idea here that's genuinely hard to show statically in a PDF/CRAN-check
  context (needs an HTML vignette, which this already is, so that part's fine) — worth trying if
  the dependency is acceptable, since it's arguably the most compelling single demo in the whole
  vignette.

## Proposed vignette structure (draft, revised 2026-08-05)

1. **Title/intro** — "The HistData Challenge: Re-Visioning Historical Graphics" (working title,
   confirmed). Open with the Merriam-Webster "RE-VISION" epigraph.

2. **A small motivating example: `Arbuthnot`** — Zabell's 1674/1704 find (see above). Concrete
   and quick before anything as big as Minard — the point is that *looking again, graphically*
   surfaces things tabulation hides. One short paragraph, one plot, done.
   
3. **What is re-visioning / statistical historiography** — adapted from `HistData-package.R` +
   the Minard paper's framing.
4. **A taxonomy of re-visions, fleshed out** — the real payoff of the vignette, not just
   background. Each of the 6 categories gets its own `###` subsection:
   - 4.1 Software/language ports
   - 4.2 Design variations
   - 4.3 Interactive/web-based
   - 4.4 Temporal/animated
   - 4.5 Alternative representations
   - 4.6 Data packaged for reuse

   Each subsection: what that mode of re-vision actually asks of you, why it counts as a
   *distinct* way of "seeing again" rather than a cosmetic variant of another category, one
   illustrative image pulled from <https://www.datavis.ca/gallery/re-minard.php> where available,
   and a forward-pointer to which of the worked/gallery examples below fits that category.
   
5. **Challenges already named in HistData** — the table above (Minard, Guerry, Playfair1824,
   Perozzo, Pollen, OldMaps), each with its citation. Per the scope decision below, only
   `Minard` and `Perozzo` get full worked treatment in this first draft; the rest are named,
   cited, and cross-linked to section 7 ("Open invitations") rather than drafted in depth.
   
6. **Case study walkthroughs** (the examples chosen for depth, per Decisions below):
   - 6.1 **`Minard`** — the original re-vision case; point to a couple of gallery entries per
     taxonomy category from section 4 as illustration, rather than reproducing them all.
   - 6.2 **`Perozzo`** — newest, most-documented example. Show the shipped base-R version, then
     build out (not just describe) the ggplot2 raster+contour version, the isometric-shear fake-3D
     version, and the red-trace-line fix — all zero-new-dependency. `gganimate`/`plotly` versions
     built too if the dependency addition is approved (see "Still open" below), else described as
     open invitations instead.
   - 6.3 **One Russell 30DayChartChallenge example, live-executed** — candidate: `Snow-density.R`
     (zero new dependencies, iconic dataset, pairs naturally with the existing `SnowMap()`
     function) or `Yeast.R` (also zero new dependencies). See the refined `sandbox/` inventory
     above for the full dependency breakdown of every candidate. A short aside on `Langren1644`
     (the sandbox script vs. the blog post's independent reproduction) can sit here too, without
     needing to become a full fourth case study.

7. **Open invitations** — the not-yet-attempted pieces: the challenges from section 5 that didn't
   get full treatment, every dormant (linked-but-never-run) `sandbox/` script not chosen for 6.3,
   the `Ebbinghaus` dataset (per `issues/TASKS.md`), the deferred Perozzo `gganimate`/`plotly`
   versions if not built, Rennie's Snow map needing external data. A literal "how to contribute"
   list.
   
8. **Going Further** — companion resources, moved here from the intro rather than front-loaded:
   - Book: Friendly, M. & Wainer, H. (2021). *A History of Data Visualization and Graphic
     Communication*. Harvard University Press.
   - Companion site: <https://friendly.github.io/HistDataVis/> — R code "reconstructions of
     historical graphs" tied to each book chapter. This vignette is the *package-specific*,
     practitioner-facing entry point; cross-link rather than repeat its content.
   - Gallery of Data Visualization (GDV), referenced in the Minard paper.
   - <https://www.datavis.ca/gallery/re-minard.php> (already linked throughout section 4, but
     worth a final pointer here too).

## Decisions (2026-08-05)

- **Format**: R Markdown (`.Rmd`), matching the existing `vignettes/Snow_deaths-duplicates.Rmd`.
- **Scope for first draft**: go deep on 2-3 examples — Minard + Perozzo + one Russell
  30DayChartChallenge example — fully worked through the taxonomy, rather than a broad survey of
  all 6 named challenges. Easier to finish and keep accurate; the other challenges stay listed as
  "open invitations" (section 7) rather than fully drafted.
- **Prerequisite**: fix the 3 missing `@references` links (Macdonell/Nightingale/Snow) *before*
  drafting, so the vignette's "already done" inventory is accurate from the start. (Done
  2026-08-05 — see `issues/TASKS.md`.)

## Where to draft this (2026-08-05)

Dropping a `.Rmd` directly into `vignettes/` is risky while it's a work-in-progress: pkgdown's
"Building articles" step scans everything in `vignettes/` and publishes it on the next
`pkgdown::build_site()` (confirmed — that's exactly how `Snow_deaths-duplicates.Rmd` gets built
today), so a half-finished draft there would go live on the GitHub Pages site the next time
anyone rebuilds the site, deliberately or not.

**Recommendation**: draft in `issues/` instead — e.g. `issues/histdata-challenge-draft.Rmd` —
mirroring the `dev/`-folder workflow already documented in the global `TASKS-all.md` ("Workflow:
resolving a `dev/` TODO with Claude"), adapted to this package's actual convention of using
`issues/` in place of `dev/`/`extra/` (per this file's own earlier notes). Preview locally with
`rmarkdown::render()` or the RStudio knit button as you go; only `git mv` it into `vignettes/`
once it's actually ready to ship (at which point run `devtools::document()`, `devtools::check()`,
add the `NEWS.md` entry, and rebuild pkgdown — same checklist as any other feature landing).

`issues/` is already `.Rbuildignore`d and not scanned by pkgdown, so nothing there gets published
regardless of how unfinished it is.

## Decisions, round 2 (2026-08-05)

- **Draft location**: `issues/vignettes/` (new folder), not `issues/` directly. This planning
  doc moved here (`git mv`); the actual draft lives alongside it as
  `issues/vignettes/histdata-challenge-draft.Rmd`. Will need a `references.bib` eventually
  (citations are plain-text in the draft for now) — not addressed yet, per instruction to focus
  on getting a working draft first.
- **`plotly` added to `Suggests`** (was already installed locally, confirmed working). The
  rotatable-surface re-vision is built in the draft. `gganimate` held for later — not added,
  described as an open invitation instead.
- **`Snow-density.R` confirmed** for section 6.3, live-executed in the draft.

First working draft exists as of 2026-08-05: intro, Arbuthnot motivating example (real code +
plot), taxonomy (6 subsections, prose only — image TODOs left for later), challenges table,
`Perozzo` case study (3 built re-visions: ggplot2 raster+contour, isometric-shear, plotly
surface — the red-trace-line idea explicitly left open, not attempted), `Snow` case study
(live `Snow-density.R`), open invitations, going further, plain-text references. Rendered
end-to-end with `rmarkdown::render()`, no errors. Still placeholder/thin: the "What is
re-visioning" section (mostly covered by the intro already) and the `Minard` case study
(structure only, no content yet).

## Progress update (2026-08-05, second pass)

MF added inline `TODO`s to the draft plus a dedicated `Minard-images.md`; worked through all of
them:

- **Taxonomy sections numbered** (1-6), per MF request.
- **Software/language ports**: the data-decomposition `TODO` (Snow's 5 layers, Minard's 3) is now
  real prose, and cross-links to the new `Minard` case study below.
- **Temporal/animated**: added a concrete example (Ron Kennett's moving-bubble re-vision),
  described in prose; actual `.gif` embedding still pending the general image-hosting/licensing
  question.
- **`Perozzo` case study**:
  - The original is now actually shown — downloaded locally (`figures/perozzo-original.jpg`,
    hotlinking to Wikimedia broke pandoc's `--embed-resources` step, which sends no User-Agent and
    gets a 403). Confirmed public domain on the file's Commons page.
  - Reading the original's own legend ("Sistema d'Assi") corrected an earlier assumption here:
    Perozzo used **red** for census-year cross-sections and **violet** for cohort-survivorship
    diagonals (not the "green isolines / blue cohorts" an earlier web-search summary suggested).
    Fixed in both this doc's history (implicitly, via the vignette) and the vignette prose.
  - Built the enhanced `persp()` plot MF's `TODO` asked for: re-angled to bring the `Age = 0`
    "wall" forward, red-highlighted cross-sections at 25-year intervals (matching Perozzo's own
    color), and blue cohort diagonals (standing in for his violet, which got lost against the
    surface shading). All base R — `persp()`'s returned projection matrix plus `trans3d()`/
    `lines()`, no new dependencies. This resolves what the "Still open" note below used to flag as
    deferred.
- **`Minard` case study**: no longer a placeholder. Built a real, working ggplot2 port directly
  from `Minard.cities`/`Minard.troops`/`Minard.temp` (the "software/language ports" example the
  taxonomy section points to), then named — in prose, not embedded — one gallery example per
  remaining category (Zelazny's pictograph for design variation, a Protovis/Google-Maps port for
  interactive, Kennett's bubble map for animated), each attributed and linked to the gallery page
  rather than reproduced raw, since licensing on the third-party ones isn't sorted out.
- **`Minard-images.md`**: found the actual "Gallery of Data Vis" folder (search for `*gallery*`
  under `Documents`, not `Documents/milestones/images/minard/` — it's a sibling,
  `Documents/milestones/images/Gallery/`) and curated one representative image per taxonomy
  category with resolutions checked. Full table and licensing notes in that file.
- Whole document re-rendered end-to-end with `rmarkdown::render()` after each change — clean, no
  warnings, on the final pass.

## Still open

- **Licensing on the third-party Minard gallery images** — see `Minard-images.md`'s "Still
  unresolved" section. Nothing embedded yet; case study is prose + one self-contained ggplot2 plot
  only.
- **`1812-2.jpg`'s authorship** — sitting in MF's own folder but not confirmed original; worth
  checking before using it as "the original" the way the confirmed-public-domain Perozzo image is
  used.
- **`references.bib`** — deferred; draft currently cites everything as plain text.
- **Taxonomy category thumbnails** — the general "pull a representative image from the datavis.ca
  gallery for each of the 6 categories" `TODO` (distinct from the Minard-specific curation above)
  is still open, same licensing question.

## Progress update (2026-08-24, third pass)

Resolved the remaining actionable inline `TODO`s (scope: finish the draft's content, not a full
ship — bibliography conversion and the move to `vignettes/` stay deferred per the file's own
header):

- **Perozzo's 1850-1870 dip**: was a bare `TODO: cite Friendly, Wainer §8.4` next to prose that
  already explained the emigration finding. Cited properly (Friendly & Wainer 2021, added to the
  plain-text References list too) and tightened the prose.
- **`Snow` case study**: dropped a speculative `TODO` musing about a better 2D-density version MF
  recalled making, possibly somewhere in a Twitter-archive media dump under
  `C:\Dropbox\Twitter\twitter-archive-2022-11-06\data\tweets_media` (thousands of untitled images,
  no code found alongside it — not worth chasing for this pass). The shipped `Snow-density.R`
  case study is fine as-is and stays.
- **Isometric-shear `Perozzo` re-vision**: tried a few `shear`/`lift` combinations as a scratch
  comparison (not committed) — the original `0.6`/`400` pair already gives the most legible
  "mountain" silhouette of the ones tried. Reworded the inline caveat from "revisit before
  shipping" to an accurate description (stylized fake-3D, not a fit to Perozzo's own oblique axis
  convention) rather than tuning further.
- **`.gitignore`**: added `issues/vignettes/*.html` (+ `.knit.md`, `*_files/`) — the knitted HTML
  was showing up as an untracked stray file every time the draft gets rendered locally.
- Re-rendered end-to-end with `rmarkdown::render()` (all 23 chunks, including `plotly`) — clean,
  no errors.

**"What is re-visioning?" section** turns out to have been already fully written (not a
placeholder) as of the second-pass update above; the earlier "Still open" line claiming otherwise
was stale, removed.

## Shipped 2026-08-24: moved to `vignettes/`

`HistData-Challenge.Rmd` and `histdata.bib` moved (`git mv`) from `issues/vignettes/` to
`vignettes/`; `figures/Perozzo-600dpi.jpg` copied alongside (not moved -- the original stays in
`issues/vignettes/figures/` since `verifying-perozzo.md` and this file still reference it there).
This planning doc, `Zabell-Wainer-note.md`, `verifying-perozzo.md`, and `Minard-images.md` all
stay in `issues/vignettes/` as working notes -- only the finished prose+code shipped.

Remaining before the next release: `devtools::document()`, `devtools::check()`, a `NEWS.md`
entry, and a pkgdown rebuild (`issues/TASKS.md`'s "Workflow: rebuilding pkgdown" checklist).
