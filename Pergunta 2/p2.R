# ------------------------------------------------------------------------------

library(readxl)   # esta biblioteca lê os dados de um ficheiro excel
library(ggplot2)
library(dplyr)    # esta biblioteca faz coisas bem fixes, worth investigating

# ------------------------------------------------------------------------------
# Leitura do ficheiro

# Neste problema já existem umas quantas dezenas de valores que são precisos do 
# gráfico, por isso é melhor usar uma função para os ler: read_excel(...).
# Pode ser frustrante trabalhar com esta função, porque ela faz o que bem lhe apetece 
# com os nomes das colunas, mas eu vou explicar como ultrapassar estas dificultades.

# A primeira coisa que se deve fazer quando é preciso ler um ficheiro é colocar o 
# dito ficheiro na mesma pasta que o código R. Depois, no RStudio, na tab do ficheiro 
# em cima (onde diz "qqr coisa.R"), clicar com o botão direito e escolher 
# "Set Working Directory". Isto faz com que o R agora saiba que se está a trabalhar 
# na mesma pasta que o código e, por isso, vai buscar o ficheiro excel à mesma pasta.

# Agora, para ler o ficheiro para uma data frame, basta fazer:

dados_do_excel <- read_excel("~/EsperancaVida.xlsx", col_types = "numeric")

# O segundo argumento col_types = "numeric" vai prevenir muitas dores de cabeça 
# mais para a frente, dizendo que se deve tentar ler todos os valores do excel 
# como números e não como caracteres.

# ------------------------------------------------------------------------------
# Criação da data frame

# Este problema pede 6 colunas de dados: 3 países diferentes, cada um com homens 
# e mulheres. Para sacar os dados das colunas que se quer, o mais fácil é abrir o
# ficheiro no excel e contar até ao número da coluna que se pretende (ou usar o 
# contador built-in do excel). Para as linhas, é mais fácil abrir o data frame no 
# RStudio para ver que linhas é que o read_excel lhe apeteceu copiar e contar a 
# partir daí. 

# Para meter cada coluna numa variável, pode usar-se: 
# variavel <- dados_do_excel[linha_inicial:linha_final, coluna]
# Esta variavel convém ficar com um nome indicativo de que tipo de coluna são os dados

# Por exemplo:

# Coluna com os dados dos homens em portugal entre 2002 e 2019
homens_de_portugal <- dados_do_excel[48:65, 62]

# Vamos também precisar de uma coluna com os anos. Para fazer isso, podemos escrever
# os anos manualmente num vetor c(...) ou usar a função rep(ano_inicial:ano_final)

# Por exemplo:
anos <- rep(2002:2019)

# Depois é só colocar as 7 variáveis dentro de uma data frame.

# ------------------------------------------------------------------------------
# Desenho do gráfico

# O enunciado pede um "gráfico temporal". Para isso podemos usar um gráfico de linha, 
# com geom_line(). 

# Para colocar várias colunas no mesmo gráfico, podemos simplesmente colocar uma 
# componente de geom_line() por cada uma das 6 colunas de dados que temos, todas 
# com a coluna dos anos nos xx. Para fazer isto, como vão existir vários pares de
# eixos para o mesmo gráfico, não podemos definir o x e o y na aes() do ggplot. 
# Cada componente tem que ter a sua própria aes(), com os seus próprios eixos e a 
# sua própria diferenciação de cores em relação às outras. 

# Para diferenciar a cor, podemos colocar manualmente o nome que vai aparecer na 
# legenda, em vez de fornecer uma variável extra com os nomes das colunas, com 
# color="nome que vai aparecer na legenda" em vez de fill porque fill é bara pintar 
# barras de gráficos e color é para traçar linhas. Se noutro gráfico for preciso 
# diferenciar por cor de linha e por cor de barra, podem usar-se os 2 argumentos.

# Para definir o nome da variável que aparece nos yy de cada componente, é necessário 
# atender aos apetites pessoais do read_excel(). Quando filtrámos os dados que queriamos 
# dos dados_do_excel para variáveis separadas, o nome da variável ficou esse, mas 
# o nome da coluna na data frame ficou igual ao número da coluna mais uns ..., 
# basicamente ficou como o read_excel entendeu que tinha de ficar. Para saber quais 
# os nomes das colunas que se têm de utilizar, podemos escrever na consola a nossa 
# data frame e inspecionar os nomes que lá aparecem. Esses são os nomes das colunas 
# que se podem dar ao ggplot para ele colocar nos eixos dos yy, senão vai dar barraca...

# Por exemplo: 

# Coluna dos homens_de_portugal
ggplot(dados) + geom_line(aes(anos, ...62, color="Homens de Portugal")) 

# Para as outras 5 colunas, é só adicionar mais componentes com o respetivo nome 
# para o eixo dos yy.

# ------------------------------------------------------------------------------
# Personalização do gráfico

# Para alterar as cores das linhas, usa-se a função scale_color_manual() em vez de 
# scale_fill_manual() por razões já referidas, ou então usa-se a maneira preguiçosa 
# com um tema pré-definido.

# ------------------------------------------------------------------------------

                            'Good luck have fun'

