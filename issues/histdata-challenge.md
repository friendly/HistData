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

## `sandbox/` inventory: what's done vs. not yet linked

14 loose scripts, **all now cross-referenced** via `@references` to John Russell's
[30DayChartChallenge 2025](https://github.com/drjohnrussell/30DayChartChallenge) edition:

MF: I think that some of these are already used as examples or referenced someway in the package.
  Refine the list to see what remains.

- `Arbuthnot-PieGlyph.R` → `Arbuthnot` (Challenge03)
- `Cholera-plots.R` → `Cholera` (Challenge01)
- `Galton-PearsonLee.R` → `Galton` & `PearsonLee` (Challenge02)
- `Guerry-map.R` → `Guerry` (Challenge22)
- `OldMaps-plot-map.R` → `OldMaps` (Challenge10)
- `Pyx-ggbump.R` / `Pyx-histogram.R` → `Pyx` (Challenge08)
- `Virginis-plot.R` → `Virginis` (Challenge22)
- `Yeast.R` → `Yeast` (Challenge28)
- `Mcdonnell-density.R` → `Macdonell` (Challenge04)
- `Nightingale-graph.R` → `Nightingale` (Challenge06)
- `Snow-density.R` → `Snow` (Challenge11)

**Resolved 2026-08-05** (commit `0ab187a`): the last 3 above (Macdonell/Nightingale/Snow) were a
real gap — found while doing this inventory, they had no `@references` link at all despite having
a `sandbox/` script. Fixed before drafting, per the decision below, so this inventory is now
accurate rather than something the vignette needs to caveat.

**Pre-existing, not from Russell/30DayChallenge:**

- `Langren-graph.R` → `Langren1644` (NEWS v0.5, original ggplot2 example)
  * MF: Link to blog post, [van Lengren's Secret](https://friendly.github.io/blog/posts/2026-07-van-langren/)
    Perhaps this could be used somewhere to talk about the design/implementation choices one makes in
    reproducing an historical graph. For example, my plots in the van Langren post (generated by Claude! -- but
    dont mention this) were more complex than that done by John Russell in `Langren-graph.R`. Also, is fonts
    were better, but the total code could have been better tweaked to position the title better.
  
- `Pollen-ex.R` → `Pollen`
  * MF: This was just a scratch file to test something. Can be safely ignored, or even deleted.

**Not package-content, exclude or mention only in passing:**

- `HistData-downloads.R`, `mypkg-downloads.R` — CRAN download-stats fun plots, unrelated to any
  dataset's historical content [MF: Ignore this stuff]
  
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
  
  MF: Some of these could be worked out, or just described for further challenges in the Case Studies section.
  The ggplot2 one is a prime example. Could also do the plotly one, if this doesn't cause excessive new
  dependencies or code pain.

## Proposed vignette structure (draft, revised 2026-08-05)

1. **Title/intro** — "The HistData Challenge: Re-Visioning Historical Graphics" (working title).
   Open with the Merriam-Webster "RE-VISION" epigraph.
   MF: Good working title
   
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
   
6. **Case study walkthroughs** (the two/three examples chosen for depth, per Decisions below):
   - 6.1 **`Minard`** — the original re-vision case; point to a couple of gallery entries per
     taxonomy category from section 4 as illustration, rather than reproducing them all.
   - 6.2 **`Perozzo`** — newest, most-documented example. Show the shipped base-R version, then
     live-demo 1-2 of the ggplot2/plotly re-visions listed above.
   - 6.3 **One Russell 30DayChartChallenge example** — pick a single `sandbox/` script (not yet
     chosen) and walk it end to end as the "here's what a finished re-vision from `sandbox/`
     looks like" demonstration.
     
7. **Open invitations** — the not-yet-attempted pieces: the challenges from section 5 that didn't
   get full treatment, the `Ebbinghaus` dataset (per `issues/TASKS.md`), the red-gridline Perozzo
   idea, Rennie's Snow map needing external data. A literal "how to contribute" list.
   
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

## Still open

- **Should `sandbox/` scripts actually be sourced/run live** in the vignette (turning "reference
  material" into "executed examples"), or just described/linked with static images — some depend
  on packages not in `Suggests` (`sp`, `ggbump`, etc.)?
