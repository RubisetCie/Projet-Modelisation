SELECT DISTINCT table_artisan.nom_artisans, table_objet.id_objet, table_veneration.nom_divinite, table_objet.prix_obelos_fer
FROM table_artisan
INNER JOIN table_cree		ON table_artisan.nom_artisans = table_cree.nom_artisans
INNER JOIN table_objet		ON table_cree.id_objet = table_objet.id_objet
INNER JOIN table_possede	ON table_objet.id_objet = table_possede.id_objet
INNER JOIN table_decoration	ON table_possede.decorations_objet = table_decoration.decorations_objet
INNER JOIN table_utilise	ON table_decoration.decorations_objet = table_utilise.decorations_objet
INNER JOIN table_veneration	ON table_utilise.mois_consacre = table_veneration.mois_consacre;