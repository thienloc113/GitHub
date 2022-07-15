# Loading libraries
      library(tidyverse)
      library(ggplot2)
      
      
# Set seed and other parameters for reproducability later
      set.seed(11)
      lambda <- 0.2
      n <- 40 

# Simulation
      sim_exp <- replicate(1000, rexp(n, lambda))
      
      
      
      # Question 1
      # Show where the distribution is centered at and compare it to the theoretical center of the distribution.
# Sample Mean versus Theoretical Mean
      each_mean <- apply(sim_exp, 2, mean)
      sam_mean <- mean(each_mean)
      sam_mean
      theory_mean <- 1/lambda
      theory_mean
      
      ## Show in figure
      ggplot() + geom_histogram(aes(x = each_mean), bins = 15, alpha = 0.5
                                , color="black") + 
            geom_vline(aes(xintercept = theory_mean),col = 'red') + 
            geom_vline(aes(xintercept = sam_mean), col = "blue") + 
            labs(x = "Means", y = "Frequency", title = "Exponential Function Simulations")
# The analytics mean is 4.993867 the theoretical mean 5. The center of 
# distribution of averages of 40 exponentials is near to the theoretical center of the distribution. 
      
# Question 2
     # Show how variable the sample is (via variance) and compare it to the theoretical variance of the distribution.
     # variance of distribution
      stan_sd_dist <- sd(each_mean)
      var_dist <- stan_sd_dist^2
      var_dist
      
      # theoretical variance of the distribution
      var_theory <- ((1/lambda)*(1/sqrt(n)))^2
      var_theory
# Question 3
      # Show that the distribution is approximately normal.
      ggplot() + geom_histogram(aes(x = each_mean, y = ..density..), bins = 40,
                                alpha = 0.5, color="black", fill = "orange") + 
            stat_function(fun = dnorm, args = list(mean = sam_mean, 
                              sd = stan_sd_dist), size = 0.8, lty = 5) +
            labs(x= "Means", y = "Density", title = "Density of Mean")
      # compare the distribution of averages of 40 exponentials to a normal distribution
      qqnorm(each_mean)
      qqline(each_mean, col = 3)      
# Due to the central limit theorem (CLT), the distribution of averages of 40 exponentials is approximately equal to a normal distribution.      