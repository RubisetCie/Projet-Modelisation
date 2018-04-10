CREATE TEMPORARY TABLE temp_total
(
    mois CHAR(12),
    quantite INT(11)
);

INSERT INTO temp_total
SELECT SUBSTRING(REPLACE(date_de_vente, RTRIM(RIGHT(date_de_vente, 2)), "  "), 6) AS mois, SUM(quantite_vendue) 
FROM table_vente
GROUP BY mois;

SELECT mois, nom_divinite, quantite
FROM temp_total INNER JOIN table_veneration ON temp_total.mois = table_veneration.mois_consacre;