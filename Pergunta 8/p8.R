# ------------------------------------------------------------------------------
# Teoria

# O intervalo de confiança IC de uma distribuição exponencial é dado por:

# IC_gama%(lambda)=[(1-c)/avg(x),(1+c)/avg(x)], c=a/sqrt(n), a=phi^-1((1+gama)/2)

# Logo, a amplitude do IC = [a, b] é dada por:

# A(IC_gama%(lambda)) = b - a = 2*c/avg(x), c=a/sqrt(n), a=phi^-1((1+gama)/2)

# ------------------------------------------------------------------------------
# Geração dos dados

# Para criar um vetor de dados com distribuição exponencial, utilizamos a função rexp(). 
# Para calcular a inversa da distribuição normal, phi^-1, usamos a função qnorm().

# Logo, utilizando a fórmula teórica, a = qnorm((1+gama)/2). Logo substituindo a, 
# fica c = qnorm((1+gama)/2)/sqrt(n). Substituindo x = rexp() e c na fórmula, ficamos 
# com A(IC) = 2*(qnorm((1+gama)/2)/sqrt(n)))/(mean(rexp(n ,lambda)).

# Basta repetir a geração m vezes e fazer a média para obter o resultado final.

# ------------------------------------------------------------------------------
# Solução

m_ic <- function(seed, m, n, lambda, gama) {
  set.seed(seed)
  return(mean(replicate(m, (2*(qnorm((1+gama)/2)/sqrt(n)))/(mean(rexp(n ,lambda))))))
}

m_ic(seed=406, m=1450, n=1340, lambda=0.96, gama=0.96)
