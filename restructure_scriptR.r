
# ==== chargement de librairies ====
require(xlsx)
require(xlsx)
require(plyr)
require("xlsx")
require("readxl")
require(reshape2)
require(ggplot2)
require(gghighlight)
require(dplyr, warn.conflicts = FALSE)
# Sys.setenv(JAVA_HOME='C:/Program Files/Java/jre1.8.0_171/')
# library(xlsx)
# au cas ou pour en sortir du xlsx si il faut
#https://stackoverflow.com/questions/27661325/unable-to-load-rjava-on-r

# charger le dossier de travail 
setwd("G:/00_data_ref/data_gouv_fr/france_agrimer/collecte-bio-2000-2018")

# ==== Attention, on considere que les noms de types de cultres ne changeront pas ====
# ==== ces noms étant encodé ====

# charge le objets
# on presuppose que l'ordre des onglets ne chargera pas
autres_cereales <- read_excel("G:/00_data_ref/data_gouv_fr/france_agrimer/collecte-bio-2000-2018/SCR-GRC-histREG_collecte_bio_depuis_2000-C18.xlsx", 
                     sheet = 1, col_types = c("date", 
                                                     "numeric", "numeric", "text", "text", 
                                                     "text", "text", "numeric", "text", 
                                                     "text", "text", "text", "text", "text", 
                                                     "text", "text", "numeric"), skip = 1)
# on cree un champ pour stocker le type de culture
autres_cereales$type_cul <- "Autres Céréales"
# on passe la sheet suivante
avoine <- read_excel("G:/00_data_ref/data_gouv_fr/france_agrimer/collecte-bio-2000-2018/SCR-GRC-histREG_collecte_bio_depuis_2000-C18.xlsx", 
                     sheet = "Avoine", col_types = c("date", 
                                                     "numeric", "numeric", "text", "text", 
                                                     "text", "text", "numeric", "text", 
                                                     "text", "text", "text", "text", "text", 
                                                     "text", "text", "numeric"), skip = 1)
avoine$type_cul <- "Avoine"
# sheet
ble_dur <- read_excel("G:/00_data_ref/data_gouv_fr/france_agrimer/collecte-bio-2000-2018/SCR-GRC-histREG_collecte_bio_depuis_2000-C18.xlsx", 
                     sheet = 3, col_types = c("date", 
                                                     "numeric", "numeric", "text", "text", 
                                                     "text", "text", "numeric", "text", 
                                                     "text", "text", "text", "text", "text", 
                                                     "text", "text", "numeric"), skip = 1)
ble_dur$type_cul <- "blé dur"
# sheet
ble_tendre <- read_excel("G:/00_data_ref/data_gouv_fr/france_agrimer/collecte-bio-2000-2018/SCR-GRC-histREG_collecte_bio_depuis_2000-C18.xlsx", 
                      sheet = 4, col_types = c("date", 
                                               "numeric", "numeric", "text", "text", 
                                               "text", "text", "numeric", "text", 
                                               "text", "text", "text", "text", "text", 
                                               "text", "text", "numeric"), skip = 1)
ble_trendre$type_cul <- "blé tendre"
# sheet
colza <- read_excel("G:/00_data_ref/data_gouv_fr/france_agrimer/collecte-bio-2000-2018/SCR-GRC-histREG_collecte_bio_depuis_2000-C18.xlsx", 
                      sheet = 5, col_types = c("date", 
                                               "numeric", "numeric", "text", "text", 
                                               "text", "text", "numeric", "text", 
                                               "text", "text", "text", "text", "text", 
                                               "text", "text", "numeric"), skip = 1)
colza$type_cul <- "Colza"

feverole <- read_excel("G:/00_data_ref/data_gouv_fr/france_agrimer/collecte-bio-2000-2018/SCR-GRC-histREG_collecte_bio_depuis_2000-C18.xlsx", 
                      sheet = 6, col_types = c("date", 
                                               "numeric", "numeric", "text", "text", 
                                               "text", "text", "numeric", "text", 
                                               "text", "text", "text", "text", "text", 
                                               "text", "text", "numeric"), skip = 1)
feverole$type_cul <- "Févérole"
# sheet
lin <- read_excel("G:/00_data_ref/data_gouv_fr/france_agrimer/collecte-bio-2000-2018/SCR-GRC-histREG_collecte_bio_depuis_2000-C18.xlsx", 
                       sheet = 7, col_types = c("date", 
                                                "numeric", "numeric", "text", "text", 
                                                "text", "text", "numeric", "text", 
                                                "text", "text", "text", "text", "text", 
                                                "text", "text", "numeric"), skip = 1)
lin$type_cul <- "Lin"
# sheet
lupin <- read_excel("G:/00_data_ref/data_gouv_fr/france_agrimer/collecte-bio-2000-2018/SCR-GRC-histREG_collecte_bio_depuis_2000-C18.xlsx", 
                       sheet = 8, col_types = c("date", 
                                                "numeric", "numeric", "text", "text", 
                                                "text", "text", "numeric", "text", 
                                                "text", "text", "text", "text", "text", 
                                                "text", "text", "numeric"), skip = 1)
lupin$type_cul <- "Lupin"
# sheet
mais <- read_excel("G:/00_data_ref/data_gouv_fr/france_agrimer/collecte-bio-2000-2018/SCR-GRC-histREG_collecte_bio_depuis_2000-C18.xlsx", 
                       sheet = 9, col_types = c("date", 
                                                "numeric", "numeric", "text", "text", 
                                                "text", "text", "numeric", "text", 
                                                "text", "text", "text", "text", "text", 
                                                "text", "text", "numeric"), skip = 1)
mais$type_cul <- "Maïs"
# sheet
orge <- read_excel("G:/00_data_ref/data_gouv_fr/france_agrimer/collecte-bio-2000-2018/SCR-GRC-histREG_collecte_bio_depuis_2000-C18.xlsx", 
                       sheet = 10, col_types = c("date", 
                                                "numeric", "numeric", "text", "text", 
                                                "text", "text", "numeric", "text", 
                                                "text", "text", "text", "text", "text", 
                                                "text", "text", "numeric"), skip = 1)
orge$type_cul <- "Orge"
# sheet
pois <- read_excel("G:/00_data_ref/data_gouv_fr/france_agrimer/collecte-bio-2000-2018/SCR-GRC-histREG_collecte_bio_depuis_2000-C18.xlsx", 
                       sheet = 11, col_types = c("date", 
                                                "numeric", "numeric", "text", "text", 
                                                "text", "text", "numeric", "text", 
                                                "text", "text", "text", "text", "text", 
                                                "text", "text", "numeric"), skip = 1)
pois$type_cul <- "Pois"
# sheet
riz <- read_excel("G:/00_data_ref/data_gouv_fr/france_agrimer/collecte-bio-2000-2018/SCR-GRC-histREG_collecte_bio_depuis_2000-C18.xlsx", 
                       sheet = 12, col_types = c("date", 
                                                "numeric", "numeric", "text", "text", 
                                                "text", "text", "numeric", "text", 
                                                "text", "text", "text", "text", "text", 
                                                "text", "text", "numeric"), skip = 1)
riz$type_cul <- "Riz"
#sheet 13 :sarrasin
sarrasin <- read_excel("G:/00_data_ref/data_gouv_fr/france_agrimer/collecte-bio-2000-2018/SCR-GRC-histREG_collecte_bio_depuis_2000-C18.xlsx", 
                       sheet = 13, col_types = c("date", 
                                                "numeric", "numeric", "text", "text", 
                                                "text", "text", "numeric", "text", 
                                                "text", "text", "text", "text", "text", 
                                                "text", "text", "numeric"), skip = 1)
sarrasin$type_cul <- "Sarrasin"
#sheet 14 :Seigle
seigle <- read_excel("G:/00_data_ref/data_gouv_fr/france_agrimer/collecte-bio-2000-2018/SCR-GRC-histREG_collecte_bio_depuis_2000-C18.xlsx", 
                       sheet = 14, col_types = c("date", 
                                                 "numeric", "numeric", "text", "text", 
                                                 "text", "text", "numeric", "text", 
                                                 "text", "text", "text", "text", "text", 
                                                 "text", "text", "numeric"), skip = 1)
seigle$type_cul <- "Seigle"
#sheet 15 :Soja
soja <- read_excel("G:/00_data_ref/data_gouv_fr/france_agrimer/collecte-bio-2000-2018/SCR-GRC-histREG_collecte_bio_depuis_2000-C18.xlsx", 
                     sheet = 15, col_types = c("date", 
                                               "numeric", "numeric", "text", "text", 
                                               "text", "text", "numeric", "text", 
                                               "text", "text", "text", "text", "text", 
                                               "text", "text", "numeric"), skip = 1)
soja$type_cul <- "Soja"
# sheet 16 : Sorghp
sorgho <- read_excel("G:/00_data_ref/data_gouv_fr/france_agrimer/collecte-bio-2000-2018/SCR-GRC-histREG_collecte_bio_depuis_2000-C18.xlsx", 
                   sheet = 16, col_types = c("date", 
                                             "numeric", "numeric", "text", "text", 
                                             "text", "text", "numeric", "text", 
                                             "text", "text", "text", "text", "text", 
                                             "text", "text", "numeric"), skip = 1)
sorgho$type_cul <- "Sorgho"
# 17: tournesol
tournesol <- read_excel("G:/00_data_ref/data_gouv_fr/france_agrimer/collecte-bio-2000-2018/SCR-GRC-histREG_collecte_bio_depuis_2000-C18.xlsx", 
                     sheet = 17, col_types = c("date", 
                                               "numeric", "numeric", "text", "text", 
                                               "text", "text", "numeric", "text", 
                                               "text", "text", "text", "text", "text", 
                                               "text", "text", "numeric"), skip = 1)
tournesol$type_cul <- "Tournesol"
# 18 : Triticale
triticale <- read_excel("G:/00_data_ref/data_gouv_fr/france_agrimer/collecte-bio-2000-2018/SCR-GRC-histREG_collecte_bio_depuis_2000-C18.xlsx", 
                        sheet = 18, col_types = c("date", 
                                                  "numeric", "numeric", "text", "text", 
                                                  "text", "text", "numeric", "text", 
                                                  "text", "text", "text", "text", "text", 
                                                  "text", "text", "numeric"), skip = 1)
triticale$type_cul <- "Triticale"



is.na(x) <- value


# on prend tout les objets cree pour en faire un seul gros dataset
# https://stackoverflow.com/questions/35387419/how-to-rbind-all-the-data-frames-in-your-working-environment
dfs = sapply(.GlobalEnv, is.data.frame)
df0 <- do.call(rbind.fill, mget(names(dfs)[dfs]))
typeof(df0)
# names(df0$X__1) <- 'variable'
View(df0)
unique(df0$X__1)
names(df0)
str(df0)

# on recree un dataframe sans des NA dans les totaux
df1<-subset(df0, (!is.na(df0[,17])) )
View(df1)
str(df1)


# on restructure la data
df1_melt <- melt(df1, id=c('Date','Récolte', 'Mois', 'type_cul'))
df1_melt$an_mois <- paste(df1_melt$Récolte, df1_melt$Mois, sep="-")

# Soit On remplace le secret statistique par 0
df1_melt$value[ df1_melt$value == "sc" ] <- 0
# Soit on subset pour enlever ces valeurs
df2_melt <- subset(df1_melt, value != "sc")
dim(df2_melt)[1] - dim(df1_melt)[1]

# on save en csv
write.csv(df2_melt, "histREG_collecte_bio_depuis_2000_restruct.csv")

# on change le type de données
df2_melt$value <- as.numeric(df2_melt$value)
 
# dfin <- rbind(prod_melt,rend_melt,surf_melt)
# write.xlsx(dfin, "hist_dep_surface_prod_cult_restruct.xlsx")

length(unique(df1_melt$variable))

# dataviz
hist(prod_melt$value)

# desactivation de la numérotation sci
# https://stackoverflow.com/questions/5352099/how-to-disable-scientific-notation
options(scipen=999)

# on convertit en date
df2_melt$Date <- as.Date(df2_melt$Date, format="%Y-%m-%d")


prod_nat <- ggplot(subset(df2_melt, variable !="TOTAL"), aes(x=Récolte, y=value)) + geom_bar(aes(y=value), stat='identity',fill="#D55E00") + theme(legend.position = "right")
prod_nat + facet_wrap(.~type_cul,scales = "free") + theme_minimal() + 
  ggtitle("Série historique de collecte annuelle biologique par récolte jusqu'au 1er septembre 2018 \n Source FranceAgriMer,Unité Système d'information économique - Etat2  biologique de consommation") + theme(plot.title = element_text(lineheight=.8, face="bold", hjust = 0.5))
# Unité : tonnes
# Chiffres provisoires arrêtés le 21/09/2018
# Juillet comprend la récolte précoce du mois de juin
# SC secret statistique
# Y compris biologique 2ème année de conversion
# Source FranceAgriMer,Unité Système d'information économique - Etat2  biologique de consommation


# === Avoine ==== 
ggplot(subset(df2_melt,type_cul == 'Avoine' & variable !="TOTAL") , aes(x=Date, y=value, colour=variable)) + geom_line(aes(x=Date, y=value, colour=variable), size=1)  + theme_minimal()  +
  gghighlight(variable == "Bourgogne\nFranche\nComté") +
#  scale_x_date(date_labels = "%b %Y")
  scale_x_date(date_breaks = "6 month", date_labels = "%b %Y") + theme(axis.text.x = element_text(angle = 90, hjust = 1))

# === Avoine les departements le max de surface ====
ggplot(subset(df2_melt,type_cul == 'Avoine' & variable !="TOTAL") , aes(x=Date, y=value, colour=variable)) + geom_line(aes(x=Date, y=value, colour=variable), size=1)  + theme_minimal() + 
  gghighlight(predicate = max(value), max_highlight = 2) +
  scale_x_date(date_breaks = "6 month", date_labels = "%b %Y") + theme(axis.text.x = element_text(angle = 90, hjust = 1))

# essayons le wrap sur toutes les cultures
ggplot(subset(df2_melt, variable !="TOTAL") , aes(x=Date, y=value, colour=variable)) + geom_line(aes(x=Date, y=value, colour=variable), size=1)  + theme_minimal() + 
  # gghighlight(predicate = max(value), max_highlight = 2) 
  facet_wrap(.~type_cul,scales = "free") + theme_minimal() +
  scale_x_date(date_breaks = "18 month", date_labels = "%b %Y") + theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme(legend.position="bottom")

