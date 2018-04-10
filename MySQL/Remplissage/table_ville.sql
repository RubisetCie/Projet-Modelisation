INSERT INTO table_ville
SELECT DISTINCT Ville
FROM temporaire_provinces
WHERE Ville != "";