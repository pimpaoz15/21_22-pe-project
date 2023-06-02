library(ggplot2)

grafico <- function(seed, m, ni, nf, nStep, lambda, erro, lambda_c, gama) {
  set.seed(seed)
  ns <- seq(ni, nf, nStep)
  a <- qnorm((1+gama)/2)  # inversa da distribuição normal para gama
  
  # Geração dos dados
  n <- numeric(length(ns))
  for(i in 1:length(ns)) {
    k <- 2*(a/sqrt(ns[i]))
    n[i] <- mean(replicate(m, k/mean(rexp(ns[i] ,lambda))))
  }
  
  # Geração dos dados contaminados
  set.seed(seed)
  n_c <- numeric(length(ns))
  for(i in 1:length(ns)) {
    k <- 2*(a/sqrt(ns[i]))
    # erro% de amostras contaminadas + (1-erro)% de amostras puras
    n_c[i] <- mean(replicate(m, k/mean(c(rexp(ns[i]*(1-erro) ,lambda), 
                                         rexp(ns[i]*erro ,lambda_c)))))
  }
  
  # Desenho do gráfico
  dados <- data.frame(ns, n, n_c)
  plot <- ggplot(dados) + geom_line(aes(ns, n, color = "Puras")) +
    geom_line(aes(ns, n_c, color = "Contaminadas")) +
    labs(x = "n", y = "MA(n)", title = "Amplitudes dos Intervalos de Confiança",
         color = "Amostras",
         subtitle = "Média das amplitudes dos IC para amostras com e sem contaminação") +
    scale_color_manual(values = c("Puras" = "deepskyblue", "Contaminadas" = "firebrick2")) +
    scale_y_continuous(expand = c(0,0), limits = c(0, 1.5)) +
    scale_x_continuous(expand = c(0,0), limits = c(0, 2500)) + theme_classic() +
    theme(panel.grid.major = element_line(size = 0.4), 
          panel.grid.minor = element_line(size = 0.4))
  ggsave("Plot.png", plot, width = 1920, height = 1080, units = "px")
  return(plot)
}

# Chama a função com os valores do enunciado
grafico(470, 800, 100, 2500, 100, 2.97, 0.15, 0.03, 0.98)
