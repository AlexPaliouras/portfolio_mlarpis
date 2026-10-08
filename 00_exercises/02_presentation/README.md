# Markup languages and reproducible programming in statistics

Deliverables for Markup languages and reproducible programming in statistics (202000010).

Exercise 1 (Ex1_presentation.qmd) is the three-slide Quarto presentation.

Exercise 2 (Ex2_presentation.qmd) is the seven-slide presentation. 

Both presentations use image assets from the shared Images/ directory.

Repository Files:

Ex1_presentation.qmd - Editable Quarto source for the three-slide presentation.

Ex1_presentation.html - Rendered Exercise 1 slides.

Ex2_presentation.qmd - Editable Quarto source for the seven-slide network science presentation, containing R code, figures, equations, and citations.

Ex2_presentation.html — Rendered Exercise 2 slides.

karate-network.html — Standalone interactive network visualization embedded into Exercise 2 using an HTML. Created this to resolve bugs for the interactive figure as mouse-hovering was not working properly.

karate-network_files/ — JavaScript and CSS dependencies required for the interactive network visualization for exercise 2 to work correctly when rendering.

references.bib — BibTeX file containing the academic references used in Exercise 2.

Images — Shared images and logos used by both presentations.

renv - reproducible environment folder for exercise 2.

When rendering Ex1_presentation.qmd, images folder is needed in the directory.

When rendering Ex2_presentation.qmd, karate-network.html + karate-network_files + references.bib + Images are needed in the directory.
