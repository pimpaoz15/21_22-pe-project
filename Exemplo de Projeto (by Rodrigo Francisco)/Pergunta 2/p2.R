library(readxl)
library(ggplot2)
library(dplyr)

# Lê o ficheiro excel com colunas do tipo numérico
EsperancaVida <- read_excel("~/EsperancaVida.xlsx", col_types = "numeric")
# Criação da data frame com os dados do ficheiro
anos <- rep(2002:2019)
francaH <- EsperancaVida[48:65,51] %>% rename(francaH = ...51)
irlandaH <- EsperancaVida[48:65,54] %>% rename(irlandaH = ...54)
portugalH <- EsperancaVida[48:65,62] %>% rename(portugalH = ...62)
francaM <- EsperancaVida[48:65,85] %>% rename(francaM = ...85)
irlandaM <- EsperancaVida[48:65,88] %>% rename(irlandaM = ...88)
portugalM <- EsperancaVida[48:65,96] %>% rename(portugalM = ...96)
dados <- data.frame(anos, francaH, irlandaH, portugalH, francaM, irlandaM, portugalM)

# Desenho do gráfico com os dados
plot <- ggplot(dados)+
  geom_line(aes(anos, francaH, color = "França"))+
  geom_line(aes(anos, irlandaH, color = "Irlanda"))+
  geom_line(aes(anos, portugalH, color = "Portugal"))+
  geom_line(aes(anos, francaM, color = "França "))+
  geom_line(aes(anos, irlandaM, color = "Irlanda "))+
  geom_line(aes(anos, portugalM, color = "Portugal "))+
  # Criação de 2 colunas para a legenda
  guides(color = guide_legend(ncol = 2))+
  scale_color_manual(values = c("França" = "dodgerblue4", "Irlanda" = "dodgerblue", 
                                "Portugal" = "deepskyblue", "França " = "purple", 
                                "Irlanda " = "magenta3", "Portugal " = "orchid1"))+
  labs(title = "Esperança de vida", x = "Ano", y = "Idade",
       subtitle = "Esperança de vida à nascença por sexo e por país, entre 2002 e 2019",
       caption = "Dados obtidos em https:www.pordata.pt a 28-10-2021",
       color = "Homens       Mulheres") +
  scale_y_continuous(expand = c(0,0), limits = c(70, 90)) +
  scale_x_continuous(expand = c(0,0), limits = c(2002, 2019)) +
  theme_classic() + 
  theme(plot.caption = element_text(size = 6), 
        panel.grid.major = element_line(size = 0.4), 
        panel.grid.minor = element_line(size = 0.4))

# Guarda o plot como imagem
ggsave("Plot2.png", plot, width = 1920, height = 1080, units = "px")




