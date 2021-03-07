                                -- Création de vues --


-- CC1 : Toutes les oeuvres d'une exposition temporaire sont empruntees

CREATE VIEW Oeuvre_expo_temporaire_non_empruntée AS
        SELECT tab->>'titre' AS oeuvre FROM Expositions, JSON_ARRAY_ELEMENTS(Expositions.oeuvre) tab
        WHERE Expositions.type = 'temp'
        AND tab->>'titre' NOT IN (SELECT Emprunte.oeuvre FROM Emprunte);


-- CC2 : Toutes les oeuvres d'une exposition permanentes appartiennent au louvre 

CREATE VIEW Oeuvre_expo_permanente_pas_au_louvre AS
        SELECT tab->>'titre' AS oeuvre FROM Expositions, JSON_ARRAY_ELEMENTS(Expositions.oeuvre) tab
        WHERE Expositions.type = 'perm'
        AND tab->>'titre' IN (SELECT Emprunte.oeuvre FROM Emprunte);


-- CC3 : Une oeuvre empruntée ne peut pas être prêtée

CREATE VIEW Oeuvre_emprunte_pretee AS
    SELECT Emprunte.oeuvre FROM Emprunte,Prete 
    WHERE Emprunte.oeuvre = Prete.oeuvre;


-- CC4 : Une oeuvre en cours de prêt ne peut pas être envoyée en restauration

CREATE VIEW Oeuvre_a_prete_en_restauration AS
    SELECT Prete.oeuvre AS Oeuvre,Prete.date_debut AS debut_prêt,Prete.date_fin AS fin_prêt,Restaurations.date_debut AS debut_restauration,Restaurations.date_fin AS fin_restauration
    FROM Prete,Restaurations
    WHERE Prete.oeuvre = Restaurations.oeuvre 
    AND Prete.date_debut > Restaurations.date_debut 
    AND ((Prete.date_debut < Restaurations.date_fin) OR Restaurations.date_fin IS NULL);


-- CC5 : Une oeuvre en restauration ne peut pas être prêtée

CREATE VIEW Oeuvre_a_envoyer_en_restauration_prete AS
    SELECT Prete.oeuvre AS Oeuvre,Prete.date_debut AS debut_prêt,Prete.date_fin AS fin_prêt,Restaurations.date_debut AS debut_restauration,Restaurations.date_fin AS fin_restauration
    FROM Prete,Restaurations
    WHERE Prete.oeuvre = Restaurations.oeuvre
    AND Restaurations.date_debut > Prete.date_debut 
    AND Restaurations.date_debut < Prete.date_fin;



-- CC6 : Une expo temporaire a sa date de fin égale a la plus grande date de fin d'emprunt des oeuvres qui y sont exposées

CREATE VIEW Expo_temporaire_fin_incohérente AS
    SELECT Expositions.nom, Expositions.date_fin AS fin_expo, MAX(Emprunte.date_fin) AS fin_emprunt 
    FROM Expositions, Emprunte, JSON_ARRAY_ELEMENTS(Expositions.oeuvre) tab
    WHERE tab->>'titre' = Emprunte.oeuvre
    AND Expositions.type = 'temp'
    AND Expositions.date_fin != Emprunte.date_fin
    AND Expositions.date_fin < Emprunte.date_fin
    GROUP BY Expositions.nom, Expositions.date_fin ;


-- CC7 : Toute exposition a au moins une salle dédiée

CREATE VIEW Expo_sans_salle AS
    SELECT Expositions.nom FROM Expositions
        WHERE Expositions.nom NOT IN (
            SELECT Salles.exposition FROM Salles WHERE Salles.exposition IS NOT NULL
            );


-- CC8 : le panneaux est placé dans une mauvaise salle (exposition incohérente)

CREATE VIEW Panneaux_exposition_incohérant_salle_exposition AS
    SELECT Panneaux.numero AS panneaux, Panneaux.exposition AS exposition_panneau, Salles.numero AS salles
    FROM Panneaux, Salles
    WHERE Salles.exposition != Panneaux.exposition
    AND Salles.numero = Panneaux.salle;


-- CC9 : Toute exposition a au moins 1 panneau

CREATE VIEW Expositions_sans_panneaux AS
    SELECT Expositions.nom FROM Expositions
    WHERE Expositions.nom NOT IN (SELECT Panneaux.exposition FROM Panneaux );

-- CC10 : Les créneaux sont associés que à des expositions Permanentes

CREATE VIEW Creneaux_expo_temp AS
    SELECT Creneaux.debut, Creneaux.jour, Creneaux.exposition FROM Creneaux, Expositions
    WHERE Creneaux.exposition = Expositions.nom
    AND Expositions.type != 'perm';

-- CC11 : Le nom des oeuvres dans la table expositions doivent exister dans la table oeuvres

CREATE VIEW nom_oeuvre_exposition_inexistant AS
    SELECT Expositions.nom,tab->>'titre' AS oeuvre 
    FROM Expositions, JSON_ARRAY_ELEMENTS(Expositions.oeuvre) tab
    WHERE tab->>'titre' NOT IN (SELECT Oeuvres.titre FROM Oeuvres);

-- CC12 : Le nom des guides, leur prenom et leur id dans la table expositions doivent exister dans la table Guides

CREATE VIEW guide_inexistant AS
    SELECT Expositions.nom, tab->>'id' AS id_guide,tab->>'nom' AS nom_guide,tab->>'prenom' AS prenom_guide
    FROM Expositions,JSON_ARRAY_ELEMENTS(Expositions.guide) tab
    WHERE tab->>'nom' NOT IN (SELECT Guides.nom FROM Guides WHERE Guides.prenom = tab->>'prenom' AND Guides.identifiant = CAST(tab->>'id' AS INTEGER));

-- CC13 : Vérifier que les creneaux dans la table guide existent vraiment

CREATE VIEW creneau_inexistant AS
    SELECT Guides.identifiant,Guides.prenom, Guides.nom, tab->>'jour' AS jour,tab->>'heure' AS heure,tab->>'expo' AS exposition
    FROM Guides, JSON_ARRAY_ELEMENTS(Guides.creneau) tab
    WHERE tab->>'jour' NOT IN (SELECT Creneaux.jour FROM Creneaux 
    WHERE Creneaux.debut = CAST(tab->>'heure' AS TIME) 
    AND  Creneaux.exposition = tab->>'expo');


-- Fonctionnalité : Affiche les guides leur adresse et leur creneaux

CREATE VIEW info_guide AS
    SELECT Guides.identifiant, Guides.nom, Guides.prenom, 
    adresse->>'numero voirie' AS nmb, adresse->>'route' AS Route, adresse->>'ville' AS Ville, adresse->>'code postal' AS zipcode, 
    tab->>'jour' AS jour,tab->>'heure' AS heure,tab->>'expo' AS exposition 
    FROM Guides, JSON_ARRAY_ELEMENTS(Guides.creneau) tab;

-- Fonctionnalité : affiche correctement la table prestataire

CREATE VIEW prestataire_detaillée AS
    SELECT Prestataires.nom, adresse->>'numero voirie' AS numero_voirie,
    adresse->>'route' AS route,adresse->>'ville' AS ville,adresse->>'code postal' AS zipcode
    FROM Prestataires;

-- Fonctionnalité : affiche correctement la table musees extérieurs

CREATE VIEW musees_exterieurs_detaillée AS
    SELECT Musees_exterieurs.nom, adresse->>'numero voirie' AS numero_voirie,
    adresse->>'route' AS route,adresse->>'ville' AS ville,adresse->>'code postal' AS zipcode
    FROM Musees_exterieurs;


-- Fonctionnalité : affiche l'exposition dans laquelle chaque oeuvre est exposée

CREATE VIEW exposition_oeuvre AS
    SELECT Expositions.nom, oe->>'titre' AS Oeuvres FROM Expositions, JSON_ARRAY_ELEMENTS(Expositions.oeuvre) oe;


-- Fonctionnalité : Toutes les peintures actuellement au musée

CREATE VIEW peinture AS
    SELECT Oeuvres.titre, Auteurs.prenom, Auteurs.nom FROM Oeuvres, Auteurs, Realise
    WHERE Oeuvres.type = 'peinture'
    AND Oeuvres.titre = Realise.oeuvre
    AND Auteurs.nom = Realise.nom AND Auteurs.prenom = Realise.prenom AND Auteurs.date_naissance = Realise.date_naissance
    AND Oeuvres.titre NOT IN ( SELECT Emprunte.oeuvre FROM Emprunte WHERE Emprunte.date_fin > NOW() UNION SELECT Prete.oeuvre FROM Prete WHERE Prete.date_fin > NOW() );


-- Fonctionnalité : Toutes les photographies actuellement au musée

CREATE VIEW photographie AS
    SELECT Oeuvres.titre, Auteurs.prenom, Auteurs.nom FROM Oeuvres, Auteurs, Realise
    WHERE Oeuvres.type = 'photographie'
    AND Oeuvres.titre = Realise.oeuvre
    AND Auteurs.nom = Realise.nom AND Auteurs.prenom = Realise.prenom AND Auteurs.date_naissance = Realise.date_naissance
    AND Oeuvres.titre NOT IN ( SELECT Emprunte.oeuvre FROM Emprunte WHERE Emprunte.date_fin > NOW() UNION SELECT Prete.oeuvre FROM Prete WHERE Prete.date_fin > NOW() );


-- Fonctionnalité : Toutes les sculptures actuellement au musée

CREATE VIEW sculpture AS
    SELECT Oeuvres.titre, Auteurs.prenom, Auteurs.nom FROM Oeuvres, Auteurs, Realise
    WHERE Oeuvres.type = 'photographie'
    AND Oeuvres.titre = Realise.oeuvre
    AND Auteurs.nom = Realise.nom AND Auteurs.prenom = Realise.prenom AND Auteurs.date_naissance = Realise.date_naissance
    AND Oeuvres.titre NOT IN ( SELECT Emprunte.oeuvre FROM Emprunte WHERE Emprunte.date_fin > NOW() UNION SELECT Prete.oeuvre FROM Prete WHERE Prete.date_fin > NOW() );


-- Fonctionnalité : Prix d'acquisition des oeuvres du musée en fonction du type d'oeuvre

CREATE VIEW prix_moyen_oeuvre_confondu AS
    SELECT ROUND(AVG(Oeuvres.prix_acquisition)) AS Prix_moyen_oeuvre, Oeuvres.type  FROM Oeuvres 
    GROUP BY Oeuvres.type;


-- Fonctionnalité : Prix moyen des oeuvres par exposition

CREATE VIEW prix_moyen_oeuvre_par_exposition AS
    SELECT ROUND(AVG(Oeuvres.prix_acquisition)), Expositions.nom AS Prix_moyen_oeuvre FROM Expositions, Oeuvres, JSON_ARRAY_ELEMENTS(Expositions.oeuvre) tab
    WHERE tab->>'titre' = Oeuvres.titre
    GROUP BY Expositions.nom;

-- Fonctionnalité : Durée moyenne des emprunts

CREATE VIEW duree_moyenne_emprunt AS
    SELECT ROUND( AVG ( @(Emprunte.date_debut - Emprunte.date_fin))) AS Duree_moyenne_emprunt FROM Emprunte;


-- Fonctionnalité : Durée moyenne des prêts
CREATE VIEW duree_moyenne_pret AS
    SELECT ROUND( AVG ( @(Prete.date_debut - Prete.date_fin))) AS Duree_moyenne_pret FROM Prete;

-- Fonctionnalité : Oeuvres en cours d'emprunt

CREATE VIEW Oeuvre_en_cours_demprunt AS
    SELECT Emprunte.oeuvre, Emprunte.date_fin FROM Emprunte
    WHERE Emprunte.date_fin < NOW();


-- Fonctionnalité : Oeuvres en cours de restauration

CREATE VIEW oeuvre_en_cours_de_restauration AS
    SELECT Restaurations.oeuvre, Restaurations.date_fin FROM Restaurations
    WHERE Restaurations.date_fin < NOW() OR Restaurations.date_fin IS NULL;

-- Fonctionnalité : Oeuvres en train d'être prêtées

CREATE VIEW oeuvre_pretee AS
    SELECT Prete.oeuvre, Prete.date_fin FROM Prete
    WHERE Prete.date_fin < NOW();

-- Fonctionnalité : Toutes les expositions temporaires

CREATE VIEW exposition_temporaire AS
SELECT nom, date_debut, date_fin FROM Expositions WHERE type = 'temp';


-- Fonctionnalité : Toutes les expositions temporaires en cours

CREATE VIEW exposition_temporaire_en_cours AS
SELECT nom, date_debut, date_fin FROM Expositions WHERE type = 'temp' AND date_fin > NOW();

-- Fonctionnalité : Toutes les expositions permanentes

CREATE VIEW exposition_permanente AS
SELECT nom FROM Expositions WHERE type = 'perm';


-- Fonctionnalité : Nombre de restauration par prestataire

CREATE VIEW oeuvre_restaure_par_prestataire AS
    SELECT COUNT(Prestataires.nom) AS Oeuvre_restauree,Prestataires.nom  FROM Restaurations, Prestataires
    WHERE Restaurations.prestataire = Prestataires.nom GROUP BY Prestataires.nom;


-- Fonctionnalité : Prix moyen d'une restauration

CREATE VIEW prix_moyen_restauration AS
    SELECT ROUND( AVG(Restaurations.prix)) AS Prix_moyen FROM Restaurations;


-- Fonctionnalité : Guide travaillant actuellement sur des expo temporaires

CREATE VIEW guide_sur_expo_temporaire AS
SELECT Expositions.nom,tab->>'id' AS identifiant, tab->>'nom' AS nom_guide, tab->>'prenom' AS prenom  
FROM Expositions, JSON_ARRAY_ELEMENTS(Expositions.guide) tab 
WHERE Expositions.date_fin > NOW() 
ORDER BY Expositions.nom,tab->>'nom';

-- Fonctionnalité : Combien de guide sont affectés a une exposition temporaire (NEW)

CREATE VIEW nombre_guide_expo_temp AS
    SELECT Expositions.nom, COUNT(tab->>'id') AS identifiant 
    FROM Expositions, JSON_ARRAY_ELEMENTS(Expositions.guide) tab 
    GROUP BY Expositions.nom;

-- Fonctionnalité : Affiche le nombre de guide affecté sur chaque creneau

CREATE VIEW nombre_guide_sur_creneau AS
SELECT COUNT(*) AS guides_affecté, tab->>'jour'AS jour, tab->>'heure' AS heure, tab->>'expo' AS exposition 
FROM Guides, JSON_ARRAY_ELEMENTS(Guides.creneau) tab 
GROUP BY tab->>'heure', tab->>'expo',tab->>'jour';

-- Fonctionnalité : nombre d'heure travaillé pour chaque guide 
CREATE VIEW heure_travaillee_par_guide AS
    SELECT 2*COUNT(*) AS heures_travaillees, Guides.prenom, Guides.nom
    FROM Guides, JSON_ARRAY_ELEMENTS(Guides.creneau) tab GROUP BY Guides.prenom, Guides.nom ;