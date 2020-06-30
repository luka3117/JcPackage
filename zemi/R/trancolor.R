Tran <- function(ColorNmae, alpha = 100)
  # color transparent
{
  newColor <- col2rgb(ColorNmae)
  apply(newColor, 2, function(curcoldata) {
    rgb(
      red = curcoldata[1],
      green = curcoldata[2],
      blue = curcoldata[3],
      alpha = alpha,
      maxColorValue = 255
    )
  })
}
