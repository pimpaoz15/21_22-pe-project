library(ggplot2)

grafico_com_n <- function(n, seed, samples, a, b) {
  
  # Geração dos dados
  set.seed(seed)
  d <- replicate(samples, mean(runif(n, a, b)))
  
  # Criação de uma distribuição normal com a mesma média e variância
  X <- seq(from = a, to = b, length.out = samples)
  f.X <- dnorm(X, mean = (a+b)/2, sd = sqrt(((b-a)^2)/(12*n)))
  
  #Criação do data frame
  dados <- data.frame(d, X, f.X)
  
  # Desenho do gráfico com os dados
  return(ggplot(dados, aes(d)) + 
    geom_histogram(aes(y = after_stat(count / sum(count)), fill = "Médias"), 
                   binwidth = 0.2, color="white") +
    geom_line(aes(x = X, y = f.X, color = "Normal")) +
    scale_color_manual(values = c("Normal" = "firebrick2"), name = NULL) +
    scale_fill_manual(values = c("Médias" = "deepskyblue"), name = NULL) +
    labs(fill = "Médias", color = "Normal", subtitle = sprintf("n = %s", n), 
         title = "Distribuição de médias de distribuições uniformes", 
         x = "Valores da distribuição da média", y = "Frequência relativa") +
    scale_y_continuous(labels = scales::percent, expand = c(0,0), limits = c(0, 3)) + 
    scale_x_continuous(expand = c(0,0), limits = c(a, b)) + theme_classic() +
    theme(panel.grid.major.y = element_line(size = 0.4), 
          panel.grid.minor.y = element_line(size = 0.4)))
}

# Ciclo de geração dos gráficos para cada n
for(n in c(3, 24, 75)) {
  
  plot <- grafico_com_n(n, seed=872, samples=560, a=9, b=13)
  # Guarda o plot como imagem
  ggsave(sprintf("Plot%s.png", n), plot, width = 1500, height = 1080, units = "px")
}
