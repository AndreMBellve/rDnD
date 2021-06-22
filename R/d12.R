d12 <- function(n = 1,
                summed = TRUE,
                quantum = FALSE) {
  if (quantum) {
    res <- round(qrandomunif(n, a = 1, b = 12), digits = 0)
  } else{
    res <- sample(1:12, size = n, replace = TRUE)
  }
  if (n > 1 & summed == TRUE) {
    res <- sum(res)
  }
  return(res)
}
