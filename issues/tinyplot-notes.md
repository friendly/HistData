# Using `tinyplot` in HistData examples — exploratory notes

MF's idea, 2026-10-04: re-write a few of the base R plot examples with
[`tinyplot`](https://grantmcdermott.com/tinyplot/), particularly where its design makes the
example code simpler (grouped plots, automatic legends, plot types). These notes survey the
current examples, try the rewrites, and record what worked. Written by Claude; the opinions
are marked as such.

Everything below was run with tinyplot 0.8.0 under R 4.6.1. Each code block ran without
error. I looked at the rendered output for the clinics, Mayer, Nightingale, Cholera and theme
plots; the others (Arbuthnot, Michelson, GaltonFamilies, Snow, Handwashing monthly, the
faceted Nightingale) ran but I did not inspect the pictures.

## Why tinyplot suits this package

- **No dependencies.** It imports only `graphics`, `grDevices`, `stats`, `tools`, `utils`, and
  needs R >= 4.0.0 (HistData already needs 4.1.0). Adding it to `Suggests` costs almost nothing,
  unlike ggplot2.
- **It is base graphics.** `plt()` takes the same arguments as `plot()` (`pch`, `lty`, `xlab`,
  `main`, ...), so a rewrite stays readable to someone who knows base R.
- **Base annotation still works afterwards.** `abline()` and `text()` called after a `plt()`
  with a legend in the right margin landed in the right place in my test. So the hand-drawn
  annotations many examples rely on do not have to be converted.
- **What it adds:** a grouping term in the formula (`y ~ x | group`), a legend drawn
  automatically, facets, and model-based plot types (`"lm"`, `"loess"`, `"density"`,
  `type_ellipse()`), all layered with `plt_add()`.

## Survey of the current examples

Of the 44 help topics, about 30 have base graphics in their examples and 9 use ggplot2. Three
base idioms come up where tinyplot would be shorter:

| Idiom in the current examples | Where | tinyplot equivalent |
|---|---|---|
| `plot(type = "n")`, then one `lines()`/`points()` per group, then `legend()` | `Handwashing`, `Nightingale` | `plt(y ~ x \| group, type = "b")` |
| `col = c(...)[group]`, `pch = (15:17)[group]`, no legend | `Mayer`, `DrinksWages`, `Snow` (dates) | `plt(y ~ x \| group)` |
| Compute a smooth or fit, then `lines()` / `abline()` | `Arbuthnot`, `Bowley`, `Michelson`, `Cholera` | `plt_add(type = "loess")`, `type = "lm"` |

## Candidates, best first

### 1. `Handwashing`: the two clinics

Current (10 lines of plotting code): empty plot, two `lines()` calls with `subset =`, a
`legend()` with colours and symbols repeated by hand.

```r
plt(rate ~ year | clinic, data = clinics, type = "b", pch = 16:17,
    palette = c("red", "blue"),
    xlab = "Year", ylab = "Maternal deaths per 100 births",
    main = "Mortality in the two clinics")
abline(v = c(1840.5, 1847.4), lty = 2)
text(1840.5, 15, "Clinics\nseparated", pos = 2, cex = 0.8)
text(1847.4, 15, "Handwashing", pos = 4, cex = 0.8)
```

One call replaces five, and the legend cannot get out of step with the lines. The legend
labels become the factor levels ("First", "Second"); to keep "First (physicians)" the levels
would have to be relabelled first. This is the clearest win. (Claude's view.)

### 2. `Nightingale`: "What if she had made a set of line graphs?"

Current: about 20 lines, twice over (rates, then percents): `with()`, an empty plot, three
`points()` calls, and a `legend()` placed at hand-picked date/height coordinates. The example
already builds a long-format data frame for the ggplot2 coxcombs, so the grouped version is:

```r
plt(Deaths ~ Date | Cause, data = long, type = "b", lwd = 2,
    palette = c("blue", "black", "red"),
    ylab = "Annual Death Rate",
    main = "Causes of Mortality of the British Army in the East")
```

Two things to watch:

- The legend order is alphabetical (Disease, Other, Wounds), so `Cause` should be made a factor
  with the wanted order, and the palette matched to it.
- The example's existing long data frame `Night` is sorted by `Deaths`, which would scramble
  the lines. Use the unsorted `melted`, or reshape separately.

Before and after the Sanitary Commission can be split into panels with
`facet = ~ Regime, facet.args = list(free = TRUE)`; that ran, but I did not look at it. The
grey background rectangle and the custom date axis would stay as base calls.

### 3. `Mayer`: points by group, with a fitted line

Current: `pch = (15:17)[as.factor(Group)]` and `col = c(...)[as.factor(Group)]`, repeated for
two plots, and no legend to say which group is which.

```r
plt(Y ~ X2 | factor(Group), data = Mayer, pch = 15:17,
    palette = c("red", "blue", "darkgreen"), legend = list(title = "Group"))
plt_add(Y ~ X2, type = "lm", col = "black", lwd = 2)
```

This adds the missing legend, and the second line draws the overall regression with a
confidence band (the current example draws the line only, with `abline(lm(...))`).

### 4. `Cholera`: mortality by elevation and water supply

The grouped plots currently depend on `car::scatterplot()`. A version without `car`:

```r
plt(cholera_drate ~ elevation | water, data = Cholera, pch = 15:17,
    palette = c("red", "darkgreen", "blue"),
    legend = list("topright", title = "Water supply"),
    xlab = "Elevation above high water mark (ft)",
    ylab = "Deaths from cholera in 1849 per 10,000")
plt_add(type = type_lm(se = FALSE))
```

This gives a regression line per water supply, each drawn only over its own range of
elevation. It does not label the outlying districts, which `car::scatterplot(id = ...)` does,
so it is an alternative rather than a replacement.

### 5. Smaller ones

- **`Arbuthnot`**: `loess.smooth()` plus `lines()` becomes
  `plt(Ratio ~ Year, data = Arbuthnot, type = "b")`, then `plt_add(type = "loess", col = "blue")`
  and `plt_add(type = type_hline(1), col = "red")`. Note this adds a confidence band the
  current plot does not have.
- **`DrinksWages`**: `plt(I(sober/n) ~ wage | class, data = DrinksWages, pch = 16)` replaces
  `col = c("blue","red","green")[class]` and adds a legend. The `I()` is required: without it
  tinyplot warns and plots `sober` alone.
- **`Snow`** (deaths by date): `plt(deaths ~ date | period, data = Snow.dates, type = "h")`
  replaces the `clr <- ifelse(...)` vector, once a before/after `period` variable is made.
- **`Michelson`**: `plt(~ velocity, data = Michelson, type = "density")` for the density plot.
  Little is saved; the two bandwidths, rug and reference lines are still separate calls.
- **`GaltonFamilies`**: `plt(childHeight ~ midparentHeight | gender, ...)` followed by
  `plt_add(type = type_ellipse(level = 0.68))` is a possible `car`-free version of the Hanley
  figure.

## Where it does not help

- **`Handwashing` monthly plot.** One grey line under points coloured by before/after takes two
  calls either way (`plt(..., type = "l")`, then `plt_add(rate ~ date | washing, type = "p")`).
  No simpler than what is there.
- **`Playfair1824` and `Bowley`.** These plot several columns of a wide data frame (`matplot()`,
  or one `lines()` per moving average). tinyplot wants long data, so a reshape would be added
  first; a net loss for `Playfair1824`, about even for `Bowley`.
- **`MichelsonSets`, `Cavendish`, `CushnyPeebles` boxplots.** Wide data again; `boxplot()` on
  the data frame is already one line.
- **`PearsonLee`.** I tried a faceted bubble plot with `cex = frequency`; it failed with
  "`cex` must be `NULL`, or a numeric vector of length 1 or 1". I did not find the right way to
  size points by a variable, so this one is unresolved.
- **Sunflower plots** (`Galton`, `Jevons`, `Macdonell`, `PearsonLee`), `mosaicplot()`, `pairs()`,
  `biplot()` and the custom drawings (`Wheat`, `Langren`, `Snow` map, `Minard`): no tinyplot
  counterpart, leave alone.

## Themes: a link to the `theme_histdata()` idea

`tinytheme()` takes overrides, so an aged look is available for base-style plots with no
ggplot2 at all. This ran and looked right (serif type, tan paper, muted red and navy):

```r
tinytheme("classic", family = "serif", bg = "#F4ECD8",
          palette.qualitative = c("#8B1A1A", "#1F3A5F"))
plt(rate ~ year | clinic, data = clinics, type = "b", pch = 16:17, ...)
tinytheme()   # reset
```

tinyplot 0.8.0 also exports `tinytheme_register()`, which suggests a named theme can be
registered; I have not tried it. Since most HistData examples are base graphics, a tinyplot
theme may reach more of them than a ggplot2 `theme_histdata()` would. This bears on the
"base-graphics counterpart" question in the `theme_histdata()` item in `TASKS.md`.

## Practicalities

- **`DESCRIPTION`**: add `tinyplot` to `Suggests`.
- **Guarding**: a suggested package should be used conditionally in examples, e.g.
  `if (requireNamespace("tinyplot", quietly = TRUE)) { ... }`, or `library(tinyplot)` in line
  with how the current examples call `library(ggplot2)` and `require(car)`.
- **Replace or add?** Replacing the base version makes the example shorter; keeping both shows
  the contrast but makes it longer. Claude's suggestion: replace in `Handwashing` (clinics) and
  `Mayer`, where the base code is clumsy; add alongside in `Nightingale` and `Cholera`, where
  the existing version has features the rewrite lacks.
- **Version**: these were tested with 0.8.0 only. `type_ellipse()` and `tinytheme_register()`
  may be recent additions; if they are used, check whether a minimum version is needed in
  `Suggests`.
- **pkgdown**: reference figures are regenerated from the examples, so each rewrite changes a
  figure on the site.

## Suggested first step

Do `Handwashing` (clinics) and `Mayer` as a trial: both are short, both clearly improve, and
neither needs data reshaping. If the result reads well on the help page, go on to `Nightingale`.
