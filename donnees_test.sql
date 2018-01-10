INSERT INTO Pizza (nom, prix)
VALUES ('MARGARITA', 9),
('ROMA', 10),
('REINE', 11);

INSERT INTO Ingredient (nom, poids)
VALUES ('tomate', 50),
('mozzarella', 100),
('jambon', 50),
('olives', 5),
('oeuf', 30);

INSERT INTO Recette (nom_pizza, ingredient_id, quantite)
VALUES ('MARGARITA', 1, 3),
('MARGARITA', 2, 2),
('MARGARITA', 4, 7),
('ROMA', 1, 3),
('ROMA', 2, 2),
('ROMA', 3, 2),
('ROMA', 4, 7),
('REINE', 1, 3),
('REINE', 2, 2),
('REINE', 3, 2),
('REINE', 4, 7),
('REINE', 5,1);

INSERT INTO Etablissement (nom, adresse)
VALUES ('GO COWS', 'South park, Colorado'),
('BRONCOS', 'Denver, Colorado');

INSERT INTO Stock (ingredient_id, etablissement_id, quantite)
VALUES (1,1,97),
(2,1,98),
(3,1,98),
(4,1,93),
(5,1,100),
(1,2,97),
(2,2,98),
(3,2,98),
(4,2,93),
(5,2,99);

INSERT INTO Employe (nom, prenom)
VALUES ('MARSH', 'Stan'),
('BROFLOVSKI', 'Kyle'),
('CARTMAN', 'Eric'),
('McCORMICK', 'Kenny');

INSERT INTO Preparateur (employe_id, etablissement_id)
VALUES (1,1),
(2,1);

INSERT INTO Livreur (employe_id, immatriculation_scooter)
VALUES (3, '666GAGA');

INSERT INTO Vendeur (employe_id, etablissement_id)
VALUES (4,1);

INSERT INTO Client (nom, prenom, adresse, email, motdepasse)
VALUES ('MARSH', 'Randy', '101 Main street, South Park, Colorado', 'randymarch@southpark.com', 'beer'),
('KERN', 'Jimbo', '112 Main street, South Park, Colorado', 'jimbokern@southpark.com', 'comingrightforus');


INSERT INTO Commande (date, statut, nom_pizza, client_id, preparateur_id, livreur_id, vendeur_id)
VALUES ('2018-01-03', 'LIVREE', 'REINE', '1', '2', '3', '4'),
('2018-01-11', 'EN LIVRAISON', 'ROMA', '2', '1', '3', NULL);

INSERT INTO Facture (montant_total, type_paiement, numero_commande)
VALUES (11, 'CB', 1);



--Requêtes de test
SELECT Ingredient.nom as nom_ingredient, Recette.quantite*Ingredient.poids AS Poids FROM Recette
INNER JOIN Pizza ON Pizza.nom=Recette.nom_pizza
INNER JOIN Ingredient ON Ingredient.id=Recette.ingredient_id
WHERE nom_pizza = 'REINE';

