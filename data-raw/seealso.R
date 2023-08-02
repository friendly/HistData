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
