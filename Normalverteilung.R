## rnorm(n, µ, σ) erzeugt n-zufällige Werte einer Normalverteilung mit dem 
## Mittelwert µ und der Standardabweichung σ.
## Die Default-Einstellung ist µ=0 und σ=1

x <- rnorm(1000, mean=0, sd=1)
hist(x, breaks=20, col="blue", xlab="Werte", ylab="Häufigkeit")

## pnorm(x, µ, σ) ist eine kumulative Funktion der Normalverteilung 
## mit µ und Standardabweichung σ.

pnorm(12:16, 14, 1)

## qnorm(p, µ, σ) ist das Gegenteil von pnorm. Hier wird eine Wahrscheinlichkeit
## genommen und der entsprechende x-Wert ausgegeben

qnorm(c(.25, .5, .75), 14, 1)

## Mit der Funktion "dnorm()" wird die Wahrscheinlichkeitsdichte einer 
## Normalverteilung für einen bestimmten Satz von Werten berechnet. 
## Um diese Dichte zu plotten, kann die Funktion "plot()" verwendet werden, 
x <- seq(-4, 4, length=100)
y <- dnorm(x, mean=0, sd=1)
plot(x, y, type="l", xlab="Werte", ylab="Dichte")



## Beispiel: Die Körpergröße von Männern ist normalverteilt mit 
## einem Mittelwert von 179.9 und einer Standardabweichung von 8,5

## 1. Wie hoch ist die Wahrscheinlichkeit, dass eine zufällig 
## ausgewählte Person kleiner als 185 cm ist? Größer als 185 cm?

pnorm(185, 179.9, 8.5)

## 2. Was ist ist 90% Perzentil für die Körpergröße der Stichprobe?

qnorm(.9, 179.9, 8.5)

## Simuliere 500 zufällige Samples von dieser Stichprobe und plotte das Resultat

library(tidyverse)
men <- rnorm(50000, 180, 8.5)
qplot(men, col=I("Darkred"))