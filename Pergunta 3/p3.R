# ------------------------------------------------------------------------------

library(readxl)
library(ggplot2)
library(dplyr)    # desta vez vai ser preciso
library(ggsci)

# ------------------------------------------------------------------------------
# Leitura do ficheiro

# Neste problema, temos que ler um ficheiro com 2 colunas de 9000 linhas cada! Seria 
# extremamente imprático retirar todos estes valores à mão para um vetor, por isso 
# é que PRECISAMOS de usar o read_excel()

# ------------------------------------------------------------------------------
# Criação da data frame

# Neste problema, o enunciado pede dois histogramas sobrepostos.

# Mesma coisa de antes: contar linhas e colunas e colocar numa variável. Desta vez, 
# ao contrário do problema anterior, vamos precisar de fazer uma data frame para 
# cada coluna. Para além disso, vamos precisar de desfazer as vontades do read_excel, 
# porque precisamos que a coluna que está em cada data frame tenha o mesmo nome, 
# para podermos fazer a sobreposição das colunas no mesmo eixo dos xx.

# Para fazer isso, usamos a função rename() da biblioteca dplyr. Esta função pega 
# numa data frame e muda o nome de uma coluna. Podemos também usar uma nova técnica 
# de aplicação de funções chamada "piping". Esta técnica consiste muito basicamente 
# em usar "%>%" para passar o retorno da última função para o primeiro argumento 
# de entrada da função seguinte, o que simplifica bastante a escrita.

# Por exemplo:

lisboa <- dados_do_excel["Lisboa"] %>% rename(coluna=`Lisboa`)
faro <- dados_do_excel["Faro"] %>% rename(coluna=`Faro`)

# Assim, colocamos na variável "lisboa" os dados da coluna "Lisboa" que ficaram 
# com o nome `Lisboa`, depois de terem sido lidos para o data frame, com mudança 
# do nome da coluna para "coluna". O nome `Lisboa` aparece no nome da coluna da 
# data frame antes de ter sido aplicado o rename().

# Para colocar em cada data frame, o que fiz foi colocar cada coluna na respetiva 
# data frame, mais uma coluna em cada com o nome que aparece na legenda. 

# Por exemplo:

dados1 <- data.frame(lisboa, nome="Lisboa")
dados2 <- data.frame(faro, nome="Faro")

# ------------------------------------------------------------------------------
# Desenho do gráfico

# De todos os gráficos, este foi dos mais complicados de perceber como organizar 
# e desenhar. Existem 2 opções: colunas alternadas ou colunas sobrepostas. A primeira 
# opção pode ser mais fácil, mas eu escolhi fazer a segunda porque achei que fica 
# melhor. 

# Para fazer colunas sobrepostas, colocamos no ggplot() apenas a 1ª data frame, com 
# a coluna "coluna" nos xx e diferenciação de cor pela coluna "nome", dentro do aes().

# Adicionamos uma componente geom_histogram() para definir o tipo de gráfico da 
# primeira data frame. Adicionamos outra componente de geom_histogram(), mas com 
# override dos dados para a segunda data frame, com data=dados2.

# Isto já funciona mas não é possível visualizar os dados de ambos os gráficos visto 
# que um se sobrepõe ao outro. Por isso, adicionamos a cada componente alpha=0.5 
# para que cada hitograma fique 50% transparente.

# Desta forma:
ggplot(dados1,aes(coluna, fill=nome)) + 
  geom_histogram(alpha = 0.5)+
  geom_histogram(data=dados2, alpha = 0.5)

# ------------------------------------------------------------------------------
# Personalização do gráfico

# Posso acrescentar que é possível definir a largura ou o número das barras de cada
# histograma, através dos argumentos bins=... ou binwidth=..., respetivamente, em
# cada componente geom_histogram().

# ------------------------------------------------------------------------------

                            'Good luck have fun'

