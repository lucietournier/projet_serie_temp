rm(list=ls())
library(forecast)

load(file = file.path("data", "donnee_propre.RData"))

boxplot(data$indice_production)
hist(data$indice_production, breaks=20)

# graph de la moyenne de l'indice par année
year<-as.factor(format(data$date, '%Y'))
yearlyIndex<-tapply(data$indice_production,year,mean)
plot(yearlyIndex,type='l',pch=20, xlab='annee', ylab="indice de production")
axis.POSIXct(1, at = seq(tail(data$date,1), data$date[1], by ="year"), format="%d/%m/%Y",las=2)

boxplot(data$indice_production~year,col="lightblue",pch=20,cex=0.5)

## ACF :
acf(data$indice_production, lag.max = 24)

## nuage de point de la série en fonction de la série retardée de 12 mois :
indice<-ts(data$indice_production)
plot(stats::lag(indice,12),indice,pch=20,cex=0.8)

## avec format ts :
data.ts <- ts(data$indice_production, start=1, frequency=12)
Acf(data.ts)
Pacf(data.ts)

desaison <- xm-lag(xm,-12) #retire le 12e`me retard
