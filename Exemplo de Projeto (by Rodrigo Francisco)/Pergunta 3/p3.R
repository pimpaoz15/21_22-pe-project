library(readxl)
library(ggplot2)
library(dplyr)
library(purrr)
library(ggsci)

# Lê o ficheiro excel com colunas do tipo texto
QualidadeAr <- read_excel("QualidadeARO3.xlsx", col_types = "text")
size = nrow(QualidadeAr)

# Altera o tipo dos dados para numérico
QualidadeAr <- modify_at(QualidadeAr, 1:size, as.numeric)

# Retira as colunas pretendidas da tabela
Espinho <- QualidadeAr["Antas-Espinho"] %>% rename(valor = `Antas-Espinho`)
Porto <- QualidadeAr["Sobreiras-Porto"] %>% rename(valor = `Sobreiras-Porto`)

# Criação de 2 data frames com cada coluna
grupo1 <- data.frame(Espinho, grupo="Antas - Espinho")
grupo2 <- data.frame(Porto, grupo="Sobreiras - Porto")

# Desenho do gráfico com os dados
plot <- ggplot(grupo1,aes(valor, fill=grupo)) + 
  geom_histogram(alpha = 0.5, binwidth = 10)+
  geom_histogram(data=grupo2, alpha = 0.5, binwidth = 10)+
  labs(title = "Níveis de Ozono",
       subtitle = "Registos nas estações de Sobreiras-Porto e Antas-Espinho em 2020",
       x = "Níveis de ozono [µg/m³]", y = "Nº de observações",
       fill = "Estações")+
  scale_y_continuous(expand = c(0,0), limits = c(0, 1749)) +
  scale_x_continuous(expand = c(0,0)) + scale_fill_nejm() + theme_classic() +
  theme(panel.grid.major.y = element_line(size = 0.4), 
        panel.grid.minor.y = element_line(size = 0.4))

# Guarda o plot como imagem
ggsave("Plot3.png", plot, width = 1920, height = 1080, units = "px")




