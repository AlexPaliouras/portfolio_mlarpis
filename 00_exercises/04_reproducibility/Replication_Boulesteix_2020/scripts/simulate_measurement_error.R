# Reproduces the measurement-error simulation from Boulesteix et al. (2020).
# Adds normally distributed errors to HbA1c and BMI across 36 scenarios,
# varying the proportion of measurement-error variance from 0% to 50%.
# Repeats each scenario 1,000 times using fixed random seeds and estimates
# the HbA1c regression coefficient in each repetition.
# Returns individual estimates and scenario-level averages.

# Simulate measurement error in HbA1c and BMI across scenarios.
# Return individual regression estimates and scenario-level averages.

# Reproduces the measurement-error simulation from Boulesteix et al. (2020).
# Adds normally distributed errors to HbA1c and BMI across 36 scenarios,
# varying the proportion of measurement-error variance from 0% to 50%.
# Repeats each scenario 1,000 times using the original random seeds.
# Returns individual regression estimates, their 95% confidence intervals,
# and scenario-level average estimates for further evaluation.

simulate_measurement_error <- function(data, n_sim = 1000, error_levels = seq(0, 0.5, 0.1)) {
  
  # Define all combinations of measurement-error percentages.
  scenarios <- expand.grid(me_HbA1c = error_levels, me_BMI = error_levels)
  
  # Extract original predictor variances and sample size.
  var_exp <- var(data$HbA1C)
  var_conf <- var(data$bmi)
  n <- nrow(data)
  
  # Initialize matrix to store regression estimates.
  beta_hat <- matrix(NA_real_, nrow = n_sim, ncol = nrow(scenarios))
  
  # Initialize matrices to store the lower and upper 95% confidence interval bounds.
  ci_lower <- matrix(NA_real_, nrow = n_sim, ncol = nrow(scenarios))
  ci_upper <- matrix(NA_real_, nrow = n_sim, ncol = nrow(scenarios))
  
  # Repeat the original simulation procedure.
  for (k in seq_len(n_sim)) {
    set.seed(k)
    
    for (i in seq_len(nrow(scenarios))) {
      
      # Calculate scenario-specific measurement-error variances.
      var_me_exp <- var_exp * scenarios$me_HbA1c[i] / (1 - scenarios$me_HbA1c[i])
      
      var_me_conf <- var_conf * scenarios$me_BMI[i] / (1 - scenarios$me_BMI[i])
      
      # Add normally distributed errors to the original predictors.
      data$HbA1C.me <- data$HbA1C + rnorm(n, 0, sqrt(var_me_exp))
      data$bmi.me <- data$bmi + rnorm(n, 0, sqrt(var_me_conf))
      
      # Fit the original regression model.
      fit <- lm(bp ~ HbA1C.me + age + bmi.me + as.factor(sex), data = data)
      
      # Store the estimated HbA1c regression coefficient.
      beta_hat[k, i] <- coef(fit)["HbA1C.me"]
      
      # Extract and store the corresponding 95% confidence interval.
      ci <- confint(fit, parm = "HbA1C.me", level = 0.95)
      ci_lower[k, i] <- ci[1, 1]
      ci_upper[k, i] <- ci[1, 2]
    }
  }
  
  # Calculate the average estimate for each scenario.
  scenarios$mean_estimate <- colMeans(beta_hat)
  
  return(list(
    scenarios = scenarios,
    beta_hat = beta_hat,
    ci_lower = ci_lower,
    ci_upper = ci_upper
  ))
}