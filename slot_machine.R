install.packages("devtools")
devtools::install_github("hadley/emo")

uvas<-emo::ji("grape")
cerezas<-emo::ji("cherries")
campana<-emo::ji("bell")
sandia<-emo::ji('watermelon')
diamante<-emo::ji('gem')

figuras<-c(uvas,cerezas,campana,sandia,diamante)
probabilidades <- c(0.35, 0.08, 0.25, 0.3, 0.02)
sample(x = figuras, size = 1, prob = probabilidades)
set.seed(30)

ventana1 <- sample(x = figuras, size = 1, prob = probabilidades)
ventana2 <- sample(x = figuras, size = 1, prob = probabilidades)
ventana3 <- sample(x = figuras, size = 1, prob = probabilidades)
ventana4 <- sample(x = figuras, size = 1, prob = probabilidades)
resultado <- c(ventana1, ventana2, ventana3, ventana4)

resultado

#//1.2.3
p4diamante <- dbinom(x = 4, size = 4, prob = 0.2)

p4nodiamante <- 4*dbinom(4, 4, 0.2)

p3diamante <- dbinom(3, 4, 0.2)

p3nodiamante <- 4*dbinom(3, 4, 0.2)
pdist <- 1*0.75*0.5*0.25
pnpremio <- p3nodiamante+pdist

ppremios <- matrix(c(p4diamante, p4nodiamante, p3diamante, p3nodiamante,pnpremio),
                   nrow = 5, ncol = 1, byrow = TRUE)

#1.2.4
partpremio <- 1000000*ppremios
cantidades <- matrix(c(700000/4, 700000/4, 700000/4,700000/4,0), 
                     nrow = 5, ncol = 1, byrow = TRUE)

importe_premio_d <- cantidades/partpremio

matrix(c(0.7/4, 0.7/4, 0.7/4,0.7/4, 0), 
       nrow = 5, ncol = 1, byrow = TRUE)/ppremios

importe_premio_c <- ceiling(importe_premio_d)#ceiling calculara el entero mayor siguiente

#comprobamos
t(importe_premio_c)%*%partpremio

#Tal y como lo tenemos, cumple los requisitos, pero damos mas asi que podemosa ajustarlo mas. vemos exceso que hay en cada punto
gastos <- importe_premio_c*partpremio
exceso <- gastos - cantidades
comparativa <- cbind(gastos, cantidades, partpremio, 
                     exceso, importe_premio_c)
colnames(comparativa) <- c("gastos", "cantidades", "partpremio", 
                           "exceso", "importe_premio_c")
rownames(comparativa) <- c("maximo", "segundo", "tercero", "cuarto", "sin premio")
print(comparativa)

#Ajustamos
premiofinal <- matrix(c(86, 28, 7, 2, 0), 
                      nrow = 5, ncol = 1, byrow = TRUE)

#producto vectorial
t(premiofinal)%*%partpremio

#
nuevosgastos <- premiofinal*partpremio
nuevoexceso <- nuevosgastos - cantidades
ncomparativa <- cbind(nuevosgastos, cantidades, partpremio,
                      nuevoexceso, premiofinal)
colnames(ncomparativa) <- c("ngastos", "cantidades", "partpremio",
                            "nexceso","premiofinal")
rownames(ncomparativa) <- c("maximo", "segundo", "tercero", "cuarto", "sin premio")
print(ncomparativa)

premio <- 0
if (sum(resultado ==diamante) == 4) premio <- premiofinal[1, 1]
if (sum(resultado ==uvas) == 4) premio <- premiofinal[2, 1]
if (sum(resultado ==cerezas) == 4) premio <- premiofinal[2, 1]
if (sum(resultado ==sandia) == 4) premio <- premiofinal[2, 1]
if (sum(resultado ==campana) == 4) premio <- premiofinal[2, 1]
if (sum(resultado ==diamante) == 3) premio <- premiofinal[3, 1]
if (sum(resultado ==diamante) == 2) premio <- premiofinal[4, 1]

#1.2.5

set.seed(130)

premioAcumulado <- 0

for (i in 1:1000) 
{
  figuras<-c(uvas,cerezas,campana,sandia,diamante)
  probabilidades <- c(0.35, 0.08, 0.25, 0.3, 0.02)
  ventana1 <- sample(x = figuras, size = 1, prob = probabilidades)
  ventana2 <- sample(x = figuras, size = 1, prob = probabilidades)
  ventana3 <- sample(x = figuras, size = 1, prob = probabilidades)
  ventana4 <- sample(x = figuras, size = 1, prob = probabilidades)
  resultado <- c(ventana1, ventana2, ventana3, ventana4)
  premiofinal <- matrix(c(86, 28, 7, 2, 0), nrow = 5, ncol = 1, byrow = TRUE)
  premio <- 0
  if (sum(resultado ==diamante) == 4) premio <- premiofinal[1, 1]
  if (sum(resultado ==uvas) == 4) premio <- premiofinal[2, 1]
  if (sum(resultado ==cerezas) == 4) premio <- premiofinal[2, 1]
  if (sum(resultado ==sandia) == 4) premio <- premiofinal[2, 1]
  if (sum(resultado ==campana) == 4) premio <- premiofinal[2, 1]
  if (sum(resultado ==diamante) == 3) premio <- premiofinal[3, 1]
  if (sum(resultado ==diamante) == 2) premio <- premiofinal[4, 1]
  cat(" ",resultado,"\n"," Premio:",premio,"euros\n")
  premioAcumulado <- premioAcumulado + premio
}
print(premioAcumulado)
