# Este exercício é só de resposta, não é preciso plots nem ficheiros PDFs escritos
#ChatGPT
set.seed(1871)
k <- 3222
lambda <- 7.5

# Generate sample from exponential distribution
sample <- rexp(k, rate = 1/lambda)

# Compute successive sums
sums <- cumsum(sample)

# Calculate the instant of occurrence of the last event
T <- ceiling(sums[k])

# Divide range [0, T] into unit amplitude intervals
intervals <- seq(0, T, by = 1)

# Count the number of events in each subinterval
event_counts <- cut(sums, breaks = intervals, right = FALSE, labels = FALSE)

# Calculate the average of events per subinterval
average_events <- mean(event_counts)

# Calculate the expected value of events in a subinterval
expected_events <- k * (1/T)

# Calculate the absolute deviation
absolute_deviation <- abs(average_events - expected_events)
absolute_deviation <- round(absolute_deviation, 4)
absolute_deviation

#MONICA
# Set seed and generate sample - the only difference is ChatGPT does the samples with 1/lambda and MONICA with lambda
set.seed(1871)
k <- 3222
lambda <- 7.5
x <- rexp(k, lambda)

# Calculate T
T <- ceiling(sum(x))

# Calculate expected number of events per subinterval
ex <- 1/lambda
en <- T/ex

# Divide range into subintervals and count events
subintervals <- seq(0, T, by = 1)
num_events <- rep(0, length(subintervals)-1)
for (i in 1:length(subintervals)-1) {
  num_events[i] <- sum(x >= subintervals[i] & x < subintervals[i+1])
}

# Calculate average number of events per subinterval
avg_events <- mean(num_events)

# Calculate absolute deviation
abs_deviation <- abs(avg_events - en)

# Round deviation to 4 decimal places
abs_deviation_rounded <- round(abs_deviation, 4)

# Print result
cat("Absolute deviation:", abs_deviation_rounded)

