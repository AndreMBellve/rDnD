#Roll n d20 dice in R.
d20 <- function(n = 1, quantum = FALSE) {

  if (quantum) {
    res <- round(qrandomunif(n, a = 1, b = 20), digits = 0)
  } else{
    res <- sample(1:20, size = n, replace = TRUE)
  }

  #Checking for criticals
  if (any(res == 20)) {
    warning("!CRITICAL SUCCESS!")
  }
  if (any(res == 1)) {
    warning("!CRITICAL FAILURE!")
  }

  return(res)
}
