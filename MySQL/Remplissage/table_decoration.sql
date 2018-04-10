INSERT INTO table_decoration
SELECT DISTINCT SUBSTRING_INDEX(Décorations, ' & ', 1)
FROM temporaire_ventes
WHERE Décorations != "";