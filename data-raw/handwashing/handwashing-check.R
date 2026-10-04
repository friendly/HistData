# Consistency checks on the Semmelweis (1861) transcriptions in data-raw/handwashing/
# Run from the package root:  Rscript data-raw/handwashing/handwashing-check.R

dir <- "data-raw/handwashing"
clinics  <- read.csv(file.path(dir, "clinics-yearly.csv"))
monthly  <- read.csv(file.path(dir, "clinic1-monthly.csv"))
hospital <- read.csv(file.path(dir, "hospital-yearly.csv"))

# ---- 1. column sums vs the printed "Summa" rows -----------------------------
printed <- data.frame(
  table  = rep(c("XXII", "I", "XXIII"), each = 2),
  clinic = rep(1:2, 3),
  births = c(23066, 13095, 20042, 17791, 47935, 40770),
  deaths = c(1505, 731, 1989, 691, 1712, 1248))
sums <- aggregate(cbind(births, deaths) ~ clinic + table, data = clinics, FUN = sum)
chk <- merge(sums, printed, by = c("table", "clinic"), suffixes = c("", ".printed"))
chk$ok <- chk$births == chk$births.printed & chk$deaths == chk$deaths.printed
cat("\n== Yearly clinic tables: transcribed sums vs printed totals ==\n"); print(chk)

msum <- function(sel) colSums(monthly[sel, c("births", "deaths")])
cat("\n== Monthly: Jun-Dec 1847 (printed 1841 / 56) and 1848 (printed 3556 / 45) ==\n")
print(rbind(`1847 Jun-Dec` = msum(monthly$table == "unnumbered"),
            `1848`         = msum(monthly$table == "XVI")))

# ---- 2. Table XVII: whole-number part of the printed percent ----------------
hospital$pct <- 100 * hospital$deaths / hospital$admitted
bad <- subset(hospital, floor(pct) != pct_whole_printed)
cat("\n== Table XVII rows where floor(computed %) != printed whole percent ==\n"); print(bad)

# ---- 3. internal (in)consistencies between Semmelweis's own tables ----------
my <- aggregate(cbind(births, deaths) ~ year, data = monthly, FUN = sum, na.action = na.omit)
my$months <- as.vector(table(monthly$year[!is.na(monthly$births)]))
c1 <- subset(clinics, clinic == 1, c(year, births, deaths))
x <- merge(my, c1, by = "year", suffixes = c(".monthly", ".yearly"))
x$d.births <- x$births.monthly - x$births.yearly
x$d.deaths <- x$deaths.monthly - x$deaths.yearly
cat("\n== Clinic 1: sum of monthly figures vs yearly tables (I, XXIII) ==\n"); print(x)

both <- aggregate(cbind(births, deaths) ~ year, data = clinics, FUN = sum)
z <- merge(hospital[, c("year", "admitted", "deaths")], both, by = "year",
           suffixes = c(".XVII", ".clinics"))
z$d.births <- z$admitted - z$births
z$d.deaths <- z$deaths.XVII - z$deaths.clinics
cat("\n== Table XVII (whole hospital) vs clinic 1 + clinic 2, 1833-1848 ==\n"); print(z)

# ---- 4. comparison with the tables on Wikipedia -----------------------------
# "Historical mortality rates of puerperal fever", taken from Carter's 1983 translation
wm <- read.csv(file.path(dir, "online/wikipedia-monthly.csv"))
wc <- read.csv(file.path(dir, "online/wikipedia-clinics-yearly.csv"))
wh <- read.csv(file.path(dir, "online/wikipedia-hospital-yearly.csv"))

cmp <- function(a, b, by, vars) {
  m <- merge(a, b, by = by, all = TRUE, suffixes = c("", ".wiki"))
  diff <- Reduce(`|`, lapply(vars, function(v) {
    p <- m[[v]]; q <- m[[paste0(v, ".wiki")]]
    !((is.na(p) & is.na(q)) | (!is.na(p) & !is.na(q) & p == q))
  }))
  m[diff, ]
}
cat("\n== Differences from Wikipedia: monthly (", nrow(wm), "rows) ==\n")
print(cmp(monthly[, 1:4], wm, c("year", "month"), c("births", "deaths")))
cat("\n== Differences from Wikipedia: yearly by clinic (", nrow(wc), "rows) ==\n")
print(cmp(clinics[, 1:4], wc, c("year", "clinic"), c("births", "deaths")))
cat("\n== Differences from Wikipedia: yearly hospital series (", nrow(wh), "rows) ==\n")
names(hospital)[2] <- "births"
print(cmp(hospital[, 1:3], wh, "year", c("births", "deaths")))
