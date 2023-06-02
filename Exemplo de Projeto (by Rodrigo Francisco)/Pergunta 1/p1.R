library(ggplot2)
library(ggsci)

# Criação da data frame
anos <- as.factor(c("2004", "2004", "2004", "2018", "2018", "2018"))
paises <- as.factor(c("Hungria", "Lituânia", "Roménia", "Hungria", "Lituânia", "Roménia"))
residuos <- c(3.4, 2.1, 18.2, 1.9, 2.5, 10.4)
dados <- data.frame(anos, paises, residuos)

# Desenho do gráfico com os dados
plot <- ggplot(dados, aes(anos, residuos, fill = paises)) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = residuos), position = position_dodge(width = 0.9), cex = 2.5, vjust = -0.3) +
  labs(title = "Produção de resíduos",
       subtitle = "Resíduos per capita produzidos em 2004 e 2018, na Roménia, Hungria e Lituânia",
       x = "Anos", y = "Resíduos per capita (toneladas)",
       caption = "Dados obtidos em https:www.pordata.pt a 26-10-2021",
       fill = "Legenda:") +
  scale_y_continuous(expand = c(0,0), limits = c(0, 20)) +
  scale_x_discrete(expand = c(0,0)) +
  scale_fill_npg() +
  theme_classic() + 
  theme(plot.caption = element_text(size = 6))

# Guarda o plot como imagem
ggsave("Plot1.png", plot, width = 1920, height = 1080, units = "px")

