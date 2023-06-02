# ------------------------------------------------------------------------------

library(dplyr)

# ------------------------------------------------------------------------------
# Teoria

# Este problema pede-nos para encontrar a diferença entre um valor real e um valor 
# teórico. 

# Para fixar a semente de geração de números aleatórios, usa-se a função set.seed().

# Para criar um vetor de dados com distribuição exponencial, utilizamos a função 
# rexp(), com n dado no enunciado e rate dado por lambda do enunciado.

# Para calcular a probabilidade de as amostras serem maiores que x (5 no meu caso), 
# podemos fazer (#amostras > x)/(#amostras total). Para escolher as amostras 
# maiores que x, podemos usar a função filter() da biblioteca dplyr, que pega numa 
# data frame e RETIRA os valores que NÃO obedecem à condição introduzida, deixando 
# apenas aqueles que obedecem à condição. Para calcular o número de amostras, basta 
# calcular o tamanho das data frames. 

# O valor teórico para P(X<x) de uma distribuição exponencial é dado pela fórmula 
# FX(x) = 1-exp(-lambda*x), logo P(X>x) = 1-FX(x) = exp(-lambda*x)

# Finalmente e opcionalmente, pode-se embrulhar tudo numa função pronta para testar 
# valores diferentes on-the-fly.

# ------------------------------------------------------------------------------
# Solução

diff <- function(lambda, seed, n, x) {
  set.seed(seed)
  rand <- data.frame(rexp(n, lambda))
  rand2 <- filter(rand, rand > x)
  estim <- length(rand2[,1])/length(rand[,1])
  teo <- exp(-lambda*x)
  return(abs(teo - estim))
}

diff(0.28, 1387, 633, 5)

