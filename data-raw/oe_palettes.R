oe_colors <- c(
  `prime_blue`   = rgb(0,52,105, max=255),
  `prime_grey`   = rgb(123, 124, 119, max=255),
  `prime_ltgrey` = rgb(241, 239, 237, max=255),
  `prime_white`  = rgb(255, 255, 255, max=255),
  `sec_grey`     = rgb(232, 236, 244, max=255),
  `sec_must`     = rgb(209, 162, 30, max=255),
  `sec_aqua`     = rgb(110, 145, 160, max=255),
  `sec_blue`     = rgb(67, 110, 172, max=255),
  `sec_brblue`   = rgb(0, 173, 220, max=255),
  `blue_grad_1`  = rgb(0, 52, 105, max=255),
  `blue_grad_2`  = rgb(0, 70, 126, max=255),
  `blue_grad_3`  = rgb(39, 90, 150, max=255),
  `blue_grad_4`  = rgb(58, 112, 174, max=255),
  `blue_grad_5`  = rgb(0, 131, 187, max=255),
  `blue_grad_6`  = rgb(0, 150, 202, max=255),
  `blue_grad_7`  = rgb(0, 173, 220, max=255),
  `blue_grad_8`  = rgb(0, 183, 225, max=255),
  `blue_grad_9`  = rgb(30, 194, 229, max=255),
  `blue_grad_10` = rgb(113, 207, 235, max=255),
  `bold_blue`    = rgb(0, 52, 105, max=255),
  `bold_ltblue`  = rgb(0, 173, 220, max=255),
  `bold_grey`    = rgb(123, 124, 119, max=255),
  `bold_red`     = rgb(189, 27, 33, max=255),
  `bold_mustard` = rgb(209, 162, 30, max=255),
  `bold_green`   = rgb(0, 121, 63, max=255),
  `bold_orange`  = rgb(222, 99, 40, max=255),
  `bold_purple`  = rgb(150, 87, 147, max=255),
  `pale_blue`    = rgb(0, 173, 220, max=255),
  `pale_midblue` = rgb(75, 199, 231, max=255),
  `pale_ltblue`  = rgb(173, 224, 242, max=255),
  `pale_grey`    = rgb(123, 124, 119, max=255),
  `pale_midgrey` = rgb(169, 166, 162, max=255),
  `pale_ltgrey`  = rgb(208, 205, 201, max=255),
  `pale_mustard` = rgb(197, 137, 48, max=255),
  `pale_dkbeige` = rgb(218, 177, 119, max=255),
  `pale_beige`   = rgb(233, 212, 180, max=255)
)


#' Function to extract oe colors as hex codes
#'
#' @param ... Character names of oe_colors
#'
oe_cols <- function(...) {
  cols <- c(...)

  if (is.null(cols))
    return (oe_colors)

  oe_colors[cols]
}

# combine colors into palettes

oe_palettes <- list(
  `primary` = oe_cols("prime_blue", "prime_grey",
                      "prime_ltgrey", "prime_white"),
  `secondary` = oe_cols("sec_grey",
                        "sec_must",
                        "sec_aqua",
                        "sec_blue",
                        "sec_brblue"),
  `blue_grad` = oe_cols("blue_grad_1",
                        "blue_grad_2",
                        "blue_grad_3",
                        "blue_grad_4",
                        "blue_grad_5",
                        "blue_grad_6",
                        "blue_grad_7",
                        "blue_grad_8",
                        "blue_grad_9",
                        "blue_grad_10"),
  `bold`      = oe_cols("bold_blue",
                        "bold_ltblue",
                        "bold_grey",
                        "bold_red",
                        "bold_mustard",
                        "bold_green",
                        "bold_orange",
                        "bold_purple "),
  `pale`      = oe_cols("pale_blue",
                        "pale_midblue",
                        "pale_ltblue",
                        "pale_grey",
                        "pale_midgrey",
                        "pale_ltgrey",
                        "pale_mustard",
                        "pale_dkbeige",
                        "pale_beige")
)


usethis::use_data(oe_palettes)
