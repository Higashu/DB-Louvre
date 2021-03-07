-- Expositions temporaires

INSERT INTO Expositions VALUES ('exposition original 1','01.01.2020','20.12.2020','temp','[{"titre" : "Guernica"},{"titre" : "Bal du moulin de la Galette"},
{"titre" : "Le Baiser"}]','[{"id":10,"nom":"du Levy","prenom":"Olivier"},{"id":1,"nom":"du Verdier","prenom":"Bob"},{"id":5,"nom":"Riou","prenom":"Thierry"}]');
INSERT INTO Expositions VALUES ('exposition original 2','01.01.2020','20.03.2020','temp','[{"titre" : "99 Cent II Diptych"}]','
[{"id":10,"nom":"du Levy","prenom":"Olivier"},{"id":1,"nom":"du Verdier","prenom":"Bob"},{"id":2,"nom":"Dias","prenom":"Anne"},
{"id":8,"nom":"Raymond","prenom":"Théophile"}]');

-- Exposition permanentes

INSERT INTO Expositions VALUES ('exposition original 5',NULL,NULL,'perm','[{"titre" : "La Cène"},{"titre" : "La Nuit étoilée"},{"titre" : "Les Ménines"},
{"titre" : "La Grande Vague de Kanagawa"},{"titre" : "Fontaine"},{"titre" : "American Gothic"},{"titre" : "La Laitière"},{"titre" : "La Liberté guidant le peuple"},{"titre" : "L''Esclave mourant"},
{"titre" : "L''Esclave rebelle"},{"titre" : "carrefour, Blois New York"}]');
INSERT INTO Expositions VALUES ('exposition moins original',NULL,NULL,'perm','[{"titre" : "La Joconde"},
{"titre" : "La Naissance de Vénus"},{"titre" : "La Jeune Fille à la perle"},{"titre" : "Le Déjeuner sur l''herbe"},
{"titre" : "Paris vu par André Kertész"},{"titre" : "Hologramme"},{"titre" : "Rehin II"}]');


-- Oeuvres --

INSERT INTO Oeuvres VALUES ('La Joconde',NULL,632308,53,77,'peinture');
INSERT INTO Oeuvres VALUES ('La Cène',1498,3530102,460,880,'peinture');
INSERT INTO Oeuvres VALUES ('Guernica',1937,4505821,3490,777,'peinture');
INSERT INTO Oeuvres VALUES ('La Nuit étoilée',1889,471660,74,92,'peinture');
INSERT INTO Oeuvres VALUES ('La Naissance de Vénus',1486,3880849,172.5,278.5,'peinture');
INSERT INTO Oeuvres VALUES ('La Jeune Fille à la perle',1665,1207820,44,39,'peinture');
INSERT INTO Oeuvres VALUES ('Les Ménines',1656,4194722,318,276,'peinture');
INSERT INTO Oeuvres VALUES ('La Grande Vague de Kanagawa',1831,1149078,25.7,37.9,'peinture');
INSERT INTO Oeuvres VALUES ('Bal du moulin de la Galette',1876,3034594,131,175,'peinture');
INSERT INTO Oeuvres VALUES ('Fontaine',1917,2152513,NULL,63,'sculpture');
INSERT INTO Oeuvres VALUES ('Le Déjeuner sur l''herbe',1863,3711799,207,265,'peinture');
INSERT INTO Oeuvres VALUES ('Le Baiser',1908,1019316,180,180,'peinture');
INSERT INTO Oeuvres VALUES ('American Gothic',1930,4997909,74,62,'peinture');
INSERT INTO Oeuvres VALUES ('La Laitière',1658,623399,45.5,41,'peinture');
INSERT INTO Oeuvres VALUES ('La Liberté guidant le peuple',1830,4098356,260,325,'peinture');
INSERT INTO Oeuvres VALUES ('L''Esclave mourant',1516,2066229,NULL,229,'sculpture');
INSERT INTO Oeuvres VALUES ('L''Esclave rebelle',1515,1013466,NULL,209,'sculpture');
INSERT INTO Oeuvres VALUES ('carrefour, Blois New York',1930,9351,10,15,'photographie');
INSERT INTO Oeuvres VALUES ('Paris vu par André Kertész',1934,578,10,15,'photographie');
INSERT INTO Oeuvres VALUES ('Hologramme',1988,3846,250,500,'photographie');
INSERT INTO Oeuvres VALUES ('99 Cent II Diptych',2001,3346456,13,13,'photographie');
INSERT INTO Oeuvres VALUES ('Rehin II',1999,4384238,13,13,'photographie');

-- Auteur --

INSERT INTO Auteurs VALUES ('de Vinci','Leonard','15.04.1452','02.05.1519');
INSERT INTO Auteurs VALUES ('Picasso','Pablo','25.10.1881','08.04.1973');
INSERT INTO Auteurs VALUES ('van Gogh','Vincent','30.03.1853','29.07.1890');
INSERT INTO Auteurs VALUES ('Botticelli','Sandro','01.03.1445','17.05.1510');
INSERT INTO Auteurs VALUES ('Vermeer','Johannes','31.10.1632','15.12.1675');
INSERT INTO Auteurs VALUES ('Vélasquez','Diego','06.06.1599','06.08.1660');
INSERT INTO Auteurs VALUES ('Hokusai','Katsushika','31.10.1760','10.05.1849');
INSERT INTO Auteurs VALUES ('Renoir','Auguste','25.02.1841','03.12.1919');
INSERT INTO Auteurs VALUES ('Manet','Edouard','23.01.1832','30.04.1883');
INSERT INTO Auteurs VALUES ('Klimt','Gustave','14.07.1862','06.02.1918');
INSERT INTO Auteurs VALUES ('Wood','Grant','13.02.1891','12.02.1942');
INSERT INTO Auteurs VALUES ('Delacroix','Eugène','26.04.1798','13.08.1863');
INSERT INTO Auteurs VALUES ('Buonarroti','Michelangelo','06.03.1475','18.02.1564');
INSERT INTO Auteurs VALUES ('Kertész','André','02.07.1894','28.09.1985');
INSERT INTO Auteurs VALUES ('Gursky','Andreas','15.01.1955',NULL);


-- Réalise

INSERT INTO Realise VALUES ('Delacroix','Eugène','26.04.1798','La Liberté guidant le peuple');
INSERT INTO Realise VALUES ('Vermeer','Johannes','31.10.1632','La Laitière');
INSERT INTO Realise VALUES ('Wood','Grant','13.02.1891','American Gothic');
INSERT INTO Realise VALUES ('Klimt','Gustave','14.07.1862','Le Baiser');
INSERT INTO Realise VALUES ('Manet','Edouard','23.01.1832','Le Déjeuner sur l''herbe');
INSERT INTO Realise VALUES ('Renoir','Auguste','25.02.1841','Bal du moulin de la Galette');
INSERT INTO Realise VALUES ('Hokusai','Katsushika','31.10.1760','La Grande Vague de Kanagawa');
INSERT INTO Realise VALUES ('Vélasquez','Diego','06.06.1599','Les Ménines');
INSERT INTO Realise VALUES ('Vermeer','Johannes','31.10.1632','La Jeune Fille à la perle');
INSERT INTO Realise VALUES ('Botticelli','Sandro','01.03.1445','La Naissance de Vénus');
INSERT INTO Realise VALUES ('van Gogh','Vincent','30.03.1853','La Nuit étoilée');
INSERT INTO Realise VALUES ('Picasso','Pablo','25.10.1881','Guernica');
INSERT INTO Realise VALUES ('de Vinci','Leonard','15.04.1452','La Cène');
INSERT INTO Realise VALUES ('Buonarroti','Michelangelo','06.03.1475','L''Esclave mourant');
INSERT INTO Realise VALUES ('Buonarroti','Michelangelo','06.03.1475','L''Esclave rebelle');
INSERT INTO Realise VALUES ('Kertész','André','02.07.1894','carrefour, Blois New York');
INSERT INTO Realise VALUES ('Kertész','André','02.07.1894','Paris vu par André Kertész');
INSERT INTO Realise VALUES ('Kertész','André','02.07.1894','Hologramme');
INSERT INTO Realise VALUES ('Gursky','Andreas','15.01.1955','99 Cent II Diptych');
INSERT INTO Realise VALUES ('Gursky','Andreas','15.01.1955','Rehin II');

-- Musée extérieurs

INSERT INTO Musees_exterieurs VALUES ('Musée Antoine-Vivenel','{"numero voirie" : "2", "route" : "rue d''Austerlitz", "ville" : "Compiègne", "code postal" : "60200"}');
INSERT INTO Musees_exterieurs VALUES ('Musée de l''Hospice Comtesse','{"numero voirie" : "32", "route" : "Rue de la Monnaie", "ville" : "Lille", "code postal" : "59800"}');
INSERT INTO Musees_exterieurs VALUES ('Musée Cantini','{"numero voirie" : "19", "route" : "Rue Grignan", "ville" : "Marseille", "code postal" : "13006"}');

-- Prestataires

INSERT INTO Prestataires VALUES ('RENOV2000','{"numero voirie" : "3", "route" : "rue Carnot", "ville" : "Compiègne", "code postal" : "60200"}');
INSERT INTO Prestataires VALUES ('RENOV''ART','{"numero voirie" : "39", "route" : "rue Dr Calmette", "ville" : "Montauban", "code postal" : "82000"}');
INSERT INTO Prestataires VALUES ('RENOV''ARTICHAUT','{"numero voirie" : "359", "route" : "avenue Pasteur", "ville" : "Rouen", "code postal" : "76100"}');

-- Restaurations

INSERT INTO Restaurations VALUES (DEFAULT,'renovation cadre','03.03.2020','26.05.2020',1000.00,'Rehin II','RENOV2000');
INSERT INTO Restaurations VALUES (DEFAULT,'recolorisation','03.03.2020','26.05.2020',2000.00,'carrefour, Blois New York','RENOV2000');
INSERT INTO Restaurations VALUES (DEFAULT,'nettoyage','03.03.2020','26.05.2020',500.00,'American Gothic','RENOV''ART');
INSERT INTO Restaurations VALUES (DEFAULT,'reparation dommages','03.03.2020','26.05.2020',290.00,'La Joconde','RENOV2000');
INSERT INTO Restaurations VALUES (DEFAULT,'nettoyage','03.03.2020','26.05.2020',3200.00,'Le Déjeuner sur l''herbe','RENOV''ARTICHAUT');
INSERT INTO Restaurations VALUES (DEFAULT,'renovation cadre','03.03.2020','26.05.2020',4800.00,'L''Esclave rebelle','RENOV''ARTICHAUT');
INSERT INTO Restaurations VALUES (DEFAULT,'recolorisation','03.03.2020','26.05.2020',130.00,'Fontaine','RENOV''ART');

-- Emprunt

INSERT INTO Emprunte VALUES ('03.01.2020','16.02.2020','Musée de l''Hospice Comtesse','Guernica');
INSERT INTO Emprunte VALUES ('20.02.2020','20.03.2020','Musée Cantini','99 Cent II Diptych');
INSERT INTO Emprunte VALUES ('14.03.2020','20.12.2020','Musée Antoine-Vivenel','Bal du moulin de la Galette');
INSERT INTO Emprunte VALUES ('13.05.2020','17.08.2020','Musée Cantini','Le Baiser');


-- Prete

INSERT INTO Prete VALUES ('10.02.2020','17.02.2020','Musée Cantini','La Cène');
INSERT INTO Prete VALUES ('18.04.2020','18.07.2020','Musée de l''Hospice Comtesse','La Cène');
INSERT INTO Prete VALUES ('18.04.2020','18.07.2020','Musée Antoine-Vivenel','La Jeune Fille à la perle');

-- Salle

INSERT INTO Salles VALUES (DEFAULT,264,'exposition original 5');
INSERT INTO Salles VALUES (DEFAULT,277,'exposition original 5');
INSERT INTO Salles VALUES (DEFAULT,202,'exposition original 2');
INSERT INTO Salles VALUES (DEFAULT,260,'exposition moins original');
INSERT INTO Salles VALUES (DEFAULT,202,'exposition moins original');
INSERT INTO Salles VALUES (DEFAULT,297,'exposition original 1');
INSERT INTO Salles VALUES (DEFAULT,159,'exposition moins original');
INSERT INTO Salles VALUES (DEFAULT,198,'exposition moins original');
INSERT INTO Salles VALUES (DEFAULT,283,'exposition original 5');
INSERT INTO Salles VALUES (DEFAULT,165,NULL);
INSERT INTO Salles VALUES (DEFAULT,196,NULL);

-- Panneaux

INSERT INTO Panneaux VALUES (DEFAULT,'Texte original 1','exposition original 2',3);
INSERT INTO Panneaux VALUES (DEFAULT,'Texte original 2','exposition original 2',3);
INSERT INTO Panneaux VALUES (DEFAULT,'Texte original 3','exposition original 5',1);
INSERT INTO Panneaux VALUES (DEFAULT,'Texte original 4','exposition original 2',3);
INSERT INTO Panneaux VALUES (DEFAULT,'Texte original 5','exposition original 2',3);
INSERT INTO Panneaux VALUES (DEFAULT,'Texte original 6','exposition original 2',3);
INSERT INTO Panneaux VALUES (DEFAULT,'Texte original 7','exposition moins original',4);
INSERT INTO Panneaux VALUES (DEFAULT,'Texte original 8','exposition original 2',3);
INSERT INTO Panneaux VALUES (DEFAULT,'Texte original 9','exposition original 1',6);

-- Guides

INSERT INTO Guides VALUES (DEFAULT,'du Verdier','Bob','{"numero voirie" : "73", "route" : "Place de la madeleine", "ville" : "Paris", "code postal" : "75008"}','01.04.2020',
'[{"jour":"dim","heure":"10:00","expo":"exposition original 5"},{"jour":"lun","heure":"14:00","expo":"exposition original 5"},{"jour":"mer","heure":"11:00","expo":"exposition original 5"}]');

INSERT INTO Guides VALUES (DEFAULT,'Dias','Anne','{"numero voirie" : "64", "route" : "Faubourg Saint Honoré", "ville" : "Paris", "code postal" : "75004"}','03.04.2020',
'[{"jour":"dim","heure":"13:00","expo":"exposition moins original"},{"jour":"jeu","heure":"09:00","expo":"exposition moins original"},{"jour":"sam","heure":"16:00","expo":"exposition moins original"}]');

INSERT INTO Guides VALUES (DEFAULT,'Ribeiro','Jules','{"numero voirie" : "43", "route" : "rue Nationale", "ville" : "Paris", "code postal" : "75004"}','13.04.2020',
'[{"jour":"lun","heure":"11:00","expo":"exposition moins original"},{"jour":"mer","heure":"14:00","expo":"exposition moins original"},{"jour":"jeu","heure":"09:00","expo":"exposition moins original"}]');

INSERT INTO Guides VALUES (DEFAULT,'Dupre','Laurent-Roger','{"numero voirie" : "99", "route" : "Faubourg Saint Honoré", "ville" : "Paris", "code postal" : "75004"}','15.04.2020',
'[{"jour":"sam","heure":"16:00","expo":"exposition moins original"},{"jour":"dim","heure":"13:00","expo":"exposition moins original"},{"jour":"mer","heure":"14:00","expo":"exposition moins original"}]');

INSERT INTO Guides VALUES (DEFAULT,'Riou','Thierry','{"numero voirie" : "79", "route" : "rue des Nations Unies", "ville" : "Paris", "code postal" : "75007"}','16.04.2020',
'[{"jour":"mer","heure":"14:00","expo":"exposition moins original"},{"jour":"lun","heure":"16:00","expo":"exposition original 5"}]');

INSERT INTO Guides VALUES (DEFAULT,'Cohen','Nicolas','{"numero voirie" : "62", "route" : "avenue Marechal Juin", "ville" : "Paris", "code postal" : "75009"}','17.04.2020',
'[{"jour":"lun","heure":"09:00","expo":"exposition original 5"},{"jour":"dim","heure":"10:00","expo":"exposition original 5"},{"jour":"mer","heure":"11:00","expo":"exposition original 5"},
{"jour":"lun","heure":"14:00","expo":"exposition original 5"},{"jour":"jeu","heure":"10:00","expo":"exposition original 5"},{"jour":"lun","heure":"16:00","expo":"exposition original 5"},
{"jour":"lun","heure":"15:00","expo":"exposition original 5"}]');

INSERT INTO Guides VALUES (DEFAULT,'Couturier-Laroche','William','{"numero voirie" : "6", "route" : "avenue Jules Ferry", "ville" : "Paris", "code postal" : "75011"}','15.05.2020',
'[{"jour":"jeu","heure":"09:00","expo":"exposition moins original"},{"jour":"sam","heure":"16:00","expo":"exposition moins original"},{"jour":"lun","heure":"11:00","expo":"exposition moins original"},
{"jour":"dim","heure":"13:00","expo":"exposition moins original"},{"jour":"mer","heure":"14:00","expo":"exposition moins original"}]');

INSERT INTO Guides VALUES (DEFAULT,'Raymond','Théophile','{"numero voirie" : "67", "route" : "quai Saint-Nicolas", "ville" : "Paris", "code postal" : "75013"}','18.05.2020',
'[{"jour":"jeu","heure":"09:00","expo":"exposition moins original"},{"jour":"sam","heure":"16:00","expo":"exposition moins original"},{"jour":"lun","heure":"11:00","expo":"exposition moins original"},
{"jour":"dim","heure":"13:00","expo":"exposition moins original"},{"jour":"mer","heure":"14:00","expo":"exposition moins original"},{"jour":"lun","heure":"09:00","expo":"exposition original 5"},
{"jour":"dim","heure":"10:00","expo":"exposition original 5"},{"jour":"mer","heure":"11:00","expo":"exposition original 5"},
{"jour":"lun","heure":"14:00","expo":"exposition original 5"},{"jour":"jeu","heure":"10:00","expo":"exposition original 5"},{"jour":"lun","heure":"16:00","expo":"exposition original 5"},
{"jour":"lun","heure":"15:00","expo":"exposition original 5"}]');

INSERT INTO Guides VALUES (DEFAULT,'Moreau','Sébastien','{"numero voirie" : "27", "route" : "rue Adolphe Wurtz", "ville" : "Paris", "code postal" : "750010"}','20.05.2020',
'[{"jour":"jeu","heure":"09:00","expo":"exposition moins original"},{"jour":"sam","heure":"16:00","expo":"exposition moins original"},{"jour":"lun","heure":"11:00","expo":"exposition moins original"},
{"jour":"dim","heure":"13:00","expo":"exposition moins original"},{"jour":"mer","heure":"14:00","expo":"exposition moins original"},{"jour":"lun","heure":"09:00","expo":"exposition original 5"},
{"jour":"lun","heure":"14:00","expo":"exposition original 5"}]');

INSERT INTO Guides VALUES (DEFAULT,'du Levy','Olivier','{"numero voirie" : "8", "route" : "boulevard Amiral Courbet", "ville" : "Paris", "code postal" : "75001"}','28.05.2020',
'[{"jour":"sam","heure":"16:00","expo":"exposition moins original"},{"jour":"lun","heure":"11:00","expo":"exposition moins original"},
{"jour":"dim","heure":"13:00","expo":"exposition moins original"},{"jour":"lun","heure":"14:00","expo":"exposition original 5"},{"jour":"jeu","heure":"10:00","expo":"exposition original 5"},{"jour":"lun","heure":"16:00","expo":"exposition original 5"},
{"jour":"lun","heure":"15:00","expo":"exposition original 5"}]');


-- Créneaux

INSERT INTO Creneaux VALUES ('lun','09:00','11:00','exposition original 5');
INSERT INTO Creneaux VALUES ('dim','10:00','12:00','exposition original 5');
INSERT INTO Creneaux VALUES ('mer','11:00','13:00','exposition original 5');
INSERT INTO Creneaux VALUES ('lun','14:00','16:00','exposition original 5');
INSERT INTO Creneaux VALUES ('jeu','09:00','11:00','exposition moins original');
INSERT INTO Creneaux VALUES ('jeu','10:00','12:00','exposition original 5');
INSERT INTO Creneaux VALUES ('lun','16:00','18:00','exposition original 5');
INSERT INTO Creneaux VALUES ('sam','16:00','18:00','exposition moins original');
INSERT INTO Creneaux VALUES ('lun','11:00','13:00','exposition moins original');
INSERT INTO Creneaux VALUES ('dim','13:00','15:00','exposition moins original');
INSERT INTO Creneaux VALUES ('lun','15:00','17:00','exposition original 5');
INSERT INTO Creneaux VALUES ('mer','14:00','16:00','exposition moins original');