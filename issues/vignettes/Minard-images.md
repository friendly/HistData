# Minard images

**PROBLEM**: The <https://www.datavis.ca/gallery/re-minard.php> page does not expose the filenames of
all of the actual graphics used. Also, a number of them are of quite low resolution.

  * **SOLVED**: All the materials for the <https://datavis.ca> Gallery site are available on GitHub:   <https://github.com/friendly/datavis/tree/master/gallery>. In particular, the Minard images are in <https://github.com/friendly/datavis/tree/master/gallery/minard>

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
| Design variation | `Gallery\zelazny-minard.png` | 703x529 | Gene Zelazny, "Say it with PowerPoint?" -- an animated PowerPoint build revealing the advance then the retreat, using divided pictogram bars for troops alive vs. deceased and (imprecise) thermometer bars. Confirmed via the gallery page text, see attributions below. |
| Design variation (alt) | `Gallery\minard-MarcoMeschini.png` | 545x313 | Marco Meschini, *La campagna di Russia di Napoleone nel 1812* -- a still from his 6-minute Italian-language video lesson, which builds the graphic over time with mixed text/iconic annotations. |
| Interactive/web-based | `Gallery\protovis-minard.png` | 905x504 | Michael Bostock & Jeffrey Heer (Stanford vis group), Protovis toolkit overlaying the flow band on a live Google Map. Page credits Antonio Saade for bringing it to Michael's attention. |
| Temporal/animated | `minard\Kennet-moving-bubble.gif` | 1288x506, 53 frames | Ron Kennett's moving-bubble re-vision -- single traveling bubble sized to army strength, animates along the route. **Not on the datavis.ca gallery page at all** -- checked against every entry there (Boylan's, Walburg/Hartzog's, and Meschini's are the only animated ones listed); still needs its own attribution source. |
| The original, redrawn for legibility | `minard\1812-2.jpg` | 1296x612 | John Schneider, "Napoleonic Literature" page -- the gallery's own "Best online image" entry: "the largest and most detailed re-creation of Minard's graphic I have found on the Web." Authorship now confirmed (see below) -- this is *not* an anonymous/uncredited find. |

**Superseded**: `march.jpg`'s `minard.r` turned out to be a very old (~2007, pre-1.0) ggplot2
script (`scale_size(to = ...)`, a `load.r` source call) -- rather than try to resurrect it, the
vignette draft (`issues/vignettes/histdata-challenge-draft.Rmd`) now builds a fresh, working
ggplot2 port directly from the package's own `Minard.cities`/`Minard.troops`/`Minard.temp`, so
`march.jpg` and its script are no longer needed for that purpose. Left in place, not deleted --
harmless either way.

## Verbatim attributions from the gallery page (2026-08-06)

The page itself *does* carry complete text and authorship for every item -- it just isn't
organized by filename, so it took a few targeted re-reads to match each shortlisted image to its
entry. Quoting directly rather than paraphrasing, since this is the text to actually credit:

- **Zelazny** (`zelazny-minard.png`), heading "Say it with PowerPoint?": shows "the power of
  PowerPoint" through an animated build revealing "the path from left to right of the advance on
  the top, then revealing the path from right to left of the retreat on the bottom," using
  "divided pictogram bars" for troops alive vs. deceased (thermometer bars present but not
  calibrated to actual values).
- **Meschini** (`minard-MarcoMeschini.png`): "Meschini built a video lesson based on Minard's
  graph, with some historical insight about the fate of Napoleon's russian campaign. The movie
  builds the graphic over time and reinforces some key-points with images and info in a mixed
  text and iconic mode." Source: "Marco Meschini's *La campagna di Russia di Napoleone nel 1812*,
  a 6 minute movie and lecture (in Italian)."
- **Protovis** (`protovis-minard.jpg` on the page -- note the shortlisted local copy is
  `.png`, same image): "Protovis is a graphical toolkit for visualization by Michael Bostock and
  Jeffrey Heer from the Stanford vis group. ... This version uses the Google Maps API to overlay
  Minard's graphic on a Google map of the region." Credit line: "Thanks to Antonio Saade for
  bringing this to my attention."
- **Schneider / `1812-2.jpg`**, heading "Best online image": "the largest and most detailed
  re-creation of Minard's graphic I have found on the Web," from John Schneider's "Napoleonic
  Literature" page. Resolves the earlier "authorship unclear" note -- it's a credited find, not
  an anonymous one.

**A second pictograph entry exists, not yet on the shortlist**: Dragga & Voss, "The human side"
(`minard465x225.gif`, referenced from *Technical Communication*, August 2001, "The Inhumanity of
Technical Illustrations"): "They present this image using pictographs, which gradually change
from soldiers to burial crosses, to illustrate how 'ethically conscious technical communicators
could introduce the human element...'" This is a distinct work from Zelazny's -- worth
considering as an addition or alternative for the "design variation" category if the human-cost
angle is wanted alongside (or instead of) Zelazny's PowerPoint-build angle.

## Licensing

Resolved, mostly: the gallery page's footer states its own license directly -- "Except where
otherwise noted, the Gallery of Data Visualization by Michael Friendly is licensed under a
Creative Commons Attribution-NonCommercial 3.0 License," with a citation format given: "Friendly,
Michael (2001), Gallery of Data Visualization, Electronic document, http://www.datavis.ca/gallery/".
None of the four entries above (Zelazny/Meschini/Protovis/Schneider) carry a separate
"otherwise noted" restriction in their own text, so CC BY-NC 3.0 -- attribution + noncommercial
use, cited as above -- looks like the operative license for embedding any of them in the
(noncommercial, open-source) vignette. Not 100% airtight for genuinely third-party original work
(Zelazny's, Meschini's, Schneider's charts are each *their* creation, redistributed here by
Michael under his own gallery's license) -- worth a sanity check before shipping, but no longer
"unresolved, needs research."

**Still open**: Kennett's moving-bubble GIF isn't on the datavis.ca gallery page at all (see
table above), so this licensing resolution doesn't cover it -- still needs its own source/
attribution before use.

None of the gallery images are embedded in the vignette draft yet -- they're described in prose
only (`## Case study: Minard`, "A few more, from the gallery"), each with attribution and a link
to <https://www.datavis.ca/gallery/re-minard.php>. Embedding is now much less blocked than before,
but still a separate step from this attribution pass.

The one exception needing no permission at all: the live ggplot2 `Minard` port now built directly
in the vignette from the package's own bundled data -- no external image, no licensing question.
