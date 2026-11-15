# Replication of Boulesteix et al. (2020)

## Project Goal

This research compendium aims to reproduce the simulation study presented by Boulesteix et al. (2020), *Introduction to Statistical Simulations in Health Research*, investigating the effects of measurement error in an exposure (HbA1c) and a confounding variable (BMI) on estimated regression coefficients.

The project reproduces the original simulation using a standalone R function, verifies numerical equivalence with the original implementation, and provides an additional evaluation of reference-based bias and confidence interval inclusion rates.

## Project Details

- **Author:** Alex Paliouras
- **Date:** 15/11/2026
- **Course:** Markup Languages and Reproducible Programming in Statistics – Week 4: Reproducibility
- **Software:** RStudio, Quarto
- **Dependency management:** `renv`

## Files and Folders

### Root Directory

- `_quarto.yml` – Configures Quarto to execute code relative to the project root, allowing consistent access to files across subdirectories.
- `Replication_Boulesteix_2020.Rproj` – RStudio project file.
- `README.md` – Documents the project structure, methodology, and reproduction instructions.
- `LICENSE.md` – Specifies the repository's licensing information.
- `.gitignore` – Specifies files and directories excluded from Git version control, including locally installed R packages, R session history, and Quarto execution caches.

### `data/`

Contains the original NHANES 2015–2016 datasets obtained from the [CDC NHANES website](https://wwwn.cdc.gov/nchs/nhanes/continuousnhanes/default.aspx?BeginYear=2015).

- `DEMO_I.xpt` – Demographic characteristics, including age and sex.
- `BPX_I.xpt` – Blood pressure measurements.
- `BMX_I.xpt` – Body measurements, including BMI.
- `GHB_I.xpt` – Glycohemoglobin (HbA1c) measurements.
- `TCHOL_I.xpt` – Total cholesterol measurements.

### `docs/`

Contains the Quarto source document, its rendered HTML report, and bibliography resources.

- `Replication_Boulesteix2020.qmd` – Main reproducible report containing data preparation, regression analyses, simulation execution, reproducibility checks, figure generation, and additional evaluation.
- `Replication_Boulesteix2020.html` – Rendered HTML version of the report.
- `Replication_Boulesteix2020.pdf` – Rendered PDF version of the reproducible Quarto report.
- `references_BoulesteixRep.bib` – Contains references cited in the report.
- `Replication_Boulesteix2020_cache/` – Quarto-generated cache storing previously executed computations, particularly the simulation results, to avoid unnecessary recomputation during rendering.
- `Replication_Boulesteix2020_files/` – Automatically generated directory containing figures and supporting files required by the rendered Quarto report.



### `scripts/`

Contains the original simulation code and supporting scripts developed for the replication.

- `original_script.R` – Original simulation implementation provided by Boulesteix et al. (2020).
- `original_script.pdf` – Pdf of original simulation R script preserved for reference.
- `simulate_measurement_error.R` – Standalone function reproducing the original 36 measurement-error scenarios across 1,000 repetitions each. Additionally extracts 95% confidence intervals for the HbA1c regression coefficients.
- `save_original_sim_results.R` – Saves the original simulation's regression estimates, RNG configuration, and R version as an RDS reference file after the original simulation has been executed.

### `results/`

Contains saved outputs from the simulation and reproducibility checks.

- `original_sim_results.rds` – Stores the original simulation's 36,000 regression coefficient estimates, RNG configuration, and R version for comparison with the function-based replication.
- `Figure_STRATOS.tif` – Reproduced simulation heatmap, retaining the original plotting specifications and saved using `ggsave()`.

### `renv/` and `renv.lock`

Contain the infrastructure for reproducing the project's R package environment.

- `renv.lock` – Records the R version, package versions, and package sources used in the project.
- `.Rprofile` – Automatically activates the project-specific `renv` environment.
- `renv/activate.R` – Initializes the reproducible environment when the project is opened.
- `renv/settings.json` – Stores project-specific `renv` settings.

The local package library (renv/library/) contains the packages installed for the project and is retained locally. It is excluded from Git version control through .gitignore, as the environment can be reconstructed from renv.lock using renv::restore().

## Reproducing the Analysis

1. Clone or download the repository and open `Replication_Boulesteix_2020.Rproj` in RStudio.
2. Ensure R and Quarto are installed.
3. Restore the project dependencies by running the following in the R console:

   ```r
   renv::restore()
   ```

4. Render the Quarto document from the project root:

   ```bash
   quarto render docs/Replication_Boulesteix2020.qmd
   ```

5. Inspect the rendered HTML or pdf report in `docs/` (modify from yaml format:) and the saved figure in `results/`.

The Quarto document contains the analysis code and calls the standalone simulation function from `scripts/`. The complete function implementation is available for inspection and reuse.

For a full computational verification, render the document with its simulation cache refreshed, ensuring that the estimates are recalculated rather than loaded from a previous execution.

## References

Boulesteix et al. (2020). *Introduction to Statistical Simulations in Health Research*.

NHANES 2015–2016 datasets: https://wwwn.cdc.gov/nchs/nhanes/continuousnhanes/default.aspx?BeginYear=2015