# Nombre del script: Unidad 1 - Fundamentos del lenguaje R y entorno de trabajo
# Autor: Daniel Auliz-Ortiz
# Propósito: Taller introductorio de R. Seguir el script en vivo y resolver los
#            ejercicios dentro del mismo archivo
# Fecha: Octubre 2026
# Datos de contacto: dauliz@cieco.unam.mx
# Notas: X Congreso Mexicano de Ecología / I Congreso ReLatE (Puebla 2026)


# CÓMO USAR ESTE SCRIPT
#
# - Corre el código línea por línea con Ctrl + Enter (Cmd + Enter en Mac).
#   El cursor avanza solo a la siguiente línea.
# - Las líneas que empiezan con  #>  muestran el resultado esperado. No son
#   código: sólo sirven para que compares con lo que obtienes tú.
# - Los ejercicios están marcados con  >>> EJERCICIO  y traen un espacio
#   en blanco debajo. Escribe ahí tu código.
# - Este archivo es tuyo: edítalo, agrega tus propias notas y guárdalo
#   (Ctrl + S).
# - Si algo sale raro: Session > Restart R (Ctrl + Shift + F10) y vuelve a
#   correr desde el inicio de la sección en la que estás.
# - Las secciones marcadas [OPCIONAL] las vemos si hay tiempo.
#
# CONTENIDO
#
#   0. RStudio y primeros pasos
#   1. Las bases de R: operadores, objetos y funciones básicas
#   2. Paquetes
#   3. Tipos de datos
#   4. Tipos de objetos
#        4.1 Vectores
#        4.2 Matrices
#        4.3 Arrays
#        4.4 Data frames
#        4.5 Tibbles
#        4.6 Listas
#   5. Funciones
#   6. Cierre


# 0. RStudio y primeros pasos ----

## 0.1 Las partes de RStudio ----
# - Editor de scripts: aquí escribes y guardas tu código (este archivo).
# - Consola: aquí R ejecuta el código y muestra los resultados.
# - Entorno global (Environment): los objetos que existen en tu sesión.
# - Utilidades: Files, Plots, Packages, Help, Viewer.

## 0.2 Atajos de teclado útiles ----
# Ejecutar línea o selección      Ctrl + Enter          (Cmd + Enter en Mac)
# Ejecutar todo el script         Ctrl + Alt + R
# Asignación  <-                  Alt + -               (Option + - en Mac)
# Pipe  %>%                       Ctrl + Shift + M
# Comentar / descomentar          Ctrl + Shift + C
# Limpiar la consola              Ctrl + L
# Reiniciar R                     Ctrl + Shift + F10
# Índice del script               Ctrl + Shift + O
# Autocompletar                   Tab
# Recuperar código anterior       Flecha arriba (en la consola)

## 0.3 Primeros pasos ----
1 + 1                      # R funciona como una calculadora
"Hola, R"                  # el texto va entre comillas
print("Hola, R")           # imprime en la consola

# Todo lo que sigue a un # es un comentario: R lo ignora.
# Úsalos para explicarle a tu "yo del futuro" qué hace cada línea.

## 0.4 Pedir ayuda ----
?mean                      # abre la ayuda de una función
help("sd")                 # es lo mismo
# Fuera de R: busca el mensaje de error completo en internet, casi siempre
# alguien ya tuvo la misma duda.


# 1. Las bases de R ----

## 1.1 R como calculadora: operadores y funciones matemáticas ----
20 + 35                    #> 55
100 - 25                   #> 75
25 * 4                     #> 100
625 / 5                    #> 125
5 ^ 2                      #> 25
sqrt(144)                  #> 12
log(10)                    #> 2.302585  (logaritmo natural)
log(10, base = 10)         #> 1
exp(2.302585)              #> 9.999999  (es decir, 10: exp() es la inversa de log())


# R respeta el orden de las operaciones; los paréntesis lo cambian
2 + 3 * 4                  #> 14
(2 + 3) * 4                #> 20

# Pruébalo: cambia los números y vuelve a correr las líneas.

## 1.2 Operadores lógicos ----
# Comparan valores y devuelven TRUE o FALSE.
#
#   ==   igual a                   !=   no es igual a
#   >    mayor que                 <    menor que
#   >=   mayor o igual que         <=   menor o igual que
#   &    Y lógico (AND)            |    O lógico (OR)
#   !    negación (NOT)

5 == 5                     #> TRUE
5 != 3                     #> TRUE
5 > 3                      #> TRUE
5 < 3                      #> FALSE
5 >= 5                     #> TRUE
3 <= 5                     #> TRUE
(5 > 3) & (2 < 4)          #> TRUE
(2 > 3) | (5 > 3)          #> TRUE
!(5 > 3)                   #> FALSE

# OJO: = asigna, == compara. No es lo mismo.

# Los operadores también trabajan con varios valores a la vez
c(1, 5, 10) > 4            #> FALSE TRUE TRUE

## 1.3 Objetos y asignación ----
# Un objeto es un "contenedor" con nombre. Para crear uno usamos <-
# (atajo: Alt + -)
a <- 1
b = 2                      # = también funciona, pero en R se prefiere <-

a                          #> 1
b                          #> 2
a + b                      #> 3

# R intenta identificar todo lo que escribes:
#   sin comillas ni paréntesis -> un objeto       a, b, resultado
#   con paréntesis             -> una función     mean(), sum()
#   entre comillas             -> texto           "Lunes"
#   sólo dígitos               -> un número       23

nombre <- "Juan"
x <- 5
x <- 10                    # al reasignar, el valor anterior se pierde
x                          #> 10

# Reglas para nombrar objetos:
#   - Pueden tener letras, números, _ y .
#   - No pueden empezar con un número ni llevar espacios
#   - R distingue mayúsculas de minúsculas: x y X son objetos distintos
#   - Evita nombres de funciones que ya existen (mean, sum, c, t, df, data)
#   - Usa nombres cortos pero que digan qué contienen: abundancia, temp_media

### >>> EJERCICIO B1: ¿cuáles funcionan y cuáles no? ----
# Para cada línea: (1) predice qué pasará, (2) quítale el # y córrela,
# (3) lee el mensaje de R y vuelve a comentarla (Ctrl + Shift + C).
# ¿Por qué funciona o por qué falla?

# x == 5
# nombre <- Juan
# mean <- 10
# 2datos <- 14
# salario juan <- 1500
# X
# Hola mundo
# resultado * 2
# 3 -> j
# (j + resultado) * x


# Si corriste mean <- 10, bórralo para no confundirte más adelante
# rm(mean)

## 1.4 Funciones estadísticas básicas ----
# Para que todos obtengamos los mismos números "aleatorios" fijamos una semilla
set.seed(2026)
aleatorio <- runif(20, min = 10, max = 30)    # 20 números entre 10 y 30

aleatorio
sum(aleatorio)             # suma
mean(aleatorio)            # promedio (el valor teórico es 20, pero con sólo
                           # 20 datos varía)
median(aleatorio)          # mediana
sd(aleatorio)              # desviación estándar
min(aleatorio)             # mínimo
max(aleatorio)             # máximo
length(aleatorio)          #> 20
print(aleatorio)           # imprimir en consola
round(aleatorio, 1)        # redondear a 1 decimal

## 1.5 Trabajando con texto ----
paste0("Hugo", "Paco", "Luis")              #> "HugoPacoLuis"
paste("Hugo", "Paco", "Luis")               #> "Hugo Paco Luis"
paste("Hugo", "Paco", "Luis", sep = "_")    #> "Hugo_Paco_Luis"
paste("Sitio", 1:3)                         #> "Sitio 1" "Sitio 2" "Sitio 3"

## 1.6 Revisar y borrar objetos ----
ls()                       # lista de los objetos que existen en la sesión
rm(aleatorio)              # borra un objeto
ls()

# Borra todos los objetos de la sesión. Úsalo con cuidado: no hay "deshacer".
rm(list = ls())
# También puedes reiniciar la sesión: Session > Restart R (Ctrl + Shift + F10)


# 2. Paquetes ----
# Los paquetes son conjuntos de funciones, datos y código adicionales a R.
# Se instalan UNA vez por computadora y se cargan en CADA sesión nueva.
# Están en repositorios como CRAN o GitHub.

## 2.1 Instalar y cargar ----
# install.packages("tidyverse")      # quita el # y corre (necesita internet)
# install.packages("readxl")
# install.packages("lubridate")
# install.packages("ggplot2")        # ya viene dentro de tidyverse

library(tidyverse)
library(readxl)
library(lubridate)

# Al cargar tidyverse, R avisa de los "conflictos": funciones con el mismo
# nombre en dos paquetes. R usa la del paquete que cargaste al último.

## 2.2 Funciones con el mismo nombre en distintos paquetes ----
# select() existe en dplyr (selecciona columnas) y en MASS (otra cosa).
dplyr::select(iris, Species) %>% head()     # dplyr:: indica de qué paquete

library(MASS)              # avisa que select() ahora es la de MASS
try(select(iris, Species)) # falla: ahora select() es la de MASS

dplyr::select(iris, Species) %>% head()     # con :: siempre funciona
detach("package:MASS", unload = TRUE)       # descargamos MASS
select(iris, Species) %>% head()            # vuelve a funcionar

# Buena práctica: si dudas, escribe paquete::función()

## 2.3 El tidyverse ----
# Es un conjunto de paquetes diseñados para trabajar juntos:
#   - datos ordenados (tidy data), código legible y reproducible
#   - sintaxis consistente y funciones con nombres predecibles
tidyverse_packages()

## 2.4 Un adelanto: el pipe %>% ----
# x %>% f()  equivale a  f(x).
# (Atajo: Ctrl + Shift + M)
# Lo usaremos en algunos ejemplos; en la siguiente unidad lo veremos a fondo.
sqrt(144)
144 %>% sqrt()

## 2.5 ¿Dónde aprender más sobre un paquete? ----
# - Cheatsheets: Help > Cheat Sheets, o https://posit.co/resources/cheatsheets/
# - Manuales y viñetas:
help(package = "dplyr")


# 3. Tipos de datos ----
#   numérico (num / dbl)   números decimales
#   entero   (int)         números enteros (se escriben con L: 10L)
#   lógico   (logi)        TRUE / FALSE
#   carácter (chr)         texto
#   factor   (factor)      datos categóricos con niveles finitos

a <- 5.5                   # numérico
j <- 10L                   # entero
p <- TRUE                  # lógico
z <- "Manzana"             # carácter
t <- factor("Azul")        # factor  (t también es una función de R)

class(a)
class(j)
class(p)
class(z)
class(t)

## 3.1 Verificar y convertir ----
h <- 18.5
is.numeric(h)              #> TRUE
class(h)                   #> "numeric"

d <- 20
is.numeric(d)              #> TRUE
class(d)                   #> "numeric"  (R guarda los números como decimales)
d <- as.integer(d)         # convertimos
class(d)                   #> "integer"

# Verificar:  is.character()  is.numeric()  is.integer()  is.logical()  is.factor()
# Convertir:  as.character()  as.numeric()  as.integer()  as.logical()  as.factor()

## 3.2 Lo que pasa al convertir ----
as.numeric(t)              #> 1       ¡el factor es un código, no un texto!
as.factor(12)              # igual que: 12 %>% as.factor()
as.logical(t)              #> NA      no todo se puede convertir
as.numeric(FALSE)          #> 0       FALSE vale 0 y TRUE vale 1
as.integer(3.9)            #> 3       corta, NO redondea
as.numeric("hola")         #> NA      (con una advertencia)

# Un error clásico: números guardados como factor
f <- factor(c("10", "20", "10", "30"))
as.numeric(f)              #> 1 2 1 3       ¡códigos internos, no los valores!
as.numeric(as.character(f))  #> 10 20 10 30    así sí
levels(f)                  # los niveles del factor
nlevels(f)                 #> 3

### >>> EJERCICIO T1 ----
# Designa una variable "p" que valga 7. Verifica a qué tipo de variable
# corresponde (¿cuál crees que será?). Por último, conviértela a número entero.



### >>> EJERCICIO T2 ----
# Designa una variable "f" que contenga la palabra viernes. Verifica el tipo
# de variable que crees que sea. Conviértela a factor.



### >>> EJERCICIO T3 ----
# Designa una variable "k" que valga 15.6. Verifica a qué tipo corresponde.
# Por último, conviértela a carácter.



### >>> EJERCICIO T4 ----
# Designa una variable "w" que contenga el factor llamado lluvias. Verifica el
# tipo de variable usando class(). Convierte el valor a numérico.



### >>> EJERCICIO T5 ----
# Designa una variable "rr" que tenga como valor Verdadero (TRUE). Verifica el
# tipo de variable con class(). Por último, conviértela a numérico.



### >>> EJERCICIO T6 ----
# Designa una variable "hh" que contenga el valor 12L. Verifica el tipo de
# variable usando class(). Convierte el valor a factor y observa cuántos
# niveles tiene.



## 3.3 [OPCIONAL] Fechas ----
# Las fechas tienen su propio tipo: Date.
fecha <- as.Date("2024-01-09")             # formato año-mes-día
class(fecha)                               #> "Date"
fecha + 30                                 # se pueden hacer cuentas con fechas
year(fecha)                                # lubridate: extraer partes
month(fecha)
dmy("9/1/2024")                            # lubridate: leer otros formatos


# 4. Tipos de objetos ----
# R trabaja con varios tipos de objetos:
#   vectores, matrices, arrays, data frames, listas
# Además hay objetos propios de ciertos paquetes: modelos, gráficos, raster...

## 4.1 Vectores ----
# Un vector es una colección ordenada de elementos del MISMO tipo, en una sola
# dimensión. Se crean con c() (de "combinar").
mi_vector <- c(1, 2, 3, 4, 5)
nombres <- c("Juan", "Ana", "Pedro")
numeros <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
valores_verdad <- c(TRUE, FALSE, TRUE, TRUE)
dias <- c("lunes", "martes", "miércoles", "jueves", "viernes", "sábado",
          "domingo")

class(mi_vector)
length(numeros)            #> 10
1:10                       # atajo para secuencias de enteros
seq(0, 100, by = 25)       #> 0 25 50 75 100
rep("A", 3)                #> "A" "A" "A"

# Si mezclas tipos, R convierte todo al más general (coerción)
mezcla <- c(1, "a", TRUE)
mezcla                     #> "1" "a" "TRUE"
class(mezcla)              #> "character"

# Los vectores se pueden operar completos (sin escribir ciclos)
numeros * 2
numeros + numeros
numeros > 5

### 4.1.1 Indexación ----
# Indexar es acceder, extraer o modificar elementos de un objeto usando su
# posición, su nombre o una condición lógica.
x <- c(10, 20, 30)

x[2]                       #> 20          por posición
x[c(1, 3)]                 #> 10 30       varias posiciones
x[2:3]                     #> 20 30       un rango
x[-1]                      #> 20 30       todo MENOS la posición 1
x > 15                     #> FALSE TRUE TRUE
x[x > 15]                  #> 20 30       por condición lógica
which(x > 15)              #> 2 3         ¿en qué posiciones se cumple?
sum(x > 15)                #> 2           ¿cuántos la cumplen?

x[2] <- 25                 # modificar un elemento
x                          #> 10 25 30

edades <- c(Juan = 30, Ana = 25, Pedro = 41)    # vector con nombres
edades["Ana"]                                    # indexar por nombre

# Pruébalo: dias[c(1, 7)]  ¿qué devuelve?

### >>> EJERCICIO V1 ----
# Abundancia de una especie en 8 sitios. Corre esta línea:
abundancia <- c(12, 0, 5, 33, 8, 1, 0, 19)
# a) ¿Cuántos sitios hay?
# b) ¿Cuál es la abundancia total?
# c) ¿Cuál es la abundancia del sitio 4?



### >>> EJERCICIO V2 ----
# a) Devuelve las abundancias que son mayores o iguales a 10.
# b) ¿En qué sitios (posiciones) ocurre eso?
# c) ¿En cuántos sitios la especie está ausente (abundancia = 0)?




## 4.2 Matrices ----
# Una matriz es una estructura bidimensional (filas y columnas) que almacena
# elementos del MISMO tipo. Se indexa como [fila, columna].
mi_mat_01 <- matrix(c(1:20), ncol = 4, nrow = 5)
mi_mat_01

dim(mi_mat_01)             #> 5 4   (filas, columnas)

# Por defecto R llena la matriz por columnas. Con byrow = TRUE, por filas:
matrix(1:6, nrow = 2, byrow = TRUE)

nombres_matriz <- matrix(c("Juan", "Ana", "Pedro", "Elena", "Jose", "Miguel",
                           "Maria", "Adriana", "Eder", "Ines", "Joel",
                           "Patricia"),
                         nrow = 4, ncol = 3)
nombres_matriz

# Indexación: [fila, columna]
mi_mat_01[3, 2]           #> 8       fila 3, columna 2
mi_mat_01[2, ]            # toda la fila 2     (columna vacía = todas)
mi_mat_01[, 2]            # toda la columna 2  (fila vacía = todas)

### >>> EJERCICIOS M1-M7: indexación de matrices ----
# M1. Devuelve el valor 14 de mi_mat_01
# M2. Devuelve el valor 2 de mi_mat_01
# M3. Devuelve sólo la fila 4 de mi_mat_01
# M4. Devuelve la columna 1 de mi_mat_01
# M5. Devuelve el nombre Adriana de nombres_matriz
# M6. Devuelve el nombre Ines de nombres_matriz
# M7. Devuelve la fila 4 de nombres_matriz



## 4.3 Arrays ----
# Un array es una estructura multidimensional (extiende la matriz) que
# almacena elementos del MISMO tipo. Se indexa como [fila, columna, nivel].
mi_array <- array(c(1:18), dim = c(3, 3, 2))
mi_array

dim(mi_array)              #> 3 3 2
mi_array[1, 2, 2]          #> 13      fila 1, columna 2, nivel 2

### >>> EJERCICIOS A1-A3: indexación de arrays ----
# A1. Devuelve el valor 17 de mi_array
# A2. Devuelve el valor 3 de mi_array
# A3. Devuelve los valores 13, 14 y 15 al mismo tiempo de mi_array



## 4.4 Data frames ----
# Un data frame es una tabla: filas = observaciones, columnas = variables.
# A diferencia de una matriz, cada columna puede tener un tipo distinto.
# Es el formato más común para datos ecológicos.
df <- data.frame(
  no     = c(1, 2, 3, 4, 8),
  site   = c("A", "B", "A", "C", "D"),
  temp   = c(22.5, 24.5, 27, 35, 26),
  precip = c(650, 820, 698, 715, 905)
)
df

### 4.4.1 Explorar un data frame ----
class(df)                  # tipo de objeto
names(df)                  # nombres de las columnas
dim(df)                    # dimensiones (filas, columnas)
nrow(df)                   # número de filas
ncol(df)                   # número de columnas
str(df)                    # estructura de los datos
glimpse(df)                # alternativa de tidyverse
head(df)                   # primeras filas (útil cuando la tabla es grande)
summary(df)                # resumen de cada variable

df$temp                    # una columna con $
unique(df$site)            # valores únicos
table(df$site)             # frecuencia de cada valor único

# Cuidado: en un data frame $ acepta nombres incompletos (coincidencia
# parcial). Funciona, pero no te acostumbres: puede traer errores difíciles.
df$prec                    # devuelve precip

### 4.4.2 Modificar un data frame ----
# OJO: esto cambia df. Si necesitas volver al original, corre otra vez el
# bloque donde se creó df.
colnames(df) <- c("number", "locality", "T", "P")    # cambiar nombres
df

df$elevacion <- c(200, 400, 750, 1200, 1500)         # nueva variable
df

### 4.4.3 Un data frame con datos de mamíferos ----
df_mamif <- data.frame(
  Especie = c("Puma concolor", "Canis lupus", "Panthera onca", "Lynx rufus",
              "Ursus americanus", "Canis latrans", "Mustela nivalis"),
  Habitat = c("Bosques", "Bosques", "Selvas tropicales", "Praderas",
              "Bosques", "Desiertos", "Tundra"),
  Poblacion = c(100, 50, 30, 80, 120, 25, 15),
  Estado_Conservacion = c("Preocupación menor", "Preocupación menor",
                          "En riesgo", "Preocupación menor",
                          "Preocupación menor", "Preocupación menor",
                          "Preocupación menor")
)
df_mamif
str(df_mamif)


### >>> EJERCICIOS D1-D4: indexación de data frames ----
# D1. Devuelve la columna Especie de df_mamif
# D2. Devuelve los datos completos de la fila de Panthera onca de df_mamif
# D3. Devuelve las columnas Habitat y Estado_Conservacion de df_mamif
# D4. Devuelve los datos de las filas Lynx rufus y Canis lupus



## 4.5 Tibbles ----
# Un tibble es una versión moderna del data frame (paquete tibble, tidyverse):
#   - se imprime de forma más limpia
#   - mantiene la naturaleza de las variables
#   - es muy compatible con tidyverse
#   - puede guardar objetos complejos (por ejemplo, modelos)

# Puedes convertir de data frame a tibble y viceversa:
#   as_tibble()      data frame -> tibble
#   as.data.frame()  tibble -> data frame
tb_iris <- iris %>% as_tibble()

head(iris)                 # data frame: sin información de los tipos
# El tibble muestra el tipo de cada columna y sólo imprime las primeras filas
tb_iris
class(iris)
class(tb_iris)

head(tb_iris$Sepal.Width)  # una columna, igual que en un data frame

# A diferencia del data frame, el tibble NO acepta nombres incompletos
head(iris$Sepal.W)         # data frame: funciona (coincidencia parcial)
tb_iris$Sepal.W            #> NULL, con una advertencia

df_mamif %>% as_tibble()
tb_iris %>% as.data.frame() %>% head()

### 4.5.1 [OPCIONAL] Un tibble con un modelo adentro ----
categoria <- c("A", "B", "A", "B")
valor <- c(10, 20, 15, 25)
texto <- c("hola", "mundo", "dato", "extra")

# Creamos un modelo lineal (ejemplo simple)
modelo <- lm(valor ~ categoria)

# Un tibble con distintos tipos de datos, incluyendo el modelo
mi_tibble <- tibble(
  Categoria = categoria,
  Valor = valor,
  Texto = texto,
  Modelo = list(modelo)    # el modelo se guarda como lista
)
mi_tibble

# Para sacar el modelo: columna Modelo ($), elemento 1 ([[ ]])
mi_tibble$Modelo[[1]] %>% summary()    # resumen del modelo guardado en la fila 1

## 4.6 Listas ----
# Una lista puede contener elementos de distintos tipos y longitudes: vectores,
# matrices, data frames, funciones y hasta otras listas. Cada elemento se
# identifica por su nombre o su posición. Son muy útiles para automatizar.
mi_lista <- list(
  Nombre = "Juan",
  Edad = 30,
  Puntuaciones = c(85, 90, 88),
  Aprobado = TRUE,
  Detalles = data.frame(Hora = c("10:00", "12:30", "15:45"),
                        Lugar = c("Bosque", "Río", "Montaña"))
)
mi_lista

names(mi_lista)
str(mi_lista)              # estructura completa de la lista

# Tres formas de indexar una lista
mi_lista$Nombre            #> "Juan"     con $ y el nombre
mi_lista[["Nombre"]]       #> "Juan"     con [[ ]]: saca el elemento
mi_lista["Nombre"]         # con [ ]: devuelve una lista más pequeña
mi_lista[[3]]              # por posición

mi_lista$Nombre %>% class()                  #> "character"
mi_lista$Detalles$Hora                       #> "10:00" "12:30" "15:45"

# Modificar y agregar elementos
mi_lista$Edad <- 31
mi_lista$Ciudad <- "Puebla"

### >>> EJERCICIOS L1-L5: indexación de listas ----
# L1. Devuelve el valor Juan
# L2. Verifica qué tipo de objeto es Puntuaciones
# L3. Devuelve el valor 88 de Puntuaciones
# L4. Devuelve la columna Lugar de Detalles
# L5. Devuelve el valor Río de Detalles



# 5. Funciones ----
# Una función es un conjunto de instrucciones que realiza una tarea específica
# y se puede llamar desde otras partes del código. Puede recibir parámetros de
# entrada (argumentos) y devolver un resultado.
#
# Ventajas de hacer tus propias funciones:
#   1. Automatización: corres muchas instrucciones de una sola vez
#   2. Claridad: la función resuelve un problema específico y tiene un nombre
#   3. Reutilización: una vez declarada, la usas las veces que quieras
#   4. Flexibilidad: según los argumentos, se adapta a distintos casos

## 5.1 Estructura de una función ----
#   nombre <- function(argumentos) {
#     cuerpo de la función
#     return(resultado)
#   }
#
# - Nombre: simple, que diga lo que hace (sumar_numeros, buscar_nombre)
# - Argumentos: los datos de entrada y los parámetros; pueden tener valores
#   por defecto
# - Cuerpo: está entre { }. Lo que pasa adentro no afecta al código de afuera
# - Resultado: lo que devuelve la función (return)

mi_suma <- function(a, b) {
  suma <- a + b
  return(suma)
}

mi_suma(2, 3)                    #> 5
mi_suma(a = 10, b = 5)           #> 15
mi_suma(c(1, 2, 3), 10)          #> 11 12 13

# Un argumento con valor por defecto
area_circulo <- function(radio, digitos = 2) {
  area <- pi * radio^2
  area <- round(area, digitos)
  return(area)
}

area_circulo(3)                  #> 28.27
area_circulo(3, digitos = 4)     #> 28.2743
area_circulo(c(1, 2, 3))         # trabaja con vectores completos

## 5.2 Una función ecológica: índice de diversidad de Shannon ----
#   H' = -sum(p * ln(p)),  donde p es la proporción de cada especie
shannon_index <- function(abundancias) {
  p <- abundancias / sum(abundancias)
  H <- -sum(p * log(p))
  return(H)
}

comunidad_a <- c(10, 10, 10, 10)    # equitativa: 4 especies igual de comunes
comunidad_b <- c(37, 1, 1, 1)       # dominada por una sola especie

shannon_index(comunidad_a)          #> 1.386294
shannon_index(comunidad_b)          # menor: hay menos diversidad

# ¿Qué pasa si una especie tiene abundancia 0?
comunidad_c <- c(10, 5, 0, 5)
shannon_index(comunidad_c)          #> NaN   (0 * log(0) no está definido)

# Vamos a corregirla: quitamos las especies ausentes antes de calcular.
# Vuelve a correr la definición para sobrescribir la función anterior.
shannon_index <- function(abundancias) {
  abundancias <- abundancias[abundancias > 0]
  p <- abundancias / sum(abundancias)
  H <- -sum(p * log(p))
  return(H)
}

shannon_index(comunidad_c)          #> 1.039721

### >>> EJERCICIO F1 ----
# Escribe una función llamada densidad() que reciba el número de individuos
# (n_individuos) y el área muestreada en m2 (area_m2) y devuelva la densidad
# en individuos por hectárea (1 ha = 10 000 m2).
# Pruébala con 25 individuos en 500 m2.



### >>> EJERCICIO F2 ----
# Escribe una función llamada coef_var() que reciba un vector x y devuelva su
# coeficiente de variación en porcentaje: desviación estándar / promedio * 100.
# Pruébala con: peso <- c(120, 135, 128, 150, 110)



### >>> EJERCICIO F3 (reto) ----
# Escribe una función simpson_index() que devuelva el índice de Simpson,
# 1 - sum(p^2), donde p es la proporción de cada especie.
# Compara comunidad_a, comunidad_b y comunidad_c.



### >>> EJERCICIO F4 (reto) ----
# La equidad de Pielou es J = H' / ln(S), donde S es el número de especies
# presentes (abundancia > 0). Escribe una función pielou_index() que use
# shannon_index() adentro. Pruébala con las tres comunidades.



# 6. Cierre ----
# Lo que vimos:
#   - RStudio, scripts, comentarios y ayuda
#   - Objetos, asignación y buenas prácticas para nombrar
#   - Paquetes: instalar, cargar y evitar conflictos
#   - Tipos de datos: numérico, entero, lógico, carácter y factor
#   - Objetos: vectores, matrices, arrays, data frames, tibbles y listas
#   - Indexación: [ ], [ , ], [[ ]] y $
#   - Escribir tus propias funciones

# Buenas prácticas para llevarte:
#   - Encabeza cada script (nombre, autor, propósito, fecha, contacto, notas)
#   - Comenta lo que haces y por qué
#   - Nombres claros, sin acentos ni espacios
#   - Antes de compartir un script, reinicia R y córrelo completo

# Guarda este script con tus notas (Ctrl + S).

# Para dejar constancia de las versiones con las que trabajaste:
sessionInfo()
