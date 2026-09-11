# Latexdiff script to produce original pdf and one with tracked changes in the fairytale

# working directory
setwd("C:/Users/alexp/OneDrive/Documents/Markup Languages/Week 1 - LateX")

# load latexdiff package
library(latexdiffr)

# produce compiled diff file of the two different files
latexdiff("Week1_LaTeX_AlexP.rnw","Week1_LaTeX2_AlexP.rnw",output = "Week1_LaTeXdiff_AlexP")
