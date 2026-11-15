# How we we saved the results of the original Boulesteix et al. (2020) simulation:

# Run after completing the original simulation's nested for loops (ending at line 75 in the original script).
# Stores all the simulated regression estimates, the RNG configuration of the seeds, and the R version used to run the 
# simulation as a reproducibility reference for the function-based replication.

original_sim_results <- list(
  beta_hat = beta.hat,
  rng_kind = RNGkind(),
  r_version = R.version.string
)

saveRDS(original_sim_results, "results/original_sim_results.rds")