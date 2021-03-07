                                -- Création de tables --

CREATE TABLE Oeuvres (

    titre VARCHAR NOT NULL,
    date_creation INTEGER,
    prix_acquisition FLOAT NOT NULL,
    Largeur FLOAT CHECK( Largeur IS NULL and type = 'sculpture' OR Largeur IS NOT NULL and type != 'sculpture'),
    Hauteur FLOAT NOT NULL,
    type VARCHAR NOT NULL
    CHECK ( type in ('peinture', 'photographie', 'sculpture') ),
    PRIMARY KEY (titre)
);



CREATE TABLE Auteurs (

    nom VARCHAR NOT NULL,
    prenom VARCHAR NOT NULL,
    date_naissance DATE NOT NULL,
    date_deces DATE
    CHECK (date_naissance < date_deces OR date_deces IS NULL),
    PRIMARY KEY (nom,prenom,date_naissance)
);

CREATE TABLE Realise (

    nom VARCHAR NOT NULL,
    prenom VARCHAR NOT NULL,
    date_naissance DATE NOT NULL,
    oeuvre VARCHAR NOT NULL,
    FOREIGN KEY (nom,prenom,date_naissance) REFERENCES Auteurs(nom,prenom,date_naissance),
    FOREIGN KEY (oeuvre) REFERENCES Oeuvres(titre),
    PRIMARY KEY (nom,prenom,date_naissance,oeuvre)
);

CREATE TABLE Prestataires (
    nom VARCHAR NOT NULL,
    adresse JSON NOT NULL,
    PRIMARY KEY (nom)
);

CREATE TABLE Restaurations (

    id_restauration SERIAL,
    type_restauration VARCHAR NOT NULL,
    date_debut DATE NOT NULL,
    date_fin DATE CHECK(date_fin > date_debut),
    prix FLOAT NOT NULL,
    oeuvre VARCHAR NOT NULL,
    prestataire VARCHAR NOT NULL,
    FOREIGN KEY (oeuvre) REFERENCES Oeuvres(titre),
    FOREIGN KEY (prestataire) REFERENCES Prestataires(nom),
    PRIMARY KEY (id_restauration)
);


CREATE TABLE Expositions (

    nom VARCHAR NOT NULL,
    date_debut DATE,
    date_fin DATE CHECK(date_fin > date_debut),
    type VARCHAR NOT NULL CHECK (type in ('temp','perm') ),
    CHECK (     ( date_debut IS NULL AND date_fin IS NULL AND type = 'perm' AND guide IS NULL ) 
            OR  ( date_debut IS NOT NULL AND date_fin IS NOT NULL AND type = 'temp' ) 
    ),
    oeuvre JSON NOT NULL,
    guide JSON,
    PRIMARY KEY (nom)

);


CREATE TABLE Salles (

    numero SERIAL,
    capacite INTEGER NOT NULL,
    exposition VARCHAR,
    FOREIGN KEY (exposition) REFERENCES Expositions(nom),
    PRIMARY KEY (numero)
);

CREATE TABLE Panneaux (

    numero SERIAL,
    texte VARCHAR NOT NULL,
    exposition VARCHAR NOT NULL,
    salle INTEGER NOT NULL,
    FOREIGN KEY (exposition) REFERENCES Expositions(nom),
    FOREIGN KEY (salle) REFERENCES Salles(numero),
    PRIMARY KEY (numero)
);

CREATE TABLE Creneaux (

    jour VARCHAR NOT NULL CHECK (jour IN ('lun','mer','jeu','ven','sam','dim') ),
    debut TIME NOT NULL CHECK (debut >= '09:00' AND debut <= '16:00'),
    fin TIME NOT NULL CHECK ( fin = debut + interval '2 hours'),
    exposition VARCHAR NOT NULL,
    FOREIGN KEY (exposition) REFERENCES Expositions(nom),
    PRIMARY KEY (jour,debut,exposition)
);

CREATE TABLE Guides (

    identifiant SERIAL,
    nom VARCHAR NOT NULL,
    prenom VARCHAR NOT NULL,
    adresse JSON NOT NULL,
    date_embauche DATE NOT NULL,
    creneau JSON NOT NULL,
    PRIMARY KEY (identifiant)
);

CREATE TABLE Musees_exterieurs (
    nom VARCHAR NOT NULL,
    adresse JSON NOT NULL,
    PRIMARY KEY (nom)
);

CREATE TABLE Prete (
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL CHECK(date_fin > date_debut),
    musee VARCHAR NOT NULL,
    oeuvre VARCHAR NOT NULL,
    FOREIGN KEY (musee) REFERENCES Musees_exterieurs(nom),
    FOREIGN KEY (oeuvre) REFERENCES Oeuvres(titre),
    PRIMARY KEY (musee,oeuvre)
);

CREATE TABLE Emprunte (
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL CHECK(date_fin > date_debut),
    musee VARCHAR NOT NULL,
    oeuvre VARCHAR NOT NULL,
    FOREIGN KEY (musee) REFERENCES Musees_exterieurs(nom),
    FOREIGN KEY (oeuvre) REFERENCES Oeuvres(titre),
    PRIMARY KEY (musee,oeuvre)
);