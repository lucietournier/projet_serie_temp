
rm(list=ls())
library(zoo)
load(file = file.path("data", "donnee_propre.RData"))

## plot format dataframe : 
plot(data$date,data$indice_production,type='l',xaxt="n",xlab='',ylab="indice de production",col='royalblue3')
axis.POSIXct(1, at = seq(tail(data$date,1), data$date[1], by ="year"), format="%m/%y",las=2)

## plot format ts :
data.ts <- ts(data$indice_production, start=1, frequency=12)
plot(data.ts)

## plot format zoo :
data.zoo <- zoo(data$indice_production, order.by = data$date) 
T <- length(xm)

plot(desaison, xaxt="n")

