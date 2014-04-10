# Compute the score of System Usability Scale (SUS) responses.
# Info on SUS: http://en.wikipedia.org/wiki/System_usability_scale
# Each column represents one of the 10 questions, each row a participant.
# WARNING: sus.compute will not clear your data for you!

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Evangelos Kapros, Wed 9 Apr, 2014
# http://ekapros.eu/ | @ekapros

# Preparation:
# This function takes as input just the responses—make sure to clean your data!
# If you have gathered responses from online survey software there probably exist headers. Make sure to turn headers on.
# Moreover, set strings to n/a to avoid as.numeric factorising the responses. You don't want to calculate the score of the indices!
# sus.demo <- read.csv("~/Documents/R/Demo Usability evaluation - Demo SUS.csv", header=T, na.strings='n/a')

# Make sure to feed into the function only the rows containing the system whose SUS you want to calculate:
# my.data <- sus.demo[which(sus.demo$The.system.I.evaluated.was.a.=="Web app (in-browser app)"),]

# Make sure to feed into the function only the columns containing SUS responses, e.g. by removing other demograohic info:
# demo.sus <-my.data[c(-1,-2,-3,-4)]

# To run from the console you would do something like:
# > sus.score <- sus.compute(demo.sus)
# > sus.score

sus.compute <- function(x){
  score <- 0
# If your data are type matrix uncomment the below piece.
# If you don't know what I'm talking about, forget about this part, do nothing.
#   if (!is.matrix(x)) {
#     warning("argument is not a matrix: returning NA")
#     return(NA_real_)
#   }
  for(j in 1:ncol(x))
  {
    for(i in 1:nrow(x)){
      if(j %% 2 == 1){
        score <- score + (as.numeric(x[i,j]) - 1)
        # To debug you can insert something like the line below:
        # warning("i:",i," j:",j," value:",as.numeric(x[i,j])," score:",score)
      }
      if(j %% 2 == 0){
        score <- score + (5 - as.numeric(x[i,j]))
      } #endif
    } #endfor
  } #endfor
  score <- 2.5 * score
  return(score/nrow(x))
}
