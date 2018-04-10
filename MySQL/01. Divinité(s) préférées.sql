SELECT DISTINCT table_vente.province_de_vente, table_veneration.nom_divinite
FROM table_vente
INNER JOIN table_objet		ON table_vente.id_objet = table_objet.id_objet
INNER JOIN table_possede	ON table_objet.id_objet = table_possede.id_objet
INNER JOIN table_utilise	ON table_possede.decorations_objet = table_utilise.decorations_objet
INNER JOIN table_veneration	ON table_utilise.mois_consacre = table_veneration.mois_consacre;