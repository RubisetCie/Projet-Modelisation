DELIMITER //
CREATE PROCEDURE Ajouter_Vente(IN date_vente CHAR(20), IN quantite INT(3), IN ville_vente CHAR(11), IN province_vente CHAR(11), IN id_obj INT)
BEGIN
	INSERT INTO table_vente(date_de_vente, quantite_vente, ville_de_vente, province_de_vente, id_objet)
	VALUES (date_vente, quantite, ville_vente, province_vente, id_obj);
END//
