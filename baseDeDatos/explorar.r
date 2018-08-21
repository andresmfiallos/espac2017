# Para identificar el tipo de variables que se obtuvieron con read.csv2
# y saber cuáles cambiar:
# str(cpnac2017)

# Para ver un resumen de una variable y comprobar que la conversión es correcta:
# summary(cpnac2017$cp_k413)
# no    si
# 8212 22431

# Si deseo observar el conteo de solo una de las causas de pérdida, debo
# convertir el vector en una tabla de contingencia usando la función table():
# tablaCausaPerdida <- table(cpnac2017$cp_k412)
# tablaCausaPerdida[names(tablaCausaPerdida)=="Sequía"]
# Sequía
#     79

# Para extraer únicamente las variables o columnas numéricas:

# library(dplyr)
# select_if(cpnac2017, is.numeric)
