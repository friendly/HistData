# Planning: a Framingham Heart Study dataset for HistData

Split out of `issues/TASKS.md` (2026-08-27) once there was enough concrete material to warrant
its own file. Status: **planning, nothing built yet.**

## Goal

Add a dataset tied to the Framingham Heart Study, one of the most historically important studies
in epidemiology (coined "risk factor," pioneered multiple logistic regression for disease risk).
Same style as `Guerry`/`Playfair1824`/`Perozzo`: small, historically pivotal, clearly sourced.

## The licensing trap (read this first)

The dataset "everyone" already has -- `framingham.csv`, ~4,240 rows, all over
Kaggle/DataCamp/textbooks -- is an **NHLBI BioLINCC "Teaching Dataset" release, not freely
redistributable**. The one CRAN package that ships Framingham microdata,
[`riskCommunicator`](https://cran.r-project.org/package=riskCommunicator) (11,627 rows, 39 vars),
does so under its own specific NHLBI approval (request #7161, approved 2019-03-11) -- that
permission is tied to *that* request, not transferable to `HistData`. Kaggle/DataCamp copies are
downstream of the same release, riding on nobody's explicit permission.

**Do not build `HistData`'s dataset from `framingham.csv` or from `riskCommunicator`'s data**
without `HistData` getting its own NHLBI approval first.

### If you want to pursue BioLINCC permission anyway (teaching-related, so plausible)

- Start here: <https://biolincc.nhlbi.nih.gov/teaching/> -- says teaching datasets are "freely
  available upon request," but **"not appropriate for publication purposes."** That phrase is the
  crux: a public CRAN package is arguably closer to "publication" than a private course handout,
  so even an approved teaching-dataset request may not license redistributing derived microdata
  inside `HistData`. Worth asking BioLINCC directly whether a CRAN-package use case is in scope
  before assuming it is.
- Request form: <https://biolincc.nhlbi.nih.gov/requests/teaching-dataset-request/>. General
  BioLINCC access (this may be the same underlying process) wants: institutional (non-free) email,
  requester at senior/tenure-track researcher level with oversight of named data users, same
  country as institution, and a signed **Research Materials Distribution Agreement (RMDA)** whose
  redistribution/publication terms weren't visible without actually starting a request.
- Bottom line: MF likely clears the eligibility bar easily (tenured professor), but **check the
  RMDA's redistribution terms explicitly before building anything on approved data** -- "I can use
  this for my course" and "I can ship this in a public R package on CRAN" are different questions.

## Recommended alternative: build from the original published tables instead

No licensing issue at all, and a better fit for `HistData`'s "history of statistics" theme than a
generic modern teaching CSV: the small tables **published directly in the two landmark papers**,
transcribed and cited the same way `Guerry`/`Playfair1824`/`Perozzo` already are.

### Kannel, Dawber, Kagan, Revotskie & Stokes (1961)

"Factors of Risk in the Development of Coronary Heart Disease -- Six-Year Follow-up Experience:
The Framingham Study." *Annals of Internal Medicine*, 55(1), 33-50.

- DOI: [10.7326/0003-4819-55-1-33](https://doi.org/10.7326/0003-4819-55-1-33)
- PubMed: [PMID 13751193](https://pubmed.ncbi.nlm.nih.gov/13751193/)
- Journal landing page (ACP Journals, paywalled): <https://www.acpjournals.org/doi/10.7326/0003-4819-55-1-33>
- **Free full-text PDF, confirmed working 2026-08-27**: <https://laoha.org/wp-content/uploads/2024/01/Framingham.pdf>
  (verified this is genuinely the paper -- title/author/first-page text checked directly)
- Coined the term "risk factor" itself. Small cross-tabulated risk tables (BP x cholesterol x ECG
  combinations vs. CHD incidence) -- these tables are the transcription target.

### Truett, Cornfield & Kannel (1967)

"A multivariate analysis of the risk of coronary heart disease in Framingham." *Journal of Chronic
Diseases*, 20(7), 511-524.

- DOI: [10.1016/0021-9681(67)90082-3](https://doi.org/10.1016/0021-9681(67)90082-3)
- PubMed: [PMID 6028270](https://pubmed.ncbi.nlm.nih.gov/6028270/)
- ScienceDirect (paywalled): <https://www.sciencedirect.com/science/article/abs/pii/0021968167900823>
- **No working free PDF found (2026-08-27)** -- a widely-cited copy at James Hanley's (McGill)
  course page, `www.med.mcgill.ca/epidemiology/hanley/bios601/CandH-ch0102/TruettCornfiledKannell1967.pdf`,
  is now dead (confirmed 404 directly, and the domain itself has since moved to
  `medicine.mcgill.ca`). Worth: (a) institutional library access/ILL, or (b) asking James Hanley
  directly -- he's already a `HistData`/`vcdExtra` contact (see `R/data-concepts.R`'s citations and
  the "What is re-visioning?" section of `HistData-Challenge.Rmd`), and it was *his* course page,
  so he may still have a copy.
- First multiple logistic risk function in epidemiology: **7 predictors** -- age, total
  cholesterol, relative weight, ECG abnormality (left ventricular hypertrophy), hemoglobin,
  cigarettes/day, systolic BP. This is the more statistically pivotal of the two papers --
  replaced the unwieldy multi-way cross-tab tables from 1961 with one fitted model.

### Still not found

An iconic, crisply-dated Framingham *graphic* from this era, the way Minard/Playfair/Snow each
have one. The familiar risk-score nomogram/point-chart is a 1990s derivative (Wilson et al.), not
an original-era graphic. May just not exist for this one -- `Federalist` and `Arbuthnot`'s
motivating example aren't built around a single iconic graphic either, so that's not a blocker.

## What's actually in `framingham.csv` (for comparison, not as a source)

Confirmed directly from the CSV header + sample rows (`GauravPadawe/Framingham-Heart-Study` on
GitHub, one of many identical mirrors of the same BioLINCC teaching release). 16 columns, one row
per participant (~4,240 rows):

| Column | Type | Notes |
|---|---|---|
| `male` | binary (0/1) | sex |
| `age` | continuous (integer years) | |
| `education` | ordinal, 1-4 | some HS / HS-GED / some college-vocational / college; has `NA`s |
| `currentSmoker` | binary (0/1) | |
| `cigsPerDay` | continuous count | has `NA`s |
| `BPMeds` | binary (0/1) | anti-hypertensive medication use; has `NA`s |
| `prevalentStroke` | binary (0/1) | |
| `prevalentHyp` | binary (0/1) | |
| `diabetes` | binary (0/1) | |
| `totChol` | continuous (mg/dL) | has `NA`s |
| `sysBP` | continuous (mmHg) | half-integer values -- averaged across two readings |
| `diaBP` | continuous (mmHg) | |
| `BMI` | continuous (kg/m^2) | has `NA`s |
| `heartRate` | continuous (bpm) | |
| `glucose` | continuous (mg/dL) | has `NA`s, more than other columns |
| `TenYearCHD` | binary (0/1) | **outcome** -- 10-year CHD risk, the logistic-regression target |

**Nothing here is "reduced to binary" that wasn't already inherently binary.** The continuous risk
factors (`age`, `totChol`, `sysBP`, `diaBP`, `BMI`, `heartRate`, `glucose`, `cigsPerDay`) stay
continuous; only genuinely yes/no clinical indicators (`male`, `currentSmoker`, `BPMeds`,
`prevalentStroke`, `prevalentHyp`, `diabetes`) and the ordinal `education` are categorical. A
logistic regression on this file would use the continuous variables as-is.

**Worth noting**: this variable set does *not* match Truett-Cornfield-Kannel (1967)'s own 7
predictors -- no ECG-abnormality or hemoglobin variable here, but `BMI`/`diabetes`/`BPMeds`/
`prevalentHyp`/`prevalentStroke` instead, which read as later-era epidemiological covariates. So
`framingham.csv` is descended from a *later* Framingham exam cycle/model, not literally the
dataset behind the 1967 paper -- one more reason building from the 1961/1967 papers' own small
published tables is the more historically honest route, not just the more legally clean one.

## Next concrete steps (none started)

1. Get the actual 1961 table(s) transcribed from the confirmed free PDF above.
2. Track down 1967 paper access (McGill/Hanley route, or institutional/ILL) and transcribe its
   table(s) / the fitted coefficients.
3. If MF pursues BioLINCC teaching-dataset access in parallel: get an explicit answer on
   redistribution-in-a-CRAN-package before building anything on it, not after.
4. Build `data-raw/Framingham.R` following the `Federalist.R` pattern (cached raw source,
   documented quirks, `@references`/`@source`/prior-work roxygen section) once source material is
   in hand.

## Related files

- `issues/TASKS.md` -- has a short pointer to this file; the original planning note that grew into
  this file is dated 2026-08-26.
