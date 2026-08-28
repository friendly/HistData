# data from: Jaap Murre & Joeri Dros' Ebbinghaus forgetting-curve replication
# (Ebbinghaus, Mack, Seitz reps from "Ebbinghaus, Mack, Seitz" sheet of
# data-raw/Ebbinghaus/Ebbinghaus Replication Schema and Results.xlsx;
# Dros learning/relearning means from Table 1 of the published paper)
#
# Ebbinghaus, H. (1885). Über das Gedächtnis. Leipzig: Dunker.
# Murre, J. M. J., & Dros, J. (2015). Replication and Analysis of Ebbinghaus'
# Forgetting Curve. PLoS ONE, 10(7), e0120644. doi:10.1371/journal.pone.0120644

library(readr)

Ebbinghaus <- read_csv("data-raw/Ebbinghaus/Ebbinghaus.csv",
                        col_types = cols(
                          interval = col_character(),
                          subject = col_factor(levels = c(
                            "Ebbinghaus", "Mack", "Seitz", "Dros")),
                          learning = col_double(),
                          relearning = col_double()
                        ))

# retention interval: an ordered factor for display, and `time` (minutes) for
# anything numeric -- plotting on a (log) time axis, modeling, etc.
interval_levels <- c("20 min", "1 hour", "9 hours", "1 day",
                      "2 days", "6 days", "31 days")
interval_minutes <- c("20 min" = 20, "1 hour" = 60, "9 hours" = 540,
                       "1 day" = 1440, "2 days" = 2880, "6 days" = 8640,
                       "31 days" = 44640)

Ebbinghaus$interval <- factor(Ebbinghaus$interval, levels = interval_levels, ordered = TRUE)
Ebbinghaus$time <- interval_minutes[as.character(Ebbinghaus$interval)]

Ebbinghaus <- Ebbinghaus[, c("interval", "time", "subject", "learning", "relearning")]
Ebbinghaus <- as.data.frame(Ebbinghaus)
str(Ebbinghaus)

# dev copy -- move to data/Ebbinghaus.RData once the dataset is settled
save(Ebbinghaus, file = "data-raw/Ebbinghaus/Ebbinghaus.RData")
