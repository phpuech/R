library(tidyverse)

#reorganisation
library(reshape)
test <- melt(alldaysmixed.R)


V# comparaison de moyennes ----------------------------------------------------
# parametrique
# anova  puis tukeyhsd
# http://www.statmethods.net/stats/anova.html
test<-aov(value ~ X1, data=t1)
summary(test)
TukeyHSD(test)
# comparaison de medianes ----------------------------------------------------
# kruskal wallis + post test
library(asbio) # outils pour la biologie
kruskal.test(E~temps, data=Emoy.attente.anova)
pairw.kw(Emoy.attente.anova$E, Emoy.attente.anova$temps, 0.95)
# non parametrique : KW puis Dunn
# http://rss.acs.unt.edu/Rdoc/library/pgirmess/html/kruskalmc.html
library(pgirmess) # probleme de dependance sous linux
kruskalmc(E~temps, data=Emoy.attente.anova, probs = 0.05, cont=NULL)
# autre methode pour avoir les p - attention il y a peut etre une question d'avant apres sur les données (ie appariement) cf livre
pairwise.wilcox.test(Emoy.attente.anova$E, Emoy.attente.anova$temps, p.adjust.method="bonferroni")
pairwise.wilcox.test(Emoy.attente.anova$E, Emoy.attente.anova$temps, p.adjust.method="holm")

# quand il n'y a que deux colonnes x1 et x2, pour un t test non normal
wilcox.test(x1,x2)

# il y a aussi des fonctions dans
library(agricolae)
kruskal()