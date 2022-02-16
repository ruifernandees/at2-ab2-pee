library(readxl)
enem_db <- read_excel("/Users/ruifernandes/Development/RProjects/at2/enem_db.xlsx")

enem_leste <- replace(enem_db$NO_MUNICIPIO_PROVA, c(
  (enem_db$NO_MUNICIPIO_PROVA == "Maceió"
  | enem_db$NO_MUNICIPIO_PROVA == "Boca da Mata"
  | enem_db$NO_MUNICIPIO_PROVA == "São Miguel dos Campos"
  | enem_db$NO_MUNICIPIO_PROVA == "Marechal Deodoro"
  | enem_db$NO_MUNICIPIO_PROVA == "Rio Largo"
  | enem_db$NO_MUNICIPIO_PROVA == "Pilar"
  | enem_db$NO_MUNICIPIO_PROVA == "Coruripe"
  | enem_db$NO_MUNICIPIO_PROVA == "Viçosa"
  | enem_db$NO_MUNICIPIO_PROVA == "São Luís do Quitunde"
  | enem_db$NO_MUNICIPIO_PROVA == "Porto Calvo"
  | enem_db$NO_MUNICIPIO_PROVA == "Campo Alegre"
  | enem_db$NO_MUNICIPIO_PROVA == "Atalaia"
  | enem_db$NO_MUNICIPIO_PROVA == "Penedo"
  | enem_db$NO_MUNICIPIO_PROVA == "Teotônio Vilela"
  | enem_db$NO_MUNICIPIO_PROVA == "União dos Palmares")
), "LESTE")
enem_agreste <- replace(enem_leste, (
  enem_leste == "Arapiraca"
  | enem_leste == "Girau do Ponciano"
  | enem_leste == "Igaci"
  | enem_leste == "Palmeira dos Índios"
  | enem_leste == "Traipu"
), "AGRESTE")
enem_sertao <- replace(enem_agreste, (
  enem_agreste == "Batalha"
  | enem_agreste == "Delmiro Gouveia"
  | enem_agreste == "Santana do Ipanema"
  | enem_agreste == "São José da Tapera"
  | enem_agreste == "Água Branca"
  | enem_agreste == "Olho d'Água das Flores"
), "SERTÃO")

enem_db$NO_MESORREGIOES <- enem_sertao
table(enem_db$NO_MESORREGIOES)

result <- aov(enem_db$NOTA_ENEN ~ factor(enem_db$NO_MESORREGIOES))
anova(result)
TukeyHSD(result)