
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
#' @examples
#' #' # If you need more colours than normally found in a palette, you
#' # can use a continuous palette to interpolate between existing
#' # colours
#' pal <- wes_palette(21, name = "Zissou1", type = "continuous")
#' image(volcano, col = pal)
#'
#' we can't directly feed the palette into scale_fill_manual because
#' the colors are named in the vector. If one provides scale_fill_manual
#' a named vector, then ggplot2 is trying to match the colors to the
#' values in the dataframe
#'
#'
#'
#'
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


#' Title
#'
#' @param x
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, family = "serif")
}
