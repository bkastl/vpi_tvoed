library(ggplot2)
library(hrbrthemes)
library(plotly)
library(lubridate)

df1 <- read.csv("data.csv", header=TRUE, sep = ";",)

df1$Monat <- ym(df1$Monat)
df1$VPI <-  as.numeric(sub(",", ".", df1$VPI, fixed = TRUE))
df1$Energie <-  as.numeric(sub(",", ".", df1$Energie, fixed = TRUE))
df1$Lohnrunden.TVÖD <-  as.numeric(sub(",", ".", df1$Lohnrunden.TVÖD, fixed = TRUE))
df1$Nahrungsmittel <-  as.numeric(sub(",", ".", df1$Nahrungsmittel, fixed = TRUE))

graph <- ggplot(df1, aes(x = Monat)) + 
  geom_line(aes(x = Monat, y = VPI), color="#16697a", size=0.5) +
  geom_line(aes(x = Monat, y = Energie), color="#489fb5", size=0.5) +
  geom_line(aes(x = Monat, y = Nahrungsmittel), color="#82c0cc", size=0.5) +
  geom_line(aes(x = Monat, y = Lohnrunden.TVÖD), color="#ffa62b", size=0.5) +
  theme_ipsum() + 
  ggtitle("Preisindex zu TVÖD Lohnrunden") +
  ylab("Preisindex")

print(ggplotly(graph))