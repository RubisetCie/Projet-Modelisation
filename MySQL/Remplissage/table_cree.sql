CREATE TEMPORARY TABLE IF NOT EXISTS temp_id
(
    id INT(11),
	artisan CHAR(30)
);

CREATE TEMPORARY TABLE IF NOT EXISTS temp_all
(
	id INT(11),
    artisan CHAR(30)
);

SET @id=1;
INSERT INTO temp_id
SELECT @id:=@id+1, Artisans
FROM temporaire_ventes;

INSERT INTO temp_all
SELECT temp_id.id, 
	SUBSTRING_INDEX(SUBSTRING_INDEX(temp_id.artisan, ' & ', seq_1_to_2.seq), ' & ', -1)
FROM temp_id INNER JOIN seq_1_to_2 ON CHAR_LENGTH(temp_id.artisan) - CHAR_LENGTH(REPLACE(temp_id.artisan, ' & ', '')) >= seq_1_to_2.seq-1;

INSERT INTO table_cree(id_objet, nom_artisans)
SELECT * FROM temp_all;