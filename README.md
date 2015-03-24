# bassins viticoles français
N'ayant pas réussi à trouver les bassins viticoles utilisés par [l'agreste](http://agreste.agriculture.gouv.fr/enquetes/pratiques-culturales/viticulture-565/), pour son enquête sur les indices de fréquence des traitements phytosanitaires des vignes en ligne, j'ai contacté le ministère pour avoir l'information.

Les données SIG ont été construites grâce à une aimable réponse de l'agreste le 23 mars 2015, jointe au dossier, et aux données [Geofla](http://professionnels.ign.fr/geofla) proposés par l'IGN sous licence ouverte en V1. Ce qui permet de produire des cartes à partir des données d'enquête agreste comme celle-là. 

![Indice de fréquance de traitement viticole par bassins](/img/gg_age_surface_2012.png)

## Les données ##
### Structuration des repertoires###

          .
          ├── data
          │   ├── agreste
          │   │   ├── ift_autres.csv
          │   │   ├── ...
          │   │   └── zonage_phyto_viti.txt
          │   ├── bassins_indiv
          │   │   ├── alsace.dbf
          │   │   ├── alsace.prj
          │   │   ├── alsace.qpj
          │   │   ├── alsace.shp
          │   │   ├── alsace.shx
          │   │   ├── beaujolais.dbf
          │   │   ├── beaujolais.prj
          │   │   ├── beaujolais.qpj
          │   │   ├── beaujolais.shp
          │   │   ├── beaujolais.shx
          │   │   ├── bordelais.dbf
          │   │   ├── ...
          │   ├── bassins_viticoles
          │   │   ├── bassins_viticoles.cpg
          │   │   ├── bassins_viticoles.dbf
          │   │   ├── bassins_viticoles.prj
          │   │   ├── bassins_viticoles.qpj
          │   │   ├── bassins_viticoles.shp
          │   │   ├── bassins_viticoles.shx
          │   │   ├── communes_bassins_viticoles.cpg
          │   │   ├── communes_bassins_viticoles.dbf
          │   │   ├── communes_bassins_viticoles.prj
          │   │   ├── communes_bassins_viticoles.qpj
          │   │   ├── communes_bassins_viticoles.shp
          │   │   └── communes_bassins_viticoles.shx
          │   └── france
          │       ├── france.cpg
          │       ├── france.dbf
          │       ├── france.prj
          │       ├── france.qpj
          │       ├── france.shp
          │       └── france.shx
          ├── img
          │   └── gg_ift_total.png
          ├── LICENSE
          ├── README.md
          └── script
              └── ift_mapper.R

### Agreste ###
On retrouve des données au format CSV reprenant l'indice de fréquence des traitements par bassins viticoles

### Bassins Indiv ###
On retrouve chaque bassin individualisé, à la commune. Par exemple toutes les communes d'Alsace qui sont comprises dans le bassin viticole Alsacien. Les communes sont issues de [Geofla](http://professionnels.ign.fr/geofla).

### Bassins viticoles ###
Deux couches SIG, l'une à la commune et l'autre agrégé par bassin des différents bassins viticole de France selon l'agreste.

### France ### 
Les contours de la France métropolitaine issus de l'agrégation des départements [Geofla](http://professionnels.ign.fr/geofla).

### script ###
Contiens des scripts [R](http://www.r-project.org/), permettant de réaliser une classification des données pour réaliser des cartes des indices de fréquences de traitement par bassin viticole.