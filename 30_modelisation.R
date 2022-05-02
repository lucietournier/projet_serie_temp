rm(list=ls())

load(file = file.path("data", "donnee_propre.RData"))

acf(data$indice_production, lag.max = 36)
pacf(data$indice_production, lag.max = 36)

# suppression de la saisonnalité :


data_diff_1=diff(data$indice_production,lag=1,differences=1)
data_diff_12=diff(data_diff_1,lag=12,differences=1)

acf(data_diff_12, lag.max=36)
pacf(data_diff_12, lag.max=36)