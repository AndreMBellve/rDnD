library(qrandom)

tic("one")
qrandomunif(1)
toc()
#Set of functions to roll dice for DnD
d20 <- function(n = 1, quantum = FALSE){

  #Quantum number or regular sample
  if(quantum){
    res <- round(qrandomunif(n, a = 1, b = 20), digits = 0)
  }else{
    res <- sample(1:20, size = n, replace = TRUE)
  }

  #Checking for criticals
  if(any(res == 20)){
    warning("!CRITICAL SUCCESS!")
  }
  if(any(res == 1)){
    warning("!CRITICAL FAILURE!")
  }

  return(res)
}

  d4 <- function(n = 1, summed = TRUE){
    if(quantum){
      res <- round(qrandomunif(n, a = 1, b = 4), digits = 0)
    }else{
    res <- sample(1:4, size = n, replace = TRUE)
    }

    if(n > 1 & summed == TRUE){
    res <- sum(res)
  }
  return(res)
}

d6 <- function(n = 1, summed = TRUE){
  res <- sample(1:6, size = n, replace = TRUE)
  if(n > 1 & summed == TRUE){
    res <- sum(res)
  }
  return(res)
}

d8 <- function(n = 1, summed = TRUE){
  res <- sample(1:8, size = n, replace = TRUE)
  if(n > 1 & summed == TRUE){
    res <- sum(res)
  }
  return(res)
}

d10 <- function(n = 1, summed = TRUE){
  res <- sample(1:10, size = n, replace = TRUE)
  if(n > 1 & summed == TRUE){
    res <- sum(res)
  }
  return(res)
}

d12 <- function(n = 1, summed = TRUE){
  res <- sample(1:12, size = n, replace = TRUE)
  if(n > 1 & summed == TRUE){
    res <- sum(res)
  }
  return(res)
}

d100 <- function(n = 1, summed = TRUE){
  res <- sample(1:100, size = n, replace = TRUE)
  if(n > 1 & summed == TRUE){
    res <- sum(res)
  }
  return(res)
}

#Example of rolling a singe die
#d20()

#Example of rolling multiple dice of the same type
#d6(4)

#Example of rolling multiple dice of different types
#sum(d6(4), d4(2))

#Example of rolling die with modifier
#d20() + 4

#Barbed Tongue with Sneak Attack
btdSneak <- function(n = 1, sN = 3){
  sample(1:8, size = n, replace = TRUE) + sample(1:6, size = n, replace = TRUE)
}

btdSneak() + 7


#Bladed Tongue
btd <- function(n = 1){
  sample(1:8, size = n, replace = TRUE)
}
btd() + 6
