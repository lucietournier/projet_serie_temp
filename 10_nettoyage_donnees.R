## projet de serie temporelles 
## serie etudiee : Indice brut de la production industrielle (base 100 en 2015) 
##                  - Fabrication de glaces et sorbets (NAF rév. 2, niveau classe, poste 10.52)

rm(list = ls())
library(dplyr)
library(lubridate)

RGPH_MLI <- read.csv( file = "data/valeurs_mensuelles.csv", header = TRUE, sep = ";")
#, stringsAsFactors = TRUE 

# creation de la base de donnees
colnames(RGPH_MLI) <- c("date", "indice_production", "code")
data <- select(RGPH_MLI, date,  indice_production)
data <- data[-1,]
data <- data[-1,]
data <- data[-1,]

data$indice_production <- as.numeric(data$indice_production)
data$date <- paste(data$date,"01",sep="-")
data$date <- as.Date(data$date)

#data <- mutate(data, year = year(date))
#data <- mutate(data, month = month(date))

save(data, file = file.path("data", "donnee_propre.RData"))
rm(data, RGPH_MLI)