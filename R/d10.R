#' @rdname d4
d10 <- function(n = 1,
                summed = TRUE,
                quantum = FALSE) {
  if (quantum) {
    res <- round(qrandom::qrandomunif(n, a = 1, b = 10), digits = 0)
  } else{
    res <- sample(1:10, size = n, replace = TRUE)
  }
  if (n > 1 & summed == TRUE) {
    res <- sum(res)
  }
  return(res)
}
