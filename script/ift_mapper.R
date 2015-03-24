## Auteur : Etienne Delay, Laboratoire Geolab, université de Limoges.
### un scripte pour visualiser les indices de fréquence de traitement par bassin viticole d'après les données de l'agreste
### source des données agreste : http://agreste.agriculture.gouv.fr/enquetes/pratiques-culturales/viticulture-565/
### sources des données SIG : http://professionnels.ign.fr/geofla

library(rgdal)
library(ggplot2)
library(plyr)
library(classInt)

rm(list = ls())
setwd(dir = "~/github/bassins_viticoles_fr/")

france_shp<-readOGR(dsn="data/france/", layer="france")
bassins_shp<-readOGR(dsn="data/bassins_viticoles/", layer="bassins_viticoles")


plot(france_shp, axes = T)
plot(bassins_shp, add=TRUE)


#### GGPLO2 PART ####
##FRANCE##
##transformation d'un spData.frame en dataFrame
france_shp@data$ID<-rownames(france_shp@data)
france.pts<-fortify(france_shp,region="ID")

##BASSIN VITICOLE##
bassins_shp@data$id<-rownames(bassins_shp@data)
bassin.pts<-fortify(bassins_shp,region="id")
bassin.df<-join(bassin.pts, bassins_shp@data, by="id")


ggfrance<-ggplot()+
  geom_polygon(data=france.pts, aes(x=long,y=lat,group=group))+
  geom_polygon(data=bassin.df, aes(x=long,y=lat,group=group, fill=bassin))
ggfrance

ggsave("img/gg_bassins.png",ggfrance,width = 10,height = 9)

#### DONNEES AGRESTE #####
ift_total<-read.csv("data/agreste/ift_total.csv",header = T, sep=";",skip=1, dec = ",")
sm_ift_total<-subset(ift_total, select = c(X, Médiane))
colnames(sm_ift_total)<-c("IFT","median_ift_total")

bassin.df<-join(bassin.df, sm_ift_total,by="IFT")
classif<-classIntervals(bassin.df$median_ift_total,n=5,style="kmeans")
bassin.df$class_ift_total<-as.factor(findCols(classif))

brks<-round(classif$brks,digits=2) ##definition des breaks

##préparation de la legende
# Create labels from break values
intLabels <- matrix(1:(length(brks)-1))
for(j in 1:length(intLabels )){intLabels [j] <- paste(as.character(brks[j]),"-",as.character(brks[j+1]))}

ggIFTtotal<-ggplot()+
  geom_polygon(data=france.pts, aes(x=long,y=lat,group=group))+
  geom_polygon(data=bassin.df, aes(x=long,y=lat,group=group, fill=class_ift_total))+
#   scale_fill_brewer(labels = intLabels, palette=3)+
  scale_fill_manual(labels = intLabels, values=c("#ffffb2","#fecc5c","#fd8d3c","#f03b20","#bd0026"))+
  guides(fill=guide_legend(title="Médiane de\n l'indice de fréquence\n de traitement total"))+
  annotate("text", label = "Sources: IGN geoflat & Agreste", x = 370000, y = 6050000, size = 5)+
  annotate("text", label = "Réalisation : E. Delay", x = 295000, y = 6010000, size = 5)
ggIFTtotal

ggsave("img/gg_ift_total.png",ggIFTtotal,width = 10,height = 9)
