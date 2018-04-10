INSERT INTO table_vente
SELECT Date, Quantité,
    CASE
        WHEN temporaire_ventes.Lieu NOT IN(
        SELECT table_province.province_de_vente FROM table_province)
            THEN SUBSTRING_INDEX(
        temporaire_ventes.Lieu,' - ', 1)
    	ELSE temporaire_ventes.Lieu
    END,
    CASE
        WHEN temporaire_ventes.Lieu NOT IN(
        SELECT table_province.province_de_vente FROM table_province)
            THEN SUBSTRING_INDEX(
        SUBSTRING_INDEX(
            temporaire_ventes.Lieu,' - ', 2),' - ', -1) 
        ELSE NULL
    END
    FROM temporaire_ventes;