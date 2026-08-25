# Note: doubt about the "Zabell, S., & Wainer, H. (2002)" citation

MF flagged a nagging doubt about this citation, currently used in `HistData-Challenge.Rmd`'s
Arbuthnot motivating example:

> Zabell, S., & Wainer, H. (2002). A Small Hurrah for the Black Death. *Chance*, 15(4), 58-60.

Investigated 2026-08-24. Initially looked well-founded on two counts (authorship, then content) --
see the "Update" sections below for how each was checked and resolved. **Bottom line: the citation
itself is correct as originally written, both on authorship and on content -- but chasing it down
surfaced a real, separate bug: the vignette's own Arbuthnot plot was plotting the wrong variable.**
See the final update below for that fix. Full PDF now obtained and saved locally.

## What was verified

The 2002 Chance piece "A Small Hurrah for the Black Death" (vol 15, no. 4, pp. 58-60) is authored
by **Wainer alone**, not "Zabell & Wainer" as the vignette currently cites. Three independent
sources agree on sole authorship:

- CrossRef's official metadata for the DOI (`10.1080/09332480.2002.10554828`): author "Howard
  Wainer", title "Visual Revelations: A Small Hurrah for the Black Death", container CHANCE,
  15(4), 58-60.
- Google Scholar's listing: author "H Wainer" only.
- Howard Wainer's own personal bibliography page, <https://www.statlit.org/Wainer.htm>: "Chance
  2002 15(4): A Small Hurrah for the Black Death (PDF)" -- listed under his solo "Visual
  Revelations" column entries, no co-author named. (The "(PDF)" label there is dead text with no
  actual `href` -- unlike neighboring entries on the same page that do link out -- so no PDF was
  recoverable from this source either.)

## What the article seems to actually be about

Content couldn't be fully confirmed (no accessible full text found -- see below), but two partial
signals both point the same direction:

- Google Scholar's snippet preview opens: "Let us begin with a few kind words about the bubonic
  plague. In 1538, Thomas Cromwell, the Earl of Essex (1485-1540), issued an injunction..."
- A publisher blurb for Wainer's essay collection *Graphic Discovery: A Trout in the Milk and
  Other Visual Adventures* (Princeton University Press), which reprints his "Visual Revelations"
  columns and appears to include this one, describes its subject as "England's plague-driven
  initiative to register vital statistics."

Both suggest the piece is about the *origin* of the English parish-register / Bills-of-Mortality
system -- i.e. general historical background for the record system Arbuthnot's data comes from --
rather than specifically about the 1674/1704 duplicate-value finding in Arbuthnot's own table.

The actual discovery of that duplicate is cleanly credited elsewhere, to **Zabell (1976)** alone
(the technical report "Arbuthnot, Heberden and the Bills of Mortality," already correctly cited in
both the vignette and `HistData`'s own package docs for `Arbuthnot`). Zabell (1976) doesn't need
this 2002 piece to support the vignette's claim -- it already stands on its own.

## PDF search: no accessible copy found

Checked and came up empty:

- statlit.org (Wainer's own bibliography page) -- listed but not actually linked, see above.
- ResearchGate, JSTOR, CORE, BASE -- no open-access copy located; JSTOR/CORE searches were also
  blocked by anti-bot pages rather than confirmed absent.
- Direct DOI resolution (`https://doi.org/10.1080/09332480.2002.10554828`) redirects to
  `tandfonline.com`, which returned 403 (paywalled, no institutional access available here).

No sci-hub-style or piracy workaround was attempted. If MF has Taylor & Francis / library access,
that's the route to an actual copy -- at which point the "what the article actually says" question
above can be resolved directly instead of inferred from snippets.

## Update 2026-08-24: authorship question resolved the other way

MF supplied a personal bibtex entry for this article, sourced directly from the tandfonline.com
abstract page (`urldate = {2019-02-28}`):

```
@article{zabell_visual_2002,
    title = {Visual {Revelations}: {A} {Small} {Hurrah} for the {Black} {Death}},
    volume = {15},
    issn = {0933-2480, 1867-2280},
    shorttitle = {Visual {Revelations}},
    url = {http://www.tandfonline.com/doi/full/10.1080/09332480.2002.10554828},
    doi = {10.1080/09332480.2002.10554828},
    language = {en},
    number = {4},
    urldate = {2019-02-28},
    journal = {CHANCE},
    author = {Zabell, Sandy and Wainer, Howard},
    month = sep,
    year = {2002},
    pages = {58--60},
}
```

This lists both authors, and -- unlike CrossRef/Scholar/statlit.org above -- was captured directly
from the publisher's own abstract page rather than a third-party index. Publisher-page bylines are
the more authoritative source when they disagree with CrossRef metadata (CrossRef records for
older "Visual Revelations" guest-column entries are a known weak spot -- the column was edited by
Wainer but individual installments often had a named co-author not always propagated to the
deposited metadata). **Authorship is very likely "Zabell & Wainer" as the vignette already has it**
-- the earlier doubt on this specific point looks resolved in favor of the original citation.

Folded into `histdata.bib`'s existing `ZabellWainer:2002` entry (enriched with the fuller
publisher-page fields: `issn`, `doi`, `url`, `language`, `urldate`, full author first names,
"CHANCE" capitalization, full title including the "Visual Revelations:" column prefix).

**Still genuinely open**: whether the article's *content* actually discusses the Arbuthnot
1674/1704 duplicate specifically, or is (as the Scholar snippet / *Graphic Discovery* blurb
suggest) more general Bills-of-Mortality/Cromwell-1538 background. That part still needs the
actual PDF -- MF is tracking it down separately.

## Update 2026-08-24 (later same day): content question resolved too -- doubt fully closed

MF read the actual displayed text from the tandfonline abstract/preview page (column 2, the last
two paragraphs before the paywall cuts it off) and shared it as a screenshot. It's a direct,
substantive match, not just origin-story background:

> Many of the other irregularities observed are explained in Figure 1, but what about the
> mysterious drop in 1704? That year has about 4,000 fewer christenings than one might expect
> from observing the adjacent data points. What happened? There was no sudden outbreak of a war or
> pestilence, no great civil uprising, nothing that could explain this enormous drop.
>
> The plot not only reveals the anomaly, it also presents a credible explanation. In Figure 2, we
> have duplicated the christening data and drawn a horizontal line across the plot through the
> 1704 data point. In doing so we immediately see that the line goes through exactly one other
> point -- 1674. If we went back to Arbuthnot's table, we would see that in 1674 the number of
> christenings of boys and girls were 6,113 and 5,738, exactly the same number as he had for 1704.
> This 1704 anomaly is likely to be a copying error! In fact, the correct figure for that year is
> 15,895 (8,153 boys and 7,742 [girls, cut off])...

Checked against `HistData::Arbuthnot` directly -- `Arbuthnot[Arbuthnot$Year %in% c(1674, 1704), c("Males","Females")]`
gives exactly **6,113 / 5,738** for both years. Every number in this excerpt (the ~4,000
shortfall, the 6,113/5,738 duplicate, the corrected 15,895 = 8,153 + 7,742) matches the vignette's
own Arbuthnot section verbatim. So this 2002 piece isn't background-only -- it's presenting
essentially the same anomaly-detection argument the vignette makes (plot the data, spot the
graphically-identical points, deduce a copying error), including a "duplicate the series and draw
a horizontal line through the outlier" technique (their Figure 2) that's a nice specific detail the
vignette doesn't currently mention and could.

**Both halves of the original doubt are now resolved, in favor of the citation as originally
written**: joint Zabell & Wainer authorship is confirmed by the publisher's own page (previous
update), and the content directly supports the vignette's specific 1674/1704 claim, matching its
numbers exactly. No changes needed to the vignette's citation or its numbers. Optional
follow-up, not required: the vignette could credit Zabell & Wainer (2002)'s own "duplicate +
horizontal line" plotting technique by name in the Arbuthnot section, since it's a slightly
different (and rather elegant) presentation of the same idea as the vignette's red-highlighted
points.

## Update 2026-08-24 (final): full PDF obtained -- and it turned up a real bug, now fixed

MF located the actual PDF: `C:\Dropbox\Documents\papers\Zabell-Wainer-Visual Revelations-2002.pdf`
(not `C:\Dropbox\papers` as first guessed). Read in full. Confirms everything above and settles
the remaining loose end:

- **Byline, from the article itself**: "VISUAL REVELATIONS / Howard Wainer, Column Editor / A
  Small Hurrah for the Black Death / Sandy Zabell and Howard Wainer" -- joint authorship, straight
  from the page. (The Crossref/T&F *citation* metadata oddly lists only "Howard Wainer (2002)" as
  the citable-as author -- an artifact of how the "Visual Revelations" column's metadata was
  deposited, crediting the column editor -- but the article's own byline is unambiguous. This is
  probably *why* CrossRef/Scholar disagreed with the publisher page in the first place: two
  different fields on the same T&F record.)
- **What Figure 1 and Figure 2 actually show**: both plot annual **Christenings** (total
  christenings, Males + Females, in thousands) against Year, 1630-1710 -- not the sex `Ratio`.
  Figure 1 shows the raw series, with several dips annotated and explained (Civil War, Great
  Plague of 1665, Great Fire, a smallpox epidemic) except for one: "the mystery of 1704." Figure 2
  duplicates the series and draws a horizontal (dotted) line through the 1704 point, showing it
  passes through exactly one other point, 1674 -- visual confirmation of the copying error, with
  an arrow marking the "correct value" where 1704 should have been.
- **Exact figures, confirmed against the article**: ~4,000-christening shortfall; 1674 and 1704
  both have Males=6,113, Females=5,738; corrected 1704 figure is 15,895 (8,153 boys, 7,742 girls),
  "which lies comfortably between the christenings of 1703 and 1705." All match the vignette's
  numbers exactly (also checked directly against `HistData::Arbuthnot`).
- **The "sore thumb" quote, exact wording**: "he did not, despite the fact that when graphed the
  error stood out, literally, like a sore thumb."
- Explicitly says it "leans heavily on an earlier technical report (Zabell, 1976) which presented
  a graph similar to Figure 1 above" -- so the Christenings-based graphical technique traces back
  to Zabell (1976) too, not just this 2002 piece.

### The real bug this surfaced: the vignette's own plot used the wrong variable

MF caught this independently before the PDF was even in hand, from a screenshot of the article
text: the vignette's `arbuthnot-plot` chunk plotted the sex **`Ratio`** (Males/Females) by Year,
not **`Christenings`** (Males + Females) as the actual Zabell & Wainer figures do. That's a real
correctness bug, not just a stylistic difference:

- In `Christenings` terms, the series climbs ~80% from 1630 to 1710, so 1674's ordinary value
  becomes a dramatic, unmissable plunge when it recurs at 1704 -- exactly what Figures 1-2 show.
- In `Ratio` terms, there's no such trend (the sex ratio at birth is roughly flat, noisily, across
  the whole span), so pasting 1674's *ratio* into 1704 produces an entirely unremarkable value --
  it does not stand out from its neighbors at all. Checked directly:
  `Arbuthnot[order(Arbuthnot$Ratio),][1:5,]` puts **1703** (Ratio 1.011) at the very bottom of the
  entire 82-year series, a dramatic-looking low point immediately next to 1704 -- but that's
  unrelated noise, no part of the copying-error story. A reader looking at the old Ratio-based
  plot and expecting to spot "the anomaly" would very plausibly land on 1703 by mistake, not 1674/
  1704.

Fixed in `HistData-Challenge.Rmd` (2026-08-24): `arbuthnot-duplicate` now shows `Christenings`
alongside `Males`/`Females`/`Ratio`; `arbuthnot-plot` now plots `Christenings` by `Year`, with a
dotted horizontal reference line through the 1704 level (a direct nod to Zabell & Wainer's own
Figure 2); added a short paragraph explaining *why* `Christenings` and not `Ratio` is the right
quantity, including the 1703-as-red-herring point. Prose citations updated to attribute the
specific numbers and the "sore thumb" quote to Zabell & Wainer [-@ZabellWainer:2002] directly
(previously mis-attributed to Wainer & Spence 2005, which the vignette hadn't actually verified
the wording of). Re-rendered end-to-end, clean.

Full PDF now saved at `C:\Dropbox\Documents\papers\Zabell-Wainer-Visual Revelations-2002.pdf`.
Nothing further blocking on this citation.
