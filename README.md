# R_melt_france_agri_mer
Petit script a l'arrache pour traiter les données provenant de la donnée ouverte :
https://www.data.gouv.fr/fr/datasets/historique-regional-sur-la-collecte-mensuelle-des-grandes-cultures-bio/#_

Le but du jeu :
Prendre un gros xlsx avec plein d'onglet et en faire un seul fichier csv exploitable sous R.
On importe chaque onglet en précisant le type de culture
on "bind", on colle tout cela dans un gros csv.

On reshape (Merci Hadley !) ou plutot on restructure le fichier en faisant passer des colonnes par région, en ligne par région.

Licence : WTFPL ! :)
cf https://twitter.com/cq94/status/1053217372922937344
