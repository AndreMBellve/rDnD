#' @rdname d4
d100 <- function(n = 1,
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

    res <- round(qrandom::qrandomunif(n, a = 1, b = 4), digits = 0)
  } else{
    res <- sample(1:100, size = n, replace = TRUE)
  }
  if (n > 1 & summed == TRUE) {
    res <- sum(res)
  }
  return(res)
}
