#' @rdname d4
d3 <- function(n = 1,
               summed = TRUE,
               quantum = FALSE) {
  if (quantum) {
    res <- round(qrandom::qrandomunif(n, a = 1, b = 3), digits = 0)
  } else{
    res <- sample(1:3, size = n, replace = TRUE)
  }
  if (n > 1 & summed == TRUE) {
    res <- sum(res)
  }
  return(res)
}
