                                -- Attribution des droits --

CREATE USER Visiteur;
CREATE USER Personnel;
CREATE USER Guide;

GRANT ALL ON TABLE
Auteurs, Realise, Oeuvres, Restaurations, Prestataires, Temporaires, 
Panneaux, Salles, Permanentes, Creneaux, Guides, Travail_exp_perm, 
Travail_exp_temp, Musees_exterieurs, Prete, Emprunte
TO Personnel;

GRANT SELECT ON TABLE 
Auteurs, Realise, Oeuvres, Restaurations, Temporaires, 
Panneaux, Salles, Permanentes, Creneaux, Guides, Travail_exp_perm, 
Travail_exp_temp, Musees_exterieurs, Prete, Emprunte
TO Guide;

GRANT SELECT ON TABLE
Auteurs, Realise, Oeuvres, Temporaires, 
Panneaux, Salles, Permanentes, Musees_exterieurs, Prete, Emprunte
TO Visiteur;