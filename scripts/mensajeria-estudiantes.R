library("ggplot2")
library("ggthemes")
library("vtree")



data <- read.csv("../data/estudiantes-edubots-interaccion.csv",sep=";")

vtree(data,"Género con.todos.los.compañeros.as.y.profesores.as",horiz=FALSE)
