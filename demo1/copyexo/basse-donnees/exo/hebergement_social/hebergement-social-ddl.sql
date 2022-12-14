
Skip to content
Pull requests
Issues
Marketplace
Explore
@Wkips
ARFP /
DWWM_2204
Public

Code
Issues
Pull requests
Actions
Projects
Security

    Insights

DWWM_2204/04-bases-de-donnees/02-herbergement-social/03-Hebergement-social-DDL.sql
Mickaël 1eres requetes
Latest commit 863b7a6 21 hours ago
History
0 contributors
50 lines (40 sloc) 1.32 KB
-- DDL : Data Definition Language (Langage de définition des données)
-- Permet de manipuler : TABLE, VIEW, TRIGGER, PROCEDURE

-- CREATE : créer une structure de données 
-- ALTER : Modifier une structure de donnes
-- DROP : Supprimer une structure de données

DROP TABLE IF EXISTS residents;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS roles;

CREATE TABLE roles
(
	role_id INT PRIMARY KEY,
	role_name VARCHAR(50) NOT NULL
);

CREATE TABLE people
(
	person_id INT,
	person_lastname VARCHAR(255) NOT NULL,
	person_firstname VARCHAR(50) NOT NULL,
	person_birthdate DATE NOT NULL,
	person_role_id INT NOT NULL,
	PRIMARY KEY(person_id)
	-- ,FOREIGN KEY (person_role_id) REFERENCES roles(role_id)
);

CREATE TABLE residents
(
	person_id INT,
	resident_date_arrival TIMESTAMP NOT NULL,
	resident_date_leave TIMESTAMP NULL, 
	resident_doctor_id INT NULL,
	PRIMARY KEY (person_id)
);

-- ALTER TABLE people 
--	ADD FOREIGN KEY (person_role_id) REFERENCES roles(role_id);
	
ALTER TABLE people 
	ADD CONSTRAINT fk_people_role_id 
	FOREIGN KEY (person_role_id) REFERENCES roles(role_id)
	ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE residents 
	ADD CONSTRAINT fk_residents_people_id FOREIGN KEY (person_id) REFERENCES people(person_id),
	ADD CONSTRAINT fk_residents_doctor_id FOREIGN KEY (resident_doctor_id) REFERENCES people(person_id);
	
	
Footer
© 2022 GitHub, Inc.
Footer navigation

    Terms
    Privacy
    Security
    Status
    Docs
    Contact GitHub
    Pricing
    API
    Training
    Blog
    About

You have unread notifications