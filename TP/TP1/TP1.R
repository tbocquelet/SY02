#TP1

# commentaire en R
# man d'une commande : ?commande ou help(commande)
# clear console : ctrl+L

############## 2 - Premiers pas ##############

# <- op�rateur d'affectation

# ** puissance

pi
# Affectation avec parenth�ses : affiche le contenu de la variable directement
(a <- (log(640320**3 + 744)/sqrt(163)))

# sinon :
a <- (log(640320**3 + 744)/sqrt(163))
a

############## 3 -  Structures de donn�es usuelles ##############

# c() permet de cr�er un vecteur, en concat�nant les arguments
(notes <- c(18, 1.5, 9.5, 15.5, 15, 15.5, 0.5, 14.5, 10))

# ajout d'une note au vecteur notes
(notes <- c(notes, 4))

# op�rations sur les vecteurs
(v <- c(1, 2, 3, 4, 5))
(u <- c(5, 4, 3, 2, 1))
v + 1
2*v
v/3
u * v
u == 2
v > pi

# on ram�ne les notes sur 10
(notes10 <- notes/2)

# nombre d'�tudiants ayant eu plus de 6/10
sum(notes10>6)

# Attention, d�but d'un vecteur � 1 et non 0 !!

# extraire une valeur d'un vecteur : 
# indice v[1] v[2:4]

# extraction par un tableau de boolean :
choix <- c(T, F, F, T, T, T, F, T, F, F)
notes10[choix]

# on extrait du vecteur les notes > 6 (idem qu'au dessus puisque notes10>6 renvoie un tableau de bool�en)
notes10[notes10>6]

# moyenne
mean(c(notes10[1], notes10[3], notes10[9]))

# taille d'un vecteur : length
length(notes[notes>10])

# floor = partie enti�re
# == op�rateur de comparaison/s�lection
min(notes10[notes10==floor(notes10)])

# v[2] <- 0 # On met � z�ro la deuxi�me case du vecteur
# v[2:4] <- 1 # On met � 1 les cases 2, 3 et 4
# v[v == 1] <- 2 # On remplace les 1 par des 2

notes10
(notes2 <- notes10-2)

# nombre de notes n�gatives
length(notes[notes2<0])

# on met les notes n�gatives � 0
(notes2[notes2<0] <- 0)

# vecteur : manipulation de variables quantitatives
# facteur : manipulation de variables qualitatives

# cr�ation d'un vecteur qualitatif (possibilit� d'ordonn� le vecteur)
(collection <- c("A", "C", "A", "A", "G", "A", "T", "G", "C", "C", "A", "T", "T", "G", "T", "C"))
(ADN <- factor(collection))

# diff�rentes modalit�s du vecteur (son contenu)
levels(ADN)

# nombre de diff�rentes modalit�s
nlevels(ADN)

length(ADN[ADN=="A"])
length(ADN[ADN=="C"])
length(ADN[ADN=="T"])
length(ADN[ADN=="G"])

# importation d'un fichier csv
X <- read.csv('sy02.csv')

# nombre de colonnes
ncol(X)

# nombre de lignes
nrow(X)

# nom des colonnes
names(X)
  
# manipulation du tableau � 2 colonnes
# X[1,1] # Extraire un �l�ment
# X[,3] # Extraire la 3�me colonne
# X[4,] # Extraire la 4�me ligne
# X[1:10,] # Extraire les 10 premi�res lignes
# X[c(1,3), c(1,4)] # Extraire les lignes 1 et 3 et les colonnes 1 et 4

# nombre d'individus
tail(X) # donne les 6 derni�res lignes du tableau

# extrait d'une colonne
X$median

# donne les param�tres de chaque colonne
summary(X)

# moyenne des notes du correcteur EG
(EG <- X[X$correcteur.median == "EG",])
mean(EG$median)

#proportion d'etudiants qui ont progresse
(med <- X$median)
(fin <- X$final)
(diff <- fin - med)
(sum(diff>0)/nrow(X))*100

# ecart type
sd(med)

# variance
var(med)

# mediane
median(med)

# quartiles
quantile(med)

# etendue inter-quartile
IQR(med)

# diagramme en batons
(t <- table(ADN))
barplot(t)

# 21
(collec <- X$correcteur.median)
(correc <- factor(collec))
(t <- table(correc))
barplot(t)

# 22 
# boite a moustache
(fin <- X$final)
boxplot(fin)

# 24
# diagramme tiges et feuilles
stem(X$moyenne)

# 25
# histogramme
hist(X$final)

# 26
# breaks permet de separer les valeurs suivant des intervalles
H <- hist(X$final, breaks=c(0, 15, 20))

# 27 
# pour voir les parametres de l'histogramme : H
H$density

# 28
# calcul d'aire
sum(diff(H$breaks)*H$density)

# Analyse bivariee

# 29
plot(X$median, X$final)
plot(final ~ median, data=X)

# 30
boxplot(X$final ~ X$correcteur.final)

# 31
(DH <- X[X$correcteur.final == "DH",])
(stock <- DH$final)
boxplot(stock)

# 32
stripchart(X$final ~ X$correcteur.final)

# 33
stripchart(X$final ~ X$correcteur.final, method="jitter")










