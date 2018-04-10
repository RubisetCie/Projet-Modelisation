INSERT INTO table_pouvoir
SELECT DISTINCT Pouvoir FROM temporaire_ventes
WHERE Pouvoir != "";