# Minard images

**PROBLEM**: The <https://www.datavis.ca/gallery/re-minard.php> page does not expose the filenames of
all of the actual graphics used. Also, a number of them are of quite low resolution.

## Found: the Gallery of Data Vis folder

`C:\Users\friendly\Dropbox\Documents\milestones\images\Gallery\` -- confirmed via a filename
search (nothing literally named "Gallery of Data Vis", but this is clearly it: dozens of
milestone/GDV-era images, including several Minard-specific ones not in the `minard/` subfolder).

## Curated picks, one per taxonomy category (2026-08-05)

Checked resolution on each with `magick identify`; all are reasonable web resolution (500-1300px
wide), none of the "quite low resolution" ones ended up on this shortlist.

| Category | File | Resolution | What it shows |
|---|---|---|---|
| Software/language port | `Gallery\ggplot2-minard-v2\2007-minard\march.jpg` (+ `minard.r`, `cities.txt`, `troops.txt`, `temps.txt` alongside it) | 1139x286 | An early ggplot2 port -- but see note below, this is now superseded. |
| Design variation | `Gallery\zelazny-minard.png` | 703x529 | Gene Zelazny's pictograph redesign -- soldier-icon bands, portrait, onion domes, thermometer icons. Striking, very different design language from the original. |
| Design variation (alt) | `Gallery\minard-MarcoMeschini.png` | 545x313 | A flat, modern Italian-language redesign. Smaller/lower-res than Zelazny's -- use as a second example only if two are wanted. |
| Interactive/web-based | `Gallery\protovis-minard.png` | 905x504 | Protovis flow band over a live, pannable/zoomable Google Map -- map controls visible in the screenshot itself. Best "interactive" illustration found. |
| Temporal/animated | `minard\Kennet-moving-bubble.gif` | 1288x506, 53 frames | Ron Kennett's moving-bubble re-vision -- single traveling bubble sized to army strength, animates along the route. |
| The original, redrawn for legibility | `minard\1812-2.jpg` | 1296x612 | Clean English-labeled redraw of the 1869 chart + temperature panel. Good candidate for "here's the original" at the top of the case study, analogous to the Perozzo Wikimedia image -- but authorship/license unconfirmed (see below). |

**Superseded**: `march.jpg`'s `minard.r` turned out to be a very old (~2007, pre-1.0) ggplot2
script (`scale_size(to = ...)`, a `load.r` source call) -- rather than try to resurrect it, the
vignette draft (`issues/vignettes/histdata-challenge-draft.Rmd`) now builds a fresh, working
ggplot2 port directly from the package's own `Minard.cities`/`Minard.troops`/`Minard.temp`, so
`march.jpg` and its script are no longer needed for that purpose. Left in place, not deleted --
harmless either way.

## Still unresolved: licensing

None of the gallery images above are embedded in the vignette draft yet -- they're described in
prose only (`## Case study: Minard`, "A few more, from the gallery"), each with attribution and a
link to <https://www.datavis.ca/gallery/re-minard.php>. Zelazny's, Meschini's, and the Protovis
screenshot are all third-party work; before embedding any of them in a CRAN-published vignette,
need to either confirm they're used with permission (per-artist) or fall back to a text-only
description (as now) / a link to the gallery page itself. `1812-2.jpg`'s authorship is unclear
even though it's in Michael's own folder -- worth a quick check of whether it's an original
creation or an uncredited copy of something else (e.g. the similar English-labeled version widely
circulated on Wikipedia) before using it as "the original" the way the confirmed-public-domain
Perozzo Wikimedia image is used in the `Perozzo` case study.

The one exception needing no permission at all: the live ggplot2 `Minard` port now built directly
in the vignette from the package's own bundled data -- no external image, no licensing question.
