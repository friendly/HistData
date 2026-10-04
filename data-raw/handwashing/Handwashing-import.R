# Build the Handwashing.* datasets from the transcriptions of Semmelweis (1861)
# Run from the package root:  Rscript data-raw/handwashing/Handwashing-import.R
# See handwashing-notes.md for sources and checks; handwashing-check.R for the checks themselves.

dir <- "data-raw/handwashing"

# ---- Handwashing.clinics: yearly, by clinic, 1833-1858 (Tabellen XXII, I, XXIII) ----
clinics <- read.csv(file.path(dir, "clinics-yearly.csv"))
Handwashing.clinics <- data.frame(
  year   = clinics$year,
  clinic = factor(clinics$clinic, levels = 1:2, labels = c("First", "Second")),
  births = clinics$births,
  deaths = clinics$deaths
)
str(Handwashing.clinics)

# ---- Handwashing.monthly: first clinic, Jan 1841 - Mar 1849 (Tabellen III, XVI, pp. 56-57) ----
monthly <- read.csv(file.path(dir, "clinic1-monthly.csv"))
Handwashing.monthly <- data.frame(
  date   = as.Date(sprintf("%d-%02d-01", monthly$year, monthly$month)),
  year   = monthly$year,
  month  = monthly$month,
  births = monthly$births,
  deaths = monthly$deaths
)
str(Handwashing.monthly)

# ---- Handwashing.hospital: whole maternity hospital, 1784-1848 (Tabelle XVII) ----
hospital <- read.csv(file.path(dir, "hospital-yearly.csv"))
Handwashing.hospital <- data.frame(
  year   = hospital$year,
  births = hospital$admitted,
  deaths = hospital$deaths
)
str(Handwashing.hospital)

save(Handwashing.clinics,  file = "data/Handwashing.clinics.RData")
save(Handwashing.monthly,  file = "data/Handwashing.monthly.RData")
save(Handwashing.hospital, file = "data/Handwashing.hospital.RData")
