SELECT nom_objet, AVG(prix_obelos_or), AVG(prix_obelos_argent), AVG(prix_obelos_fer)
FROM table_objet
GROUP BY nom_objet;