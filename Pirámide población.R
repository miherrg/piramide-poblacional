library(ggplot2)

# Creación de un conjunto de datos de ejemplo
data <- data.frame(
  Edad = c("0-4", "5-9", "10-14", "15-19", "20-24"),
  Hombres = c(100, 120, 90, 80, 60),
  Mujeres = c(95, 110, 85, 75, 55)
)

# Creación de la pirámide de población
p <- ggplot(data, aes(y = Edad)) +
  geom_bar(aes(x = Hombres, fill = "Hombres"), stat = "identity", position = "identity") +
  geom_bar(aes(x = -Mujeres, fill = "Mujeres"), stat = "identity", position = "identity") +
  scale_fill_manual(values = c("Hombres" = "blue", "Mujeres" = "pink")) +
  labs(title = "Pirámide de Población", x = "", y = "Grupo de Edad") +
  theme_minimal() +
  scale_x_continuous(breaks = seq(-max(data$Mujeres), max(data$Hombres), by = 20), labels = abs(seq(-max(data$Mujeres), max(data$Hombres), by = 20))) +
  geom_text(aes(y = Edad, x = 0, label = Edad), hjust = 0.5, vjust = 0) +
  theme(axis.text.y = element_blank(), axis.ticks.y = element_blank())
p