#' @rdname d4
d3 <- function(n = 1,
               summed = TRUE,
               quantum = FALSE) {

  if (quantum) {

    #Checking for qrandom
    if (!requireNamespace("qrandom", quietly = TRUE)) {
      stop(
        "Package \"qrandom\" must be installed to use this function.",
        call. = FALSE
      )
    }

    res <- round(qrandom::qrandomunif(n, a = 0.5, b = 3.5), digits = 0)
  } else{
    res <- sample(1:3, size = n, replace = TRUE)
  }
  if (n > 1 & summed == TRUE) {
    res <- sum(res)
  }
  return(res)
}
