library(readxl)

enem_db <- read_excel("/Users/ruifernandes/Development/RProjects/at2/enem_db.xlsx")

t.test(enem_db$NOTA_ENEN, conf.level = 0.95)

# P(508.5726 <= u <= 509.7158) = 95%

t.test(enem_db$NOTA_ENEN, conf.level = 0.99)

# P(508.3930 <= u <= 509.8954) = 99%