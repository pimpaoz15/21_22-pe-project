# Este exercício é só de resposta, não é preciso plots nem ficheiros PDFs escritos

set.seed(1048)  # Fix seed at 1048
m <- 1119  # Number of samples
n <- 17  # Dimension of samples

# Simulate m samples of dimension n from a normal population of mean null and unit variance
samples <- matrix(rnorm(m * n), ncol = n)

# Calculate the sum of squares of the observed values for each sample
sums_of_squares <- apply(samples, 1, function(x) sum(x^2))

# Calculate the quantiles of the sample sums of squares and the theoretical distribution
quantiles_sample <- quantile(sums_of_squares, probs = 0.31)
quantiles_theoretical <- qchisq(0.31, df = n)

# Calculate the absolute difference between the quantiles
abs_diff <- abs(quantiles_sample - quantiles_theoretical)

# Round the absolute difference to 4 decimal places
abs_diff_rounded <- round(abs_diff, 4)

# Print the result
abs_diff_rounded
