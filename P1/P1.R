# Load required packages
library(readxl)
library(dplyr)
library(ggplot2)
library(lubridate)

# Set path where all data is located || latter it will be the directory where the plot will be saved
# If u use RStudio as long as all files are on the same folder, you don't need this line, i'm using VSCode/NeoVIM
setwd('/Users/pimpao/Library/CloudStorage/OneDrive-Personal/Code/R/P1')

# Load the data
data <- read_xlsx("econ.xlsx", sheet = 1)
  
# Select data for years >= 2000
data2000 <- data %>% filter(year(tempo) >= 2000)

# Calculate mean and standard deviation for each variable
mean_gcp <- mean(data2000$gcp)
sd_gcp <- sd(data2000$gcp)
mean_tpp <- mean(data2000$tpp)
sd_tpp <- sd(data2000$tpp)

# Apply the transformation to the data associated with each variable
data_transformed <- data2000 %>% mutate(z_gcp = (gcp - mean_gcp) / sd_gcp, z_tpp = (tpp - mean_tpp) / sd_tpp)

# Call the pdf command to start the plot - with the directory i want to save in + plot width + plot height (both in inches)
pdf(file='/Users/pimpao/Library/CloudStorage/OneDrive-Personal/Code/R/P1/Rplot.pdf', width = 4, height = 4)

# Plot the graph
ggplot(data_transformed, aes(x = tempo)) + 
  geom_line(aes(y = z_gcp, color = "gcp"), linewidth = 0.7) +
  geom_line(aes(y = z_tpp, color = "tpp"), linewidth = 0.7) +
  scale_color_manual(values = c("gcp" = "red", "tpp" = "blue"), 
                     name = "Variável") +
  labs(x = "Ano", y = "Valor Padrão",
       title = "Evolução dos Gastos de Consumo Pessoal (GCP), em biliões de dólares e da Taxa de Poupança Pessoal (TPP) desde 2000") +
  theme_bw()

dev.off()