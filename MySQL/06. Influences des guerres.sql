CREATE TEMPORARY TABLE temp_ventes
(
    province CHAR(11),
    annee INT(11),
    quantite INT(11)
);

INSERT INTO temp_ventes
SELECT province_de_vente, SUBSTRING(date_de_vente, 1, 3) AS annee, SUM(quantite_vendue)
FROM table_vente
GROUP BY annee, province_de_vente;

SELECT COUNT(province_de_vente), province_de_vente, SUM(temp_ventes.quantite)
FROM table_touche INNER JOIN temp_ventes ON table_touche.province_de_vente = temp_ventes.province
WHERE annee_guerre = annee
GROUP BY province_de_vente;