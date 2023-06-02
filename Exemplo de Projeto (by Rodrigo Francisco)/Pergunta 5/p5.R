library(dplyr)

diff <- function(lambda, seed, n, x) {
  set.seed(seed)
  rand <- data.frame(rexp(n, lambda))
  rand2 <- filter(rand, rand > x)
  estim <- length(rand2[,1])/length(rand[,1])
  teo <- exp(-lambda*x)
  return(abs(teo - estim))
}

diff(0.28, 1387, 633, 5)

