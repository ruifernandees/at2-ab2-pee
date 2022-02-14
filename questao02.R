library(readxl)

enem_db <- read_xlsx("/Users/ruifernandes/Development/RProjects/at2/enem_db.xlsx")
enem_escola_mcz <- enem_db[enem_db$CO_ESCOLA == "27041042", ]
table(enem_escola_mcz$NO_MUNICIPIO_RESIDENCIA)

# LETRA A
shapiro.test(enem_escola_mcz$NU_NOTA_CN) # Passou
shapiro.test(enem_escola_mcz$NU_NOTA_REDACAO) # Passou
shapiro.test(enem_escola_mcz$NU_NOTA_CH) # Passou
shapiro.test(enem_escola_mcz$NU_NOTA_MT) # Não passou
shapiro.test(sqrt(enem_escola_mcz$NU_NOTA_LC)) # Não passou

# LETRA B

## A fazer...

# LETRA C
enem_homens <- enem_escola_mcz[enem_escola_mcz$TP_SEXO == "Masculino", ]
enem_mulheres <- enem_escola_mcz[enem_escola_mcz$TP_SEXO == "Feminino", ]

t.test(enem_homens$NU_NOTA_CN, enem_mulheres$NU_NOTA_CN)
t.test(enem_homens$NU_NOTA_REDACAO, enem_mulheres$NU_NOTA_REDACAO)
t.test(enem_homens$NU_NOTA_CH, enem_mulheres$NU_NOTA_CH)

# LETRA D

## A fazer...