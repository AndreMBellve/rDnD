#'  x-sided dice roller
#'
#'  A collection of virtual dice for DnD 5e. Rolls a dX die,
#'  where X = the number of sides.
#'
#' @param n A integer specifying how many of dice to roll
#' @param summed T/F indicating whether or not the results should be
#' summed or returned as individual die rolls.
#' @param quantum T/F indicating whether or not the sampling should
#' call ANU's quantum random number generator (see package qrandom)
#' @param die T/F exclusive to the coin function. If die = TRUE, the
#' the function will 'roll' a 2-sided die
#'
#'
#'
#' @details
#'  Each function will roll n dice, sum the result as a
#'  default (`coin` and `d20` are exceptions for summing). Random
#'  numbers can be drawn from the ANU quantum random number
#'  generator (QRNG) for truly random results. The QRNG has a slight
#'  lag as it samples a live quantum field, and as such requires an
#'  internet connection. All dice are fully extensible and numbers
#'  can be added directly to the function to account for
#'  ability/weapon modifiers.  In addition, new functions can be
#'  easily defined to save your favourite skills / items - see
#'  examples.
#'
#' @return
#' Returns a vector of n integers or, if `summed = TRUE`, then a
#' single integer which is the sum of all the rolls. The default is
#' to roll a single die.
#'
#' In the case of the function `coin()` - the default is to return a
#' character vector with either "Heads" or "Tails" - this can be
#' reverted to integers using the `die = TRUE` argument.
#'
#' In the case of the `d20()` function, the default is not to sum
#' the output (i.e. default is `summed = FALSE`), as this die is
#' usually used for ability checks, and it multiple are rolled it
#' is because the check is with advantage/ disadvantage and
#' individual rolls are desired. Moreover, if a natural 1 or a
#' natural 20 is rolled, a warning will be thrown (e.g. "!CRITICAL
#' SUCCESS!")
#'
#'@examples
#'coin() #A standard coin flip
#'
#'coin(die = TRUE) #1d2 roll
#'
#'d4() #1d4
#'
#'d6(3) #3d6
#'
#'d8(2) + 5 #2d8 + 5 (e.g.+5 ability modifier)
#'
#'d20() + 4 # 1d20 + 4 (e.g.+4 ability modifier)
#'
#'#Weapons can be coded like so:
#'#Flame tongue rapier -
#'#https://www.dndbeyond.com/magic-items/flame-tongue
#'
#' ftr <- function(mod){ return(d8() + d6(2) + mod) }
#'
#'#Or if you wanted to bundle in an attack roll:
#'ftr <- function(mod, prof){
#'        cat(paste("Attack Roll:", (d20() + mod + prof), "\n"))
#'        cat(paste("Damage Roll:", (d8() + d6(2) + mod)))
#'      }
#'
#'#Where mod is your ability modifier for the attack, and prof is
#'#your proficiency bonus. These can also be given defaults, but
#'#don't forget to update as you level up adventurer!
#'
d4 <- function(n = 1,
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

    res <- round(qrandom::qrandomunif(n, a = 1, b = 4),
                 digits = 0)
  } else{
    res <- sample(1:4, size = n, replace = TRUE)
  }

  if (n > 1 & summed == TRUE) {
    res <- sum(res)
  }
  return(res)
}
