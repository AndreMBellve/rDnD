# rDnD
A dice-roller for DnD 5e - quantum rolling extension for the chaos affecianado's

Hello fellow adventurer! It seems you have found your way to my DnD dice roller R package. 
In this bag of holding are several useful tools for rolling the standard DnD 5e dice. Why you might ask?

- Sometimes you forget your dice and that sucks - this is an easy out for those situations!

- Sometimes you need to roll a huge number of dice (I once say 36 six-sided dice rolled!!!) and you then need to sum up the values. This brings the story to a grinding halt, so this offers a nice solution to avoid that!

- Fun (read nerdy) fact - most dice (especially those that are not six-sided) are not fair! Why? Because Casino's are legally required to have fair dice and they are the biggest buyers of dice in the world. However, to make a fair dice you need specific a temperature and humidity to ensure that the density of the dice is constant. So, the biggest producers of dice (based in China and South America) all produce the ones they need to be properly balanced when the conditions are right. All the others are damned, something that is further exacerbated when you get dice that have multiple colours or things cast inside of them. You might think that this is over-kill but I can promise you that consistently rolling low during a campaign can be real shit! So this ensures that the numbers are fair which can let players feel less short-changed by "randomness".

TL;DR - A package for when you forget your dice, need to sum up a huge number of them or your dice consistently roll unfairly.

There is also a variant in each function that allows you to specify if you want a quantum random number generator to roll for you. It takes a second but it is really just there for pure geekery... I get the feeling that the folks at ANU did not anticipate this use for their quantum random field but isn't that a measure of success?!

Setup:
To install the package you will need to run this line  `devtools::install_github("AndreMBellve/rDnD")`

Short tutorial:

All the commonly used dice in DnD 5e are included in this package. d6 refers to a six-sided die, d4 a four-sided die,  This is really common DnD terminology and I am assuming if someone is using my package that they know this...

Executing the function `d6()` will roll a single six sided die, while  4d6 (or in rDnD syntax d6(4)) is four six-sided dice - the default is to `sum` these values for all dice except for the `d20()` and the `coin` function, although both can be set to do so. 

```
coin() #A standard coin flip

coin(die = TRUE) #1d2 roll

d4() #1d4

d6(3) #3d6

d8(2) + 5 #2d8 + 5 (e.g.+5 ability modifier)

d20() + 4 # 1d20 + 4 (e.g.+4 ability modifier)
```

The joy of R is that these functions are all extensible! You have a sweet weapon that you always use and your modifiers are consistent? Just write yourself a quick wrapper to run it in a single line!

E.g.

```#Weapons can be coded like so:
#Flame tongue rapier -
#https://www.dndbeyond.com/magic-items/flame-tongue`

mod <- 3 # modifier
prof <- 2 # proficieny

ftr <- function(mod){ return(d8() + d6(2) + mod) }

#Or if you wanted to bundle in an attack roll:
ftr <- function(mod, prof){
       cat(paste("Attack Roll:", (d20() + mod + prof), "\n"))
       cat(paste("Damage Roll:", (d8() + d6(2) + mod)))
     }

ftr(mod, prof)

#Where mod is your ability modifier for the attack, and prof is
#your proficiency bonus. These can also be given defaults, but
#don't forget to update as you level up adventurer!
```
The same extra process above can be done for your monsters too! Down the track I will include some functions I have written for monsters encountered in the 'Mines of Madness' one shot :)

If you have the means, then please feel free to get back to me with any comments/issues you find with my package as it is still very much in development!
This is really just a pet project, so please understand if there are delays in gettint back to you.

Thanks for reading this far and I hope that the package helps you tell your own stories.

-André a.k.a. Stats Dungeon Master
