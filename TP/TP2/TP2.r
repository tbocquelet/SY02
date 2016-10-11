# Etude de peintres

library(MASS)
head(painters)

# tableau = painters

# 1

hist(painters$Composition)
hist(painters$Drawing)
hist(painters$Colour)
hist(painters$Expression)
hist(painters$School)

# afficher plusieurs graphes dans une meme fenetre 
par(mfrow=c(2,2))

# 2
(moyenne <- (painters[,1] + painters[,2] + painters[,3] + painters[,4])/4)

# 3
(moy_emp <- sum(moyenne)/nrow(painters))

n <- length(moyenne)
x <- sum(moyenne)/n
# var non corrigee
sum((moyenne-x)^2)/(n)
# var corrigee
sum((moyenne-x)^2)/(n-1)

# 4
mean(moyenne)
var(moyenne)
sd(moyenne)

# 5
hist(moyenne)

# Calcul de probabilites

# 6 

# Prefixe pour les lois
# d : fonction de densite
# p : fonction de repartition
# q : fractiles
# r : generateur de nombres aleatoires

# unif
# norm
# pois
# exp
# binom
# t
# chisq
# f

# 6.1 
1 - pnorm(3) # pareil
1 - pnorm(3, mean=0, sd=1)

# 6.2
pnorm(42, mean=35, sd=6)
pnorm((42-35)/6)

# 6.3
pnorm(50, mean=35, sd=6) - pnorm(40, mean=35, sd=6)

# 6.4
# on utilise la fonction de densite car fonction discrete
dbinom(4, 5, 0.5)
dbinom(9, 10, 0.5)
dbinom(29, 30, 0.5)

# 6.5

sum(dbinom(15:20, 20, 0.5))
# ou bien
1 - pbinom(14, 20, 0.5) # 14 car fonction discrete

# 6.6

sum(dbinom(10:15, 20, 0.5))
pbinom(15, 20, 0.5) - pbinom(9, 20, 0.5)

# 7.1

qnorm(0.05, mean=0, sd=1)
qnorm(0.1, mean=0, sd=1)
qnorm(0.9, mean=0, sd=1)

# 7.2

qchisq(0.05, df=10)
qchisq(0.1, df=10)
qchisq(0.9, df=10)

# 7.3

qt(0.05, df=5)
qt(0.1, df=5)
qt(0.9, df=5)

# 7.4

qf(0.05, df1=2, df2=5)
qf(0.1, df1=2, df2=5)
qf(0.9, df1=2, df2=5)


# Implementation d'une loi de probabilite

# 8 

 dloi <- function(x,b){
 	if(x<0 | x>b) stop('non definie pour x<0 ou x>b')
 	a <- 2/b^2
	res <- a*x
	res[x<0] <- 0
	res[x>b] <- 0
 	return(res)
 }
# marche ?
# le if ne prend pas en parametre des vecteurs -> boucle for qui parcourt le vecteur
 dloi <- function(x,b){
 	a <- 2/b^2
 	res <- a*x
	if(x < 0){res<- 0}
	if(x > b){res<- 0}
 	return(res)
 }

# 9 

 dloi(c(-1,0,1,2,3,4,5),3)
 
 # visualisation
 
 curve(dloi(x,3), from=-5, to=5)
 
 #10
 
 ploi <- function(x,b){
 	if(x<=0 | x>b) stop('non definie pour x<=0 ou x>b')
 	res <- (x^2)/(b^2)
 	res[x<=0] <- 0
 	res[x>b] <- 1
 	return(res)
 }
 
 # 11
 
 curve(ploi(x,3), from=-5, to=5)

# 12

 qloi <- function(alpha,b){
 	if(alpha==0 | alpha==1) stop('non definie pour alpha=0 ou alpha=1')
 	res <- b*sqrt(alpha)
 	res[alpha=0] <- 0
 	res[alpha=1] <- b
 	return(res)
 }

# y = x^2/b^2
# y = alpha^2/b^2

# 13

# 14

rloi <- function(n,b){
	runif(n, min=0, max=b)
}

# 15
echantillon <- rloi(1000,3)
hist(echantillon, breaks=c(10, 50, 100, 1000))








