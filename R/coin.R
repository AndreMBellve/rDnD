#' @rdname d4
coin <- function(n = 1,
                 summed = TRUE,
                 quantum = FALSE,
                 die = FALSE) {
  if(quantum) {

    #Checking for qrandom
    if (!requireNamespace("qrandom", quietly = TRUE)) {
      stop(
        "Package \"qrandom\" must be installed to use this function.",
        call. = FALSE
      )
    }

    res <- round(qrandom::qrandomunif(n, a = 0.5, b = 2.5), digits = 0)
  } else{
    res <- sample(1:2, size = n, replace = TRUE)
  }

  #Converting to heads or tails because qrandomunif won't sample a character vector
  if(!die){
    res <- ifelse(res == 1, "Heads", "Tails")
  }else{
    if (n > 1 & summed == TRUE) {
      res <- sum(res)
    }
  }

  return(res)
}
