INSERT INTO table_veneration(nom_divinite, mois_consacre)
SELECT `Divinité fétée`, Mois
FROM temporaire_mois;