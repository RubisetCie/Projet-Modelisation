INSERT INTO table_guerre
SELECT DISTINCT SUBSTRING_INDEX(SUBSTRING_INDEX(temporaire_guerre.`Année de guerre`, ';', seq_1_to_100.seq), ';', -1)
FROM temporaire_guerre INNER JOIN seq_1_to_100 ON CHAR_LENGTH(temporaire_guerre.`Année de guerre`) - CHAR_LENGTH(REPLACE(temporaire_guerre.`Année de guerre`, ';', '')) >= seq_1_to_100.seq;