CREATE TEMPORARY TABLE IF NOT EXISTS temp_id
(
    id INT(11),
	pouvoir CHAR(30)
);

SET @id=1;
INSERT INTO temp_id
SELECT @id:=@id+1, Pouvoir
FROM temporaire_ventes;

INSERT INTO table_est_dote(id_objet, nom_pouvoir)
SELECT * FROM temp_id
WHERE pouvoir != "";