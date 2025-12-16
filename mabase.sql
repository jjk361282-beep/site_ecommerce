-- ----------------------------------------------------------
-- Script MYSQL pour mcd 
-- ----------------------------------------------------------


-- ----------------------------
-- Table: article
-- ----------------------------
CREATE TABLE article (
  id_article INT NOT NULL,
  categorie VARCHAR(255) NOT NULL,
  stoc_aricle INT NOT NULL,
  nom_article VARCHAR(255) NOT NULL,
  date_article DATE NOT NULL,
  CONSTRAINT article_PK PRIMARY KEY (id_article, categorie, stoc_aricle)
)ENGINE=InnoDB;


-- ----------------------------
-- Table: panier
-- ----------------------------
CREATE TABLE panier (
  id_panier INT NOT NULL,
  article_commander VARCHAR(255) NOT NULL,
  id_client INT,
  CONSTRAINT panier_PK PRIMARY KEY (id_panier)
)ENGINE=InnoDB;


-- ----------------------------
-- Table: contenue
-- ----------------------------
CREATE TABLE contenue (
  id_article INT NOT NULL,
  categorie VARCHAR(255) NOT NULL,
  stoc_aricle INT NOT NULL,
  id_panier INT NOT NULL,
  id_panier_contenue INT NOT NULL,
  CONSTRAINT contenue_PK PRIMARY KEY (id_article, categorie, stoc_aricle, id_panier, id_panier_contenue),
  CONSTRAINT contenue_id_article_categorie_stoc_aricle_FK FOREIGN KEY (id_article, categorie, stoc_aricle) REFERENCES article (id_article, categorie, stoc_aricle),
  CONSTRAINT contenue_id_panier_FK FOREIGN KEY (id_panier) REFERENCES panier (id_panier),
  CONSTRAINT contenue_id_panier_contenue_FK FOREIGN KEY (id_panier_contenue) REFERENCES panier (id_panier)
)ENGINE=InnoDB;


-- ----------------------------
-- Table: client
-- ----------------------------
CREATE TABLE client (
  id_client INT NOT NULL,
  nom__client VARCHAR(50) NOT NULL,
  password VARCHAR(255) NOT NULL,
  date_creation DATE NOT NULL,
  id_panier INT NOT NULL,
  CONSTRAINT client_PK PRIMARY KEY (id_client),
  CONSTRAINT client_id_panier_FK FOREIGN KEY (id_panier) REFERENCES panier (id_panier)
)ENGINE=InnoDB;


-- ===== FOREIGN KEYS =====

ALTER TABLE panier
  ADD CONSTRAINT panier_id_client_FK FOREIGN KEY (id_client)
  REFERENCES client (id_client);