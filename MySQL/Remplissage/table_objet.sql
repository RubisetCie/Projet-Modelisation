INSERT INTO table_objet(nom_objet, prix_obelos_or, prix_obelos_argent, prix_obelos_fer)
SELECT Objet, Oo, Oa, Of FROM temporaire_ventes;