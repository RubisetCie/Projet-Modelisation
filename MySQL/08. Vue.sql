CREATE VIEW vue_progression_artisans AS
SELECT nom_artisans, SUBSTRING(date_de_vente, 1, 3) AS annee, COUNT(SUBSTRING(date_de_vente, 1, 3)) AS nombre_de_vente
FROM table_vente INNER JOIN table_cree ON table_vente.id_vente = table_cree.id_objet
GROUP BY annee, nom_artisans;