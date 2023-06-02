# ------------------------------------------------------------------------------

library(ggplot2)

# ------------------------------------------------------------------------------
# Teoria

# O valor esperado de uma distribuição uniforme X~Unif(a, b) é dado pela fórmula 
# E(X) = (a + b) / 2 e a variância é dada por Var(X) = ((b - a)^2) / 12

# ------------------------------------------------------------------------------
# Geração da data frame

# Para gerar valores com distribuição uniforme, utilizamos a função runif(), com 
# n = cada um dos n do enunciado, min e max iguais aos extremos do intervalo.
# Para calcular a média dos valores de um vetor, utilizamos a função mean().
# Para gerar m amostras podemos usar o for loop. A sintaxe de um for loop é:

for(i in 1:m) {
  # cenas
}

# Antes do for deve "alocar-se" um vetor para ir pondo os resultados das m gerações.
# Isso pode fazer-se com vetor <- numeric(m), com m = número de amostras.

# ------------------------------------------------------------------------------
# Desenho dos gráficos

# Estes foram os gráficos que demoraram mais tempo a perceber como fazer e a discutir 
# se estavam certos ou não. O problema pede para criar 3 histogramas, um para cada 
# valor de n, e sobrepô-los com uma curva normal com a mesma média e variância.

# Tipo de gráfico
# Houve bastante discussão sobre qual o tipo de gráfico a utilizar. A conclusão 
# é que se pode utilizar geom_histogram() em que o y pode ser stat(density) ou 
# after_stat(count / sum(count)). A diferença entre os dois métodos reside no facto
# de o primeiro método produzir um histograma de densidade e o segundo método produzir 
# um histograma de frequência relativa. Após discussão com os professores responsáveis 
# pelo projeto, aceitam-se os dois métodos. 

# Curva normal
# A sobreposição da normal também pode ser feita de várias maneiras. Uma delas é 
# criar os dados correspondentes à curva normal e espetar em cima do histograma 
# com uma componente geom_line(). Para isso, criam-se 2 vetores: um vetor Y com 
# uma sequência de m números entre os extremos da uniforme e outro usando a função 
# dnorm() com argumentos Y, mean=E(X) e sd=sqrt(Var(X)/n). Outra maneira seria 
# utilizar uma componente stat_function(fun, args) em que fun=dnorm e args=c(mean, sd), 
# com mean = E(X) e sd = sqrt(Var(X)/n).

# Escala percentual
# Para colocar a escala do gráfico em percentagem, com 1 = 100%, podemos utilizar 
# a componente scale_y_continuous(labels = scales::percent)

# Observação
# Contra-intuitivamente, as duas componentes do ggplot, o histograma e a normal, 
# não vão coincidir um com o outro. Esta disparidade é explicada pela teoria de PE, 
# mas não vou entrar em detalhe porque os professores já estão à espera de ver esta 
# disparidade nos gráficos.

# ------------------------------------------------------------------------------
# Personalização do gráfico

# Neste caso, cada gráfico vai ter uma componente com cor definida por fill e outra 
# com cor definida por color. Como só existe 1 desenho com fill e 1 com color, se 
# escolhermos um tema pré-definido as cores vão ser obrigatoriamente iguais, devido 
# à maneira como o ggplot escolhe as cores automaticamente. Por isso, devemos escolher 
# as cores manualmente com scale_fill_manual(), para as barras do histograma, e 
# scale_color_manual(), para a linha da distribuição normal.

# ------------------------------------------------------------------------------

                            'Good luck have fun'

