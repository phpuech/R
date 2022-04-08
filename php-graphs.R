# plots normaux
plot(mouvement2.3, type='l', xlab="Temps (msec)", ylab="Deplacement (nm)")
plot(immobile.3, type='l', xlab="Temps (msec)", ylab="Deplacement (nm)")
# deux plots sur le meme
plot(mouvement2.3, type='l', xlab="Temps (msec)", ylab="Deplacement (nm)")
points(immobile.3, type='l', col="red")
# mise a l'echelle
plot(immobile.3, type='l', xlab="Temps (msec)", ylab="Deplacement (nm)", xlim=c(0,4500), ylim=c(-2000, 0))
# ajouter ligne pointillee
abline(h=0, lty=2)
# legende
legend(0,-1500, c("droite, mobile", "gauche, immobile"), lty=c(1,1), col=c("black", "red"), box.col="white")
# histogramme basique
hist(immobile.3$V2, freq=FALSE, xlab="Deplacement (nm)", ylab="Densité", ylim=c(0,0.03), breaks=20, main="")
box() # fermer la boite
lines(density(immobile.3$V2), col="red", lwd=2) # ajouter la courbe de densite
# multiples plots
opar <- par() # sauvegarde la config de depart (eg. la config "zero")
par(mfrow=c(3, 2)) 
par(opar) # RAZ de l'outlook
# boxplot ---------------------------------------------------------------
# changer l'ordre des box en fonction des labels
values <- factor(Emoy.attente.anova$temps,  levels = c("t0", "t5", "t7", "t10"))
boxplot(E~values, data=Emoy.attente.anova)
# mieux 
boxplot(E~values, data=Emoy.attente.anova, xlab="Temps entre deux courbes (sec)", ylab="Module de Young (Pa)", ylim=c(0,600))
# barplot ---------------------------------------------
# Preliminary data creation
means <- tapply(E,temps,function(x) mean(x,na.rm=TRUE))
std.dev <- tapply(E,temps,function(x) sd(x,na.rm=TRUE))
# Graph
graph <- barplot(means, axes=FALSE, ann=FALSE, col=c("red", "grey", "green","grey"),
                 ylim=c(0,500), names=c("t0","t10","t5","t7"), xpd=FALSE)
abline(h=0)
axis(2)
box()
# Error bars
segments(graph, means, graph, means + std.dev)
#segments(graph, means - std.dev, graph, means + std.dev)
segments(graph - 0.1, means + std.dev, graph + 0.1, means + std.dev)
#segments(graph - 0.1, means - std.dev, graph + 0.1, means - std.dev)
# -------------------------------------------------------------
# axes
# graduations a l'interieur de la box
par(tcl=0.5)
# log y axis 
plot(x, y, log="y")
boxplot(data=allcells, V2~values, log="y", ylim=c(100, 100000), ylab="Young modulus (Pa)")
boxplot(young~type, data=m140122, log="y", ylim=c(60,6000), col=c('grey','white', 'white'), ylab="Young modulus (Pa)")
# add mean on boxplot
boxplot(count ~ spray, data = InsectSprays, col = "lightgray")
means <- tapply(InsectSprays$count,InsectSprays$spray,mean)
# correct syntax means <- tapply(t$value, t$variable,mean)
# If your data contains missing values, you might want to replace the last argument of the tapply function with function(x) mean(x,na.rm=T)
points(means,col="red",pch=18)