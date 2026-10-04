# Semmelweis handwashing data — working notes

New datasets for HistData: puerperal ("childbed") fever mortality at the Vienna
General Hospital's lying-in clinics, before and after Semmelweis introduced chlorine
handwashing in mid-May 1847.

Dataset names: `Handwashing.*` (MF's choice, over `Semmelweis.*`).

Impetus for this: A mention in "This Month in Statistics History", AMSTAT News, Sept. 2026 (Penny S. Reynolds)

> " Handwashing was the most effective protection against hospital-acquired infections, which was still a significant patient safety concern. Using the “numerical method,” advocated by Pierre‑Charles Alexandre Louis, Ignaz Semmelweis published a quantitative comparison of mortality rates between two maternity wards at Vienna General Hospital. He showed that maternal deaths from puerperal (child bed) fever dropped dramatically from 18% to under 2% after stringent handwashing protocols were introduced. His attempts at reform did not go well: His findings were rejected by the medical establishment, and he lost his job and died in a mental institution. However, since then, handwashing has saved millions of lives."

## Source

Semmelweis, Ignaz Philipp (1861). *Die Aetiologie, der Begriff und die Prophylaxis des
Kindbettfiebers*. Pest, Wien und Leipzig: C. A. Hartleben's Verlags-Expedition. vi + 543 pp.

- Wellcome Collection copy (Public Domain Mark): <https://wellcomecollection.org/works/n5yu49cf>
- IIIF manifest: <https://iiif.wellcomecollection.org/presentation/v3/b33953740>
- PDF: <https://iiif.wellcomecollection.org/pdf/b33953740>
- OCR text: <https://api.wellcomecollection.org/text/v1/b33953740> (useful for finding tables,
  useless for the numbers in them)
- English translation: K. Codell Carter (1983), *The Etiology, Concept, and Prophylaxis of
  Childbed Fever*, University of Wisconsin Press. Carter renumbers the tables (see below).

Page images: `https://iiif.wellcomecollection.org/image/b33953740_NNNN.jp2/full/full/0/default.jpg`,
where `NNNN` = printed page number + 8 (e.g. p. 3 is `0011`). Full size is only about
1127 x 1789 px, but the server will upscale a cropped region, which is what made the small
digits legible: `.../b33953740_0070.jp2/170,570,460,500/1380,/0/default.jpg` (region `x,y,w,h`,
then output width).

MF: Also found-- An English translation, ascribed to Semmelweis, with tables:
http://graphics8.nytimes.com/images/blogs/freakonomics/pdf/the%20etiology,%20concept%20and%20prophylaxis%20of%20childbed%20fever.pdf
This was linked in the Forbes article, Dykes B 2016. A history lesson on the dangers of letting data speak for itself. Forbes
https://www.forbes.com/sites/brentdykes/2016/02/09/a-history-lesson-on-the-
dangers-of-letting-data-speak-for-itself/

Claude: this PDF (saved as `online/Semmelweis-etiology_of_childbed_fever.pdf`, 14 pp.) is an
excerpt of Carter's 1983 translation, not a separate translation: the source note on its first
page says "Excerpted from Ignaz Semmelweis, *The Etiology, Concept, and Prophylaxis of Childbed
Fever*, trans. K. Codell Carter", reprinted as pp. 46–59 of an anthology ("Part I. Historical
Development"). It carries Carter's Tables 1–7 with the percent decimals printed at normal size,
so it is an independent check on the transcription; see "Carter excerpt" below.



## What was transcribed

Everything was read from the page scans, not from the OCR.

| File | Rows | Tables | Content |
|---|---|---|---|
| `clinics-yearly.csv` | 52 | XXII (p. 139), I (p. 3), XXIII (p. 140) | Births and deaths by year, 1833–1858, for clinic 1 and clinic 2 |
| `clinic1-monthly.csv` | 99 | III (p. 13), unnumbered (p. 56), XVI (p. 57), text (p. 57) | Births and deaths by month in clinic 1, Jan 1841 – Mar 1849 |
| `hospital-yearly.csv` | 65 | XVII (p. 62) | Admissions and deaths by year for the whole lying-in hospital, 1784–1848 |

Each row carries the `table` and `page` it came from.

Departures from the four tables originally listed (I, XV, XVII, XXIII):

- **Table XV is not transcribed separately.** XV (pp. 49–50) is the monthly figures for 1846
  and Jan–May 1847. Tabelle III (p. 13) gives the same months as part of a complete monthly
  series from Jan 1841, so III was used instead. The counts in XV and III agree for all 17
  months (compared by eye).
- **Table XVI and the unnumbered table on p. 56 were added**, to carry the monthly series
  past the start of handwashing (Jun–Dec 1847, then all of 1848). Jan–Mar 1849 are given
  only in running text on p. 57 (403/9, 389/12, 406/20).
- **Table XXII was added**, giving the two clinics for 1833–1840, so the yearly clinic series
  runs continuously from the division of the hospital into two clinics.

Clinic labels: Abtheilung I = "Klinik für Aerzte" (medical students); Abtheilung II = "Klinik
für Hebammen" (midwives). Tabelle XXII covers the years when students and midwives were
divided equally between both clinics; the separation dates from 1841 (text, p. 139).

Footnotes to Tabelle XXIII, as printed: 1847 — Semmelweis, assistant 20 March 1847 to
20 March 1849; 1849 — Carl Braun, assistant "vom 20. März 1853 bis im Sommer 1853" (the first
"1853" is presumably a misprint for 1849); 1853 — Gustav Braun, assistant, and acting professor
April–December 1857; 1858 — Karl Braun, professor.

## Percentages

Semmelweis prints a percent column in every table, with the decimals set as tiny inferior
figures (e.g. 13.₃₉). Those decimals are not reliably legible in the scan even enlarged, so
**they are not transcribed**; rates should be computed from the counts.

- For Tabelle XVII the whole-number part of the printed percent is recorded
  (`pct_whole_printed`) as a check on the counts.
- For the other tables I compared the printed percent with deaths/births while transcribing;
  this was by eye and is not recorded in the CSVs.
- Where the decimals could be read, the printed values look truncated rather than rounded
  (e.g. 4/213 = 1.878 printed as 1.87).

Tabelle I's percents are legible and worth keeping for documentation: clinic 1 —
7.7, 15.8, 8.9, 8.2, 6.8, 11.4, total 9.92; clinic 2 — 3.5, 7.5, 5.9, 2.3, 2.03, 2.7, total 3.38.
The clinic 2 total disagrees with the counts: 691/17791 = 3.88, not 3.38 (clinic 1's 9.92 =
1989/20042 is right). So the ratio of the clinics over 1841–1846 is 2.6, not the 2.9 the
printed percents imply.

## Checks (`handwashing-check.R`)

Run from the package root: `Rscript data-raw/handwashing/handwashing-check.R`.

Passed:

- Column sums of Tabellen I, XXII and XXIII reproduce all twelve printed "Summa" figures.
- Monthly sums reproduce the printed totals for Jun–Dec 1847 (1841 births, 56 deaths) and
  1848 (3556, 45).
- In Tabelle XVII, floor(100 × deaths/admitted) matches the printed whole percent in 64 of
  65 rows.

Apparent misprints in the original (transcribed as the counts read):

- **Tabelle XVII, 1825**: 2594 admitted, 229 deaths = 8.83%, but the percent is printed "4.8x".
  The counts are clear at 4x enlargement; the "4" looks like a misprint for "8".
- **Tabelle III, February 1845**: 274 births, 13 deaths = 4.74%, but the printed percent reads
  "5.11", which is 14/274. Either the deaths or the percent is wrong in the original. Recorded
  as 13, which is also what Wikipedia/Carter has.

Tabelle XVII has no printed totals, so its counts are checked only by the whole percent, which
is a weak check on the last digits of `admitted`.

## Inconsistencies between Semmelweis's own tables

These are in the source, not transcription errors. They need a sentence in the documentation.

1. **Monthly births do not add up to the yearly births for clinic 1**, although the deaths do:

   | Year | Births, sum of months | Births, yearly table | Deaths, sum of months | Deaths, yearly table |
   |---|---|---|---|---|
   | 1842 | 3067 | 3287 | 521 | 518 |
   | 1843 | 2871 | 3060 | 274 | 274 |
   | 1844 | 2918 | 3157 | 260 | 260 |
   | 1845 | 3253 | 3492 | 241 | 241 |
   | 1846 | 3352 | 4010 | 459 | 459 |
   | 1847 | 3375 | 3490 | 176 | 176 |
   | 1848 | 3556 | 3556 | 45 | 45 |

   (1841 is not comparable: December is "fehlt".) So monthly rates run higher than the yearly
   rates for the same year. I have not found Semmelweis's explanation for this.

2. **Tabelle XVII does not equal clinic 1 + clinic 2.** For 1833–1838 the deaths agree exactly
   but XVII has about 200 fewer admissions each year; for 1839–1848 XVII has a few more deaths
   (2 to 19) and differs in admissions by −737 to +320. One possibility is that XVII counts a
   different population (it says "Aufgenommen", admitted, not births, and there was also a
   paying ward, Tabelle XX); this is a guess, not checked against the text.

3. Semmelweis says (p. 3) that the true clinic 1 mortality was higher than reported, because
   sick women were transferred to the general hospital and their deaths recorded there.

## Online versions

Copies of the Wikipedia tables are in `online/` for the comparison in the check script.

### Wikipedia

"Historical mortality rates of puerperal fever",
<https://en.wikipedia.org/wiki/Historical_mortality_rates_of_puerperal_fever>. Its figures are
from Carter's 1983 translation, with rates computed by the editors. Three tables correspond:

| Wikipedia table | Carter's table | Semmelweis 1861 | Compared with | Result |
|---|---|---|---|---|
| Monthly, clinic 1, 1841–1849 (99 rows) | 3, 6, 7 + text | III, p. 56, XVI + text | `clinic1-monthly.csv` | identical |
| Yearly by clinic, 1833–1858 (52 rows) | 11, 1, 12 | XXII, I, XXIII | `clinics-yearly.csv` | one difference |
| Yearly, 1784–1849 (66 rows) | "14" | not XVII after 1832 | `hospital-yearly.csv` | see below |

- **Clinic 2, 1848**: Wikipedia has 3319 births; the original has **3219** — in Tabelle XXIII,
  where 3219 is needed to make the printed total 40770, and again in the text on p. 56
  ("von 3219 Entbundenen 43"). Carter's text also has 3219 (excerpt p. 53), so the error is
  Wikipedia's.
- **1784–1849 series**: for 1784–1832 Wikipedia agrees with Tabelle XVII except **1792**, where
  it has 1579 and the scan clearly reads **1574**. Carter's Table 6 also has 1574, so again the
  error is Wikipedia's. From 1833 on, Wikipedia's series switches to
  clinic 1 only (its own note says so) and runs to 1849, so it is a different table from XVII —
  probably the Vienna column of Tabelle XXXI (Vienna vs. Dublin, about p. 156), which I have not
  looked at. Tabelle XVII as printed runs to 1848 and is the whole hospital throughout.

### Carter excerpt (`online/Semmelweis-etiology_of_childbed_fever.pdf`)

Carter's table numbers in the excerpt, against the 1861 tables and my CSVs:

| Carter | 1861 | Content | Agreement with my transcription |
|---|---|---|---|
| Table 1 | I | Two clinics, 1841–1846 | all counts, totals and percents agree |
| Table 2 | — | Newborn deaths, two clinics, 1841–1846 | not transcribed |
| Table 3 | XV | Clinic 1 monthly, 1846 – May 1847 | agree, except Carter prints Feb 1847 births as "912" (a typo for 312; his rate 1.92 = 6/312) |
| Table 4 | p. 56 | Clinic 1 monthly, Jun–Dec 1847 | agree |
| Table 5 | XVI | Clinic 1 monthly, 1848 | agree (the excerpt's caption says "second clinic", which is wrong: 3556 / 45 is clinic 1) |
| Table 6 | XVII | Whole hospital, 1784–1848 | all 65 rows agree |
| Table 7 | — | Two clinics, 1839 and 1840 | agree with the 1839–1840 rows of XXII |

(The Wikipedia footnote uses different Carter numbers — "table 3, p. 72", "table 11", "table 12",
"table 14" — so the excerpt has renumbered the tables, or Wikipedia numbers them differently.)

What the excerpt settles:

- **Tabelle XVII is the whole hospital**: Carter titles it "for all patients at the Vienna
  maternity hospital from 1784 to 1848". His footnote 10 adds that the 1841–1843 figures
  Semmelweis quotes in the text beside it are for the first clinic only.
- **Printed percents in XVII.** Carter gives the decimals, and reproduces the 1825 misprint
  (4.82 for 229/2594 = 8.83). Three more rows have a printed percent that does not match the
  counts in the second decimal or worse: 1805 (0.40 vs 9/2112 = 0.43), 1806 (0.73 vs
  13/1875 = 0.69) and 1840 (6.44 vs 328/5166 = 6.35). The whole-percent check could not see
  these. Either the percent or a count is misprinted in each; the counts are kept as printed.
- **Start of handwashing**: "in the middle of May 1847; I no longer remember the specific day"
  (p. 53). So a mid-May date is the most that can be said; DataCamp's 1 June is a convention.
- **Separation of the clinics**: by Imperial Decree of 10 October 1840 all male students were
  assigned to the first clinic and all female students to the second (p. 46); before that both
  clinics trained both. So clinic 1 = physicians and clinic 2 = midwives holds from 1841.
- **Tabelle XXII**: Carter's footnote 11 says Semmelweis at first had only the 1839 and 1840
  figures (Table 7) and obtained the full 1833–1840 table later, giving it at p. 139 of the
  German edition with an apology for not having had it earlier.
- **Admission days** (p. 46): clinic 1 admitted four days a week and clinic 2 three, which is
  why clinic 1 has more births.

Not settled: the excerpt does not include the monthly table for 1841–1845, so the February
1845 question (13 deaths vs. a percent implying 14) is still open, as is the gap between
monthly and yearly births.

### R package `corona` (CRAN, v0.3.0)

Dataset `vienna`: "Semmelweis' data on Deaths of parturients in Vienna", 98 rows, columns
`date`, `births`, `deaths`; source given as the Wikipedia article above. 98 rows is the
Wikipedia monthly table less December 1841. Not downloaded or compared directly.
<https://search.r-project.org/CRAN/refmans/corona/html/vienna.html>

MF: This references the Wikipedia page, https://en.wikipedia.org/wiki/Historical_mortality_rates_of_puerperal_fever
In particularly, the table "Monthly mortality rates for birthgiving women 1841–49"
See the note there: https://en.wikipedia.org/wiki/Historical_mortality_rates_of_puerperal_fever#cite_note-5
There's also a time-series--intervention chart:
https://en.wikipedia.org/wiki/Historical_mortality_rates_of_puerperal_fever#/media/File:Monthly_mortality_rates_1841-1849.png

### DataCamp project

"Dr. Semmelweis and the Discovery of Handwashing" (R and Python versions), widely copied in
DataCamp workspaces and course repos. Two files:

- `yearly_deaths_by_clinic.csv` — `year`, `births`, `deaths`, `clinic`; 1841–1846, both clinics.
  This is the content of Tabelle I.
- `monthly_deaths.csv` — `date`, `births`, `deaths`; clinic 1 by month. Corresponds to
  `clinic1-monthly.csv`.

The project dates the start of handwashing as 1 June 1847; Semmelweis says "Mitte Mai 1847".
I found only descriptions of these files, not the files themselves, so they are not compared
here; they very likely derive from the Wikipedia tables.

### What an original-source HistData version would add

- Provenance to the 1861 table and page, rather than to a translation via Wikipedia.
- Two corrections to the circulating numbers (clinic 2 births 1848; admissions 1792).
- The whole-hospital series 1784–1848 (Tabelle XVII) as printed, which the online versions
  only have for 1784–1832.

## Datasets built

`Handwashing-import.R` (run from the package root) builds three data frames from the CSVs and
saves them to `data/`; they are documented together in `R/Handwashing.R` (help topic
`Handwashing`).

| Dataset | Rows | From | Variables |
|---|---|---|---|
| `Handwashing.clinics` | 52 | `clinics-yearly.csv` | `year`, `clinic` (First/Second), `births`, `deaths` |
| `Handwashing.monthly` | 99 | `clinic1-monthly.csv` | `date`, `year`, `month`, `births`, `deaths` |
| `Handwashing.hospital` | 65 | `hospital-yearly.csv` | `year`, `births` (printed as "Aufgenommen"), `deaths` |

The `table` / `page` provenance columns stay in the CSVs and are described in the help page
rather than carried in the data frames.

## Decided

- Names: `Handwashing.clinics`, `Handwashing.monthly`, `Handwashing.hospital`, shipped as
  three data frames (MF).
- Not extending to the other tables in the book (MF: "too much"): IV–XIV (crowding vs.
  mortality comparisons), XX (paying ward), XXI and XXXII–XXXIII (Paris Maternité, Dubois'
  clinic), XXV–XXX and XXXV (London and Dublin hospitals), XXXI (Vienna vs. Dublin), and the
  newborn mortality table that Wikipedia cites as Carter's table 4.
- The 1792 and 1848 figures are settled against Carter's excerpt (see "Wikipedia" above).

## Still open

- February 1845 deaths: 13 as printed, vs. a printed percent implying 14.
- Why the monthly births for clinic 1 sum to less than the yearly births; check the full
  Carter (1983) for a note on this.
- What Tabelle XVII counts, given it is not clinic 1 + clinic 2; read Semmelweis's text around
  pp. 62–64.
