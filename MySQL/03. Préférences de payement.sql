CREATE TEMPORARY TABLE temp_sum
(
    province CHAR(11),
    sum_or INT(11),
    sum_argent INT(11)
);

INSERT INTO temp_sum
SELECT table_vente.province_de_vente, SUM(table_objet.prix_obelos_or), SUM(table_objet.prix_obelos_argent)
FROM table_objet INNER JOIN table_vente ON table_objet.id_objet = table_vente.id_objet
GROUP BY table_vente.province_de_vente;

SELECT province,
CASE
    WHEN sum_or * 2 > sum_argent THEN "Préfère payer en OR"
   	ELSE "Préfère payer en ARGENT"
END
FROM temp_sum;