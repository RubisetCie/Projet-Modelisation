INSERT INTO table_touche(province_de_vente, ville_de_vente, annee_guerre)
SELECT
	CASE
        WHEN temporaire_guerre.`Province/Citée` NOT IN(
        SELECT table_province.province_de_vente FROM table_province)
            THEN SUBSTRING_INDEX(temporaire_guerre.`Province/Citée`, ' - ', 1)
    	ELSE temporaire_guerre.`Province/Citée`
    END,
    CASE
        WHEN temporaire_guerre.`Province/Citée` NOT IN(
        SELECT table_province.province_de_vente FROM table_province)
            THEN SUBSTRING_INDEX(SUBSTRING_INDEX(temporaire_guerre.`Province/Citée`,' - ', 2),' - ', -1) 
        ELSE NULL
    END,
	SUBSTRING_INDEX(SUBSTRING_INDEX(temporaire_guerre.`Année de guerre`, ';', seq_1_to_100.seq), ';', -1)
FROM temporaire_guerre INNER JOIN seq_1_to_100 ON CHAR_LENGTH(temporaire_guerre.`Année de guerre`) - CHAR_LENGTH(REPLACE(temporaire_guerre.`Année de guerre`, ';', '')) >= seq_1_to_100.seq