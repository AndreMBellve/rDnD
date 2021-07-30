#' @rdname d4
coin <- function(n = 1,
                 summed = TRUE,
                 quantum = FALSE,
                 die = FALSE) {
  if(quantum) {
    res <- round(qrandom::qrandomunif(n, a = 1, b = 2), digits = 0)
  } else{
    res <- sample(1:2, size = n, replace = TRUE)
  }

  #Converting to heads or tails because qrandomunif won't sample a character vector
  if(!die){
    res <- ifelse(res == 1, "Heads", "Tails")
  }

  return(res)
}
