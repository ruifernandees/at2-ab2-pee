library(readxl)

enem_db <- read_xlsx("/Users/ruifernandes/Development/RProjects/at2/enem_db.xlsx")
enem_db_leste <- enem_db[
  enem_db$NO_MUNICIPIO_PROVA == "Maceió"
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
  | enem_db$NO_MUNICIPIO_PROVA == "União dos Palmares",
]
table(enem_db_leste$NO_MUNICIPIO_PROVA)

## Agreste
enem_db_agreste <- enem_db[
    enem_db$NO_MUNICIPIO_PROVA == "Arapiraca"
  | enem_db$NO_MUNICIPIO_PROVA == "Girau do Ponciano"
  | enem_db$NO_MUNICIPIO_PROVA == "Igaci"
  | enem_db$NO_MUNICIPIO_PROVA == "Palmeira dos Índios"
  | enem_db$NO_MUNICIPIO_PROVA == "Traipu",
]
table(enem_db_agreste$NO_MUNICIPIO_PROVA)

## Sertão
enem_db_sertao <- enem_db[
    enem_db$NO_MUNICIPIO_PROVA == "Batalha"
  | enem_db$NO_MUNICIPIO_PROVA == "Delmiro Gouveia"
  | enem_db$NO_MUNICIPIO_PROVA == "Santana do Ipanema"
  | enem_db$NO_MUNICIPIO_PROVA == "São José da Tapera"
  | enem_db$NO_MUNICIPIO_PROVA == "Água Branca"
  | enem_db$NO_MUNICIPIO_PROVA == "Olho d'Água das Flores",
]
table(enem_db_sertao$NO_MUNICIPIO_PROVA)
