options(stringsAsFactors = FALSE)


# Libraries

library(fireData)
library(tidyverse)


#functions
source('./functions/secrets.R')
source('./functions/firebase_functions.R')
source('./functions/player_functions.R')
source('./functions/tournament_functions.R')

test_function <- function(){
  print('test')
}
