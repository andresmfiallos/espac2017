# Si tenemos problemas con tildes en Mac, debemos cerrar RStudio, abrir la
# terminal, y ejecutar el siguiente código:

# defaults write org.R-project.R force.LANG en_US.UTF-8

# A continuación presento el código necesario para el procesamiento del archivo
# cpnac2017.csv correspondiente a los cultivos permanentes de la base de datos
# de la Encuesta de Superficie y Producción Agropecuaria Continua realizada por
# el INEC en el 2017. Este archivo tiene 121 variables, de las cuales en el
# presente código sólo se procesan las primeras

# Para crear un data frame que contenga los datos de cultivos permanentes,
# usamos la función read.csv2, la cual, a diferencia de read.csv, hace que el
# separador de columnas sea un punto y coma (;) y el separador de decimales sea una coma y
# no un punto:

cpnac2017 <- read.csv2("/Users/andresmorales/Dropbox/espac2017/baseDeDatos/cpnac2017.csv")

# Luego, hay que identificar el tipo de variables que se obtuvieron con read.csv2
# para saber cuáles cambiar.

# str(cpnac2017)

# Las variables que deberían ser de tipo factor, es decir, cualitativas, deben
# convertirse al tipo correcto. Por ejemplo, la variable cp_k413, Uso de riego,
# recoge dos tipos, categorias o niveles de respuesta, "si" y "no", con "1"
# correspondiendo a "si" y "2" a "no". Entonces, debemos primero convertirla a
# factor, para luego asignar niveles, o etiquetas en SPSS, o categorias, a cada
# variable. En este caso, debemos asignar niveles 1 y 2, estas son las respuesta
# registrada en la base de datos. Para esto, creamos el vector o lista que
# contiene los niveles con la función concatenar c(), así: c("1", "2"). En el
# caso de la base de datos proporcionada por el INEC, se indica que el número 1
# corresponde a la opción si y el 2 a la opción no, por lo que debemos asignar
# las etiquetas si y no a los valores registrados

cpnac2017$cp_k413 <- factor(cpnac2017$cp_k413, levels = c(1, 2), labels = c("si", "no"))

# Ahora, podemos visualizar con la función de resumen, summary(), el resultado final

# summary(cpnac2017$cp_k413)
# no    si
# 8212 22431

# Con las siguientes líneas de código, automatizamos el proceso y vamos a
# cambiar todas las variables categóricas en su forma correcta, a la vez que
# asignamos los nombres de cada nivel o categoría, según corresponda para cada
# variable. En el caso de las provincias, debemos indicar los niveles, 'levels',
# y las etiquetas, 'labels'. Los niveles son los valores registrados
# numéricamente en la encuesta, mientras que las etiquetas son lo que cada
# número registrado en la encuesta representa, en este caso, la provincia

cpnac2017$cp_prov <- factor(cpnac2017$cp_prov,
                            levels = c(1:24,90),
                            labels = c(
                              "Azuay",
                              "Bolivar",
                              "Canar",
                              "Carchi",
                              "Cotopaxi",
                              "Chimborazo",
                              "El Oro",
                              "Esmeraldas",
                              "Guayas",
                              "Imbabura",
                              "Loja",
                              "Los Rios",
                              "Manabi",
                              "Morona Santiago",
                              "Napo",
                              "Pastaza",
                              "Pichincha",
                              "Tungurahua",
                              "Zamora Chinchipe",
                              "Galapagos",
                              "Sucumbios",
                              "Orellana",
                              "Santo Domingo de los Tsachilas",
                              "Santa Elena",
                              "Zona No Delimitada"))

# En el caso de los cantones y parroquias, solo los convertiremos a factores; el código
# siguiente asignará cada número que aparezca a un nivel, pero las etiquetas se
# las designará según la necesidad del investigador

cpnac2017$cp_cant <- factor(cpnac2017$cp_cant)
cpnac2017$cp_parr <- factor(cpnac2017$cp_parr)

# De manera similar, para las siguientes variables, Estratos, segmentos número
# de cuestionario, número de terreno, y número de línea

cpnac2017$cp_estr <- factor(cpnac2017$cp_estr)
cpnac2017$cp_segm <- factor(cpnac2017$cp_segm)
cpnac2017$cp_ncues <- factor(cpnac2017$cp_ncues)
cpnac2017$cp_numt <- factor(cpnac2017$cp_numt)

# Para la siguiente variable, cada número registrado en la base de datos
# corresponde a una clave de cultivo, utilizaremos el diccionario de variables
# para asignar cada número a su cultivo correspondiente según surja la necesidad
# investigativa, por el momento, solo la convertiremos en factor

cpnac2017$cp_clacul <- factor(cpnac2017$cp_clacul)

# Procedemos con las siguientes:

cpnac2017$cp_k404 <- factor(cpnac2017$cp_k404)
cpnac2017$cp_distancia_1 <- as.numeric(cpnac2017$cp_distancia_1)
cpnac2017$cp_distancia_2 <- as.numeric(cpnac2017$cp_distancia_2)
cpnac2017$cp_k408 <- factor(cpnac2017$cp_k408)
cpnac2017$cp_k409 <- as.numeric(cpnac2017$cp_k409)
cpnac2017$cp_k409h <- as.numeric(cpnac2017$cp_k409h)
cpnac2017$cp_k410 <- as.numeric(cpnac2017$cp_k410)
cpnac2017$cp_k410h <- as.numeric(cpnac2017$cp_k410h)
cpnac2017$cp_k411 <- as.numeric(cpnac2017$cp_k411)
cpnac2017$cp_k411h <- as.numeric(cpnac2017$cp_k411h)
cpnac2017$cp_k412 <- factor(
  cpnac2017$cp_k412,
  levels = c(1:6),
  labels = c(
    "Sequía",
    "Helada",
    "Plagas",
    "Enfermedades",
    "Inundación",
    "Otra"
  )
)

# Si deseo observar el conteo de solo una de las causas de pérdida, debo
# convertir el vector en una tabla de contingencia usando la función table()

# tablaCausaPerdida <- table(cpnac2017$cp_k412)
# tablaCausaPerdida[names(tablaCausaPerdida)=="Sequía"]
# Sequía
#     79

# El resto de las variables

cpnac2017$cp_k414 <- factor(cpnac2017$cp_k414, levels = c(1, 2), labels = c("si", "no"))
cpnac2017$cp_k415 <- factor(cpnac2017$cp_k415, levels = c(1, 2), labels = c("si", "no"))
cpnac2017$cp_k416 <- as.numeric(cpnac2017$cp_k416)

# Para la siguiente variable, el diccionario de variables del INEC no tiene los
# significados de todas las unidades de medida en producción, de ser necesario,
# se recomienda contactar al INEC para obtener los datos completos

cpnac2017$cp_k417 <- factor(cpnac2017$cp_k417)

# El resto de las variables

cpnac2017$cp_k418 <- as.numeric(cpnac2017$cp_k418)
cpnac2017$cp_k420 <- factor(cpnac2017$cp_k420)
cpnac2017$cp_afecta_prod <-
  factor(
    cpnac2017$cp_afecta_prod,
    levels = c(1:7),
    labels = c(
      "Sequía/Heladas",
      "Plagas/Enfermedades",
      "Exceso de agua",
      "Semilla",
      "Prácticas inadecuadas/Falta de prácticas",
      "Edad de la plantación",
      "Ninguna"
    )
  )
cpnac2017$cp_k422 <- as.numeric(cpnac2017$cp_k422)
cpnac2017$cp_k423 <- factor(cpnac2017$cp_k423)
cpnac2017$cp_k424 <- as.numeric(cpnac2017$cp_k424)
cpnac2017$cp_k426 <- factor(cpnac2017$cp_k426)
cpnac2017$cp_rdpr1 <- as.numeric(cpnac2017$cp_rdpr1)
cpnac2017$cp_rdpr2 <- as.numeric(cpnac2017$cp_rdpr2)
cpnac2017$cp_rdpr3 <- as.numeric(cpnac2017$cp_rdpr3)
cpnac2017$cp_rdpr4 <- as.numeric(cpnac2017$cp_rdpr4)
cpnac2017$cp_rdpr5 <- as.numeric(cpnac2017$cp_rdpr5)
cpnac2017$cp_rdpr6 <- as.numeric(cpnac2017$cp_rdpr6)
cpnac2017$cp_fconvf <- as.numeric(cpnac2017$cp_fconvf)
cpnac2017$cp_fconvs <- as.numeric(cpnac2017$cp_fconvs)
cpnac2017$cp_control_maleza <- factor(cpnac2017$cp_control_maleza, levels = c(1, 2), labels = c("si", "no"))
cpnac2017$cp_prot_fruto <- factor(cpnac2017$cp_prot_fruto, levels = c(1, 2), labels = c("si", "no"))
cpnac2017$cp_riego <- factor(cpnac2017$cp_riego, levels = c(1, 2), labels = c("si", "no"))
cpnac2017$cp_superf_regada <- as.numeric(cpnac2017$cp_superf_regada)
cpnac2017$cp_superf_regada_ha <- as.numeric(cpnac2017$cp_superf_regada_ha)








devtools::use_data(cpnac2017, overwrite = T)











