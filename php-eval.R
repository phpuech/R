library(readr)
Ecriture <- read_delim("~/Dropbox/Ecriture.txt", " ", escape_double = FALSE)
View(Ecriture)

plot(Ecriture$duree, ylab="Heures", type='o')
plot(Ecriture$words, ylab="Nombre de mots", type='o')
plot(cumsum(Ecriture$words), ylab="Nombre total de mots", type='o')

