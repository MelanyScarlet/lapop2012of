###Scrapping: Manera de poder jalar contenido de internet sin tener que descargarlo.

linkPage= "https://en.wikipedia.org/wiki/2019%E2%80%9320_coronavirus_pandemic"
linkPath = '//*[@id="thetable"]'

library(htmltab)
coronavirus = htmltab(doc = linkPage, which =linkPath, rm_nodata_cols = F) 

###Limpieza
head(coronavirus)
coronavirus = coronavirus[,c(2:5)]

###Cambiando los nombres
names(coronavirus)

new_names = c("Paises", "Casos", "Muertes", "Recuperados")

names(coronavirus) = new_names
names (coronavirus)

###Eliminando los pie de p?ginas

coronavirus = coronavirus[-c(229:230),]
View(coronavirus)

###Algo mas de limpieza para el valor ????"

library(dplyr)
coronavirus = coronavirus %>% 
  mutate(Recuperados = replace(Recuperados, Recuperados == '????"', NA))

View(coronavirus)

###Analisis

str(coronavirus)

####Comentario 15 de abril
