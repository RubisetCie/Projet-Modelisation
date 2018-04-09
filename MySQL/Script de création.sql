#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Vente
#------------------------------------------------------------

CREATE TABLE Table_Vente(
        id_vente        Int NOT NULL ,
        date_de_vente   Char (20) NOT NULL ,
        quantite_vendue Int ,
		province_de_vente Char (11) NOT NULL ,
        ville_de_vente    Char (11) NOT NULL ,
        id_objet        Int NOT NULL ,
        PRIMARY KEY (id_vente )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Vénération
#------------------------------------------------------------

CREATE TABLE Table_Veneration(
        mois_consacre Char (12) NOT NULL ,
        nom_divinite  Char (8) NOT NULL ,
        PRIMARY KEY (mois_consacre )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Artisan
#------------------------------------------------------------

CREATE TABLE Table_Artisan(
        nom_artisans Char (30) NOT NULL ,
        PRIMARY KEY (nom_artisans )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Province
#------------------------------------------------------------

CREATE TABLE Table_Province(
        province_de_vente Char (11) NOT NULL ,
        PRIMARY KEY (province_de_vente )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Décoration
#------------------------------------------------------------

CREATE TABLE Table_Decoration(
        decorations_objet Char (50) NOT NULL ,
        PRIMARY KEY (decorations_objet )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Objet
#------------------------------------------------------------

CREATE TABLE Table_Objet(
        id_objet           Int NOT NULL ,
        nom_objet          Char (25) NOT NULL ,
        prix_obelos_or     Int NOT NULL ,
        prix_obelos_argent Int NOT NULL ,
        prix_obelos_fer    Int NOT NULL ,
        id_vente           Int NOT NULL ,
        PRIMARY KEY (id_objet )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Guerre
#------------------------------------------------------------

CREATE TABLE Table_Guerre(
        annee_guerre Int NOT NULL ,
        PRIMARY KEY (annee_guerre )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Pouvoir
#------------------------------------------------------------

CREATE TABLE Table_Pouvoir(
        nom_pouvoir Char (30) NOT NULL ,
        PRIMARY KEY (nom_pouvoir )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Ville
#------------------------------------------------------------

CREATE TABLE Table_Ville(
        ville_de_vente Char (11) NOT NULL ,
        PRIMARY KEY (ville_de_vente )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Utilise
#------------------------------------------------------------

CREATE TABLE Table_Utilise(
        decorations_objet Char (50) NOT NULL ,
        mois_consacre     Char (12) NOT NULL ,
        PRIMARY KEY (decorations_objet ,mois_consacre )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Possède
#------------------------------------------------------------

CREATE TABLE Table_Possede(
        decorations_objet Char (50) NOT NULL ,
        id_objet          Int NOT NULL ,
        PRIMARY KEY (decorations_objet ,id_objet )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Crée
#------------------------------------------------------------

CREATE TABLE Table_Cree(
        nom_artisans Char (30) NOT NULL ,
        id_objet     Int NOT NULL ,
        PRIMARY KEY (nom_artisans ,id_objet )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Vendu à
#------------------------------------------------------------

CREATE TABLE Table_Vendu_a(
        id_vente          Int NOT NULL ,
        province_de_vente Char (11) NOT NULL ,
        ville_de_vente    Char (11) NOT NULL ,
        PRIMARY KEY (id_vente ,province_de_vente ,ville_de_vente )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Touche
#------------------------------------------------------------

CREATE TABLE Table_Touche(
        annee_guerre      Int NOT NULL ,
        province_de_vente Char (11) NOT NULL ,
        ville_de_vente    Char (11) NOT NULL ,
        PRIMARY KEY (annee_guerre ,province_de_vente ,ville_de_vente )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Est doté
#------------------------------------------------------------

CREATE TABLE Table_Est_dote(
        id_objet    Int NOT NULL ,
        nom_pouvoir Char (30) NOT NULL ,
        PRIMARY KEY (id_objet ,nom_pouvoir )
)ENGINE=InnoDB;

ALTER TABLE Table_Vente ADD CONSTRAINT FK_Vente_id_objet FOREIGN KEY (id_objet) REFERENCES Table_Objet(id_objet);
ALTER TABLE Table_Vente ADD CONSTRAINT FK_Vente_province_de_vente FOREIGN KEY (province_de_vente) REFERENCES Table_Objet(province_de_vente);
ALTER TABLE Table_Vente ADD CONSTRAINT FK_Vente_ville_de_vente FOREIGN KEY (ville_de_vente) REFERENCES Table_Objet(ville_de_vente);
ALTER TABLE Table_Objet ADD CONSTRAINT FK_Objet_id_vente FOREIGN KEY (id_vente) REFERENCES Table_Vente(id_vente);
ALTER TABLE Table_Utilise ADD CONSTRAINT FK_Utilise_decorations_objet FOREIGN KEY (decorations_objet) REFERENCES Table_Decoration(decorations_objet);
ALTER TABLE Table_Utilise ADD CONSTRAINT FK_Utilise_mois_consacre FOREIGN KEY (mois_consacre) REFERENCES Table_Veneration(mois_consacre);
ALTER TABLE Table_Possede ADD CONSTRAINT FK_Possede_decorations_objet FOREIGN KEY (decorations_objet) REFERENCES Table_Decoration(decorations_objet);
ALTER TABLE Table_Possede ADD CONSTRAINT FK_Possede_id_objet FOREIGN KEY (id_objet) REFERENCES Table_Objet(id_objet);
ALTER TABLE Table_Cree ADD CONSTRAINT FK_Cree_nom_artisans FOREIGN KEY (nom_artisans) REFERENCES Table_Artisan(nom_artisans);
ALTER TABLE Table_Cree ADD CONSTRAINT FK_Cree_id_objet FOREIGN KEY (id_objet) REFERENCES Table_Objet(id_objet);
ALTER TABLE Table_Vendu_a ADD CONSTRAINT FK_Vendu_a_id_vente FOREIGN KEY (id_vente) REFERENCES Table_Vente(id_vente);
ALTER TABLE Table_Vendu_a ADD CONSTRAINT FK_Vendu_a_province_de_vente FOREIGN KEY (province_de_vente) REFERENCES Table_Province(province_de_vente);
ALTER TABLE Table_Vendu_a ADD CONSTRAINT FK_Vendu_a_ville_de_vente FOREIGN KEY (ville_de_vente) REFERENCES Table_Ville(ville_de_vente);
ALTER TABLE Table_Touche ADD CONSTRAINT FK_Touche_annee_guerre FOREIGN KEY (annee_guerre) REFERENCES Table_Guerre(annee_guerre);
ALTER TABLE Table_Touche ADD CONSTRAINT FK_Touche_province_de_vente FOREIGN KEY (province_de_vente) REFERENCES Table_Province(province_de_vente);
ALTER TABLE Table_Touche ADD CONSTRAINT FK_Touche_ville_de_vente FOREIGN KEY (ville_de_vente) REFERENCES Table_Ville(ville_de_vente);
ALTER TABLE Table_Est_dote ADD CONSTRAINT FK_Est_dote_id_objet FOREIGN KEY (id_objet) REFERENCES Table_Objet(id_objet);
ALTER TABLE Table_Est_dote ADD CONSTRAINT FK_Est_dote_nom_pouvoir FOREIGN KEY (nom_pouvoir) REFERENCES Table_Pouvoir(nom_pouvoir);
