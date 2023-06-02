# Teoria

# Uma distribuição binomial corresponde a um vetor com o número de sucessos numa 
# sequência de n tentativas com uma probabilidade p de sucesso e uma probabilidade 
# 1-p de fracasso.
# O valor esperado da média de muitas amostras de uma v.a. X~Binom(n, p) é dado por
# E(X) = n*p

# ------------------------------------------------------------------------------
# Geração dos dados

# Para criar um vetor de dados com distribuição binomial, utilizamos a função rbinom()
# com os argumentos n, size e prob, em que n é o tamanho da distribuição e size é 
# o número de tentativas. O que confunde aqui é que eu uso os nomes das variáveis
# ao contrário, uso n para designar o número de tentativas, e size para o tamanho.

# Em vez de usar um for loop, descobri que existe a função replicate() que repete
# n vezes a mesma expressão de geração aleatória e retorna um vetor com os dados.
# Neat!

# ------------------------------------------------------------------------------
# Cálculo do resultado

# Portanto, o enunciado pede "o valor absoluto da diferença entre a média da amostra 
# de médias e o valor esperado da distribuição teórica". Para o valor absoluto podemos 
# usar a função abs() e o resto é simples.

# ------------------------------------------------------------------------------
# Solução

diff <- function(seed, samples, size, n, p) {
  set.seed(seed)
  return(abs(mean(replicate(samples, mean(rbinom(size, n, p)))) - n*p))
}

diff(seed=1429, samples=8225, size=70, n=14, p=0.32)

# 2 linhas :D