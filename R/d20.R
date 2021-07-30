#' @rdname d4
d20 <- function(n = 1, summed = FALSE, quantum = FALSE) {

  if (quantum) {
    res <- round(qrandom::qrandomunif(n, a = 1, b = 20), digits = 0)
  } else{
    res <- sample(1:20, size = n, replace = TRUE)
  }

  #To sum (unlikely in DnD)
  if (summed) {
    res <- sum(res)
  }

  #Checking for criticals
  if (any(res == 20) & summed == FALSE) {
    warning("!CRITICAL SUCCESS!")
  }
  if (any(res == 1 & summed == FALSE)) {
    warning("!CRITICAL FAILURE!")
  }

  return(res)
}
