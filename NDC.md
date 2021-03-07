## Note de clarification pour un système de gestion du musée du Louvre

### Oeuvres
-------------------

* Une oeuvre est définie par __un titre__, __une date de création__, __le nom de l'auteur__, __le prénom de l'auteur__, __la date de naissance de l'auteur__, __la date de décès de l'auteur__ (si l'auteur est décédé), __un prix d'acquisition__ et __son statut__ (Empruntée, Prêtée, Restauration, Louvre)

* Une oeuvre peut être :
    * __Une photographie__ : On doit alors renseigner _sa largeur_ et _sa hauteur_.

    * __Une sculpture__ : On doit alors renseigner _sa hauteur_.

    * __Une peinture__ : On doit alors renseigner _sa largeur_ et _sa hauteur_.

* Une oeuvre peut être __empruntée__ à un musée extérieur, on renseignera le nom et l'adresse du musée prêteur.

* Une oeuvre est empruntée pour une certaine durée

* Une oeuvre peut être __prêtée__ à un musée extérieur, on renseignera le nom et l'adresse du musée emprunteur.

* Une oeuvre est prêtée pour une certaine durée

* Une oeuvre peut être prêtée qu'une seule fois à un même musée.

* Une oeuvre peut être empruntée qu'une seule fois par le même musée.

* Une oeuvre peut être en __restauration__.


### Restaurations
-----------------------

* Une restauration est définie par __le type de restauration__, __sa date de début__,
__sa date de fin__, __son prix__.

* Une restauration est réalisée par _un prestataire_.

### Prestataire
--------------------

* Une prestataire est défini par __son nom__ et __son adresse__.


### Expositions
-----------------

* Une exposition est définie par __son nom__.

* Des oeuvres sont présentées lors d'une exposition
* Une exposition _occupe une ou plusieurs salles_.
* Dans une exposition _il y a un ou plusieurs panneaux_ explicatifs. La demande n'était pas claire, donc le choix a été d'admettre que dans chaque exposition (temporaire ou permanente) il y a des panneaux.

* Une exposition peut être :

    * __Permanente__, seul des _oeuvres appartenant au Louvre_ y sont exposées.

    
        Une oeuvre exposée d'une exposition permanente ne peut que être exposée dans cette même exposition.

    * __Temporaire__, seul des _oeuvres empruntées à un musée extérieur_ y sont exposées.

        Une exposition temporaire est définie par _une date de début et une date de fin_.
        

### Panneaux
---------------

* Un panneau est défini par __un numéro__ et __son texte__.
* Un panneau se situe __dans une salle__.

### Salles
--------------

* Une salle est identifiée par __son numéro__ et __sa capacité maximale__.

### Guides
------------------

* Un guide est défini par __un identifiant__, __son nom__, __son prenom__, __son adresse__ et __sa date d'embauche__.

* Un guide est affecté à __des créneaux sur les expositions permanente__.

* Un guide peut __exceptionellement être affecté à une exposition temporaire__. Il n'aura alors plus de créneaux et travaillera exclusivement sur l'exposition temporaire.

### Créneaux
--------------

* Un créneau est défini par __le jour__, __l'horaire de début__ et __l'horaire de fin__.
* Un créneau horaire __dure 2 heures__.
* Le musée est fermé le mardi.
* Un guide peut travailler de 09h jusqu'a 18h.

## Contraintes d'associations


* Un musée extérieur peut prêter 0 ou N oeuvres.
* Un musée extérieur peut emprunter 0 ou N oeuvres.
* Une oeuvre peut être emprunté par 0 ou N musées extérieur.
* Un musée extérieur ne peut pas emprunter deux fois la même oeuvre.
* Une oeuvre peut être réalisé par 0 (auteur inconnu) ou N auteurs.
* On peut ne pas connaitre la date de création d'une oeuvre.
* Un auteur peut avoir réalisé 0 ou N oeuvres.
* Une restauration concerne 1 oeuvre.
* Si une restauration n'est pas fini, on peut ne pas connaitre sa date de fin.
* Une oeuvre peut être restaurée 0 ou N fois.
* Une restauration est réalisée par 1 prestataire.
* Un prestataire peut réaliser 0 ou N restaurations.
* Dans une salle il peut y avoir 0 ou N panneaux.
* Un panneau se trouve dans 1 salle.
* Un guide travail sur 1 ou N créneaux horaires OU un guide travail sur 0 ou N expositions temporaires.
* Sur un créneau horaire travaillent 0 ou N guides.
* Un créneau horaire concerne 1 exposition permanente.
* Une exposition permanente est concernée par 0 ou N créneaux horaires.
* Une exposition est composée de 1 ou N oeuvres.
* Une exposition a 1 à N panneaux explicatif.
* Le musée est fermé le Mardi.

## Fonctionnalité

* Afficher l'exposition associée à chaque oeuvre.
* Afficher toutes les peintures actuellement au musée.
* Afficher toutes les photographies actuellement au musée.
* Afficher toutes les sculptures actuellement au musée.
* Afficher le prix moyens des oeuvres par type d'oeuvre.
* Afficher le prix moyen des oeuvres par exposition.
* Afficher la durée moyenne des emprunts.
* Afficher la durée moyenne des prêts.
* Afficher les oeuvres en cours d'emprunt.
* Afficher les oeuvres en cours de restauration.
* Afficher les oeuvres en train d'être prêtées.
* Afficher toutes les expositions temporaires.
* Afficher toutes les expositions temporaires en cours.
* Afficher toutes les expositions permanentes.
* Afficher le nombre de restauration réalisé par chaque prestataire.
* Afficher le prix moyen d'une restauration.
* Afficher les guides qui affectés sur une exposition temporaire en cours.
* Afficher le nombre de guide affecté a une exposition temporaire.
* Afficher le nombre de guide affecté sur chaque creneau.
* Afficher le nombre d'heure travaillé pour chaque guide.

## Choix d'héritage


### Table oeuvre
-------------------

* Héritage par classe fille : CC avec l'unicité du titre de l'oeuvre, classe associations réalise avec auteur, emprunts et prets avec musee extérieur et la composition de oeuvre multiplié par 3. Cela ne semble pas être une bonne solution.

* Héritage par référence : On  a toujours pas l'unicité du titre de l'oeuvre et il faut s'assurer que chaque titre d'oeuvre est référencé. Une table supplémentaire par rapport à l'héritage par classe fille.

* Héritage par classe mère : CHECK( Largeur IS NULL and type = 'sculpture' OR Largeur IS NOT NULL and type != 'sculpture').

* L'héritage par classe mère a été la solution choisi.

### Table exposition
-----------------------

* Héritage par classe fille : CC avec l'unicité du nom de l'exposition, CC chaque exposition a au moins une salle attribuée.

* Héritage par référence : CC pas d'unicité du nom de l'exposition, CC chaque exposition a au moins une salle attribuée, s'assurer que chaque exposition est référencé. 1 table supplémentaire par rapport à l'héritage par classe fille.

* Héritage par classe mère : CC un creneaux est associée a une exposition permanentes et CC sur la classe associations travail_temp, CC chaque exposition a au moins une salle attribuée.

* L'héritage par classe mère a été choisi.


## Rôles des utilisateurs

### Le personnel
-----------------

* Les membres du personnel auront tous les droits sur la base de donnée afin de l'administrer.

### Les guides
-----------------

* Les guides auront un accès consultatif sur tout sauf la table des prestataires.

### Les visiteurs
-----------------

* Les visiteurs auront un accès consultatif sur : Auteurs, Realise, Oeuvres, Temporaires, Panneaux, Salles, Permanentes, Musees_exterieurs, Prete, Emprunte.
