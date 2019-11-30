
#' An Oxford Economics palette generator
#'
#' Color palettes based on the OE style guide
#'
#' @param name Name of desired palette. Choices are:
#'   \code{primary}, \code{secondary},  \code{blue_grad},
#'   \code{bold}, \code{pale}
#' @param n Number of colors desired.
#' @param type Either "continuous" or "discrete". Use continuous if you want
#'   to automatically interpolate between colours.
#'
#' @return A vector of colours.
#' @export
#'
#' @importFrom magrittr %>%
#' @importFrom ggplot2 ggplot
#' @importFrom ggplot2 aes
#' @importFrom ggplot2 geom_bar
#' @importFrom ggplot2 geom_point
#' @importFrom ggplot2 scale_fill_manual
#' @importFrom ggplot2 scale_color_manual
#' @importFrom ggplot2 scale_colour_manual
#'
#' @examples
#' # If you need more colours than normally found in a palette, you
#' # can use a continuous palette to interpolate between existing
#' # colours
#' pal <- oe_palette("secondary", 21, type = "continuous")
#' image(volcano, col = pal)
#'
#' # We can't directly feed the palette into scale_fill_manual because
#' # the colors are named in the vector. If one provides scale_fill_manual
#' # a named vector, then ggplot2 is trying to match the colors to the
#' # values in the dataframe
#'
#' # One approach: Just directly assign from the palette
#' ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Species)) +
#'   geom_point(size = 4) +
#'   scale_colour_manual(values = c(
#'     "setosa"=oe_palettes$primary[["prime_blue"]],
#'     "virginica"=oe_palettes$primary[["prime_grey"]],
#'     "versicolor"=oe_palettes$primary[["prime_ltgrey"]]))
#'
#' # Another approach: Create vector of colors by selecting palette, extract
#' # specific colors, and unname
#' cols <- oe_palette("primary")[c("prime_blue", "prime_ltgrey")] %>%
#'  unname()
#' ggplot(mtcars, aes(factor(cyl), fill=factor(vs))) +  geom_bar() +
#'  scale_fill_manual(values = cols)
#'
#' # Another approach: Create vector of colors by seleting palette and unname
#' # it
#' cols <- unname(oe_palette("primary"))
#' ggplot(mtcars, aes(factor(cyl), fill=factor(vs))) +  geom_bar() +
#'  scale_fill_manual(values = cols)
#'
#' # Another approach: Create vector of colors and then set names (e.g.
#' # to match dataframe values)
#' cols <- oe_palette("primary")[c("prime_blue", "prime_ltgrey")] %>%
#'  setNames(c("1", "0"))
#' ggplot(mtcars, aes(factor(cyl), fill=factor(vs))) +  geom_bar() +
#'  scale_fill_manual(values = cols)
#'

oe_palette <- function(name, n, type = c("discrete", "continuous")) {
  type <- match.arg(type)

  pal <- oe_palettes[[name]]
  if (is.null(pal))
    stop("Palette not found.")

  if (missing(n)) {
    n <- length(pal)
  }

  if (type == "discrete" && n > length(pal)) {
    stop("Number of requested colors greater than what palette can offer")
  }

  out <- switch(type,
                continuous = grDevices::colorRampPalette(pal)(n),
                discrete = pal[1:n]
  )
  structure(out, class = "palette", name = name)
}


#' Print palette
#'
#' @param x Palette
#' @param ...
#'
#' @return Image?
#' @export
#'
#' @examples
#'
#' oe_palette("blue_grad")
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, family = "serif")
}
