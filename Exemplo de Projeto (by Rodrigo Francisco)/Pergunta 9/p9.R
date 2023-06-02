library(ggplot2)

grafico <- function(seed, m, ni, nf, nStep, lambda, gama) {
  set.seed(seed)
  ns <- seq(ni, nf, nStep)
  a <- qnorm((1+gama)/2)  # inversa da distribuição normal para gama
  
  # Geração dos dados
  n <- numeric(length(ns))
  for(i in 1:length(ns)) {
    k <- 2*(a/sqrt(ns[i]))
    n[i] <- mean(replicate(m, k/mean(rexp(ns[i] ,lambda))))
  }
  
  # Desenho do gráfico
  dados <- data.frame(ns, n)
  plot <- ggplot(dados) + geom_line(aes(ns, n), color = "firebrick") +
    labs(x = "n", y = "MA(n)", title = "Amplitudes dos Intervalos de Confiança",
         subtitle = sprintf("Média das amplitudes dos IC de %s amostras para cada n", m)) +
    scale_y_continuous(expand = c(0,0), limits = c(0, 0.8)) +
    scale_x_continuous(expand = c(0,0), limits = c(0, 5100)) + theme_classic() +
    theme(panel.grid.major = element_line(size = 0.4), 
          panel.grid.minor = element_line(size = 0.4))
  
  # Guarda o plot como imagem
  ggsave("Plot.png", plot, width = 1920, height = 1080, units = "px")
  return(plot)
}

# Chama a função com os valores do enunciado
grafico(seed=218, m=1450, ni=100, nf=5000, nStep=100, lambda=1.85, gama=0.96)
