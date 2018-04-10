SELECT province_de_vente, SUBSTRING(date_de_vente, 1, 3) AS annee, SUM(quantite_vendue)
FROM table_vente
GROUP BY annee, province_de_vente
