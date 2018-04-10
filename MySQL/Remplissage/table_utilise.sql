INSERT INTO table_utilise
SELECT DISTINCT decorations_objet, mois_consacre
FROM table_decoration, table_veneration
WHERE INSTR(decorations_objet, nom_divinite) > 0;