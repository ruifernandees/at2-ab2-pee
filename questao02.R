library(readxl)
enem_db <- read_excel("C:/Users/AntÙnio Carlos/Downloads/enem_db.xlsx")

enem_escola_mcz <- enem_db[enem_db$CO_ESCOLA == "27041042", ]
table(enem_escola_mcz$NO_MUNICIPIO_RESIDENCIA)

# LETRA A
shapiro.test(enem_escola_mcz$NU_NOTA_CN) # Passou
shapiro.test(enem_escola_mcz$NU_NOTA_REDACAO) # Passou
c<-shapiro.test(enem_escola_mcz$NU_NOTA_CH) # Não Passou <5%
a<-shapiro.test(enem_escola_mcz$NU_NOTA_MT) # Não passou <5%
b<-shapiro.test(enem_escola_mcz$NU_NOTA_LC) # Não passou <5%

# LETRA B
sqrt(a$p.value)# Não passou <5%
sqrt(b$p.value)# Passou >5%
sqrt(c$p.value)# Passou >5%

# LETRA C
enem_homens <- enem_escola_mcz[enem_escola_mcz$TP_SEXO == "Masculino", ]
enem_mulheres <- enem_escola_mcz[enem_escola_mcz$TP_SEXO == "Feminino", ]

t.test(enem_homens$NU_NOTA_CN, enem_mulheres$NU_NOTA_CN)
t.test(enem_homens$NU_NOTA_CH, enem_mulheres$NU_NOTA_CH)
t.test(enem_homens$NU_NOTA_LC, enem_mulheres$NU_NOTA_LC)
t.test(enem_homens$NU_NOTA_REDACAO, enem_mulheres$NU_NOTA_REDACAO)


# LETRA D
boxplot(enem_escola_mcz$NU_NOTA_CH, enem_escola_mcz$NU_NOTA_CN, 
        enem_escola_mcz$NU_NOTA_MT, enem_escola_mcz$NU_NOTA_LC,
        enem_escola_mcz$NU_NOTA_REDACAO,
        main='Notas das matérias do ENEM',
        sub='Ciências humanas | Ciências da natureza | Matemática | Linguagens e códigos | Redação',
        col = c('orange', 'blue', 'red', 'purple', 'brown')
)


# LETRA E
# Explicação no documento
