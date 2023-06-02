diff <- function(seed, samples, size, n, p) {
  set.seed(seed)
  return(abs(mean(replicate(samples, mean(rbinom(size, n, p)))) - n*p))
}

diff(seed=1429, samples=8225, size=70, n=14, p=0.32)

# 2 linhas :D