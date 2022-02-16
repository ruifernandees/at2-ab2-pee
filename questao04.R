library(readxl)
enem_db <- read_excel("/Users/ruifernandes/Development/RProjects/at2/enem_db.xlsx")

a<-aggregate(enem_db$NU_NOTA_CN, list(enem_db$NO_MUNICIPIO_PROVA), FUN=mean)
b<-aggregate(enem_db$NU_NOTA_CH, list(enem_db$NO_MUNICIPIO_PROVA), FUN=mean)
c<-aggregate(enem_db$NU_NOTA_LC, list(enem_db$NO_MUNICIPIO_PROVA), FUN=mean)
d<-aggregate(enem_db$NU_NOTA_MT, list(enem_db$NO_MUNICIPIO_PROVA), FUN=mean)
e<-aggregate(enem_db$NU_NOTA_REDACAO, list(enem_db$NO_MUNICIPIO_PROVA), FUN=mean)

notasset<-data.frame(
  CN=a,
  CH=b,
  LC=c,
  MT=d,
  RD=e
)

nota<-data.frame(
  CN=notasset$CN.x,
  CH=notasset$CH.x,
  LC=notasset$LC.x,
  MT=notasset$MT.x,
  RD=notasset$RD.x
)

cor(nota)

#A maior correla??o ? entre as disciplinas: Linguagens e c?digos e ci?ncias da natureza.

#Regress?o
regressaolinear<-lm(nota$LC~nota$CN)
summary(regressaolinear)

#Coeficiente de determina??o

coefDeterminacao <- (0.9754803)^2; coefDeterminacao

#Teste de hip?tese

cor.test(nota$CN, nota$LC, method="pearson")
#Conclus?o: correla??o boa, uma vez que, p-value ? um n?mero muito pequeno 2e-16
