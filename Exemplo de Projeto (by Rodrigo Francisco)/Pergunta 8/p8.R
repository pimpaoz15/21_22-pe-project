m_ic <- function(seed, m, n, lambda, gama) {
  set.seed(seed)
  return(mean(replicate(m, (2*(qnorm((1+gama)/2)/sqrt(n)))/(mean(rexp(n ,lambda))))))
}

m_ic(seed=406, m=1450, n=1340, lambda=0.96, gama=0.96)
