# Load required packages
library(dplyr)
library(ggplot2)

# Set path where all data is located
setwd('/Users/pimpao/Library/CloudStorage/OneDrive-Personal/Code/R/P2')

# Read data from csv file
# Não tenho a certeza se este link é igual para o grupo todo ou não
data <- read.csv('https://web.tecnico.ulisboa.pt/~paulo.soares/pe/projeto/TIME_USE_24092022.csv')

# Filter the data to remove all data from South Africa, once it is incomplete
filtered_data <- filter(data, !País %in% c("África do Sul"))

# Create a subset of data for women in Personal care and unpaid work
women_data <- filter(filtered_data, Sexo == "Mulheres", 
                     Ocupação %in% c("Cuidados pessoais", "Trabalho não remunerado"))

# Call the pdf command to start the plot - with the directory i want to save in + plot width + plot height (both in inches)
pdf(file='/Users/pimpao/Library/CloudStorage/OneDrive-Personal/Code/R/P2/Rplot.pdf', width = 10, height = 10)

# Create a boxplot with two facets to compare the two occupations
ggplot(women_data, aes(x = Ocupação, y = Tempo)) +
  geom_boxplot() +
  facet_wrap(~Ocupação, nrow = 1) +
  labs(title = "Comparação do tempo diário passado por Mulheres entre Cuidados pessoais e trabalho não remunerado",
       x = "Ocupação", y = "Tempo (em minutos)")

dev.off()