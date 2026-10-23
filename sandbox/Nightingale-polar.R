#' ---
#' title: Nightingale-style polar-area chart, from Sabarieswar V & Rajaseharan
#' ---

# Source: code from Sec. VII, "Reproducible R implementation", p. 3 of
#
#   Sabarieswar V & Vimal Rajaseharan. "The Polar Area Diagram: Analytical Foundations,
#   Algorithmic Construction, and Computational Implementation of Florence Nightingale's
#   Visual Chart." Manuscript, 4 pp.
#   Sabarieswar V: Student, Vellore Institute of Technology, Vellore, India
#   Vimal Rajaseharan: Statistician and Aviation Expert
#
#   Local copy: C:/Users/friendly/Dropbox/Documents/papers/PolarCharts.pdf
#
# Where it appeared is not known. The PDF names no journal, volume or DOI. Its metadata
# describe it as an "IEEE-style journal manuscript" (PDF title "Polar-Area and Florence
# Nightingale Charts"; author field "Vimal Philatelica"), made with LibreOffice, 2026-10-16.
# A web search for the title (2026-10-22) found nothing, so it is probably an unpublished
# manuscript or preprint. The paper cites HistData's Nightingale documentation [4] and
# Friendly & Denis, Milestones [2], and Friendly & Wainer (2021) [7].
#
# The approach follows the example(Nightingale) in HistData: stacked bars, a square-root
# y scale so sector AREA is proportional to the rate, then coord_polar(). Fig. 2 in the
# paper shows the result: two panels, Apr 1854-Mar 1855 and Apr 1855-Mar 1856.
#
# Transcribed as printed, except for line breaks the two-column layout introduced.
# Notes (not changed below):
# * Month uses format(Date, "%b") with levels = month.abb, which assumes an English locale,
#   and puts January, not April, at the start of each panel.
# * ggsave() writes nightingale_polar_area.png to the working directory.
#
# !! The code does not do what the paper says it does (checked 2026-10-22):
# * ggplot2 applies scale_y_sqrt() BEFORE position_stack(), so it stacks sqrt(rates):
#   the outer radius is sqrt(a) + sqrt(b) + sqrt(c), not sqrt(a + b + c). Sector areas
#   are then not proportional to the rates, contrary to the paper's eq. (3) and Sec. III.
#   Jan 1855: stacked outer radius 48.5, vs. sqrt(1173.5) = 34.3.
# * Because of that, limits = c(0, 1100) (sqrt = 33.2) is exceeded, and 6 rows are
#   dropped with a warning: the disease and other-cause sectors for the worst winter
#   months (e.g., Jan 1855) vanish, the opposite of the paper's point.
# * The paper's Fig. 2 and Fig. 3 look like matplotlib output, not this ggplot2 code.
# HistData's example(Nightingale) avoids the stacking problem with position = "identity":
# overlapping wedges, each measured from the center, as in Nightingale's original.
# A correct stacked version computes cumulative rates first and draws annular sectors
# from sqrt(cumulative lower) to sqrt(cumulative upper), e.g. with geom_rect() + coord_polar().

# Reproducible Nightingale-style polar-area chart
# Packages: HistData, ggplot2, dplyr, tidyr

library(HistData)
library(ggplot2)
library(dplyr)
library(tidyr)

data(Nightingale)

# Keep the annualized mortality rates
night <- Nightingale %>%
  select(Date, Disease.rate, Wounds.rate, Other.rate) %>%
  pivot_longer(
    cols = c(Disease.rate, Wounds.rate, Other.rate),
    names_to = "Cause",
    values_to = "Rate"
  ) %>%
  mutate(
    Cause = recode(
      Cause,
      Disease.rate = "Preventable disease",
      Wounds.rate  = "Wounds/injuries",
      Other.rate   = "Other causes"
    ),
    Period = if_else(Date < as.Date("1855-04-01"),
                     "Apr 1854–Mar 1855",
                     "Apr 1855–Mar 1856"),
    Month = factor(format(Date, "%b"),
                   levels = month.abb)
  )

# Nightingale-style construction:
# 1) stacked rectangular bars
# 2) square-root radial scale so AREA is proportional to Rate
# 3) polar coordinates with equal-angle sectors

p <- ggplot(night, aes(x = Month, y = Rate, fill = Cause)) +
  geom_col(width = 1, colour = "white", linewidth = 0.25) +
  scale_y_sqrt(
    breaks = c(0, 100, 300, 600, 1000),
    limits = c(0, 1100)
  ) +
  coord_polar(start = -pi/2) +
  facet_wrap(~ Period, nrow = 1) +
  labs(
    title = "Nightingale-style polar-area chart",
    subtitle = "Annual mortality rate per 1,000 soldiers",
    x = NULL, y = "Rate per 1,000 per year", fill = "Cause"
  ) +
  theme_minimal(base_size = 10) +
  theme(
    panel.grid.major = element_line(linewidth = 0.25),
    panel.grid.minor = element_blank(),
    axis.text.x = element_text(size = 7),
    legend.position = "bottom",
    plot.title = element_text(face = "bold")
  )

print(p)

ggsave(
  "nightingale_polar_area.png",
  p, width = 10, height = 5.5, dpi = 300
)

# Optional: verify the manual radius calculation.
# For equal-angle sectors, r is proportional to sqrt(total rate).
check <- Nightingale %>%
  mutate(
    Total.rate = Disease.rate + Wounds.rate + Other.rate,
    Radius = sqrt(Total.rate)
  ) %>%
  select(Date, Total.rate, Radius)

print(check)


#' ## Corrected stacked version
#
# NOT FROM THE ORIGINAL ARTICLE. Added by M. Friendly (with Claude Code), 2026-10-22,
# to do what the article describes in eq. (3) and Sec. III but its code does not.
#
# How it is fixed:
# 1. Compute the stacking in the DATA, not with position_stack(). Within each month, the
#    causes are accumulated in a fixed order (inside to outside: disease, wounds, other,
#    as in the article's worked calculation for Jan 1855). Each cause gets a lower and
#    upper cumulative rate: lower = sum of the causes inside it, upper = lower + its rate.
# 2. Take square roots of the cumulative rates: r_lower = sqrt(lower), r_upper = sqrt(upper).
#    Each cause is then an annular sector from r_lower to r_upper, so its AREA is
#    proportional to its rate, and the whole wedge has outer radius sqrt(total rate).
# 3. Draw the sectors with geom_rect() on a LINEAR y scale (the sqrt is already applied),
#    then coord_polar(). The y-axis breaks are placed at sqrt(rate) and labelled with the
#    rates, so the reference circles still read as rates per 1,000.
# 4. No y limits are set, so nothing is dropped.
# Also changed: each panel starts at April (12 o'clock) and runs clockwise through March,
# as in Nightingale's diagrams and the article's own Fig. 2, instead of starting at January.
# Check: Jan 1855 has outer radius sqrt(1173.5) = 34.26, as in the article's Sec. IV.B.

causes <- c("Preventable disease", "Wounds/injuries", "Other causes")

night_fixed <- night %>%
  mutate(Cause = factor(Cause, levels = causes)) %>%
  arrange(Date, Cause) %>%
  group_by(Date) %>%
  mutate(upper = cumsum(Rate),
         lower = upper - Rate) %>%
  ungroup() %>%
  group_by(Period) %>%
  mutate(pos = match(Date, sort(unique(Date)))) %>%   # 1 = April, ..., 12 = March
  ungroup() %>%
  mutate(r_lower = sqrt(lower),
         r_upper = sqrt(upper))

# check: outer radius = sqrt(total rate)
night_fixed %>%
  filter(Date == as.Date("1855-01-01")) %>%
  select(Date, Cause, Rate, lower, upper, r_lower, r_upper)

month_labels <- format(sort(unique(night$Date))[1:12], "%b")   # Apr ... Mar
rate_breaks  <- c(100, 300, 600, 1000)

p_fixed <- ggplot(night_fixed) +
  geom_rect(aes(xmin = pos - 1, xmax = pos, ymin = r_lower, ymax = r_upper, fill = Cause),
            colour = "white", linewidth = 0.25) +
  scale_x_continuous(breaks = (1:12) - 0.5, labels = month_labels, limits = c(0, 12)) +
  scale_y_continuous(breaks = sqrt(rate_breaks), labels = rate_breaks) +
  coord_polar(start = 0) +
  facet_wrap(~ Period, nrow = 1) +
  labs(
    title = "Nightingale-style polar-area chart, corrected stacking",
    subtitle = "Annual mortality rate per 1,000 soldiers; sector area proportional to rate",
    x = NULL, y = "Rate per 1,000 per year", fill = "Cause"
  ) +
  theme_minimal(base_size = 10) +
  theme(
    panel.grid.major = element_line(linewidth = 0.25),
    panel.grid.minor = element_blank(),
    axis.text.x = element_text(size = 7),
    legend.position = "bottom",
    plot.title = element_text(face = "bold")
  )

print(p_fixed)
