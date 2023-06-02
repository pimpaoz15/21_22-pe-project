# ------------------------------------------------------------------------------

library(ggplot2)  # esta biblioteca é usada para criar todos os gráficos
library(ggsci)    # esta biblioteca é usada para personalizar o theme

# ------------------------------------------------------------------------------
# Criação da data frame

# Neste problema, como são apenas pedidos 6 valores da tabela, é permitido copiar
# diretamente da tabela para o código. A outra opção é usar a biblioteca readxl
# para ler os dados do ficheiro excel, como fiz nos outros problemas

# Para definir as estruturas de dados que vamos utilizar, usamos c(coisa, coisa,...)
# para criar um vetor de coisas. No caso de strings, usamos as.factor(c(...)) para
# o R saber que o que lhe estamos a dar são variáveis qualitativas/categóricas, 
# podendo mesmo assim ser números. No caso de querermos mesmo números como variáveis
# quantitativas, podemos usar as.numeric(c(...)) ou simplesmente usar c(...)

# Para atribuir estes vetores a variáveis, usamos <- em vez de =

# Por exemplo:

# Vetor de números quantitativos
numeros <- c(1, 2, 3)

#Vetor de números qualitativos (categorias)
anos <- as.factor(c("2020", "2021", "2022"))

# Vetor de strings qualiattivas (categorias)
localidades <- as.factor(c("Atlântida", "Área 51", "Marte"))

# Para organizar os vetores, usa-se a função data.frame(coluna1, coluna2, coluna3), 
# na qual a ordem das colunas determina a ordem pela qual aparecem na tabela
dados <- data.frame(numeros, anos, localidades)

# Corre estas 4 linhas para veres como fica a data frame, depois escreve "dados"
# na consola ou clica na variável "dados" na tab "Environment" para visualizares

# Neste problema, o objetivo é criar um gráfico com 3 valores para cada 2 anos,
# logo 6 valores no total. O gráfico pedido tem de ter 6 barras lado a lado, com
# uma separação por anos ou por países, ou seja, 2 grupos de 3 colunas ou 3 grupos 
# de 2 colunas, é opção. No exemplo vai estar a opção 1. Para organizar os dados, 
# vamos querer colocar os valores pela ordem que aparecem no gráfico, da esquerda 
# para a direita, mais uma coluna a dizer de que país é esse dado e outra a dizer 
# de que ano, pela ordem correspondente aos valores. 

# Por exemplo, com 2 valores:
valores <- c(14, 29)
anos <- as.factor(c("2020", "2020"))
paises <- as.factor(c("Portugal", "Espanha"))
dados <- data.frame(valores, anos, paises)
# Estes são 2 valores para 2020 com a correspondência Portugal-14, Espanha-29

# ------------------------------------------------------------------------------
# Desenho do gráfico com os dados

# Para desenhar gráficos, usa-se a função ggplot(...) da biblioteca ggplot2 (não confundir)
# A função ggplot é diferente do que estamos habituados. Como um gráfico é 
# infinitamente personalizáve, o ggplot funciona através da adição de componentes 
# com um "+", que depois se personalizam individualmente. 

# O primeiro argumento do ggplot é sempre a data frame que tem os dados a utilizar
# Depois vem o mapping, que é a maneira de dizer que colunas se quer por em que eixos 
# e usa-se assim: mapping=aes(x=coluna_do_x, y=coluna_do_y), "mapping=" é opcional 
# se for colocada a aes(...) como 2º argumento, logo a seguir à data frame.

# Uma das componentes obrigatórias do ggplot é o tipo de gráfico a criar. Para
# escolher o tipo de gráfico, escreve-se um "+" depois da função ggplot e usa-se
# a função geom_<tipo do gráfico>, por exemplo geom_bar, como é o caso.

# Por exemplo:

ggplot(dados, aes(paises, valores)) + geom_bar(stat = "identity")

# Dentro do geom_bar() é usado stat = "identity" como override do default que é
# stat = "count", que não funciona para 2 eixos

# O problema pede para que o gráfico seja separado lado a lado, logo podemos 
# colocar no ggplot aes(anos, valores, fill = paises):

ggplot(dados, aes(anos, valores, fill=paises)) + geom_bar(stat = "identity")

# O que isto faz é: coloca 
# no eixo dos xx os anos, cada uma com 3 valores, 1 para cada país, coloca no eixo 
# dos yy os valores e diferencia a cor das barras pelo tipo de país. Adicionalmente, 
# o ggplot faz uma legenda automática com o nome dos países e a cor que lhes atribuiu. 
# Porém, desta maneira as barras do gráfico aparecem umas em cima das outras, por 
# isso colocamos position = "dodge" dentro do geom_bar:

ggplot(dados, aes(anos, valores, fill=paises)) + 
  geom_bar(stat = "identity", position = "dodge")

# Assim, para uma data frame com valores para vários anos, o ggplot vai colocar 
# os valores dos paises no mesmo ano todos juntos e separar por anos diferentes

# ------------------------------------------------------------------------------
# Personalização do gráfico

# Esta parte é opcional, mas eu vou explicar à mesma as várias opções que fazem 
# com que o gráfico fique mais bonito.

# Labels
# A função labs(...) do ggplot permite alterar qualquer texto que aparece no gráfico
# title = "título do gráfico"
# subtitle = "subtítulo do gráfico"
# x = "label do eixo dos xx"
# y = "label do eixo dos yy"

# Legenda
# Para personalizar a legenda automática que o ggplot fez por nós, temos que saber
# algumas coisas primeiro: o título que foi dado à legenda é o nome da variável 
# pela qual o ggplot diferenciou as cores das barras. Como usamos fill=paises, 
# o titulo ficou "paises". Para alterar este título, colocamos fill="titulo da legenda" 
# dentro do labs().
# O nome das colunas que aparece na legenda vem do vetor "paises", que foi a variável
# usada para diferenciar as cores das barras. Para alterar estes nomes, basta refazer 
# o vetor com os nomes que se quer que apareçam na legenda.

# Cores
# Se as cores automáticas que o ggplot escolheu não forem do teu agrado, tens 2 
# opções: a preguiçosa ou a full custom. 
# A maneira preguiçosa é escolher outro set de cores pre-definidas (outro tema) com
# a biblioteca ggsci. adicionando ao ggplot uma componente scale_fill_<tema>(), por
# exemplo scale_fill_jama(). Há muitos temas diferentes, é ver os que existem e
# escolher o que fica melhor.
# A maneira full custom não me está a apetecer explicar, por isso digo só que é 
# com a função scale_fill_manual()

# Outline das barras
# Também é possível colocar as barras com um outline para se destacarem melhor. 
# Para isso, coloca-se color="nome da cor" dentro da componente do tipo do gráfico, 
# neste caso o geom_bar(). O nome da cor pode ser escolhido pesquisando no google 
# "r colors" e clicando no primeiro pdf que aparece ou escrevendo colors() na consola, 
# sendo que desta maneira não dá para saber que cor é :/

# ------------------------------------------------------------------------------
# Guardar o gráfico

# Este passo pode ser feito usando o botão "Export" que aparece por cima do preview 
# do gráfico. Não queor ver gente a fazer print-screens porque isso é manhoso >:(

# ------------------------------------------------------------------------------

                            'Good luck have fun'

