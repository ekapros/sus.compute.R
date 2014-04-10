SUS.compute.R
=============

Some simple R code to compute the score of System Usability Scale (SUS) responses.

Info on SUS: http://en.wikipedia.org/wiki/System_usability_scale

Each column represents one of the 10 questions, each row a participant.
WARNING: sus.compute will not clear your data for you!


This Source Code Form is subject to the terms of the Mozilla Public
License, v. 2.0. If a copy of the MPL was not distributed with this
file, You can obtain one at http://mozilla.org/MPL/2.0/.


Preparation:

This function takes as input just the responses—make sure to clean your data!
If you have gathered responses from online software there probably exist headers. Make sure to turn headers on.
Moreover, set strings to n/a to avoid as.numeric factorising the responses. You don't want to calculate the score of the indices!

> sus.demo <- read.csv("~/Documents/R/Demo Usability evaluation - Demo SUS.csv", header=T, na.strings='n/a')

Make sure to feed into the function only the rows containing the system whose SUS you want to calculate:

> my.data <- sus.demo[which(sus.demo$The.system.I.evaluated.was.a.=="Web app (in-browser app)"),]

Make sure to feed into the function only the columns containing SUS responses, e.g. by removing other demograohic info:

> demo.sus <-my.data[c(-1,-2,-3,-4)]

To run from the console you would do something like:

> sus.score <- sus.compute(demo.sus)

> sus.score
