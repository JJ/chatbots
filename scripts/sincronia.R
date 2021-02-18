library("ggplot2")
library("ggthemes")
library("vttree")



data <- read.csv("../data/interaccion-estudiantes.csv")

vtree(data,"Experiencia.docente La.interacción.con.el.estudiante.prefiere.que.se.lleve.a.cabo",horiz=FALSE)


vtree(data,"Experiencia.docente Prefiere.la.interacción.con.el.estudiante",horiz=FALSE)
vtree(data,"Área La.interacción.con.el.estudiante.prefiere.que.se.lleve.a.cabo",horiz=FALSE)
