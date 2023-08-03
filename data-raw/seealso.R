# generate \seealso{} citation links for a package

vcdExtra::datasets("HistData") |> 
  select(Item) |> 
  glue::glue_data("\\code{\\link{[Item]}}", .open = "[", .close = "]") |> 
  glue::glue_collapse(",\n")

# Produces:
# \code{\link{Arbuthnot}},
# \code{\link{Armada}},
# \code{\link{Bowley}},
# \code{\link{Breslau}},
# \code{\link{Cavendish}},
# ...

# generate list of contributors from DESCRIPTION

ctb <- c(person(given = "Michael", family = "Friendly", role=c("aut", "cre"), email="friendly@yorku.ca"),
  person(given = "Stephane", family = "Dray", role="ctb", email="stephane.dray@univ-lyon1.fr"),
  person(given = "Hadley", family = "Wickham", role="ctb", email="hadley@rstudio.com"),
  person(given = "James", family = "Hanley", role="ctb", email="james.hanley@mcgill.ca"),
  person(given = "Dennis", family = "Murphy", role="ctb", email = "djmuser@gmail.com"),
  person(given = "Peter", family = "Li", role="ctb", email="lindbrook@gmail.com"),
  person(given = "Luiz", family = "Droubi", role="ctb", email="lfpdroubi@gmail.com"),
  person(given = "James", family = "Riley", role="ctb", email = "jimr1603@gmail.com"),
  person(given = "Antoine", family = "de Falguerolles", role="ctb"),
  person(given = "Monique", family = "Graf", role="ctb"),
  person(given = "Neville", family = "Verlander", role="ctb", email="Neville.Verlander@phe.gov.uk"),
  person(given = "Brian", family = "Clair", role="ctb"),
  person(given = "Jim", family = "Oeppen", role="ctb", email = "joeppen@health.sdu.dk"),
  person(given = "David", family = "Bellhouse", role="ctb", email="bellhouse@stats.uwo.ca")
)

ctb  |> 
#  slice(-1) |> 
  paste(collapse = ", ") |> 
  stringr::str_replace_all(" \\[ctb\\],?", ",")
