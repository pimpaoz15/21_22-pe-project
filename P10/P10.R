# Este exercício é só de resposta, não é preciso plots nem ficheiros PDFs escritos
# R: 0.086 (MONICA)

set.seed(219)
m <- 300
n <- 41
mu <- 50.5
sigma <- 2
alpha <- 0.09
reject_count <- 0

for (i in 1:m) {
  x <- rnorm(n, mu, sigma)
  test_result <- t.test(x, mu = 49.2)
  if (test_result$p.value >= alpha) {
    reject_count <- reject_count + 1
  }
}

non_reject_prob <- 1 - reject_count/m
non_reject_prob <- round(non_reject_prob, 3)
non_reject_prob