INSERT INTO table_artisan
SELECT DISTINCT SUBSTRING_INDEX(SUBSTRING_INDEX(temporaire_ventes.Artisans, ' & ', seq_1_to_2.seq), ' & ', -1)
FROM temporaire_ventes INNER JOIN seq_1_to_2 ON CHAR_LENGTH(temporaire_ventes.Artisans) - CHAR_LENGTH(REPLACE(temporaire_ventes.Artisans, ' & ', '')) >= seq_1_to_2.seq-1;