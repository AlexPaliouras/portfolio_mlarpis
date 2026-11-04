# my-reproducible manuscript

<!-- badges: start -->
<!-- badges: end -->

# Project Goal
The goal of my-reproducible-manuscript is to create a reproducible research compendium 
based on the https://mlarpis.github.io/quarto/ guide 

# Project Details
Author: Alex Paliouras

Date: 04/11/26 

Course: Markup Languages and Reproducible Programming in Statistics - Week 4 Reproducibility

# Files and Folders
_quarto.yml = text file with extra yaml setup for quarto script working directory to be able to parse any file in the project without having to specify specific folder working directories for different code chunks

data = contains data.csv dataset with penguin data from palmerpenguins package (https://allisonhorst.github.io/palmerpenguins/)

docs:
- ecological-research.csl = Citation style language file from https://www.zotero.org/styles used in ecological research journals
- my-reproducible-manuscript_files = default folder created during rendering of qmd document containing figure-specific files of the rendered report.
- my-reproducible_manuscript.html = rendered html file of quarto markdown file.
- my-reproducible-manuscript.ipynb = default python markdown template from existing project if python is preferred (unused)
- my-reproducible-manuscript.pdf = rendered pdf file of quarto markdown file.
- my-reproducible-manuscript.qmd = source quarto markdown file of exercise 1.
- references_reproducible_manuscript.bib = bibtex file with references used in qmd.

scripts: do_addition function for number addition and dummy code to be used in the exercise in both R and python script formats. 


