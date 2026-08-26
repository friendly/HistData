# Generate a custom "page not found" image for a pkgdown site, in the style
# of a reference image (big colored "404" digits over a bare ggplot2 panel,
# with sad-face emoji scattered in the background and a fake R error message
# underneath).
#
# DONE: 2026-08-11 first draft; colors sampled from the reference image;
#       font matches the site's `code_font` (JetBrains Mono, see _pkgdown.yml)
# DONE: 2026-08-11 first '4' recolored darkgreen; background sad-face emoji
#       (drawn first, so the digits sit on top); generalized into a function
#       that takes `package` so it can be reused across packages
# DONE: 2026-08-11 filled the emoji faces with light yellow -- Noto Emoji's
#       glyph outline has a transparent center (it's a "ring" path), so a
#       plain colored disc is drawn underneath each glyph to fake a fill
# DONE: 2026-08-11 added pkgdown_404_install() to wire the image into a
#       package's pkgdown site (writes the .github/404.md marker plus a
#       standalone pkgdown/assets/404.html)
# DONE: 2026-08-11 tried in vcdExtra (see heplots/dev/404.R for the
#       original) -- confirms the function is portable across packages
# DONE: 2026-08-26 installed in HistData, copied verbatim from heplots/vcdExtra
# DONE: 2026-08-26 pkgdown::build_home() (and build_site()) was found to
#       actively overwrite docs/404.html with its own templated render of
#       the .github/404.md marker's (comment-only) content -- so the
#       earlier FIXME's assumption was wrong, or at least incomplete: the
#       marker's presence does NOT stop build_404() from writing a page,
#       it only stops pkgdown's *default* boilerplate page. The asset copy
#       that puts our real 404.html/404.png in place happens in
#       init_site(), which must run AFTER build_404()/build_home() to win.
#       pkgdown_404_install() now calls init_site() itself at the end, but
#       this must be re-run after any LATER build_site()/build_home() call
#       too, since those will re-clobber docs/404.html each time.
# FIXME: this ordering dependency relies on undocumented pkgdown internals
#        (verified against pkgdown 2.2.1) and could change in a future
#        pkgdown release.

library(ggplot2)
library(showtext)
library(sysfonts)
library(glue)

#' Make a "page not found" image for a pkgdown site
#'
#' @param package Name of the package, used in the fake error message
#'        and as part of the default output filename.
#' @param out_dir Directory to save the image in. Default: `"pkgdown/assets"`,
#'        which pkgdown copies verbatim into `docs/`.
#' @param file Output filename. Default: `"404.png"`.
#' @param colors Length-3 vector of colors for the "4", "0", "4" digits.
#' @param code_font Google font used for the digits and error message.
#'        Default `"JetBrains Mono"` to match the usual pkgdown `code_font`.
#' @param n_emoji Number of background sad-face emoji to scatter.
#' @param emoji_char Emoji character to use for the background. Default is
#'        a crying face, rendered via the (monochrome) "Noto Emoji" font.
#' @param emoji_fill Fill color for the disc drawn behind each emoji glyph,
#'        which fakes a "filled" emoji since Noto Emoji's face outline has
#'        a transparent center. Default: a very light yellow.
#' @param emoji_colour Color of the emoji glyph itself (features drawn on
#'        top of `emoji_fill`).
#' @param seed Optional seed for reproducible emoji placement.
#' @param width,height,dpi Passed to `ggplot2::ggsave()`.
#'
#' @return Invisibly, the ggplot object.
make_404_page <- function(package,
                           out_dir = "pkgdown/assets",
                           file = "404.png",
                           colors = c("darkgreen", "#CD4348", "#2C0B57"),
                           code_font = "JetBrains Mono",
                           n_emoji = 10,
                           emoji_char = "\U0001F622",
                           emoji_fill = "#FFF3B0",
                           emoji_colour = "grey40",
                           seed = NULL,
                           width = 10, height = 5.8, dpi = 144) {

  if (length(colors) != 3) {
    stop(glue("`colors` must have exactly 3 elements (one per digit), got {length(colors)}"))
  }

  if (!is.null(seed)) set.seed(seed)

  sysfonts::font_add_google(code_font, "code_font")
  sysfonts::font_add_google("Noto Emoji", "noto_emoji")
  showtext::showtext_auto()
  showtext::showtext_opts(dpi = dpi)

  emoji_df <- data.frame(
    x = runif(n_emoji, 10, 190),
    y = runif(n_emoji, 10, 90)
  )

  digits <- data.frame(
    label = c("4", "0", "4"),
    x     = c(40, 100, 165),
    y     = 50,
    col   = colors
  )

  msg <- glue("Error: Can't find page in `{package}`.")

  p <- ggplot() +
    geom_point(data = emoji_df, aes(x, y),
               shape = 21, size = 15, stroke = 0, fill = emoji_fill) +
    geom_text(data = emoji_df, aes(x, y), label = emoji_char,
              family = "noto_emoji", size = 12, colour = emoji_colour) +
    geom_text(data = digits, aes(x, y, label = label, colour = col),
              family = "code_font", fontface = "bold", size = 90) +
    scale_colour_identity() +
    annotate("text", x = 100, y = 8, label = msg,
             family = "code_font", size = 8, colour = "grey20") +
    scale_x_continuous(limits = c(0, 200), breaks = seq(0, 200, 50)) +
    scale_y_continuous(limits = c(0, 100), breaks = seq(0, 100, 25)) +
    coord_cartesian(clip = "off") +
    theme_minimal(base_size = 14) +
    theme(
      axis.title = element_text(face = "bold"),
      plot.margin = margin(20, 20, 20, 20)
    )

  if (!dir.exists(out_dir)) dir.create(out_dir, recursive = TRUE)

  ggsave(
    filename = file.path(out_dir, file),
    plot = p,
    width = width, height = height, dpi = dpi, bg = "white"
  )

  invisible(p)
}

#' Wire a generated 404 page into a package's pkgdown site
#'
#' Generates the 404 image (via [make_404_page()]), writes a standalone
#' `404.html` beside it in `pkgdown/assets/` (copied verbatim into `docs/`
#' on every pkgdown build), and adds a `.github/404.md` marker file so
#' pkgdown's own `build_404()` doesn't overwrite it with its bare-bones
#' default page, then runs [pkgdown::init_site()] to actually copy the
#' assets into `docs/` -- `build_404()` writes *some* page to
#' `docs/404.html` regardless of the marker (see DONE log above), so the
#' asset copy has to happen last to win. Re-run `pkgdown::init_site()`
#' yourself after any later `build_site()`/`build_home()` call, or the
#' custom page will get overwritten again.
#'
#' The `404.html` written here is a small standalone page (its own
#' `<head>`/`<style>`, no site navbar) rather than one built through
#' pkgdown's internal templating -- it's an error page, so it doesn't need
#' to match the rest of the site chrome, and this avoids depending on
#' unexported pkgdown internals.
#'
#' @param package Package name (used in the fake error message). If
#'        missing, read from `pkg_root/DESCRIPTION`.
#' @param pkg_root Path to the package root. Default `"."`.
#' @param home_url Link target for the "Take me home" link on the 404
#'        page. Default `"index.html"` (the pkgdown site root).
#' @param overwrite_marker Overwrite an existing `.github/404.md` if one is
#'        already there? Default `FALSE` -- only its *existence* matters to
#'        pkgdown, so an existing file (e.g. with your own notes) is left
#'        alone by default.
#' @param ... Passed on to [make_404_page()].
#'
#' @return Invisibly, a list of the paths written.
pkgdown_404_install <- function(package,
                                 pkg_root = ".",
                                 home_url = "index.html",
                                 overwrite_marker = FALSE,
                                 ...) {

  desc_path <- file.path(pkg_root, "DESCRIPTION")
  if (missing(package)) {
    if (!file.exists(desc_path)) {
      stop(glue("Can't find DESCRIPTION at {desc_path} -- pass `package` explicitly."))
    }
    package <- unname(read.dcf(desc_path, fields = "Package")[1, 1])
  }

  assets_dir <- file.path(pkg_root, "pkgdown", "assets")
  github_dir <- file.path(pkg_root, ".github")

  make_404_page(package, out_dir = assets_dir, ...)
  img_file <- file.path(assets_dir, "404.png")

  if (!dir.exists(github_dir)) dir.create(github_dir, recursive = TRUE)
  marker_path <- file.path(github_dir, "404.md")
  if (!file.exists(marker_path) || overwrite_marker) {
    writeLines(
      c("<!-- Marker file: tells pkgdown's build_404() to skip generating",
        "     its default docs/404.html -- see pkgdown_404_install() in dev/404.R -->"),
      marker_path
    )
  }

  html_path <- file.path(assets_dir, "404.html")
  html <- glue('
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Page not found &middot; {package}</title>
<style>
  body {{
    margin: 0;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    min-height: 100vh;
    background: #ffffff;
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
  }}
  img {{ max-width: 90vw; height: auto; }}
  a {{
    margin-top: 1.5rem;
    font-size: 1.1rem;
    color: #2C0B57;
    text-decoration: none;
  }}
  a:hover {{ text-decoration: underline; }}
</style>
</head>
<body>
  <img src="404.png" alt="404 - page not found">
  <a href="{home_url}">Take me home</a>
</body>
</html>
')
  writeLines(html, html_path)

  message(glue("Wrote {img_file}"))
  message(glue("Wrote {marker_path}"))
  message(glue("Wrote {html_path}"))

  pkgdown::init_site(pkg = pkg_root)
  message("Ran pkgdown::init_site() to copy the custom 404 page into docs/ now.")
  message("NOTE: any LATER pkgdown::build_site()/build_home() call will overwrite")
  message("docs/404.html again (see FIXME above) -- re-run pkgdown::init_site()")
  message("afterward each time to restore the custom page.")

  invisible(list(image = img_file, marker = marker_path, html = html_path))
}

pkgdown_404_install("HistData")
